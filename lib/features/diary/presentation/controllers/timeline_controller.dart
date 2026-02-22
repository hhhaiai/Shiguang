import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/objectbox/objectbox_providers.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../../settings/data/settings_provider.dart';
import '../../data/ai/embedding_service.dart';
import '../../data/entities/vector_diary.dart';
import '../../data/network/web_search_service.dart';
import '../../data/repositories/vector_diary_repository.dart';
import '../../domain/diary_content_codec.dart';

part 'timeline_controller.g.dart';

class TimelineSearchResult {
  final List<VectorDiary> exactMatches;
  final List<VectorDiary> fuzzyMatches;
  final List<VectorDiary> networkMatches;
  final Map<int, String> fuzzyExcerpts;

  const TimelineSearchResult({
    this.exactMatches = const [],
    this.fuzzyMatches = const [],
    this.networkMatches = const [],
    this.fuzzyExcerpts = const {},
  });
}

@riverpod
VectorDiaryRepository vectorDiaryRepository(Ref ref) {
  final objectBox = ref.watch(objectBoxServiceProvider);
  return VectorDiaryRepository(objectBox);
}

@riverpod
EmbeddingService embeddingService(Ref ref) {
  final service = EmbeddingService(
    // Requirement: always use on-device BGE ONNX embedding.
    preferLocal: true,
    allowWebSocketFallback: false,
    enforceLocalEndpoint: true,
  );
  ref.onDispose(service.dispose);
  return service;
}

final webSearchServiceProvider = Provider<WebSearchService>((ref) {
  return WebSearchService();
});

@riverpod
class Timeline extends _$Timeline {
  bool _backfillStarted = false;

  @override
  List<VectorDiary> build() {
    final accountId = ref.watch(authProvider);
    if (accountId == null) return [];

    final repository = ref.read(vectorDiaryRepositoryProvider);
    final diaries = repository.getByAccountId(accountId);
    if (!_backfillStarted) {
      _backfillStarted = true;
      unawaited(_backfillMissingEmbeddings(accountId));
    }
    return diaries;
  }

  VectorDiaryRepository get _repository =>
      ref.read(vectorDiaryRepositoryProvider);

  /// Refresh the timeline
  void refresh() {
    final accountId = ref.read(authProvider);
    if (accountId == null) return;

    state = _repository.getByAccountId(accountId);
  }

  /// Create a new diary entry
  VectorDiary? createDiary({
    required String rawText,
    String? aiSummary,
    String? aiTags,
    Float32List? embedding,
  }) {
    final accountId = ref.read(authProvider);
    if (accountId == null) return null;

    final diary = _repository.create(
      accountId: accountId,
      rawText: rawText,
      aiSummary: aiSummary,
      aiTags: aiTags,
      embedding: embedding,
    );

    refresh();
    final visibleRawText = DiaryContentCodec.decode(rawText).text;
    if (embedding == null && visibleRawText.trim().isNotEmpty) {
      unawaited(
        _generateAndAttachEmbedding(
          accountId: accountId,
          diaryId: diary.id,
          sourceText: visibleRawText,
          expectedRawText: rawText,
        ),
      );
    }
    return diary;
  }

  /// Update a diary entry
  VectorDiary? updateDiary(
    int id, {
    String? rawText,
    String? aiSummary,
    String? aiTags,
  }) {
    final accountId = ref.read(authProvider);
    if (accountId == null) return null;

    final diary = _repository.getByIdForAccount(
      accountId: accountId,
      diaryId: id,
    );
    if (diary == null) return null;

    final rawTextChanged = rawText != null && rawText != diary.rawText;
    if (rawText != null) {
      diary.rawText = rawText;
      if (rawTextChanged) {
        diary.embedding = null;
      }
    }
    if (aiSummary != null) diary.aiSummary = aiSummary;
    if (aiTags != null) diary.aiTags = aiTags;

    final updated = _repository.update(diary);
    refresh();
    final visibleRawText = rawText != null
        ? DiaryContentCodec.decode(rawText).text
        : '';
    if (rawTextChanged && visibleRawText.trim().isNotEmpty) {
      unawaited(
        _generateAndAttachEmbedding(
          accountId: accountId,
          diaryId: id,
          sourceText: visibleRawText,
          expectedRawText: rawText,
        ),
      );
    }
    return updated;
  }

  /// Delete a diary entry
  void deleteDiary(int id) {
    final accountId = ref.read(authProvider);
    if (accountId == null) return;

    _repository.softDeleteForAccount(accountId: accountId, diaryId: id);
    refresh();
  }

  /// Get diary by ID
  VectorDiary? getDiary(int id) {
    final accountId = ref.read(authProvider);
    if (accountId == null) return null;

    return _repository.getByIdForAccount(accountId: accountId, diaryId: id);
  }

  /// Search diaries with exact match first and semantic fuzzy fallback.
  Future<TimelineSearchResult> search(String query, {int limit = 20}) async {
    final accountId = ref.read(authProvider);
    if (accountId == null) return const TimelineSearchResult();

    final normalizedQuery = query.trim();
    if (normalizedQuery.isEmpty) {
      return const TimelineSearchResult();
    }

    final sectionLimit = limit <= 0 ? 20 : limit;
    final all = _repository.getByAccountId(accountId, limit: 1000);
    final exactMatches = _searchByText(
      all,
      normalizedQuery,
    ).take(sectionLimit).toList(growable: false);
    final exactIds = exactMatches.map((item) => item.id).toSet();
    final fuzzyScoreById = <int, double>{};

    try {
      final embedding = await ref
          .read(embeddingServiceProvider)
          .generateEmbedding(normalizedQuery);
      final vectorCandidates = _repository.searchByVector(
        accountId: accountId,
        queryVector: embedding,
        limit: sectionLimit < 30 ? 30 : sectionLimit * 3,
      );
      final fallbackCandidates = all
          .where((item) => item.embedding != null && item.embedding!.isNotEmpty)
          .toList(growable: false);
      final candidates = vectorCandidates.isNotEmpty
          ? vectorCandidates
          : fallbackCandidates;
      final threshold = _dynamicSimilarityThreshold(normalizedQuery);

      final supportsFuzzy =
          _normalizedLength(normalizedQuery) >= 2 && embedding.isNotEmpty;
      if (supportsFuzzy) {
        for (final item in candidates) {
          if (exactIds.contains(item.id)) continue;
          final candidate = item.embedding;
          if (candidate == null || candidate.isEmpty) continue;
          final similarity = _cosineSimilarity(embedding, candidate);
          if (!_acceptFuzzyMatch(
            query: normalizedQuery,
            item: item,
            similarity: similarity,
            threshold: threshold,
          )) {
            continue;
          }
          fuzzyScoreById[item.id] = similarity;
        }

        if (exactMatches.isEmpty && fuzzyScoreById.isEmpty) {
          for (final item in candidates) {
            if (exactIds.contains(item.id)) continue;
            final candidate = item.embedding;
            if (candidate == null || candidate.isEmpty) continue;
            final similarity = _cosineSimilarity(embedding, candidate);
            if (similarity < 0.42) continue;
            fuzzyScoreById[item.id] = similarity;
          }
        }
      }
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[Timeline] Search embedding failed: $error');
      }
      // Keep exact-match search available even if embedding service is unavailable.
    }

    // Local AI-style semantic matcher over local DB text/summary/tags.
    // This path is fully local and complements vector retrieval.
    final localAiMatches = _searchByLocalAiDatabase(
      all: all,
      query: normalizedQuery,
      exactIds: exactIds,
      limit: sectionLimit < 24 ? 24 : sectionLimit * 3,
    );
    for (final local in localAiMatches) {
      final existing = fuzzyScoreById[local.item.id];
      if (existing != null) {
        // Keep vector ranking dominant while allowing local semantic match to rerank.
        final blended = existing * 0.72 + local.score * 0.28;
        fuzzyScoreById[local.item.id] = max(existing, blended);
        continue;
      }
      // New candidates from local semantic matcher use a stricter floor.
      if (local.score >= 0.68) {
        fuzzyScoreById[local.item.id] = local.score;
      }
    }

    final fuzzyScores =
        all
            .where((item) => fuzzyScoreById.containsKey(item.id))
            .map(
              (item) =>
                  _ScoredDiary(item: item, score: fuzzyScoreById[item.id] ?? 0),
            )
            .toList(growable: false)
          ..sort((a, b) {
            final scoreCompare = b.score.compareTo(a.score);
            if (scoreCompare != 0) return scoreCompare;
            return b.item.updatedAt.compareTo(a.item.updatedAt);
          });

    if (kDebugMode) {
      final withEmbedding = all.where((d) => d.embedding != null).length;
      debugPrint(
        '[Search] query="$normalizedQuery" exact=${exactMatches.length} '
        'fuzzy=${fuzzyScores.length} vector+localAi withEmbedding=$withEmbedding/${all.length}',
      );
    }

    final fuzzyMatches = fuzzyScores
        .take(sectionLimit)
        .map((entry) => entry.item)
        .toList(growable: false);
    final fuzzyExcerpts = <int, String>{};
    for (final item in fuzzyMatches) {
      final excerpt = _bestSemanticExcerpt(query: normalizedQuery, item: item);
      if (excerpt.isNotEmpty) {
        fuzzyExcerpts[item.id] = excerpt;
      }
    }

    return TimelineSearchResult(
      exactMatches: exactMatches,
      fuzzyMatches: fuzzyMatches,
      fuzzyExcerpts: fuzzyExcerpts,
    );
  }

  Future<List<VectorDiary>> searchNetwork(String query, {int limit = 8}) async {
    final settings = ref.read(settingsProvider);
    if (!settings.enableNetworkSearch) {
      return const [];
    }

    final accountId = ref.read(authProvider);
    if (accountId == null) return const [];

    final normalizedQuery = query.trim();
    if (normalizedQuery.isEmpty) {
      return const [];
    }

    final items = await ref
        .read(webSearchServiceProvider)
        .search(normalizedQuery, limit: limit);
    if (items.isEmpty) return const [];

    final now = DateTime.now().millisecondsSinceEpoch;
    return items
        .asMap()
        .entries
        .map((entry) {
          final index = entry.key;
          final item = entry.value;
          final rawText = [
            item.markdown.trim().isNotEmpty
                ? item.markdown.trim()
                : item.snippet.trim(),
          ].where((line) => line.isNotEmpty).join('\n');
          final sanitizedTitle = item.title.replaceAll('\n', ' ').trim();
          final sanitizedSource = item.source.replaceAll('\n', ' ').trim();

          return VectorDiary(
            id: -(index + 1),
            accountId: accountId,
            rawText: rawText,
            aiSummary: sanitizedTitle.isEmpty ? item.url : sanitizedTitle,
            aiTags:
                'network:url:${item.url}\nnetwork:source:$sanitizedSource\nnetwork:title:$sanitizedTitle',
            createdAt: now,
            updatedAt: now,
          );
        })
        .toList(growable: false);
  }

  List<VectorDiary> _searchByText(List<VectorDiary> all, String query) {
    final lowerQuery = query.toLowerCase();
    return all.where((d) {
      final visible = DiaryContentCodec.decode(d.rawText).text;
      return visible.toLowerCase().contains(lowerQuery) ||
          (d.aiSummary?.toLowerCase().contains(lowerQuery) ?? false);
    }).toList();
  }

  List<_ScoredDiary> _searchByLocalAiDatabase({
    required List<VectorDiary> all,
    required String query,
    required Set<int> exactIds,
    required int limit,
  }) {
    if (_normalizedLength(query) < 2) return const [];

    final scored = <_ScoredDiary>[];
    for (final item in all) {
      if (exactIds.contains(item.id)) continue;
      final score = _localAiDatabaseScore(query: query, item: item);
      if (score < 0.52) continue;
      scored.add(_ScoredDiary(item: item, score: score));
    }

    scored.sort((a, b) {
      final scoreCompare = b.score.compareTo(a.score);
      if (scoreCompare != 0) return scoreCompare;
      return b.item.updatedAt.compareTo(a.item.updatedAt);
    });

    if (scored.length <= limit) return scored;
    return scored.take(limit).toList(growable: false);
  }

  double _localAiDatabaseScore({
    required String query,
    required VectorDiary item,
  }) {
    final visible = DiaryContentCodec.decode(item.rawText).text;
    final summary = item.aiSummary ?? '';
    final tags = item.aiTags ?? '';
    final searchable = '$summary $tags $visible';

    final normalizedQuery = _normalizeSemanticText(query);
    final normalizedSearchable = _normalizeSemanticText(searchable);
    if (normalizedQuery.isEmpty || normalizedSearchable.isEmpty) {
      return 0;
    }

    var score = 0.0;

    if (normalizedSearchable.contains(normalizedQuery)) {
      score += 0.48;
    }

    final queryRunes = normalizedQuery.runes.toSet();
    if (queryRunes.isNotEmpty) {
      var hit = 0;
      for (final rune in queryRunes) {
        final char = String.fromCharCode(rune);
        if (normalizedSearchable.contains(char)) {
          hit += 1;
        }
      }
      score += (hit / queryRunes.length) * 0.24;
    }

    final queryTokens = _extractSemanticTokens(query);
    final searchableTokens = _extractSemanticTokens(searchable).toSet();
    if (queryTokens.isNotEmpty && searchableTokens.isNotEmpty) {
      var overlap = 0;
      for (final token in queryTokens) {
        if (searchableTokens.contains(token)) {
          overlap += 1;
        }
      }
      score += (overlap / queryTokens.length) * 0.24;
    }

    final days = DateTime.now()
        .difference(DateTime.fromMillisecondsSinceEpoch(item.updatedAt))
        .inDays;
    if (days <= 1) {
      score += 0.05;
    } else if (days <= 7) {
      score += 0.03;
    }

    return score.clamp(0.0, 1.0);
  }

  String _bestSemanticExcerpt({
    required String query,
    required VectorDiary item,
  }) {
    final visible = DiaryContentCodec.decode(item.rawText).text.trim();
    final summary = (item.aiSummary ?? '').trim();
    final fragments = <String>[
      ..._collectSemanticFragments(visible),
      ..._collectSemanticFragments(summary),
    ];
    if (fragments.isEmpty) {
      return visible.isNotEmpty ? visible : summary;
    }

    var best = '';
    var bestScore = -1.0;
    for (final fragment in fragments) {
      final score = _semanticFragmentScore(query: query, fragment: fragment);
      if (score > bestScore) {
        bestScore = score;
        best = fragment;
      }
    }

    if (best.isEmpty) {
      return visible.isNotEmpty ? visible : summary;
    }
    return best;
  }

  List<String> _collectSemanticFragments(String input) {
    if (input.isEmpty) return const [];
    final compact = input.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (compact.isEmpty) return const [];

    final coarse = compact
        .split(RegExp(r'[\n\r。！？!?；;]'))
        .map((part) => part.trim())
        .where((part) => part.isNotEmpty)
        .toList(growable: false);
    if (coarse.isEmpty) return const [];

    final fragments = <String>[];
    for (final part in coarse) {
      if (part.runes.length <= 54) {
        fragments.add(part);
        continue;
      }
      final chars = part.runes.toList(growable: false);
      for (var i = 0; i < chars.length; i += 24) {
        final end = min(i + 54, chars.length);
        final slice = String.fromCharCodes(chars.sublist(i, end)).trim();
        if (slice.isNotEmpty) {
          fragments.add(slice);
        }
        if (end == chars.length) break;
      }
    }
    return fragments;
  }

  double _semanticFragmentScore({
    required String query,
    required String fragment,
  }) {
    final normalizedQuery = _normalizeSemanticText(query);
    final normalizedFragment = _normalizeSemanticText(fragment);
    if (normalizedQuery.isEmpty || normalizedFragment.isEmpty) return 0;

    var score = 0.0;
    if (normalizedFragment.contains(normalizedQuery)) {
      score += 0.52;
    }

    final queryRunes = normalizedQuery.runes.toSet();
    if (queryRunes.isNotEmpty) {
      var hit = 0;
      for (final rune in queryRunes) {
        final char = String.fromCharCode(rune);
        if (normalizedFragment.contains(char)) {
          hit += 1;
        }
      }
      score += (hit / queryRunes.length) * 0.24;
    }

    final queryTokens = _extractSemanticTokens(query);
    final fragmentTokens = _extractSemanticTokens(fragment).toSet();
    if (queryTokens.isNotEmpty && fragmentTokens.isNotEmpty) {
      var overlap = 0;
      for (final token in queryTokens) {
        if (fragmentTokens.contains(token)) {
          overlap += 1;
        }
      }
      score += (overlap / queryTokens.length) * 0.24;
    }
    return score.clamp(0.0, 1.0);
  }

  String _normalizeSemanticText(String input) {
    return input
        .toLowerCase()
        .replaceAll(RegExp(r'\s+'), '')
        .replaceAll(RegExp(r'[^\u4e00-\u9fffa-z0-9]'), '');
  }

  List<String> _extractSemanticTokens(String input) {
    final lower = input.toLowerCase();
    final tokens = <String>[];

    final latinMatches = RegExp(r'[a-z0-9]+').allMatches(lower);
    for (final match in latinMatches) {
      final token = match.group(0);
      if (token == null || token.length < 2) continue;
      tokens.add(token);
    }

    final cjk = lower.replaceAll(RegExp(r'[^\u4e00-\u9fff]'), '');
    if (cjk.length >= 2) {
      for (var i = 0; i < cjk.length - 1; i++) {
        tokens.add(cjk.substring(i, i + 2));
      }
    } else if (cjk.isNotEmpty) {
      tokens.add(cjk);
    }

    return tokens;
  }

  int _normalizedLength(String query) {
    return query.replaceAll(RegExp(r'\s+'), '').runes.length;
  }

  bool _acceptFuzzyMatch({
    required String query,
    required VectorDiary item,
    required double similarity,
    required double threshold,
  }) {
    if (similarity.isNaN || similarity < threshold) {
      return false;
    }

    final normalized = query.replaceAll(RegExp(r'\s+'), '');
    if (normalized.runes.length <= 2 && similarity < (threshold + 0.12)) {
      return false;
    }

    final visibleText = DiaryContentCodec.decode(item.rawText).text;
    final combinedText = '$visibleText ${item.aiSummary ?? ''}'.toLowerCase();
    if (normalized.runes.length <= 3) {
      final hasOverlap = normalized.runes.any(
        (code) => combinedText.contains(String.fromCharCode(code)),
      );
      if (!hasOverlap && similarity < (threshold + 0.20)) {
        return false;
      }
    }

    return true;
  }

  double _dynamicSimilarityThreshold(String query) {
    final length = _normalizedLength(query);
    if (length >= 12) return 0.50;
    if (length >= 8) return 0.54;
    if (length >= 4) return 0.58;
    return 0.60;
  }

  double _cosineSimilarity(Float32List a, Float32List b) {
    if (a.length != b.length || a.isEmpty) return -1;

    var dot = 0.0;
    var normA = 0.0;
    var normB = 0.0;
    for (var i = 0; i < a.length; i++) {
      final av = a[i];
      final bv = b[i];
      dot += av * bv;
      normA += av * av;
      normB += bv * bv;
    }
    if (normA <= 0 || normB <= 0) return -1;
    return dot / (sqrt(normA) * sqrt(normB));
  }

  Future<void> _generateAndAttachEmbedding({
    required int accountId,
    required int diaryId,
    required String sourceText,
    required String expectedRawText,
  }) async {
    if (sourceText.trim().isEmpty) return;

    try {
      final embedding = await ref
          .read(embeddingServiceProvider)
          .generateEmbedding(sourceText);
      final latest = _repository.getByIdForAccount(
        accountId: accountId,
        diaryId: diaryId,
      );
      if (latest == null) return;

      // Skip stale write if text changed while embedding was computing.
      if (latest.rawText != expectedRawText) return;

      latest.embedding = embedding;
      _repository.update(latest);
      if (kDebugMode) {
        debugPrint(
          '[Timeline] Embedding attached for diary#$diaryId dim=${embedding.length}',
        );
      }
      refresh();
    } catch (error) {
      if (kDebugMode) {
        debugPrint(
          '[Timeline] Attach embedding failed for diary#$diaryId: $error',
        );
      }
      // Keep note creation/editing path resilient even when AI model is unavailable.
    }
  }

  Future<void> _backfillMissingEmbeddings(int accountId) async {
    final items = _repository.getByAccountId(accountId, limit: 2000);
    final pending = items
        .where((d) => d.embedding == null && d.rawText.trim().isNotEmpty)
        .toList(growable: false);
    if (pending.isEmpty) {
      return;
    }

    if (kDebugMode) {
      debugPrint(
        '[Timeline] Backfill embeddings start pending=${pending.length}',
      );
    }

    for (final diary in pending) {
      final latest = _repository.getByIdForAccount(
        accountId: accountId,
        diaryId: diary.id,
      );
      if (latest == null || latest.embedding != null) {
        continue;
      }
      final sourceText = DiaryContentCodec.decode(latest.rawText).text;
      if (sourceText.trim().isEmpty) {
        continue;
      }
      await _generateAndAttachEmbedding(
        accountId: accountId,
        diaryId: latest.id,
        sourceText: sourceText,
        expectedRawText: latest.rawText,
      );
      await Future<void>.delayed(const Duration(milliseconds: 12));
    }

    if (kDebugMode) {
      debugPrint('[Timeline] Backfill embeddings done');
    }
  }
}

class _ScoredDiary {
  final VectorDiary item;
  final double score;

  const _ScoredDiary({required this.item, required this.score});
}

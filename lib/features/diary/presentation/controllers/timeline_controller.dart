import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/objectbox/objectbox_providers.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../data/ai/embedding_service.dart';
import '../../data/entities/vector_diary.dart';
import '../../data/repositories/vector_diary_repository.dart';
import '../../domain/diary_content_codec.dart';

part 'timeline_controller.g.dart';

class TimelineSearchResult {
  final List<VectorDiary> exactMatches;
  final List<VectorDiary> fuzzyMatches;
  final List<VectorDiary> networkMatches;

  const TimelineSearchResult({
    this.exactMatches = const [],
    this.fuzzyMatches = const [],
    this.networkMatches = const [],
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
    final fuzzyScores = <_ScoredDiary>[];

    try {
      final embedding = await ref
          .read(embeddingServiceProvider)
          .generateEmbedding(normalizedQuery);

      final supportsFuzzy =
          _normalizedLength(normalizedQuery) >= 2 && embedding.isNotEmpty;
      if (supportsFuzzy) {
        for (final item in all) {
          if (exactIds.contains(item.id)) continue;
          final candidate = item.embedding;
          if (candidate == null || candidate.isEmpty) continue;
          final similarity = _cosineSimilarity(embedding, candidate);
          if (!_acceptFuzzyMatch(
            query: normalizedQuery,
            item: item,
            similarity: similarity,
          )) {
            continue;
          }
          fuzzyScores.add(_ScoredDiary(item: item, score: similarity));
        }

        fuzzyScores.sort((a, b) {
          final scoreCompare = b.score.compareTo(a.score);
          if (scoreCompare != 0) return scoreCompare;
          return b.item.updatedAt.compareTo(a.item.updatedAt);
        });
      }

      if (kDebugMode) {
        final withEmbedding = all.where((d) => d.embedding != null).length;
        debugPrint(
          '[Search] query="$normalizedQuery" exact=${exactMatches.length} fuzzy=${fuzzyScores.length} withEmbedding=$withEmbedding/${all.length}',
        );
      }
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[Timeline] Search embedding failed: $error');
      }
      // Keep exact-match search available even if embedding service is unavailable.
    }

    return TimelineSearchResult(
      exactMatches: exactMatches,
      fuzzyMatches: fuzzyScores
          .take(sectionLimit)
          .map((entry) => entry.item)
          .toList(growable: false),
    );
  }

  List<VectorDiary> _searchByText(List<VectorDiary> all, String query) {
    final lowerQuery = query.toLowerCase();
    return all.where((d) {
      final visible = DiaryContentCodec.decode(d.rawText).text;
      return visible.toLowerCase().contains(lowerQuery) ||
          (d.aiSummary?.toLowerCase().contains(lowerQuery) ?? false);
    }).toList();
  }

  int _normalizedLength(String query) {
    return query.replaceAll(RegExp(r'\s+'), '').runes.length;
  }

  bool _acceptFuzzyMatch({
    required String query,
    required VectorDiary item,
    required double similarity,
  }) {
    if (similarity.isNaN || similarity < 0.60) {
      return false;
    }

    final normalized = query.replaceAll(RegExp(r'\s+'), '');
    if (normalized.runes.length <= 2 && similarity < 0.72) {
      return false;
    }

    final visibleText = DiaryContentCodec.decode(item.rawText).text;
    final combinedText = '$visibleText ${item.aiSummary ?? ''}'.toLowerCase();
    if (normalized.runes.length <= 3) {
      final hasOverlap = normalized.runes.any(
        (code) => combinedText.contains(String.fromCharCode(code)),
      );
      if (!hasOverlap && similarity < 0.80) {
        return false;
      }
    }

    return true;
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

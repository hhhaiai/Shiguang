import 'dart:convert';

import 'package:http/http.dart' as http;

class WebSearchResultItem {
  final String title;
  final String snippet;
  final String url;
  final String source;

  const WebSearchResultItem({
    required this.title,
    required this.snippet,
    required this.url,
    required this.source,
  });
}

class WebSearchService {
  static const String _duckDuckGoHost = 'api.duckduckgo.com';

  Future<List<WebSearchResultItem>> search(
    String query, {
    int limit = 8,
  }) async {
    final normalized = query.trim();
    if (normalized.isEmpty) return const [];
    final cappedLimit = limit <= 0 ? 8 : limit;

    try {
      final uri = Uri.https(_duckDuckGoHost, '/', <String, String>{
        'q': normalized,
        'format': 'json',
        'no_html': '1',
        'no_redirect': '1',
        'skip_disambig': '1',
      });
      final response = await http
          .get(
            uri,
            headers: const <String, String>{'Accept': 'application/json'},
          )
          .timeout(const Duration(seconds: 8));

      if (response.statusCode < 200 || response.statusCode >= 300) {
        return const [];
      }

      final decoded = jsonDecode(response.body);
      if (decoded is! Map<String, dynamic>) {
        return const [];
      }

      final dedup = <String, WebSearchResultItem>{};

      void addItem({
        required String title,
        required String snippet,
        required String url,
        required String source,
      }) {
        final normalizedUrl = url.trim();
        if (normalizedUrl.isEmpty || dedup.containsKey(normalizedUrl)) {
          return;
        }
        final normalizedTitle = title.trim();
        final normalizedSnippet = snippet.trim();
        if (normalizedTitle.isEmpty && normalizedSnippet.isEmpty) {
          return;
        }
        dedup[normalizedUrl] = WebSearchResultItem(
          title: normalizedTitle.isEmpty ? normalizedSnippet : normalizedTitle,
          snippet: normalizedSnippet,
          url: normalizedUrl,
          source: source,
        );
      }

      final abstractText = (decoded['AbstractText'] as String?)?.trim() ?? '';
      final abstractUrl = (decoded['AbstractURL'] as String?)?.trim() ?? '';
      final heading = (decoded['Heading'] as String?)?.trim() ?? '';
      if (abstractText.isNotEmpty && abstractUrl.isNotEmpty) {
        addItem(
          title: heading,
          snippet: abstractText,
          url: abstractUrl,
          source: 'DuckDuckGo',
        );
      }

      void parseRelated(dynamic raw) {
        if (raw is! List) return;
        for (final entry in raw) {
          if (entry is! Map<String, dynamic>) continue;
          final text = (entry['Text'] as String?)?.trim() ?? '';
          final firstUrl = (entry['FirstURL'] as String?)?.trim() ?? '';
          if (text.isNotEmpty && firstUrl.isNotEmpty) {
            final splitIndex = text.indexOf(' - ');
            final title = splitIndex > 0 ? text.substring(0, splitIndex) : text;
            addItem(
              title: title,
              snippet: text,
              url: firstUrl,
              source: 'DuckDuckGo',
            );
          }
          parseRelated(entry['Topics']);
          if (dedup.length >= cappedLimit) return;
        }
      }

      parseRelated(decoded['RelatedTopics']);

      return dedup.values.take(cappedLimit).toList(growable: false);
    } catch (_) {
      return const [];
    }
  }
}

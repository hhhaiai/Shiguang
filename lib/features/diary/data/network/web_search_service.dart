import 'dart:convert';

import 'package:http/http.dart' as http;

class WebSearchResultItem {
  final String title;
  final String snippet;
  final String url;
  final String source;
  final String markdown;

  const WebSearchResultItem({
    required this.title,
    required this.snippet,
    required this.url,
    required this.source,
    this.markdown = '',
  });

  WebSearchResultItem copyWith({
    String? title,
    String? snippet,
    String? url,
    String? source,
    String? markdown,
  }) {
    return WebSearchResultItem(
      title: title ?? this.title,
      snippet: snippet ?? this.snippet,
      url: url ?? this.url,
      source: source ?? this.source,
      markdown: markdown ?? this.markdown,
    );
  }
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

      final baseItems = dedup.values.take(cappedLimit).toList(growable: false);
      return _withMarkdownPreview(baseItems);
    } catch (_) {
      return const [];
    }
  }

  Future<List<WebSearchResultItem>> _withMarkdownPreview(
    List<WebSearchResultItem> items,
  ) async {
    if (items.isEmpty) return const [];

    final enriched = <WebSearchResultItem>[];
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      // Limit full-page fetch count to keep search responsive.
      if (i >= 4) {
        enriched.add(item);
        continue;
      }

      final markdown = await _fetchMarkdown(item.url);
      if (markdown.isEmpty) {
        enriched.add(item);
        continue;
      }
      enriched.add(item.copyWith(markdown: markdown));
    }
    return enriched;
  }

  Future<String> _fetchMarkdown(String url) async {
    try {
      final uri = Uri.tryParse(url);
      if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
        return '';
      }

      final response = await http
          .get(
            uri,
            headers: const <String, String>{
              'User-Agent':
                  'Mozilla/5.0 (compatible; ShiguangBot/1.0; +https://shiguang.local)',
            },
          )
          .timeout(const Duration(seconds: 8));
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return '';
      }

      final contentType = response.headers['content-type'] ?? '';
      if (!contentType.contains('text/html')) {
        return '';
      }

      final body = utf8.decode(response.bodyBytes, allowMalformed: true);
      return _htmlToMarkdown(body);
    } catch (_) {
      return '';
    }
  }

  String _htmlToMarkdown(String html) {
    if (html.trim().isEmpty) return '';

    var text = html
        .replaceAll(
          RegExp(
            r'<script[^>]*>.*?</script>',
            caseSensitive: false,
            dotAll: true,
          ),
          '',
        )
        .replaceAll(
          RegExp(
            r'<style[^>]*>.*?</style>',
            caseSensitive: false,
            dotAll: true,
          ),
          '',
        )
        .replaceAll(
          RegExp(r'<head[^>]*>.*?</head>', caseSensitive: false, dotAll: true),
          '',
        )
        .replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false), '\n')
        .replaceAll(RegExp(r'</p>', caseSensitive: false), '\n\n')
        .replaceAll(RegExp(r'</div>', caseSensitive: false), '\n')
        .replaceAll(RegExp(r'</h[1-6]>', caseSensitive: false), '\n\n')
        .replaceAll(RegExp(r'<li[^>]*>', caseSensitive: false), '- ')
        .replaceAll(RegExp(r'</li>', caseSensitive: false), '\n')
        .replaceAll(RegExp(r'<[^>]+>', dotAll: true), ' ');

    const htmlEntities = <String, String>{
      '&nbsp;': ' ',
      '&amp;': '&',
      '&lt;': '<',
      '&gt;': '>',
      '&quot;': '"',
      '&#39;': '\'',
    };
    htmlEntities.forEach((entity, char) {
      text = text.replaceAll(entity, char);
    });

    text = text
        .replaceAll(RegExp(r'\r\n?'), '\n')
        .replaceAll(RegExp(r'[ \t]+'), ' ')
        .replaceAll(RegExp(r'\n{3,}'), '\n\n')
        .trim();

    if (text.length > 6000) {
      text = '${text.substring(0, 6000)}\n\n...';
    }

    return text;
  }
}

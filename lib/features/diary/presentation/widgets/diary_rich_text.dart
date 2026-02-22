import 'package:flutter/material.dart';
import '../../domain/diary_style_markers.dart';

class DiaryRichText {
  static final RegExp _headingPattern = RegExp(r'^(#{1,3})\s+');
  static final RegExp _tokenPattern = RegExp(
    r'(\uE000[^\uE001\n]+?\uE001|\uE002[^\uE003\n]+?\uE003|\uE004[^\uE005\n]+?\uE005|\uE006[^\uE007\n]+?\uE007|<(?:strong|b)>[^<\n]+?</(?:strong|b)>|<(?:em|i)>[^<\n]+?</(?:em|i)>|<(?:del|strike|s)>[^<\n]+?</(?:del|strike|s)>|<code>[^<\n]+?</code>|\*\*[^*\n]+?\*\*|__[^_\n]+?__|~~[^~\n]+?~~|`[^`\n]+?`|\*(?!\s)[^*\n]+?\*(?<!\s)|_(?!\s)[^_\n]+?_(?<!\s))',
    caseSensitive: false,
  );

  static final RegExp _stripHtmlTagPattern = RegExp(
    r'</?(?:strong|b|em|i|del|strike|s|code)>',
    caseSensitive: false,
  );

  static TextSpan buildTextSpan({
    required BuildContext context,
    required String source,
    required TextStyle baseStyle,
  }) {
    final codeBackground = Theme.of(context).brightness == Brightness.dark
        ? const Color(0x26FFFFFF)
        : const Color(0x14000000);
    return TextSpan(
      style: baseStyle,
      children: _buildSpans(source, baseStyle, codeBackground),
    );
  }

  static List<InlineSpan> _buildSpans(
    String source,
    TextStyle base,
    Color codeBackground,
  ) {
    if (source.isEmpty) return const <InlineSpan>[];
    final spans = <InlineSpan>[];
    final lines = source.split('\n');
    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      spans.addAll(
        _buildLineSpans(line: line, base: base, codeBackground: codeBackground),
      );
      if (i < lines.length - 1) {
        spans.add(TextSpan(text: '\n', style: base));
      }
    }
    return spans;
  }

  static List<InlineSpan> _buildLineSpans({
    required String line,
    required TextStyle base,
    required Color codeBackground,
  }) {
    var remaining = line;
    var contentStyle = base;
    final headingMatch = _headingPattern.firstMatch(line);
    if (headingMatch != null) {
      remaining = line.substring(headingMatch.end);
      final level = headingMatch.group(1)?.length ?? 1;
      final baseSize = base.fontSize ?? 16;
      if (level <= 1) {
        contentStyle = base.copyWith(
          fontSize: baseSize + 8,
          height: 1.25,
          fontWeight: FontWeight.w800,
        );
      } else if (level == 2) {
        contentStyle = base.copyWith(
          fontSize: baseSize + 5,
          height: 1.3,
          fontWeight: FontWeight.w700,
        );
      } else {
        contentStyle = base.copyWith(
          fontSize: baseSize + 2,
          height: 1.35,
          fontWeight: FontWeight.w700,
        );
      }
    }
    return _buildInlineSpans(
      source: remaining,
      base: contentStyle,
      codeBackground: codeBackground,
    );
  }

  static List<InlineSpan> _buildInlineSpans({
    required String source,
    required TextStyle base,
    required Color codeBackground,
  }) {
    if (source.isEmpty) return const <InlineSpan>[];
    final spans = <InlineSpan>[];
    var cursor = 0;
    for (final match in _tokenPattern.allMatches(source)) {
      if (match.start > cursor) {
        spans.add(
          TextSpan(text: source.substring(cursor, match.start), style: base),
        );
      }

      final token = match.group(0)!;
      final lower = token.toLowerCase();
      if ((token.startsWith('**') &&
              token.endsWith('**') &&
              token.length > 4) ||
          (token.startsWith(DiaryStyleMarkers.boldOpen) &&
              token.endsWith(DiaryStyleMarkers.boldClose) &&
              token.length > 2) ||
          (token.startsWith('__') &&
              token.endsWith('__') &&
              token.length > 4) ||
          (lower.startsWith('<b>') &&
              lower.endsWith('</b>') &&
              token.length > 7) ||
          (lower.startsWith('<strong>') &&
              lower.endsWith('</strong>') &&
              token.length > 17)) {
        spans.add(
          TextSpan(
            text: _unbox(token),
            style: base.copyWith(fontWeight: FontWeight.w700),
          ),
        );
      } else if ((token.startsWith('~~') &&
              token.endsWith('~~') &&
              token.length > 4) ||
          (token.startsWith(DiaryStyleMarkers.strikeOpen) &&
              token.endsWith(DiaryStyleMarkers.strikeClose) &&
              token.length > 2) ||
          (lower.startsWith('<s>') &&
              lower.endsWith('</s>') &&
              token.length > 7) ||
          (lower.startsWith('<del>') &&
              lower.endsWith('</del>') &&
              token.length > 11) ||
          (lower.startsWith('<strike>') &&
              lower.endsWith('</strike>') &&
              token.length > 17)) {
        spans.add(
          TextSpan(
            text: _unbox(token),
            style: base.copyWith(decoration: TextDecoration.lineThrough),
          ),
        );
      } else if ((token.startsWith('`') &&
              token.endsWith('`') &&
              token.length > 2) ||
          (token.startsWith(DiaryStyleMarkers.codeOpen) &&
              token.endsWith(DiaryStyleMarkers.codeClose) &&
              token.length > 2) ||
          (lower.startsWith('<code>') &&
              lower.endsWith('</code>') &&
              token.length > 13)) {
        spans.add(
          TextSpan(
            text: _unbox(token),
            style: base.copyWith(
              fontFamily: 'monospace',
              backgroundColor: codeBackground,
            ),
          ),
        );
      } else if ((token.startsWith('*') &&
              token.endsWith('*') &&
              token.length > 2) ||
          (token.startsWith(DiaryStyleMarkers.italicOpen) &&
              token.endsWith(DiaryStyleMarkers.italicClose) &&
              token.length > 2) ||
          (token.startsWith('_') && token.endsWith('_') && token.length > 2) ||
          (lower.startsWith('<i>') &&
              lower.endsWith('</i>') &&
              token.length > 7) ||
          (lower.startsWith('<em>') &&
              lower.endsWith('</em>') &&
              token.length > 9)) {
        spans.add(
          TextSpan(
            text: _unbox(token),
            style: base.copyWith(fontStyle: FontStyle.italic),
          ),
        );
      } else {
        spans.add(TextSpan(text: token, style: base));
      }
      cursor = match.end;
    }
    if (cursor < source.length) {
      spans.add(TextSpan(text: source.substring(cursor), style: base));
    }
    return spans;
  }

  static String _unbox(String token) {
    final lower = token.toLowerCase();
    if (token.startsWith(DiaryStyleMarkers.boldOpen) &&
        token.endsWith(DiaryStyleMarkers.boldClose) &&
        token.length > 2) {
      return token.substring(1, token.length - 1);
    }
    if (token.startsWith(DiaryStyleMarkers.italicOpen) &&
        token.endsWith(DiaryStyleMarkers.italicClose) &&
        token.length > 2) {
      return token.substring(1, token.length - 1);
    }
    if (token.startsWith(DiaryStyleMarkers.strikeOpen) &&
        token.endsWith(DiaryStyleMarkers.strikeClose) &&
        token.length > 2) {
      return token.substring(1, token.length - 1);
    }
    if (token.startsWith(DiaryStyleMarkers.codeOpen) &&
        token.endsWith(DiaryStyleMarkers.codeClose) &&
        token.length > 2) {
      return token.substring(1, token.length - 1);
    }
    if (token.startsWith('**') && token.endsWith('**') && token.length > 4) {
      return token.substring(2, token.length - 2);
    }
    if (token.startsWith('__') && token.endsWith('__') && token.length > 4) {
      return token.substring(2, token.length - 2);
    }
    if (token.startsWith('~~') && token.endsWith('~~') && token.length > 4) {
      return token.substring(2, token.length - 2);
    }
    if (token.startsWith('*') && token.endsWith('*') && token.length > 2) {
      return token.substring(1, token.length - 1);
    }
    if (token.startsWith('_') && token.endsWith('_') && token.length > 2) {
      return token.substring(1, token.length - 1);
    }
    if (token.startsWith('`') && token.endsWith('`') && token.length > 2) {
      return token.substring(1, token.length - 1);
    }
    if (lower.startsWith('<b>') && lower.endsWith('</b>') && token.length > 7) {
      return token.substring(3, token.length - 4);
    }
    if (lower.startsWith('<strong>') &&
        lower.endsWith('</strong>') &&
        token.length > 17) {
      return token.substring(8, token.length - 9);
    }
    if (lower.startsWith('<i>') && lower.endsWith('</i>') && token.length > 7) {
      return token.substring(3, token.length - 4);
    }
    if (lower.startsWith('<em>') &&
        lower.endsWith('</em>') &&
        token.length > 9) {
      return token.substring(4, token.length - 5);
    }
    if (lower.startsWith('<s>') && lower.endsWith('</s>') && token.length > 7) {
      return token.substring(3, token.length - 4);
    }
    if (lower.startsWith('<del>') &&
        lower.endsWith('</del>') &&
        token.length > 11) {
      return token.substring(5, token.length - 6);
    }
    if (lower.startsWith('<strike>') &&
        lower.endsWith('</strike>') &&
        token.length > 17) {
      return token.substring(8, token.length - 9);
    }
    if (lower.startsWith('<code>') &&
        lower.endsWith('</code>') &&
        token.length > 13) {
      return token.substring(6, token.length - 7);
    }
    return token;
  }

  static String toPlainText(String source) {
    if (source.isEmpty) return source;
    var normalized = source.replaceAll(_stripHtmlTagPattern, '');
    normalized = DiaryStyleMarkers.stripAll(normalized);
    normalized = normalized.replaceAllMapped(
      _tokenPattern,
      (match) => _unbox(match.group(0) ?? ''),
    );
    normalized = normalized.replaceAllMapped(
      RegExp(r'^\s*#{1,3}\s+', multiLine: true),
      (_) => '',
    );
    return normalized;
  }
}

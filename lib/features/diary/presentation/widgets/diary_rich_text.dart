import 'package:flutter/material.dart';

import '../../domain/diary_style_markers.dart';

class DiaryRichText {
  static final RegExp _headingPattern = RegExp(r'^(#{1,3})\s+');
  static final RegExp _quotePattern = RegExp(r'^\s*>\s?');
  static final RegExp _unorderedListPattern = RegExp(r'^\s*[-*+]\s+');
  static final RegExp _orderedListPattern = RegExp(r'^\s*\d+\.\s+');
  static final RegExp _stripHtmlTagPattern = RegExp(
    r'</?(?:strong|b|em|i|del|strike|s|code)>',
    caseSensitive: false,
  );
  static final RegExp _legacyInlineStylePattern = RegExp(
    r'(\*\*[^*\n]+?\*\*|__[^_\n]+?__|~~[^~\n]+?~~|`[^`\n]+?`|\*(?!\s)[^*\n]+?\*(?<!\s)|_(?!\s)[^_\n]+?_(?<!\s))',
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
      children: buildStyledSpans(
        source: source,
        baseStyle: baseStyle,
        codeBackground: codeBackground,
        parseMarkdown: true,
      ),
    );
  }

  static List<InlineSpan> buildStyledSpans({
    required String source,
    required TextStyle baseStyle,
    required Color codeBackground,
    bool parseMarkdown = false,
    bool includeMarkers = false,
    TextStyle? markerStyle,
  }) {
    if (source.isEmpty) return const <InlineSpan>[];
    final markerHiddenStyle =
        markerStyle ??
        baseStyle.copyWith(
          color: Colors.transparent,
          fontSize: 0.001,
          height: 0.001,
          letterSpacing: -1.0,
        );
    if (!parseMarkdown) {
      return _buildInlineSpans(
        source: source,
        baseStyle: baseStyle,
        codeBackground: codeBackground,
        includeMarkers: includeMarkers,
        markerStyle: markerHiddenStyle,
        parseMarkdown: false,
      );
    }
    return _buildMarkdownAwareSpans(
      source: source,
      baseStyle: baseStyle,
      codeBackground: codeBackground,
      includeMarkers: includeMarkers,
      markerStyle: markerHiddenStyle,
    );
  }

  static String toPlainText(String source) {
    if (source.isEmpty) return source;
    var normalized = source.replaceAll(_stripHtmlTagPattern, '');
    normalized = DiaryStyleMarkers.stripAll(normalized);
    normalized = normalized.replaceAllMapped(_legacyInlineStylePattern, (
      match,
    ) {
      final token = match.group(0) ?? '';
      if (token.startsWith('**') && token.endsWith('**') && token.length > 4) {
        return token.substring(2, token.length - 2);
      }
      if (token.startsWith('__') && token.endsWith('__') && token.length > 4) {
        return token.substring(2, token.length - 2);
      }
      if (token.startsWith('~~') && token.endsWith('~~') && token.length > 4) {
        return token.substring(2, token.length - 2);
      }
      if (token.startsWith('`') && token.endsWith('`') && token.length > 2) {
        return token.substring(1, token.length - 1);
      }
      if (token.startsWith('*') && token.endsWith('*') && token.length > 2) {
        return token.substring(1, token.length - 1);
      }
      if (token.startsWith('_') && token.endsWith('_') && token.length > 2) {
        return token.substring(1, token.length - 1);
      }
      return token;
    });
    return normalized;
  }

  static TextStyle _applyInlineStyle({
    required TextStyle base,
    required _InlineFormatState state,
    required Color codeBackground,
  }) {
    var style = base;
    if (state.bold) {
      style = style.copyWith(fontWeight: FontWeight.w700);
    }
    if (state.italic) {
      style = style.copyWith(fontStyle: FontStyle.italic);
    }
    if (state.strike) {
      style = _lineThroughStyle(style);
    }
    if (state.code) {
      style = style.copyWith(
        fontFamily: 'monospace',
        backgroundColor: codeBackground,
      );
    }
    return style;
  }

  static TextStyle _lineThroughStyle(TextStyle base) {
    final decorations = <TextDecoration>[];
    if (base.decoration != null && base.decoration != TextDecoration.none) {
      decorations.add(base.decoration!);
    }
    decorations.add(TextDecoration.lineThrough);
    return base.copyWith(
      decoration: TextDecoration.combine(decorations),
      decorationColor: base.color ?? Colors.black,
      decorationThickness: 2.5,
      decorationStyle: TextDecorationStyle.solid,
    );
  }

  static List<InlineSpan> _buildMarkdownAwareSpans({
    required String source,
    required TextStyle baseStyle,
    required Color codeBackground,
    required bool includeMarkers,
    required TextStyle markerStyle,
  }) {
    final spans = <InlineSpan>[];
    final lines = source.split('\n');
    for (var index = 0; index < lines.length; index++) {
      spans.addAll(
        _buildMarkdownLineSpans(
          line: lines[index],
          baseStyle: baseStyle,
          codeBackground: codeBackground,
          includeMarkers: includeMarkers,
          markerStyle: markerStyle,
        ),
      );
      if (index < lines.length - 1) {
        spans.add(TextSpan(text: '\n', style: baseStyle));
      }
    }
    return spans;
  }

  static List<InlineSpan> _buildMarkdownLineSpans({
    required String line,
    required TextStyle baseStyle,
    required Color codeBackground,
    required bool includeMarkers,
    required TextStyle markerStyle,
  }) {
    var content = line;
    var contentStyle = baseStyle;

    final headingMatch = _headingPattern.firstMatch(content);
    if (headingMatch != null) {
      content = content.substring(headingMatch.end);
      final level = headingMatch.group(1)?.length ?? 1;
      final baseSize = baseStyle.fontSize ?? 16;
      if (level <= 1) {
        contentStyle = baseStyle.copyWith(
          fontSize: baseSize + 8,
          height: 1.25,
          fontWeight: FontWeight.w800,
        );
      } else if (level == 2) {
        contentStyle = baseStyle.copyWith(
          fontSize: baseSize + 5,
          height: 1.3,
          fontWeight: FontWeight.w700,
        );
      } else {
        contentStyle = baseStyle.copyWith(
          fontSize: baseSize + 2,
          height: 1.35,
          fontWeight: FontWeight.w700,
        );
      }
    }

    final quoteMatch = _quotePattern.firstMatch(content);
    if (quoteMatch != null) {
      content = content.substring(quoteMatch.end);
      contentStyle = contentStyle.copyWith(
        fontStyle: FontStyle.italic,
        color: contentStyle.color?.withValues(alpha: 0.8),
      );
    }

    final unorderedMatch = _unorderedListPattern.firstMatch(content);
    if (unorderedMatch != null) {
      content = '• ${content.substring(unorderedMatch.end)}';
    }

    final orderedMatch = _orderedListPattern.firstMatch(content);
    if (orderedMatch != null) {
      final prefix = content.substring(0, orderedMatch.end).trimRight();
      final number = prefix.substring(0, prefix.length - 1).trim();
      content = '$number. ${content.substring(orderedMatch.end)}';
    }

    return _buildInlineSpans(
      source: content,
      baseStyle: contentStyle,
      codeBackground: codeBackground,
      includeMarkers: includeMarkers,
      markerStyle: markerStyle,
      parseMarkdown: true,
    );
  }

  static List<InlineSpan> _buildInlineSpans({
    required String source,
    required TextStyle baseStyle,
    required Color codeBackground,
    required bool includeMarkers,
    required TextStyle markerStyle,
    required bool parseMarkdown,
  }) {
    final spans = <InlineSpan>[];
    final buffer = StringBuffer();
    final active = _InlineFormatState();

    void flushBuffer() {
      if (buffer.isEmpty) return;
      spans.add(
        TextSpan(
          text: buffer.toString(),
          style: _applyInlineStyle(
            base: baseStyle,
            state: active,
            codeBackground: codeBackground,
          ),
        ),
      );
      buffer.clear();
    }

    for (var index = 0; index < source.length; index++) {
      final char = source[index];

      final openFormat = DiaryStyleMarkers.formatForOpenMarker(char);
      if (openFormat != null) {
        flushBuffer();
        if (includeMarkers) {
          spans.add(TextSpan(text: char, style: markerStyle));
        }
        active.enable(openFormat);
        continue;
      }
      final closeFormat = DiaryStyleMarkers.formatForCloseMarker(char);
      if (closeFormat != null) {
        flushBuffer();
        if (includeMarkers) {
          spans.add(TextSpan(text: char, style: markerStyle));
        }
        active.disable(closeFormat);
        continue;
      }
      if (DiaryStyleMarkers.isAnyMarker(char)) {
        flushBuffer();
        if (includeMarkers) {
          spans.add(TextSpan(text: char, style: markerStyle));
        }
        continue;
      }

      if (parseMarkdown) {
        final markdown = _matchMarkdownDelimiter(
          source: source,
          index: index,
          state: active,
        );
        if (markdown != null) {
          flushBuffer();
          active.toggle(markdown.format);
          index += markdown.length - 1;
          continue;
        }
      }

      buffer.write(char);
    }

    flushBuffer();
    return spans;
  }

  static _MarkdownDelimiter? _matchMarkdownDelimiter({
    required String source,
    required int index,
    required _InlineFormatState state,
  }) {
    final char = source[index];

    if (char == '`') {
      if (!state.code) {
        final next = source.indexOf('`', index + 1);
        if (next <= index + 1) return null;
      }
      return const _MarkdownDelimiter(format: 'code', length: 1);
    }

    if (state.code) return null;

    if (index + 1 < source.length) {
      final pair = source.substring(index, index + 2);
      if (pair == '~~') {
        if (!state.strike) {
          final close = source.indexOf('~~', index + 2);
          if (close <= index + 2) return null;
        }
        return const _MarkdownDelimiter(format: 'strike', length: 2);
      }
      if (pair == '**' || pair == '__') {
        if (!state.bold) {
          final close = source.indexOf(pair, index + 2);
          if (close <= index + 2) return null;
        }
        return const _MarkdownDelimiter(format: 'bold', length: 2);
      }
    }

    if (char == '*' || char == '_') {
      final active = state.italic;
      if (_isValidSingleItalicDelimiter(
        source: source,
        index: index,
        delimiter: char,
        active: active,
      )) {
        return const _MarkdownDelimiter(format: 'italic', length: 1);
      }
    }

    return null;
  }

  static bool _isValidSingleItalicDelimiter({
    required String source,
    required int index,
    required String delimiter,
    required bool active,
  }) {
    final previous = index > 0 ? source[index - 1] : '';
    final next = index + 1 < source.length ? source[index + 1] : '';

    if (delimiter == '_' && _isWordChar(previous) && _isWordChar(next)) {
      return false;
    }
    if (index > 0 && source[index - 1] == '\\') {
      return false;
    }

    if (active) {
      return previous.isNotEmpty && !_isWhitespace(previous);
    }

    if (next.isEmpty || _isWhitespace(next)) {
      return false;
    }
    final close = source.indexOf(delimiter, index + 1);
    if (close <= index + 1) return false;
    return true;
  }

  static bool _isWhitespace(String char) {
    if (char.isEmpty) return true;
    return char.trim().isEmpty;
  }

  static bool _isWordChar(String char) {
    if (char.isEmpty) return false;
    return RegExp(r'[A-Za-z0-9]').hasMatch(char);
  }
}

class _InlineFormatState {
  bool bold = false;
  bool italic = false;
  bool strike = false;
  bool code = false;

  void enable(String format) {
    switch (format) {
      case 'bold':
        bold = true;
        break;
      case 'italic':
        italic = true;
        break;
      case 'strike':
        strike = true;
        break;
      case 'code':
        code = true;
        break;
    }
  }

  void disable(String format) {
    switch (format) {
      case 'bold':
        bold = false;
        break;
      case 'italic':
        italic = false;
        break;
      case 'strike':
        strike = false;
        break;
      case 'code':
        code = false;
        break;
    }
  }

  void toggle(String format) {
    switch (format) {
      case 'bold':
        bold = !bold;
        break;
      case 'italic':
        italic = !italic;
        break;
      case 'strike':
        strike = !strike;
        break;
      case 'code':
        code = !code;
        break;
    }
  }
}

class _MarkdownDelimiter {
  final String format;
  final int length;

  const _MarkdownDelimiter({required this.format, required this.length});
}

import 'package:flutter/material.dart';

import '../../domain/diary_style_markers.dart';

class DiaryRichText {
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
      ),
    );
  }

  static List<InlineSpan> buildStyledSpans({
    required String source,
    required TextStyle baseStyle,
    required Color codeBackground,
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
          spans.add(TextSpan(text: char, style: markerHiddenStyle));
        }
        active.enable(openFormat);
        continue;
      }
      final closeFormat = DiaryStyleMarkers.formatForCloseMarker(char);
      if (closeFormat != null) {
        flushBuffer();
        if (includeMarkers) {
          spans.add(TextSpan(text: char, style: markerHiddenStyle));
        }
        active.disable(closeFormat);
        continue;
      }
      if (DiaryStyleMarkers.isAnyMarker(char)) {
        flushBuffer();
        if (includeMarkers) {
          spans.add(TextSpan(text: char, style: markerHiddenStyle));
        }
        continue;
      }
      buffer.write(char);
    }
    flushBuffer();
    return spans;
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
}

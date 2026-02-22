import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:markdown/markdown.dart' as md;

class MarkdownMathSupport {
  static List<md.InlineSyntax> get inlineSyntaxes => <md.InlineSyntax>[
    _MathBlockInlineSyntax(),
    _MathInlineSyntax(),
  ];

  static Map<String, MarkdownElementBuilder> builders({
    required TextStyle baseStyle,
    required Color bodyTextColor,
    required Color secondaryTextColor,
  }) {
    return <String, MarkdownElementBuilder>{
      'math-inline': _MathInlineBuilder(
        baseStyle: baseStyle,
        bodyTextColor: bodyTextColor,
      ),
      'math-block': _MathBlockBuilder(
        baseStyle: baseStyle,
        bodyTextColor: bodyTextColor,
        secondaryTextColor: secondaryTextColor,
      ),
    };
  }

  static String normalizeMathSource(String source) {
    if (source.isEmpty) return source;
    var text = source;
    text = text.replaceAllMapped(
      RegExp(r'\\\(([\s\S]*?)\\\)'),
      (match) => '\$${match.group(1) ?? ''}\$',
    );
    text = text.replaceAllMapped(
      RegExp(r'\\\[([\s\S]*?)\\\]'),
      (match) => '\$\$${match.group(1) ?? ''}\$\$',
    );
    return text;
  }
}

class _MathInlineSyntax extends md.InlineSyntax {
  _MathInlineSyntax()
    : super(r'(?<!\\)\$(?!\$)([^$\n]+?)(?<!\\)\$', startCharacter: 36);

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final tex = (match.group(1) ?? '').trim();
    if (tex.isEmpty) return false;
    parser.addNode(md.Element.text('math-inline', _unescape(tex)));
    return true;
  }
}

class _MathBlockInlineSyntax extends md.InlineSyntax {
  _MathBlockInlineSyntax()
    : super(r'(?<!\\)\$\$([\s\S]+?)(?<!\\)\$\$', startCharacter: 36);

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final tex = (match.group(1) ?? '').trim();
    if (tex.isEmpty) return false;
    parser.addNode(md.Element.text('math-block', _unescape(tex)));
    return true;
  }
}

String _unescape(String source) {
  return source
      .replaceAll(r'\$', '\$')
      .replaceAll(r'\{', '{')
      .replaceAll(r'\}', '}');
}

class _MathInlineBuilder extends MarkdownElementBuilder {
  final TextStyle baseStyle;
  final Color bodyTextColor;

  _MathInlineBuilder({required this.baseStyle, required this.bodyTextColor});

  @override
  Widget? visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) {
    final tex = element.textContent.trim();
    if (tex.isEmpty) return null;
    final style = (parentStyle ?? preferredStyle ?? baseStyle).copyWith(
      color: bodyTextColor,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Math.tex(
        tex,
        mathStyle: MathStyle.text,
        textStyle: style,
        onErrorFallback: (error) =>
            Text(tex, style: style.copyWith(fontFamily: 'monospace')),
      ),
    );
  }
}

class _MathBlockBuilder extends MarkdownElementBuilder {
  final TextStyle baseStyle;
  final Color bodyTextColor;
  final Color secondaryTextColor;

  _MathBlockBuilder({
    required this.baseStyle,
    required this.bodyTextColor,
    required this.secondaryTextColor,
  });

  @override
  bool isBlockElement() => true;

  @override
  Widget? visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) {
    final tex = element.textContent.trim();
    if (tex.isEmpty) return null;
    final style = (preferredStyle ?? parentStyle ?? baseStyle).copyWith(
      color: bodyTextColor,
    );
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: secondaryTextColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Math.tex(
          tex,
          mathStyle: MathStyle.display,
          textStyle: style,
          onErrorFallback: (error) =>
              Text(tex, style: style.copyWith(fontFamily: 'monospace')),
        ),
      ),
    );
  }
}

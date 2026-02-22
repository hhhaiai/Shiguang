import 'package:flutter_test/flutter_test.dart';

import 'package:shiguang/features/diary/presentation/widgets/markdown_diagram_resolver.dart';
import 'package:shiguang/features/diary/presentation/widgets/markdown_html_embed_parser.dart';

void main() {
  group('MarkdownDiagramResolver', () {
    test('replaces drawio fence with fallback markdown when disabled', () async {
      const source = '''
Before

```drawio
<mxGraphModel><root><mxCell id="0"/></root></mxGraphModel>
```

After
''';

      final resolved = await MarkdownDiagramResolver.resolveMarkdown(source);

      expect(MarkdownDiagramResolver.hasDiagramFence(source), isTrue);
      expect(
        resolved,
        contains('Draw.io source hidden (rendering temporarily disabled).'),
      );
      expect(resolved, isNot(contains('<mxGraphModel>')));
      expect(resolved, contains('Before'));
      expect(resolved, contains('After'));
    });

    test('keeps non-diagram markdown unchanged', () async {
      const source = '# Title\n\nNormal paragraph.';
      final resolved = await MarkdownDiagramResolver.resolveMarkdown(source);
      expect(MarkdownDiagramResolver.hasDiagramFence(source), isFalse);
      expect(resolved, source);
    });
  });

  group('MarkdownHtmlEmbedParser', () {
    test('parses markdown + details + video + audio chunks in order', () {
      const source = '''
Intro

<details>
  <summary>点击展开</summary>
  body line
</details>

<video controls>
  <source src="movie.mp4" type="video/mp4">
</video>

<audio controls>
  <source src="audio.mp3" type="audio/mpeg">
</audio>

Tail
''';

      final chunks = MarkdownHtmlEmbedParser.parse(source);

      expect(chunks.length, 5);
      expect(chunks[0].isMarkdown, isTrue);
      expect(chunks[1].isDetails, isTrue);
      expect(chunks[1].title, '点击展开');
      expect(chunks[1].content, contains('body line'));
      expect(chunks[2].isVideo, isTrue);
      expect(chunks[2].content, 'movie.mp4');
      expect(chunks[3].isAudio, isTrue);
      expect(chunks[3].content, 'audio.mp3');
      expect(chunks[4].isMarkdown, isTrue);
      expect(chunks[4].content, contains('Tail'));
    });
  });
}

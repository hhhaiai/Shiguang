class MarkdownHtmlEmbedChunk {
  final MarkdownHtmlChunkType type;
  final String content;
  final String? title;

  const MarkdownHtmlEmbedChunk._({
    required this.type,
    required this.content,
    this.title,
  });

  const MarkdownHtmlEmbedChunk.markdown(String content)
    : this._(type: MarkdownHtmlChunkType.markdown, content: content);

  const MarkdownHtmlEmbedChunk.video(String source)
    : this._(type: MarkdownHtmlChunkType.video, content: source);

  const MarkdownHtmlEmbedChunk.audio(String source)
    : this._(type: MarkdownHtmlChunkType.audio, content: source);

  const MarkdownHtmlEmbedChunk.details({
    required String summary,
    required String body,
  }) : this._(
         type: MarkdownHtmlChunkType.details,
         content: body,
         title: summary,
       );

  bool get isMarkdown => type == MarkdownHtmlChunkType.markdown;
  bool get isVideo => type == MarkdownHtmlChunkType.video;
  bool get isAudio => type == MarkdownHtmlChunkType.audio;
  bool get isDetails => type == MarkdownHtmlChunkType.details;
}

enum MarkdownHtmlChunkType { markdown, video, audio, details }

class MarkdownHtmlEmbedParser {
  static final RegExp _detailsPattern = RegExp(
    r'<details\b[^>]*>([\s\S]*?)</details>',
    caseSensitive: false,
  );
  static final RegExp _summaryPattern = RegExp(
    r'<summary\b[^>]*>([\s\S]*?)</summary>',
    caseSensitive: false,
  );
  static final RegExp _videoPattern = RegExp(
    r'<video\b([^>]*)>([\s\S]*?)</video>',
    caseSensitive: false,
  );
  static final RegExp _audioPattern = RegExp(
    r'<audio\b([^>]*)>([\s\S]*?)</audio>',
    caseSensitive: false,
  );
  static final RegExp _srcAttributePattern = RegExp(
    r'''\bsrc\s*=\s*['"]([^'"]+)['"]''',
    caseSensitive: false,
  );
  static final RegExp _stripTagPattern = RegExp(r'<[^>]+>');
  static final RegExp _anyHtmlStartPattern = RegExp(
    r'<\s*(details|video|audio)\b',
    caseSensitive: false,
  );

  static List<MarkdownHtmlEmbedChunk> parse(String source) {
    if (source.isEmpty) return const <MarkdownHtmlEmbedChunk>[];
    final chunks = <MarkdownHtmlEmbedChunk>[];
    var cursor = 0;

    while (cursor < source.length) {
      final details = _detailsPattern.matchAsPrefix(source, cursor);
      if (details != null) {
        final inner = details.group(1) ?? '';
        final summaryMatch = _summaryPattern.firstMatch(inner);
        final summary = _stripTags(summaryMatch?.group(1) ?? '').trim();
        final bodyRaw = summaryMatch == null
            ? inner
            : inner.replaceRange(summaryMatch.start, summaryMatch.end, '');
        final body = _dedentBlock(bodyRaw).trim();
        chunks.add(
          MarkdownHtmlEmbedChunk.details(summary: summary, body: body),
        );
        cursor = details.end;
        continue;
      }

      final video = _videoPattern.matchAsPrefix(source, cursor);
      if (video != null) {
        final src = _extractMediaSource(
          video.group(1) ?? '',
          video.group(2) ?? '',
        );
        if (src.isNotEmpty) chunks.add(MarkdownHtmlEmbedChunk.video(src));
        cursor = video.end;
        continue;
      }

      final audio = _audioPattern.matchAsPrefix(source, cursor);
      if (audio != null) {
        final src = _extractMediaSource(
          audio.group(1) ?? '',
          audio.group(2) ?? '',
        );
        if (src.isNotEmpty) chunks.add(MarkdownHtmlEmbedChunk.audio(src));
        cursor = audio.end;
        continue;
      }

      final nextIndex = _nextHtmlStart(source, cursor);
      if (nextIndex < 0) {
        final rest = source.substring(cursor);
        if (rest.trim().isNotEmpty) {
          chunks.add(MarkdownHtmlEmbedChunk.markdown(rest));
        }
        break;
      }

      final plain = source.substring(cursor, nextIndex);
      if (plain.trim().isNotEmpty) {
        chunks.add(MarkdownHtmlEmbedChunk.markdown(plain));
      }
      cursor = nextIndex;
    }

    return chunks;
  }

  static int _nextHtmlStart(String source, int from) {
    final match =
        _anyHtmlStartPattern.matchAsPrefix(source, from) ??
        _anyHtmlStartPattern.firstMatch(source.substring(from));
    if (match == null) return -1;
    if (match.input == source) return match.start;
    return from + match.start;
  }

  static String _stripTags(String value) {
    if (value.isEmpty) return value;
    return value.replaceAll(_stripTagPattern, '');
  }

  static String _extractMediaSource(String tagAttributes, String innerHtml) {
    final fromTag = _srcAttributePattern
        .firstMatch(tagAttributes)
        ?.group(1)
        ?.trim();
    if (fromTag != null && fromTag.isNotEmpty) {
      return fromTag;
    }
    final fromSourceTag = _srcAttributePattern
        .firstMatch(innerHtml)
        ?.group(1)
        ?.trim();
    return fromSourceTag ?? '';
  }

  static String _dedentBlock(String source) {
    if (source.isEmpty) return source;
    final lines = source.split('\n');
    int? minIndent;
    for (final line in lines) {
      if (line.trim().isEmpty) continue;
      final indent = line.length - line.trimLeft().length;
      minIndent = minIndent == null
          ? indent
          : (indent < minIndent ? indent : minIndent);
    }
    if (minIndent == null || minIndent <= 0) return source;
    return lines
        .map((line) {
          if (line.trim().isEmpty) return '';
          if (line.length <= minIndent!) return line.trimLeft();
          return line.substring(minIndent);
        })
        .join('\n');
  }
}

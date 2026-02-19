class DiaryContentBlock {
  final String? text;
  final String? imagePath;

  const DiaryContentBlock.text(this.text) : imagePath = null;
  const DiaryContentBlock.image(this.imagePath) : text = null;
}

class DiaryContent {
  final String text;
  final List<String> imagePaths;
  final List<DiaryContentBlock> blocks;

  const DiaryContent({
    required this.text,
    required this.imagePaths,
    required this.blocks,
  });
}

class DiaryContentCodec {
  static final RegExp _richImagePattern = RegExp(
    r'!\[[^\]]*\]\(([^)]+)\)|\[\[(?:img|mg):([^\]]+)\]\]',
  );
  static const String _objectReplacementChar = '\uFFFC';

  static String _safeDecodePath(String raw) {
    if (raw.isEmpty) return raw;
    try {
      return Uri.decodeComponent(raw);
    } catch (_) {
      return raw;
    }
  }

  static DiaryContent decode(String raw) {
    final parsedBlocks = parseBlocks(raw);
    final normalizedBlocks = <DiaryContentBlock>[];
    final imagePaths = <String>{};
    final visibleTextParts = <String>[];

    for (final block in parsedBlocks) {
      final text = block.text;
      if (text != null) {
        final cleaned = text.replaceAll(_objectReplacementChar, '');
        normalizedBlocks.add(DiaryContentBlock.text(cleaned));
        final trimmed = cleaned.trim();
        if (trimmed.isNotEmpty) {
          visibleTextParts.add(trimmed);
        }
        continue;
      }
      final imagePath = block.imagePath;
      if (imagePath == null || imagePath.trim().isEmpty) continue;
      final normalizedPath = imagePath.trim();
      normalizedBlocks.add(DiaryContentBlock.image(normalizedPath));
      imagePaths.add(normalizedPath);
    }

    if (normalizedBlocks.isEmpty) {
      normalizedBlocks.add(const DiaryContentBlock.text(''));
    }

    return DiaryContent(
      text: visibleTextParts.join('\n'),
      imagePaths: imagePaths.toList(growable: false),
      blocks: normalizedBlocks,
    );
  }

  static List<DiaryContentBlock> parseBlocks(String raw) {
    if (raw.isEmpty) {
      return const [DiaryContentBlock.text('')];
    }

    final result = <DiaryContentBlock>[];
    var cursor = 0;
    for (final match in _richImagePattern.allMatches(raw)) {
      if (match.start > cursor) {
        result.add(DiaryContentBlock.text(raw.substring(cursor, match.start)));
      }

      final markdownPath = match.group(1)?.trim();
      final tokenPath = match.group(2)?.trim();
      final resolved = markdownPath?.isNotEmpty == true
          ? markdownPath!
          : _safeDecodePath(tokenPath ?? '');
      if (resolved.isNotEmpty) {
        result.add(DiaryContentBlock.image(resolved));
      }
      cursor = match.end;
    }

    if (cursor < raw.length) {
      result.add(DiaryContentBlock.text(raw.substring(cursor)));
    }

    if (result.isEmpty) {
      result.add(const DiaryContentBlock.text(''));
    }
    return result;
  }

  static String encode({
    required String text,
    required List<String> imagePaths,
  }) {
    final normalizedText = text.replaceAll(_objectReplacementChar, '').trim();
    if (imagePaths.isEmpty) return normalizedText;

    final tokens = imagePaths
        .map((path) => path.trim())
        .where((path) => path.isNotEmpty)
        .toSet()
        .map((path) => '[[img:${Uri.encodeComponent(path)}]]')
        .join('\n');

    if (tokens.isEmpty) return normalizedText;
    if (normalizedText.isEmpty) return tokens;
    return '$normalizedText\n$tokens';
  }
}

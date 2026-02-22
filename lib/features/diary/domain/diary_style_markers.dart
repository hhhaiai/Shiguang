class DiaryStyleMarkers {
  // Private-use markers are stable in storage and easy to parse.
  // They are hidden in editor/preview by rich text spans.
  static const String boldOpen = '\uE000';
  static const String boldClose = '\uE001';
  static const String italicOpen = '\uE002';
  static const String italicClose = '\uE003';
  static const String strikeOpen = '\uE004';
  static const String strikeClose = '\uE005';
  static const String codeOpen = '\uE006';
  static const String codeClose = '\uE007';

  static final RegExp allMarkers = RegExp(
    // Includes current markers and legacy hidden/replace markers.
    r'[\uE000-\uE007\u200B-\u200F\uFE00-\uFE0F\uFEFF\uFFFC\uFFFD]',
  );

  static String? openMarkerFor(String format) {
    switch (format) {
      case 'bold':
        return boldOpen;
      case 'italic':
        return italicOpen;
      case 'strike':
        return strikeOpen;
      case 'code':
        return codeOpen;
      default:
        return null;
    }
  }

  static String? closeMarkerFor(String format) {
    switch (format) {
      case 'bold':
        return boldClose;
      case 'italic':
        return italicClose;
      case 'strike':
        return strikeClose;
      case 'code':
        return codeClose;
      default:
        return null;
    }
  }

  static String? formatForOpenMarker(String marker) {
    switch (marker) {
      case boldOpen:
        return 'bold';
      case italicOpen:
        return 'italic';
      case strikeOpen:
        return 'strike';
      case codeOpen:
        return 'code';
      default:
        return null;
    }
  }

  static String? formatForCloseMarker(String marker) {
    switch (marker) {
      case boldClose:
        return 'bold';
      case italicClose:
        return 'italic';
      case strikeClose:
        return 'strike';
      case codeClose:
        return 'code';
      default:
        return null;
    }
  }

  static Set<String> resolveActiveFormats(String source, int offset) {
    if (source.isEmpty) return const <String>{};
    final active = <String>{};
    final limit = offset.clamp(0, source.length);
    for (var index = 0; index < limit; index++) {
      final marker = source[index];
      final openFormat = formatForOpenMarker(marker);
      if (openFormat != null) {
        active.add(openFormat);
        continue;
      }
      final closeFormat = formatForCloseMarker(marker);
      if (closeFormat != null) {
        active.remove(closeFormat);
      }
    }
    return active;
  }

  static String stripAll(String source) {
    if (source.isEmpty) return source;
    return source.replaceAll(allMarkers, '');
  }

  static bool isAnyMarker(String value) {
    if (value.isEmpty) return false;
    return allMarkers.hasMatch(value);
  }
}

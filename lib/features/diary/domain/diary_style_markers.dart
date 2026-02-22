class DiaryStyleMarkers {
  static const String boldOpen = '\uE000';
  static const String boldClose = '\uE001';
  static const String italicOpen = '\uE002';
  static const String italicClose = '\uE003';
  static const String strikeOpen = '\uE004';
  static const String strikeClose = '\uE005';
  static const String codeOpen = '\uE006';
  static const String codeClose = '\uE007';

  static final RegExp allMarkers = RegExp(r'[\uE000-\uE007]');

  static String stripAll(String source) {
    if (source.isEmpty) return source;
    return source.replaceAll(allMarkers, '');
  }
}

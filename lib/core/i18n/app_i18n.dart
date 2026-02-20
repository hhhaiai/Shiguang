import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum AppLocaleKind { zhHans, zhHant, en }

AppLocaleKind resolveAppLocaleKind(Locale locale) {
  if (locale.languageCode == 'en') {
    return AppLocaleKind.en;
  }

  if (locale.languageCode == 'zh') {
    final country = locale.countryCode?.toUpperCase();
    final script = locale.scriptCode?.toUpperCase();
    if (script == 'HANT' ||
        country == 'TW' ||
        country == 'HK' ||
        country == 'MO') {
      return AppLocaleKind.zhHant;
    }
  }

  return AppLocaleKind.zhHans;
}

String i18nText(
  BuildContext context, {
  required String zhHans,
  String? zhHant,
  String? en,
}) {
  final localeKind = resolveAppLocaleKind(Localizations.localeOf(context));
  switch (localeKind) {
    case AppLocaleKind.zhHans:
      return zhHans;
    case AppLocaleKind.zhHant:
      return zhHant ?? zhHans;
    case AppLocaleKind.en:
      return en ?? zhHans;
  }
}

String _localeTag(BuildContext context) {
  return Localizations.localeOf(context).toLanguageTag();
}

String formatDateTimeShort(BuildContext context, DateTime dateTime) {
  final localeKind = resolveAppLocaleKind(Localizations.localeOf(context));
  final locale = _localeTag(context);
  if (localeKind == AppLocaleKind.en) {
    return DateFormat('MMM d, yyyy • HH:mm', locale).format(dateTime);
  }
  return DateFormat('yyyy/MM/dd HH:mm', locale).format(dateTime);
}

String formatDateTimeWithSeconds(BuildContext context, DateTime dateTime) {
  final localeKind = resolveAppLocaleKind(Localizations.localeOf(context));
  final locale = _localeTag(context);
  if (localeKind == AppLocaleKind.en) {
    return DateFormat('MMM d, yyyy • HH:mm:ss', locale).format(dateTime);
  }
  return DateFormat('yyyy/MM/dd HH:mm:ss', locale).format(dateTime);
}

String formatDateTimeLong(BuildContext context, DateTime dateTime) {
  final localeKind = resolveAppLocaleKind(Localizations.localeOf(context));
  final locale = _localeTag(context);
  if (localeKind == AppLocaleKind.en) {
    return DateFormat('EEEE, MMMM d, yyyy • HH:mm', locale).format(dateTime);
  }
  return DateFormat('yyyy年M月d日 EEEE HH:mm', locale).format(dateTime);
}

extension AppI18nBuildContext on BuildContext {
  String t({required String zhHans, String? zhHant, String? en}) {
    return i18nText(this, zhHans: zhHans, zhHant: zhHant, en: en);
  }
}

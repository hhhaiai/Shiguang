import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum AppLocaleKind { zhHans, zhHant, en }

AppLocaleKind resolveAppLocaleKind(Locale locale) {
  if (locale.languageCode == 'zh') {
    final country = locale.countryCode?.toUpperCase();
    final script = locale.scriptCode?.toUpperCase();
    if (script == 'HANT' ||
        country == 'TW' ||
        country == 'HK' ||
        country == 'MO') {
      return AppLocaleKind.zhHant;
    }
    return AppLocaleKind.zhHans;
  }

  return AppLocaleKind.en;
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
  if (localeKind == AppLocaleKind.zhHans ||
      localeKind == AppLocaleKind.zhHant) {
    return DateFormat('yyyy/MM/dd HH:mm', locale).format(dateTime);
  }
  return DateFormat.yMd(locale).add_Hm().format(dateTime);
}

String formatDateTimeWithSeconds(BuildContext context, DateTime dateTime) {
  final localeKind = resolveAppLocaleKind(Localizations.localeOf(context));
  final locale = _localeTag(context);
  if (localeKind == AppLocaleKind.zhHans ||
      localeKind == AppLocaleKind.zhHant) {
    return DateFormat('yyyy/MM/dd HH:mm:ss', locale).format(dateTime);
  }
  return DateFormat.yMd(locale).add_Hms().format(dateTime);
}

String formatDateTimeLong(BuildContext context, DateTime dateTime) {
  final localeKind = resolveAppLocaleKind(Localizations.localeOf(context));
  final locale = _localeTag(context);
  if (localeKind == AppLocaleKind.zhHans ||
      localeKind == AppLocaleKind.zhHant) {
    return DateFormat('yyyy年M月d日 EEEE HH:mm', locale).format(dateTime);
  }
  return DateFormat.yMMMMEEEEd(locale).add_Hm().format(dateTime);
}

extension AppI18nBuildContext on BuildContext {
  String t({required String zhHans, String? zhHant, String? en}) {
    return i18nText(this, zhHans: zhHans, zhHant: zhHant, en: en);
  }
}

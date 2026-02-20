import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_router.dart';
import '../features/settings/data/settings_provider.dart';
import '../features/reminder/data/services/local_reminder_scheduler.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  final LocalReminderScheduler _reminderScheduler = LocalReminderScheduler();
  StreamSubscription<ReminderTapEvent>? _tapSubscription;

  @override
  void initState() {
    super.initState();
    _tapSubscription = _reminderScheduler.tapStream.listen(_handleReminderTap);
    unawaited(_reminderScheduler.ensureInitialized());
  }

  void _handleReminderTap(ReminderTapEvent event) {
    if (event.diaryId != null) {
      routerProvider.go('/diary/${event.diaryId}');
      return;
    }

    routerProvider.go('/reminders');
  }

  @override
  void dispose() {
    _tapSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final themeMode = switch (settings.themeMode) {
      AppThemeMode.light => ThemeMode.light,
      AppThemeMode.dark => ThemeMode.dark,
      AppThemeMode.system => ThemeMode.system,
    };
    final appTitle = settings.language.isChinese ? '拾光' : 'Shiguang';
    final configuredLocale = settings.language.locale;
    final locale =
        GlobalMaterialLocalizations.delegate.isSupported(configuredLocale)
        ? configuredLocale
        : const Locale('en');
    final supportedLocales = <Locale>{};
    for (final language in AppLanguage.values) {
      final appLocale = language.locale;
      if (GlobalMaterialLocalizations.delegate.isSupported(appLocale)) {
        supportedLocales.add(appLocale);
      }
    }
    supportedLocales.add(const Locale('en'));

    return MaterialApp.router(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      locale: locale,
      supportedLocales: supportedLocales.toList(growable: false),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      routerConfig: routerProvider,
    );
  }
}

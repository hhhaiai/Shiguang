import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/local_endpoint_policy.dart';

enum AppThemeMode { system, light, dark }

enum AppLanguage {
  zhHans('zh', '简体中文', '简中'),
  zhHant('zh_TW', '繁體中文', '繁中'),
  en('en', 'English', 'English');

  final String code;
  final String displayName;
  final String shortName;

  const AppLanguage(this.code, this.displayName, this.shortName);

  Locale get locale {
    if (this == AppLanguage.zhHant) {
      return const Locale('zh', 'TW');
    }
    return Locale(code);
  }

  static AppLanguage fromCode(String code) {
    return AppLanguage.values.firstWhere(
      (lang) => lang.code == code,
      orElse: () => AppLanguage.zhHans,
    );
  }
}

/// App settings
class AppSettings {
  static const String defaultVoiceAiEndpoint = 'ws://127.0.0.1:8008/stream';
  static const String defaultEmbeddingEndpoint =
      'ws://127.0.0.1:8008/embedding';
  static const String defaultLlmEndpoint = 'http://127.0.0.1:11434';

  final String voiceAiEndpoint;
  final String embeddingEndpoint;
  final String llmEndpoint;
  final bool preferLocalAi;
  final bool autoGenerateSummary;
  final bool autoGenerateEmbedding;
  final AppThemeMode themeMode;
  final AppLanguage language;
  final List<String> searchHistory;

  const AppSettings({
    this.voiceAiEndpoint = defaultVoiceAiEndpoint,
    this.embeddingEndpoint = defaultEmbeddingEndpoint,
    this.llmEndpoint = defaultLlmEndpoint,
    this.preferLocalAi = true,
    this.autoGenerateSummary = true,
    this.autoGenerateEmbedding = true,
    this.themeMode = AppThemeMode.system,
    this.language = AppLanguage.zhHans,
    this.searchHistory = const [],
  });

  static bool get _allowPrivateNetwork => !Platform.isAndroid;

  static bool isLocalEndpoint(String endpoint) {
    return LocalEndpointPolicy.isAllowed(
      endpoint,
      allowPrivateNetwork: _allowPrivateNetwork,
    );
  }

  static String normalizeLocalEndpoint({
    required String endpoint,
    required String fallback,
  }) {
    return LocalEndpointPolicy.normalize(
      endpoint,
      fallback: fallback,
      allowPrivateNetwork: _allowPrivateNetwork,
    );
  }

  AppSettings copyWith({
    String? voiceAiEndpoint,
    String? embeddingEndpoint,
    String? llmEndpoint,
    bool? preferLocalAi,
    bool? autoGenerateSummary,
    bool? autoGenerateEmbedding,
    AppThemeMode? themeMode,
    AppLanguage? language,
    List<String>? searchHistory,
  }) {
    return AppSettings(
      voiceAiEndpoint: voiceAiEndpoint ?? this.voiceAiEndpoint,
      embeddingEndpoint: embeddingEndpoint ?? this.embeddingEndpoint,
      llmEndpoint: llmEndpoint ?? this.llmEndpoint,
      preferLocalAi: preferLocalAi ?? this.preferLocalAi,
      autoGenerateSummary: autoGenerateSummary ?? this.autoGenerateSummary,
      autoGenerateEmbedding:
          autoGenerateEmbedding ?? this.autoGenerateEmbedding,
      themeMode: themeMode ?? this.themeMode,
      language: language ?? this.language,
      searchHistory: searchHistory ?? this.searchHistory,
    );
  }
}

/// Settings notifier
class SettingsNotifier extends StateNotifier<AppSettings> {
  static const _settingsStorageKey = 'app_settings_v1';
  static const _secureStorage = FlutterSecureStorage();

  SettingsNotifier() : super(const AppSettings()) {
    _restoreFromStorage();
  }

  Future<void> _restoreFromStorage() async {
    try {
      final raw = await _secureStorage.read(key: _settingsStorageKey);
      if (raw == null || raw.trim().isEmpty) return;

      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return;

      final voiceAiEndpoint =
          (decoded['voiceAiEndpoint'] as String?)?.trim() ??
          AppSettings.defaultVoiceAiEndpoint;
      final embeddingEndpoint =
          (decoded['embeddingEndpoint'] as String?)?.trim() ??
          AppSettings.defaultEmbeddingEndpoint;
      final llmEndpoint =
          (decoded['llmEndpoint'] as String?)?.trim() ??
          AppSettings.defaultLlmEndpoint;
      final preferLocalAi = decoded['preferLocalAi'] is bool
          ? decoded['preferLocalAi'] as bool
          : true;
      final autoGenerateSummary = decoded['autoGenerateSummary'] is bool
          ? decoded['autoGenerateSummary'] as bool
          : true;
      final autoGenerateEmbedding = decoded['autoGenerateEmbedding'] is bool
          ? decoded['autoGenerateEmbedding'] as bool
          : true;

      final themeModeRaw = (decoded['themeMode'] as String?)?.trim();
      final themeMode = AppThemeMode.values.firstWhere(
        (mode) => mode.name == themeModeRaw,
        orElse: () => AppThemeMode.system,
      );

      final languageCode = (decoded['language'] as String?)?.trim();
      final language = AppLanguage.fromCode(languageCode ?? '');

      final historyRaw = decoded['searchHistory'];
      final searchHistory = historyRaw is List
          ? historyRaw
                .whereType<String>()
                .map((item) => item.trim())
                .where((item) => item.isNotEmpty)
                .toList(growable: false)
          : const <String>[];

      state = state.copyWith(
        voiceAiEndpoint: AppSettings.normalizeLocalEndpoint(
          endpoint: voiceAiEndpoint,
          fallback: AppSettings.defaultVoiceAiEndpoint,
        ),
        embeddingEndpoint: AppSettings.normalizeLocalEndpoint(
          endpoint: embeddingEndpoint,
          fallback: AppSettings.defaultEmbeddingEndpoint,
        ),
        llmEndpoint: AppSettings.normalizeLocalEndpoint(
          endpoint: llmEndpoint,
          fallback: AppSettings.defaultLlmEndpoint,
        ),
        preferLocalAi: preferLocalAi,
        autoGenerateSummary: autoGenerateSummary,
        autoGenerateEmbedding: autoGenerateEmbedding,
        themeMode: themeMode,
        language: language,
        searchHistory: List.unmodifiable(searchHistory),
      );
    } catch (_) {
      // Keep defaults if local settings cannot be restored.
    }
  }

  Future<void> _persist() async {
    final payload = <String, dynamic>{
      'voiceAiEndpoint': state.voiceAiEndpoint,
      'embeddingEndpoint': state.embeddingEndpoint,
      'llmEndpoint': state.llmEndpoint,
      'preferLocalAi': state.preferLocalAi,
      'autoGenerateSummary': state.autoGenerateSummary,
      'autoGenerateEmbedding': state.autoGenerateEmbedding,
      'themeMode': state.themeMode.name,
      'language': state.language.code,
      'searchHistory': state.searchHistory,
    };
    try {
      await _secureStorage.write(
        key: _settingsStorageKey,
        value: jsonEncode(payload),
      );
    } catch (_) {
      // Ignore persist failures to avoid breaking app flows.
    }
  }

  void _setState(AppSettings nextState) {
    state = nextState;
    _persist();
  }

  void setVoiceAiEndpoint(String endpoint) {
    _setState(
      state.copyWith(
        voiceAiEndpoint: AppSettings.normalizeLocalEndpoint(
          endpoint: endpoint,
          fallback: AppSettings.defaultVoiceAiEndpoint,
        ),
      ),
    );
  }

  void setEmbeddingEndpoint(String endpoint) {
    _setState(
      state.copyWith(
        embeddingEndpoint: AppSettings.normalizeLocalEndpoint(
          endpoint: endpoint,
          fallback: AppSettings.defaultEmbeddingEndpoint,
        ),
      ),
    );
  }

  void setLlmEndpoint(String endpoint) {
    _setState(
      state.copyWith(
        llmEndpoint: AppSettings.normalizeLocalEndpoint(
          endpoint: endpoint,
          fallback: AppSettings.defaultLlmEndpoint,
        ),
      ),
    );
  }

  void setPreferLocalAi(bool prefer) {
    _setState(state.copyWith(preferLocalAi: prefer));
  }

  void setAutoGenerateSummary(bool auto) {
    _setState(state.copyWith(autoGenerateSummary: auto));
  }

  void setAutoGenerateEmbedding(bool auto) {
    _setState(state.copyWith(autoGenerateEmbedding: auto));
  }

  void setThemeMode(AppThemeMode mode) {
    _setState(state.copyWith(themeMode: mode));
  }

  void setLanguage(AppLanguage language) {
    _setState(state.copyWith(language: language));
  }

  void addSearchHistory(String query) {
    final normalized = query.trim();
    if (normalized.isEmpty) return;

    final next = state.searchHistory
        .where((item) => item.toLowerCase() != normalized.toLowerCase())
        .toList(growable: true);
    next.insert(0, normalized);
    if (next.length > 20) {
      next.removeRange(20, next.length);
    }
    _setState(state.copyWith(searchHistory: List.unmodifiable(next)));
  }

  void clearSearchHistory() {
    _setState(state.copyWith(searchHistory: const []));
  }
}

/// Settings provider
final settingsProvider = StateNotifierProvider<SettingsNotifier, AppSettings>((
  ref,
) {
  return SettingsNotifier();
});

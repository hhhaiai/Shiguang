import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/utils/local_endpoint_policy.dart';

enum AppThemeMode { system, light, dark }

enum AppLanguage {
  zhHans('zh-Hans', '简体中文'),
  zhHant('zh-Hant', '繁體中文'),
  zhHk('zh-HK', '繁體中文（香港）'),
  en('en', 'English'),
  es('es', 'Español'),
  fr('fr', 'Français'),
  de('de', 'Deutsch'),
  it('it', 'Italiano'),
  ptPt('pt-PT', 'Português (Portugal)'),
  ptBr('pt-BR', 'Português (Brasil)'),
  nl('nl', 'Nederlands'),
  ru('ru', 'Русский'),
  pl('pl', 'Polski'),
  uk('uk', 'Українська'),
  ro('ro', 'Română'),
  cs('cs', 'Čeština'),
  sk('sk', 'Slovenčina'),
  hu('hu', 'Magyar'),
  sv('sv', 'Svenska'),
  nb('nb', 'Norsk bokmål'),
  da('da', 'Dansk'),
  fi('fi', 'Suomi'),
  el('el', 'Ελληνικά'),
  bg('bg', 'Български'),
  sr('sr', 'Српски'),
  hr('hr', 'Hrvatski'),
  sl('sl', 'Slovenščina'),
  lt('lt', 'Lietuvių'),
  lv('lv', 'Latviešu'),
  et('et', 'Eesti'),
  ga('ga', 'Gaeilge'),
  cy('cy', 'Cymraeg'),
  isLang('is', 'Íslenska'),
  ca('ca', 'Català'),
  eu('eu', 'Euskara'),
  gl('gl', 'Galego'),
  sq('sq', 'Shqip'),
  mt('mt', 'Malti'),
  mk('mk', 'Македонски'),
  bs('bs', 'Bosanski'),
  cnr('cnr', 'Crnogorski'),
  ja('ja', '日本語'),
  ko('ko', '한국어'),
  mn('mn', 'Монгол'),
  mnMong('mn-Mong', 'ᠮᠣᠩᠭᠣᠯ'),
  vi('vi', 'Tiếng Việt'),
  th('th', 'ไทย'),
  id('id', 'Bahasa Indonesia'),
  ms('ms', 'Bahasa Melayu'),
  fil('fil', 'Filipino'),
  my('my', 'မြန်မာ'),
  km('km', 'ខ្មែរ'),
  lo('lo', 'ລາວ'),
  su('su', 'Basa Sunda'),
  jv('jv', 'Basa Jawa'),
  hi('hi', 'हिन्दी'),
  bn('bn', 'বাংলা'),
  ur('ur', 'اردو'),
  ta('ta', 'தமிழ்'),
  te('te', 'తెలుగు'),
  mr('mr', 'मराठी'),
  gu('gu', 'ગુજરાતી'),
  kn('kn', 'ಕನ್ನಡ'),
  ml('ml', 'മലയാളം'),
  pa('pa', 'ਪੰਜਾਬੀ'),
  ne('ne', 'नेपाली'),
  si('si', 'සිංහල'),
  ar('ar', 'العربية'),
  he('he', 'עברית'),
  fa('fa', 'فارسی'),
  tr('tr', 'Türkçe'),
  ckb('ckb', 'کوردی سۆرانی'),
  ku('ku', 'Kurdî'),
  az('az', 'Azərbaycan dili'),
  hy('hy', 'Հայերեն'),
  ka('ka', 'ქართული'),
  sw('sw', 'Kiswahili'),
  zu('zu', 'isiZulu'),
  xh('xh', 'isiXhosa'),
  yo('yo', 'Yorùbá'),
  ig('ig', 'Igbo'),
  ha('ha', 'Hausa'),
  am('am', 'አማርኛ'),
  so('so', 'Soomaali'),
  af('af', 'Afrikaans'),
  ht('ht', 'Kreyòl ayisyen'),
  frCa('fr-CA', 'Français (Canada)'),
  qu('qu', 'Runasimi');

  final String code;
  final String displayName;

  const AppLanguage(this.code, this.displayName);

  bool get isZhHans => this == AppLanguage.zhHans;

  bool get isZhHant => this == AppLanguage.zhHant || this == AppLanguage.zhHk;

  bool get isChinese => isZhHans || isZhHant;

  String get shortName {
    if (this == AppLanguage.zhHans) {
      return '简中';
    }
    if (this == AppLanguage.zhHant) {
      return '繁中';
    }
    if (this == AppLanguage.zhHk) {
      return '繁中HK';
    }
    return code;
  }

  Locale get locale {
    return _localeFromLanguageTag(code);
  }

  static Locale _localeFromLanguageTag(String tag) {
    final normalized = tag.trim().replaceAll('_', '-');
    if (normalized.isEmpty) {
      return const Locale('en');
    }

    final parts = normalized.split('-');
    final languageCode = parts.first.toLowerCase();
    String? scriptCode;
    String? countryCode;

    if (parts.length >= 2) {
      final second = parts[1];
      if (second.length == 4) {
        scriptCode =
            '${second[0].toUpperCase()}${second.substring(1).toLowerCase()}';
        if (parts.length >= 3 && parts[2].isNotEmpty) {
          countryCode = parts[2].toUpperCase();
        }
      } else if (second.isNotEmpty) {
        countryCode = second.toUpperCase();
      }
    }

    return Locale.fromSubtags(
      languageCode: languageCode,
      scriptCode: scriptCode,
      countryCode: countryCode,
    );
  }

  static String _normalizeCode(String code) {
    return code.trim().replaceAll('_', '-').toLowerCase();
  }

  static AppLanguage fromCode(String code) {
    final normalized = _normalizeCode(code);
    if (normalized.isEmpty) {
      return AppLanguage.zhHans;
    }

    const aliases = <String, AppLanguage>{
      'zh': AppLanguage.zhHans,
      'zh-cn': AppLanguage.zhHans,
      'zh-sg': AppLanguage.zhHans,
      'zh-hans': AppLanguage.zhHans,
      'zh-tw': AppLanguage.zhHant,
      'zh-mo': AppLanguage.zhHant,
      'zh-hant': AppLanguage.zhHant,
      'zh-hk': AppLanguage.zhHk,
      'pt': AppLanguage.ptBr,
      'no': AppLanguage.nb,
      'iw': AppLanguage.he,
    };
    final byAlias = aliases[normalized];
    if (byAlias != null) {
      return byAlias;
    }

    return AppLanguage.values.firstWhere(
      (lang) => _normalizeCode(lang.code) == normalized,
      orElse: () => AppLanguage.zhHans,
    );
  }
}

enum ChatModelProvider { local, openai, gemini, anthropic, ollama, custom }

enum CustomLlmProtocol { openai, gemini, anthropic, ollama }

enum VoiceRecognitionEngine { localModel, systemNative, endpointCloud }

/// App settings
class AppSettings {
  static const String defaultVoiceAiEndpoint = 'ws://127.0.0.1:8008/stream';
  static const String defaultEmbeddingEndpoint =
      'ws://127.0.0.1:8008/embedding';
  static const String defaultLlmEndpoint = 'http://127.0.0.1:11434';
  static const String defaultLlmModel = 'qwen2.5:0.5b';

  static const String defaultOpenAiEndpoint = 'https://api.openai.com/v1';
  static const String defaultOpenAiModel = 'gpt-4o-mini';

  static const String defaultGeminiEndpoint =
      'https://generativelanguage.googleapis.com/v1beta';
  static const String defaultGeminiModel = 'gemini-1.5-flash';

  static const String defaultAnthropicEndpoint = 'https://api.anthropic.com/v1';
  static const String defaultAnthropicModel = 'claude-3-5-sonnet-latest';

  static const String defaultCustomEndpoint = 'https://api.openai.com/v1';
  static const String defaultCustomModel = 'gpt-4o-mini';

  final String voiceAiEndpoint;
  final String embeddingEndpoint;
  final String llmEndpoint;
  final String llmModel;
  final bool preferLocalAi;
  final bool autoGenerateSummary;
  final bool autoGenerateEmbedding;
  final bool enableNetworkSearch;
  final AppThemeMode themeMode;
  final AppLanguage language;
  final List<String> searchHistory;

  final ChatModelProvider chatModelProvider;
  final String openAiEndpoint;
  final String openAiApiKey;
  final String openAiModel;

  final String geminiEndpoint;
  final String geminiApiKey;
  final String geminiModel;

  final String anthropicEndpoint;
  final String anthropicApiKey;
  final String anthropicModel;

  final String customEndpoint;
  final String customApiKey;
  final String customModel;
  final CustomLlmProtocol customLlmProtocol;

  final VoiceRecognitionEngine voiceRecognitionEngine;

  const AppSettings({
    this.voiceAiEndpoint = defaultVoiceAiEndpoint,
    this.embeddingEndpoint = defaultEmbeddingEndpoint,
    this.llmEndpoint = defaultLlmEndpoint,
    this.llmModel = defaultLlmModel,
    this.preferLocalAi = true,
    this.autoGenerateSummary = true,
    this.autoGenerateEmbedding = true,
    this.enableNetworkSearch = false,
    this.themeMode = AppThemeMode.system,
    this.language = AppLanguage.zhHans,
    this.searchHistory = const [],
    this.chatModelProvider = ChatModelProvider.local,
    this.openAiEndpoint = defaultOpenAiEndpoint,
    this.openAiApiKey = '',
    this.openAiModel = defaultOpenAiModel,
    this.geminiEndpoint = defaultGeminiEndpoint,
    this.geminiApiKey = '',
    this.geminiModel = defaultGeminiModel,
    this.anthropicEndpoint = defaultAnthropicEndpoint,
    this.anthropicApiKey = '',
    this.anthropicModel = defaultAnthropicModel,
    this.customEndpoint = defaultCustomEndpoint,
    this.customApiKey = '',
    this.customModel = defaultCustomModel,
    this.customLlmProtocol = CustomLlmProtocol.openai,
    this.voiceRecognitionEngine = VoiceRecognitionEngine.localModel,
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

  static String normalizeNetworkEndpoint({
    required String endpoint,
    required String fallback,
  }) {
    final trimmed = endpoint.trim();
    if (trimmed.isEmpty) return fallback;
    final uri = Uri.tryParse(trimmed);
    if (uri == null) return fallback;
    final scheme = uri.scheme.toLowerCase();
    if (scheme != 'http' &&
        scheme != 'https' &&
        scheme != 'ws' &&
        scheme != 'wss') {
      return fallback;
    }
    if (uri.host.trim().isEmpty) return fallback;
    return uri.toString();
  }

  static String normalizeHttpEndpoint({
    required String endpoint,
    required String fallback,
  }) {
    final trimmed = endpoint.trim();
    if (trimmed.isEmpty) return fallback;
    final uri = Uri.tryParse(trimmed);
    if (uri == null) return fallback;
    final scheme = uri.scheme.toLowerCase();
    if (scheme != 'http' && scheme != 'https') {
      return fallback;
    }
    if (uri.host.trim().isEmpty) {
      return fallback;
    }
    return uri.toString();
  }

  AppSettings copyWith({
    String? voiceAiEndpoint,
    String? embeddingEndpoint,
    String? llmEndpoint,
    String? llmModel,
    bool? preferLocalAi,
    bool? autoGenerateSummary,
    bool? autoGenerateEmbedding,
    bool? enableNetworkSearch,
    AppThemeMode? themeMode,
    AppLanguage? language,
    List<String>? searchHistory,
    ChatModelProvider? chatModelProvider,
    String? openAiEndpoint,
    String? openAiApiKey,
    String? openAiModel,
    String? geminiEndpoint,
    String? geminiApiKey,
    String? geminiModel,
    String? anthropicEndpoint,
    String? anthropicApiKey,
    String? anthropicModel,
    String? customEndpoint,
    String? customApiKey,
    String? customModel,
    CustomLlmProtocol? customLlmProtocol,
    VoiceRecognitionEngine? voiceRecognitionEngine,
  }) {
    return AppSettings(
      voiceAiEndpoint: voiceAiEndpoint ?? this.voiceAiEndpoint,
      embeddingEndpoint: embeddingEndpoint ?? this.embeddingEndpoint,
      llmEndpoint: llmEndpoint ?? this.llmEndpoint,
      llmModel: llmModel ?? this.llmModel,
      preferLocalAi: preferLocalAi ?? this.preferLocalAi,
      autoGenerateSummary: autoGenerateSummary ?? this.autoGenerateSummary,
      autoGenerateEmbedding:
          autoGenerateEmbedding ?? this.autoGenerateEmbedding,
      enableNetworkSearch: enableNetworkSearch ?? this.enableNetworkSearch,
      themeMode: themeMode ?? this.themeMode,
      language: language ?? this.language,
      searchHistory: searchHistory ?? this.searchHistory,
      chatModelProvider: chatModelProvider ?? this.chatModelProvider,
      openAiEndpoint: openAiEndpoint ?? this.openAiEndpoint,
      openAiApiKey: openAiApiKey ?? this.openAiApiKey,
      openAiModel: openAiModel ?? this.openAiModel,
      geminiEndpoint: geminiEndpoint ?? this.geminiEndpoint,
      geminiApiKey: geminiApiKey ?? this.geminiApiKey,
      geminiModel: geminiModel ?? this.geminiModel,
      anthropicEndpoint: anthropicEndpoint ?? this.anthropicEndpoint,
      anthropicApiKey: anthropicApiKey ?? this.anthropicApiKey,
      anthropicModel: anthropicModel ?? this.anthropicModel,
      customEndpoint: customEndpoint ?? this.customEndpoint,
      customApiKey: customApiKey ?? this.customApiKey,
      customModel: customModel ?? this.customModel,
      customLlmProtocol: customLlmProtocol ?? this.customLlmProtocol,
      voiceRecognitionEngine:
          voiceRecognitionEngine ?? this.voiceRecognitionEngine,
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
      final llmModel =
          (decoded['llmModel'] as String?)?.trim().isNotEmpty == true
          ? (decoded['llmModel'] as String).trim()
          : AppSettings.defaultLlmModel;
      final preferLocalAi = decoded['preferLocalAi'] is bool
          ? decoded['preferLocalAi'] as bool
          : true;
      final autoGenerateSummary = decoded['autoGenerateSummary'] is bool
          ? decoded['autoGenerateSummary'] as bool
          : true;
      final autoGenerateEmbedding = decoded['autoGenerateEmbedding'] is bool
          ? decoded['autoGenerateEmbedding'] as bool
          : true;
      final enableNetworkSearch = decoded['enableNetworkSearch'] is bool
          ? decoded['enableNetworkSearch'] as bool
          : false;

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

      final chatModelProviderRaw = (decoded['chatModelProvider'] as String?)
          ?.trim();
      final chatModelProvider = ChatModelProvider.values.firstWhere(
        (provider) => provider.name == chatModelProviderRaw,
        orElse: () =>
            preferLocalAi ? ChatModelProvider.local : ChatModelProvider.ollama,
      );

      final voiceEngineRaw = (decoded['voiceRecognitionEngine'] as String?)
          ?.trim();
      final voiceRecognitionEngine = VoiceRecognitionEngine.values.firstWhere(
        (engine) => engine.name == voiceEngineRaw,
        orElse: () => preferLocalAi
            ? VoiceRecognitionEngine.localModel
            : VoiceRecognitionEngine.endpointCloud,
      );

      final openAiEndpoint =
          (decoded['openAiEndpoint'] as String?)?.trim() ??
          AppSettings.defaultOpenAiEndpoint;
      final openAiApiKey = (decoded['openAiApiKey'] as String?)?.trim() ?? '';
      final openAiModel =
          (decoded['openAiModel'] as String?)?.trim().isNotEmpty == true
          ? (decoded['openAiModel'] as String).trim()
          : AppSettings.defaultOpenAiModel;

      final geminiEndpoint =
          (decoded['geminiEndpoint'] as String?)?.trim() ??
          AppSettings.defaultGeminiEndpoint;
      final geminiApiKey = (decoded['geminiApiKey'] as String?)?.trim() ?? '';
      final geminiModel =
          (decoded['geminiModel'] as String?)?.trim().isNotEmpty == true
          ? (decoded['geminiModel'] as String).trim()
          : AppSettings.defaultGeminiModel;

      final anthropicEndpoint =
          (decoded['anthropicEndpoint'] as String?)?.trim() ??
          AppSettings.defaultAnthropicEndpoint;
      final anthropicApiKey =
          (decoded['anthropicApiKey'] as String?)?.trim() ?? '';
      final anthropicModel =
          (decoded['anthropicModel'] as String?)?.trim().isNotEmpty == true
          ? (decoded['anthropicModel'] as String).trim()
          : AppSettings.defaultAnthropicModel;

      final customEndpoint =
          (decoded['customEndpoint'] as String?)?.trim() ??
          AppSettings.defaultCustomEndpoint;
      final customApiKey = (decoded['customApiKey'] as String?)?.trim() ?? '';
      final customModel =
          (decoded['customModel'] as String?)?.trim().isNotEmpty == true
          ? (decoded['customModel'] as String).trim()
          : AppSettings.defaultCustomModel;
      final customProtocolRaw = (decoded['customLlmProtocol'] as String?)
          ?.trim();
      final customLlmProtocol = CustomLlmProtocol.values.firstWhere(
        (protocol) => protocol.name == customProtocolRaw,
        orElse: () => CustomLlmProtocol.openai,
      );
      final derivedPreferLocalAi =
          chatModelProvider == ChatModelProvider.local &&
          voiceRecognitionEngine == VoiceRecognitionEngine.localModel;

      state = state.copyWith(
        voiceAiEndpoint: AppSettings.normalizeNetworkEndpoint(
          endpoint: voiceAiEndpoint,
          fallback: AppSettings.defaultVoiceAiEndpoint,
        ),
        embeddingEndpoint: AppSettings.normalizeLocalEndpoint(
          endpoint: embeddingEndpoint,
          fallback: AppSettings.defaultEmbeddingEndpoint,
        ),
        llmEndpoint: AppSettings.normalizeHttpEndpoint(
          endpoint: llmEndpoint,
          fallback: AppSettings.defaultLlmEndpoint,
        ),
        llmModel: llmModel,
        preferLocalAi: derivedPreferLocalAi,
        autoGenerateSummary: autoGenerateSummary,
        autoGenerateEmbedding: autoGenerateEmbedding,
        enableNetworkSearch: enableNetworkSearch,
        themeMode: themeMode,
        language: language,
        searchHistory: List.unmodifiable(searchHistory),
        chatModelProvider: chatModelProvider,
        openAiEndpoint: AppSettings.normalizeHttpEndpoint(
          endpoint: openAiEndpoint,
          fallback: AppSettings.defaultOpenAiEndpoint,
        ),
        openAiApiKey: openAiApiKey,
        openAiModel: openAiModel,
        geminiEndpoint: AppSettings.normalizeHttpEndpoint(
          endpoint: geminiEndpoint,
          fallback: AppSettings.defaultGeminiEndpoint,
        ),
        geminiApiKey: geminiApiKey,
        geminiModel: geminiModel,
        anthropicEndpoint: AppSettings.normalizeHttpEndpoint(
          endpoint: anthropicEndpoint,
          fallback: AppSettings.defaultAnthropicEndpoint,
        ),
        anthropicApiKey: anthropicApiKey,
        anthropicModel: anthropicModel,
        customEndpoint: AppSettings.normalizeHttpEndpoint(
          endpoint: customEndpoint,
          fallback: AppSettings.defaultCustomEndpoint,
        ),
        customApiKey: customApiKey,
        customModel: customModel,
        customLlmProtocol: customLlmProtocol,
        voiceRecognitionEngine: voiceRecognitionEngine,
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
      'llmModel': state.llmModel,
      'preferLocalAi': state.preferLocalAi,
      'autoGenerateSummary': state.autoGenerateSummary,
      'autoGenerateEmbedding': state.autoGenerateEmbedding,
      'enableNetworkSearch': state.enableNetworkSearch,
      'themeMode': state.themeMode.name,
      'language': state.language.code,
      'searchHistory': state.searchHistory,
      'chatModelProvider': state.chatModelProvider.name,
      'openAiEndpoint': state.openAiEndpoint,
      'openAiApiKey': state.openAiApiKey,
      'openAiModel': state.openAiModel,
      'geminiEndpoint': state.geminiEndpoint,
      'geminiApiKey': state.geminiApiKey,
      'geminiModel': state.geminiModel,
      'anthropicEndpoint': state.anthropicEndpoint,
      'anthropicApiKey': state.anthropicApiKey,
      'anthropicModel': state.anthropicModel,
      'customEndpoint': state.customEndpoint,
      'customApiKey': state.customApiKey,
      'customModel': state.customModel,
      'customLlmProtocol': state.customLlmProtocol.name,
      'voiceRecognitionEngine': state.voiceRecognitionEngine.name,
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
        voiceAiEndpoint: AppSettings.normalizeNetworkEndpoint(
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
        llmEndpoint: AppSettings.normalizeHttpEndpoint(
          endpoint: endpoint,
          fallback: AppSettings.defaultLlmEndpoint,
        ),
      ),
    );
  }

  void setLlmModel(String model) {
    final normalized = model.trim();
    if (normalized.isEmpty) return;
    _setState(state.copyWith(llmModel: normalized));
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

  void setEnableNetworkSearch(bool enabled) {
    _setState(state.copyWith(enableNetworkSearch: enabled));
  }

  void setThemeMode(AppThemeMode mode) {
    _setState(state.copyWith(themeMode: mode));
  }

  void setLanguage(AppLanguage language) {
    _setState(state.copyWith(language: language));
  }

  void setChatModelProvider(ChatModelProvider provider) {
    _setState(
      state.copyWith(
        chatModelProvider: provider,
        preferLocalAi:
            provider == ChatModelProvider.local &&
            state.voiceRecognitionEngine == VoiceRecognitionEngine.localModel,
      ),
    );
  }

  void setOpenAiEndpoint(String endpoint) {
    _setState(
      state.copyWith(
        openAiEndpoint: AppSettings.normalizeHttpEndpoint(
          endpoint: endpoint,
          fallback: AppSettings.defaultOpenAiEndpoint,
        ),
      ),
    );
  }

  void setOpenAiApiKey(String apiKey) {
    _setState(state.copyWith(openAiApiKey: apiKey.trim()));
  }

  void setOpenAiModel(String model) {
    final normalized = model.trim();
    if (normalized.isEmpty) return;
    _setState(state.copyWith(openAiModel: normalized));
  }

  void setGeminiEndpoint(String endpoint) {
    _setState(
      state.copyWith(
        geminiEndpoint: AppSettings.normalizeHttpEndpoint(
          endpoint: endpoint,
          fallback: AppSettings.defaultGeminiEndpoint,
        ),
      ),
    );
  }

  void setGeminiApiKey(String apiKey) {
    _setState(state.copyWith(geminiApiKey: apiKey.trim()));
  }

  void setGeminiModel(String model) {
    final normalized = model.trim();
    if (normalized.isEmpty) return;
    _setState(state.copyWith(geminiModel: normalized));
  }

  void setAnthropicEndpoint(String endpoint) {
    _setState(
      state.copyWith(
        anthropicEndpoint: AppSettings.normalizeHttpEndpoint(
          endpoint: endpoint,
          fallback: AppSettings.defaultAnthropicEndpoint,
        ),
      ),
    );
  }

  void setAnthropicApiKey(String apiKey) {
    _setState(state.copyWith(anthropicApiKey: apiKey.trim()));
  }

  void setAnthropicModel(String model) {
    final normalized = model.trim();
    if (normalized.isEmpty) return;
    _setState(state.copyWith(anthropicModel: normalized));
  }

  void setCustomEndpoint(String endpoint) {
    _setState(
      state.copyWith(
        customEndpoint: AppSettings.normalizeHttpEndpoint(
          endpoint: endpoint,
          fallback: AppSettings.defaultCustomEndpoint,
        ),
      ),
    );
  }

  void setCustomApiKey(String apiKey) {
    _setState(state.copyWith(customApiKey: apiKey.trim()));
  }

  void setCustomModel(String model) {
    final normalized = model.trim();
    if (normalized.isEmpty) return;
    _setState(state.copyWith(customModel: normalized));
  }

  void setCustomLlmProtocol(CustomLlmProtocol protocol) {
    _setState(state.copyWith(customLlmProtocol: protocol));
  }

  void setVoiceRecognitionEngine(VoiceRecognitionEngine engine) {
    _setState(
      state.copyWith(
        voiceRecognitionEngine: engine,
        preferLocalAi:
            state.chatModelProvider == ChatModelProvider.local &&
            engine == VoiceRecognitionEngine.localModel,
      ),
    );
  }

  void applyBackupSettings(
    Map<String, dynamic> imported, {
    bool includeApiKeys = false,
  }) {
    final themeMode = _parseEnum(
      imported['themeMode'],
      AppThemeMode.values,
      state.themeMode,
    );
    final language = AppLanguage.fromCode(
      (imported['language'] as String?)?.trim() ?? state.language.code,
    );
    final chatModelProvider = _parseEnum(
      imported['chatModelProvider'],
      ChatModelProvider.values,
      state.chatModelProvider,
    );
    final voiceRecognitionEngine = _parseEnum(
      imported['voiceRecognitionEngine'],
      VoiceRecognitionEngine.values,
      state.voiceRecognitionEngine,
    );
    final customLlmProtocol = _parseEnum(
      imported['customLlmProtocol'],
      CustomLlmProtocol.values,
      state.customLlmProtocol,
    );

    final autoGenerateSummary = imported['autoGenerateSummary'] is bool
        ? imported['autoGenerateSummary'] as bool
        : state.autoGenerateSummary;
    final autoGenerateEmbedding = imported['autoGenerateEmbedding'] is bool
        ? imported['autoGenerateEmbedding'] as bool
        : state.autoGenerateEmbedding;
    final enableNetworkSearch = imported['enableNetworkSearch'] is bool
        ? imported['enableNetworkSearch'] as bool
        : state.enableNetworkSearch;
    final derivedPreferLocalAi =
        chatModelProvider == ChatModelProvider.local &&
        voiceRecognitionEngine == VoiceRecognitionEngine.localModel;

    _setState(
      state.copyWith(
        themeMode: themeMode,
        language: language,
        chatModelProvider: chatModelProvider,
        voiceRecognitionEngine: voiceRecognitionEngine,
        preferLocalAi: derivedPreferLocalAi,
        voiceAiEndpoint: AppSettings.normalizeNetworkEndpoint(
          endpoint:
              (imported['voiceAiEndpoint'] as String?) ?? state.voiceAiEndpoint,
          fallback: state.voiceAiEndpoint,
        ),
        embeddingEndpoint: AppSettings.normalizeLocalEndpoint(
          endpoint:
              (imported['embeddingEndpoint'] as String?) ??
              state.embeddingEndpoint,
          fallback: state.embeddingEndpoint,
        ),
        llmEndpoint: AppSettings.normalizeHttpEndpoint(
          endpoint: (imported['llmEndpoint'] as String?) ?? state.llmEndpoint,
          fallback: state.llmEndpoint,
        ),
        llmModel: (imported['llmModel'] as String?)?.trim().isNotEmpty == true
            ? (imported['llmModel'] as String).trim()
            : state.llmModel,
        openAiEndpoint: AppSettings.normalizeHttpEndpoint(
          endpoint:
              (imported['openAiEndpoint'] as String?) ?? state.openAiEndpoint,
          fallback: state.openAiEndpoint,
        ),
        openAiModel:
            (imported['openAiModel'] as String?)?.trim().isNotEmpty == true
            ? (imported['openAiModel'] as String).trim()
            : state.openAiModel,
        geminiEndpoint: AppSettings.normalizeHttpEndpoint(
          endpoint:
              (imported['geminiEndpoint'] as String?) ?? state.geminiEndpoint,
          fallback: state.geminiEndpoint,
        ),
        geminiModel:
            (imported['geminiModel'] as String?)?.trim().isNotEmpty == true
            ? (imported['geminiModel'] as String).trim()
            : state.geminiModel,
        anthropicEndpoint: AppSettings.normalizeHttpEndpoint(
          endpoint:
              (imported['anthropicEndpoint'] as String?) ??
              state.anthropicEndpoint,
          fallback: state.anthropicEndpoint,
        ),
        anthropicModel:
            (imported['anthropicModel'] as String?)?.trim().isNotEmpty == true
            ? (imported['anthropicModel'] as String).trim()
            : state.anthropicModel,
        customEndpoint: AppSettings.normalizeHttpEndpoint(
          endpoint:
              (imported['customEndpoint'] as String?) ?? state.customEndpoint,
          fallback: state.customEndpoint,
        ),
        customModel:
            (imported['customModel'] as String?)?.trim().isNotEmpty == true
            ? (imported['customModel'] as String).trim()
            : state.customModel,
        customLlmProtocol: customLlmProtocol,
        autoGenerateSummary: autoGenerateSummary,
        autoGenerateEmbedding: autoGenerateEmbedding,
        enableNetworkSearch: enableNetworkSearch,
        openAiApiKey: includeApiKeys
            ? (imported['openAiApiKey'] as String?)?.trim() ??
                  state.openAiApiKey
            : state.openAiApiKey,
        geminiApiKey: includeApiKeys
            ? (imported['geminiApiKey'] as String?)?.trim() ??
                  state.geminiApiKey
            : state.geminiApiKey,
        anthropicApiKey: includeApiKeys
            ? (imported['anthropicApiKey'] as String?)?.trim() ??
                  state.anthropicApiKey
            : state.anthropicApiKey,
        customApiKey: includeApiKeys
            ? (imported['customApiKey'] as String?)?.trim() ??
                  state.customApiKey
            : state.customApiKey,
      ),
    );
  }

  T _parseEnum<T>(dynamic raw, List<T> values, T fallback) {
    if (raw is! String) return fallback;
    final value = raw.trim();
    for (final item in values) {
      if ('$item'.split('.').last == value) {
        return item;
      }
    }
    return fallback;
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

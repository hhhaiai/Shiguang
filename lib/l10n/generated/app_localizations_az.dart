// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AppLocalizationsAz extends AppLocalizations {
  AppLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get languageName => 'Azərbaycan dili';

  @override
  String get languageNameEn => 'Azerbaijani';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Settings';

  @override
  String get account => 'Account';

  @override
  String get reminders => 'Reminders';

  @override
  String get language => 'Language';

  @override
  String get appLanguage => 'App Language';

  @override
  String get appearance => 'Appearance';

  @override
  String get themeMode => 'Theme Mode';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get system => 'System';

  @override
  String get aiService => 'AI Service';

  @override
  String get aiChatProvider => 'AI Chat Provider';

  @override
  String get chatModel => 'Chat Model';

  @override
  String get localModel => 'Local Model';

  @override
  String get localModelDefault => 'Local Model (Default)';

  @override
  String get ollamaEndpoint => 'Ollama Endpoint';

  @override
  String get ollamaModel => 'Ollama Model';

  @override
  String get openAiEndpoint => 'OpenAI Endpoint';

  @override
  String get openAiApiKey => 'OpenAI API Key';

  @override
  String get openAiModel => 'OpenAI Model';

  @override
  String get geminiEndpoint => 'Gemini Endpoint';

  @override
  String get geminiApiKey => 'Gemini API Key';

  @override
  String get geminiModel => 'Gemini Model';

  @override
  String get anthropicEndpoint => 'Anthropic Endpoint';

  @override
  String get anthropicApiKey => 'Anthropic API Key';

  @override
  String get anthropicModel => 'Anthropic Model';

  @override
  String get customProtocol => 'Custom Protocol';

  @override
  String get protocol => 'Protocol';

  @override
  String get customEndpoint => 'Custom Endpoint';

  @override
  String get customApiKey => 'Custom API Key';

  @override
  String get customModel => 'Custom Model';

  @override
  String get optionalForLocalServers => 'Optional for local/custom servers';

  @override
  String get speechRecognitionEngine => 'Speech Recognition Engine';

  @override
  String get local => 'Local';

  @override
  String get endpoint => 'Endpoint';

  @override
  String get localSpeechModel => 'Local Speech Model';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (on-device)';

  @override
  String get systemSpeechRecognition => 'System Speech Recognition';

  @override
  String get systemRecognitionAndroidIos => 'System Recognition (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Endpoint Recognition (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Use built-in Android / iOS recognizer (may use cloud)';

  @override
  String get voiceAiEndpoint => 'Voice AI Endpoint';

  @override
  String get embeddingModel => 'Embedding Model';

  @override
  String get crossDeviceSync => 'Cross-Device Sync';

  @override
  String get sendToOtherDevices => 'Send to Other Devices (LocalSend)';

  @override
  String get exportBackupAndSend => 'Export backup and send via share sheet';

  @override
  String get importFromLocalSend => 'Import from LocalSend';

  @override
  String get selectBackupJson => 'Select backup JSON and merge local data';

  @override
  String get autoGeneration => 'Auto Generation';

  @override
  String get autoGenerateSummary => 'Auto Generate Summary';

  @override
  String get generateAiSummaryForNewEntries =>
      'Generate AI summary for new entries';

  @override
  String get autoGenerateEmbedding => 'Auto Generate Embedding';

  @override
  String get generateVectorEmbedding => 'Generate vector embedding for search';

  @override
  String get enableNetworkSearch => 'Enable Network Search';

  @override
  String get allowOnlineRetrieval =>
      'Allow online retrieval for search and AI chat (off by default)';

  @override
  String get about => 'About';

  @override
  String version(String version) {
    return 'Version $version';
  }

  @override
  String get database => 'Database';

  @override
  String get objectBoxWithHnsw => 'ObjectBox with HNSW index';

  @override
  String get logOut => 'Log Out';

  @override
  String get custom => 'Custom';

  @override
  String get openAiCompatible => 'OpenAI Compatible';

  @override
  String get notSet => 'Not set';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'Supports local/LAN/public endpoints';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend Backup';

  @override
  String get localBackupFromShiguang =>
      'Local backup from Shiguang (receive via LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Select backup file received from LocalSend';

  @override
  String get failedToResolveFilePath => 'Failed to resolve selected file path';

  @override
  String get importOptions => 'Import Options';

  @override
  String get importSettingsAsWell =>
      'Parametrlər də idxal edilsin?\n(API açarları üzərinə yazılmayacaq)';

  @override
  String get dataOnly => 'Yalnız Data';

  @override
  String get dataAndSettings => 'Məlumat + Parametrlər';

  @override
  String get importCompleted => 'İdxal tamamlandı';

  @override
  String get settingsInBackupWereApplied =>
      'Yedəkdəki parametrlər tətbiq edildi.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Yedəkdəki parametrlər tətbiq edilmədi.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Ləğv et';

  @override
  String get save => 'Saxla';

  @override
  String get delete => 'Sil';

  @override
  String get clear => 'Təmiz';

  @override
  String get add => 'əlavə et';

  @override
  String get create => 'Yaradın';

  @override
  String get edit => 'Redaktə et';

  @override
  String get search => 'Axtar';

  @override
  String get areYouSureYouWantToLogOut => 'Çıxmaq istədiyinizə əminsiniz?';

  @override
  String get chooseLanguage => 'Dil seçin';

  @override
  String get databaseInfo => 'Verilənlər bazası məlumatı';

  @override
  String get storage => 'Saxlama: ObjectBox';

  @override
  String get vectorIndex => 'Vektor indeksi: HNSW';

  @override
  String get dimensions => 'Ölçülər: 384';

  @override
  String get embeddingModelBge => 'Yerləşdirmə Modeli: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Şəkil çəkin';

  @override
  String get chooseFromGallery => 'Qalereyadan seçin';

  @override
  String get editNickname => 'Ləqəbi redaktə edin';

  @override
  String get enterNickname => 'Ləqəb daxil edin';

  @override
  String get pleaseEnterNickname => 'Lütfən, ləqəb daxil edin';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Ləqəb artıq mövcuddur və ya etibarsızdır';

  @override
  String get user => 'İstifadəçi';

  @override
  String get manageScheduledReminders =>
      'Planlaşdırılmış xatırlatmaları və həyəcan siqnallarını idarə edin';

  @override
  String get imageFailedToLoad => 'Şəkili yükləmək alınmadı. Yenidən seçin.';

  @override
  String get imageIsStillLoading => 'Şəkil hələ də yüklənir';

  @override
  String get imageAreaNotReady =>
      'Şəkil sahəsi hazır deyil. Yenidən cəhd edin.';

  @override
  String get cropFrameNotReady =>
      'Kəsmə çərçivəsi hazır deyil. Yenidən cəhd edin.';

  @override
  String get invalidCropArea => 'Yanlış əkin sahəsi. Yenidən cəhd edin.';

  @override
  String get cropFailed => 'Crop failed. Please try again.';

  @override
  String get cropAvatar => 'Crop Avatar';

  @override
  String get chooseAgain => 'Choose Again';

  @override
  String get rotate90 => 'Rotate 90°';

  @override
  String get dragFrameToMove =>
      'Drag the frame to move, drag bottom-right to resize; pinch to zoom and move image.';

  @override
  String get pleaseFillInAllFields => 'Please fill in all fields';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN must be at least 4 digits';

  @override
  String get pinAtLeast4Digits => 'PIN must be at least 4 digits';

  @override
  String get invalidUsernameOrPin => 'Invalid username or PIN';

  @override
  String get invalidUsernameOrPinError => 'Invalid username or PIN';

  @override
  String get usernameAlreadyExists => 'Username already exists';

  @override
  String get captureMomentsKeepMemories => 'Capture moments, keep memories';

  @override
  String get username => 'Username';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Login';

  @override
  String get createAccount => 'Create Account';

  @override
  String get dontHaveAccountCreateOne => 'Don\'t have an account? Create one';

  @override
  String get alreadyHaveAccountLogin => 'Already have an account? Login';

  @override
  String get pleaseEnterUsername => 'Please enter a username';

  @override
  String get pinsDoNotMatch => 'PINs do not match';

  @override
  String get tapToAddAvatar => 'Tap to add avatar';

  @override
  String get yourName => 'Your Name';

  @override
  String get privatePinOptional => 'Private PIN (optional)';

  @override
  String get usedToEncryptPrivateRecords => 'Used to encrypt private records';

  @override
  String get privatePin => 'Private PIN';

  @override
  String get leaveEmptyForNoEncryption => 'Leave empty for no encryption';

  @override
  String get confirmPin => 'Confirm PIN';

  @override
  String get getStarted => 'Get Started';

  @override
  String get noReminders => 'No reminders';

  @override
  String get addReminder => 'Add Reminder';

  @override
  String get title => 'Title';

  @override
  String get descriptionOptional => 'Description (optional)';

  @override
  String get microphonePermissionRequired => 'Microphone permission required';

  @override
  String get aiAssistant => 'AI Assistant';

  @override
  String get listening => 'Listening...';

  @override
  String get typeAMessage => 'Type a message...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Start a conversation';

  @override
  String get typeYourMessage => 'Type your message...';

  @override
  String get asrReconnecting => 'ASR reconnecting...';

  @override
  String get write => 'Write';

  @override
  String get writeEntry => 'Write Entry';

  @override
  String get noMemoriesYet => 'No memories yet';

  @override
  String get tapPlusToCapture => 'Tap + to capture your thoughts';

  @override
  String get tapPlusToCaptureYourThoughts => 'Tap + to capture your thoughts';

  @override
  String get deleteMemory => 'Delete Memory';

  @override
  String get deleteRecord => 'Delete Record';

  @override
  String get thisEntryWillBeRemoved =>
      'This entry will be removed from your timeline.';

  @override
  String get thisRecordWillBeRemoved =>
      'This record will be removed from your timeline.';

  @override
  String get searchYourRecords => 'Search your records...';

  @override
  String get exactMatches => 'Exact Matches';

  @override
  String get noExactMatches => 'No exact matches';

  @override
  String get exact => 'Exact';

  @override
  String get exactMatch => 'Exact Match';

  @override
  String get fuzzyMatches => 'Fuzzy Matches';

  @override
  String get noFuzzyMatches => 'No fuzzy matches';

  @override
  String get vectorMatch => 'Vector Match';

  @override
  String get networkMatches => 'Network Matches';

  @override
  String get noNetworkMatches => 'No network matches';

  @override
  String get networkSearchIsOff =>
      'Network search is off. Enable it in Settings.';

  @override
  String get network => 'Network';

  @override
  String get networkMatch => 'Network Match';

  @override
  String get noSearchHistory => 'No search history';

  @override
  String get searchHistory => 'Search History';

  @override
  String get invalidLink => 'Invalid link';

  @override
  String get unableToOpenWebPage => 'Unable to open web page';

  @override
  String get imageMemory => '[Image memory]';

  @override
  String get tapToOpenWebPage => 'Tap to open web page';

  @override
  String get editEntry => 'Edit Entry';

  @override
  String get entryDetails => 'Entry Details';

  @override
  String get noContent => 'Məzmun yoxdur';

  @override
  String get diaryNotFound => 'Gündəlik tapılmadı';

  @override
  String get diaryNotFoundShort => 'Qeyd tapılmadı';

  @override
  String get aiSummary => 'AI xülasəsi';

  @override
  String get microphoneInterrupted => 'Mikrofon kəsildi, çəkiliş dayandırıldı.';

  @override
  String get bold => 'Qalın';

  @override
  String get italic => 'kursiv';

  @override
  String get strikethrough => 'üstü üstü';

  @override
  String get image => 'Şəkil';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR mövcud deyil. Qeydiyyat hələ də aktivdir.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Girişinizi yazın...';

  @override
  String get writeYourContent => 'Məzmununuzu yazın...';

  @override
  String microphoneStartFailed(String error) {
    return 'Mikrofonu işə salmaq alınmadı: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofon kəsildi, çəkiliş dayandırıldı.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR yenidən qoşulur: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Şəkil daxil edildi: $name';
  }

  @override
  String voiceError(String error) {
    return 'Səs xətası: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Üzr istəyirik, AI xidməti hazırda əlçatan deyil: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Paylaşmaq alınmadı: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count hit';
  }

  @override
  String matchCount(int count) {
    return 'Uyğunluq: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Mənbə: $source';
  }

  @override
  String get createNew => 'Yaradın';

  @override
  String micStartFailed(String error) {
    return 'Mikrofon başlamadı: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Hesablar: +$created / yeniləndi $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Gündəliklər: +$created / yenilənmiş $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Xatırlatmalar: +$created / yeniləndi $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Keçildi: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Ümumi dəyişdirilmiş: $count';
  }

  @override
  String get settingsApplied => 'Yedəkdəki parametrlər tətbiq edildi.';

  @override
  String get settingsNotApplied => 'Yedəkdəki parametrlər tətbiq edilmədi.';

  @override
  String backupExported(String path) {
    return 'Yedək eksport edildi: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Eksport uğursuz oldu: $error';
  }

  @override
  String importFailed(String error) {
    return 'Import uğursuz oldu: $error';
  }

  @override
  String get timelineTab => 'Timeline';

  @override
  String get searchAiTab => 'Search/AI';

  @override
  String get calendarTab => 'Calendar';

  @override
  String get searchAiTitle => 'Search & AI';

  @override
  String get calendarStatsTitle => 'Calendar & Stats';

  @override
  String get onThisDay => 'On This Day';

  @override
  String get weekLabel => 'Week';

  @override
  String dayGap(int days) {
    return '$days-day gap';
  }

  @override
  String get openAiChat => 'Open AI Chat';

  @override
  String get validateAiQualityHint =>
      'Ask questions and validate response quality';

  @override
  String get tapToOpenMarkdownPreview => 'Tap to open markdown preview';

  @override
  String get totalEntries => 'Entries';

  @override
  String get streakDays => 'Streak';

  @override
  String get totalChars => 'Chars';

  @override
  String get activityCalendarTitle => 'Activity Calendar';

  @override
  String get activityCalendarHint =>
      'Darker cells mean more entries on that day.';

  @override
  String get noActivityYet => 'No activity yet';

  @override
  String dayEntriesTooltip(int day, int count) {
    return '$day · $count entries';
  }

  @override
  String get noEntryOnThisDay => 'No entries on this date in previous years';

  @override
  String get networkResult => 'Network Result';

  @override
  String get noPreviewContent => 'No preview content';

  @override
  String get imageMemoryPlain => 'Image memory';

  @override
  String get shareAction => 'Share';
}

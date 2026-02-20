// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Igbo (`ig`).
class AppLocalizationsIg extends AppLocalizations {
  AppLocalizationsIg([String locale = 'ig']) : super(locale);

  @override
  String get languageName => 'Igbo';

  @override
  String get languageNameEn => 'Igbo';

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
      'Import settings as well?\n(API keys will not be overwritten)';

  @override
  String get dataOnly => 'Data Only';

  @override
  String get dataAndSettings => 'Data + Settings';

  @override
  String get importCompleted => 'Import Completed';

  @override
  String get settingsInBackupWereApplied => 'Settings in backup were applied.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Settings in backup were not applied.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get clear => 'Clear';

  @override
  String get add => 'Add';

  @override
  String get create => 'Create';

  @override
  String get edit => 'Edit';

  @override
  String get search => 'Search';

  @override
  String get areYouSureYouWantToLogOut => 'Are you sure you want to log out?';

  @override
  String get chooseLanguage => 'Choose Language';

  @override
  String get databaseInfo => 'Database Info';

  @override
  String get storage => 'Storage: ObjectBox';

  @override
  String get vectorIndex => 'Vector Index: HNSW';

  @override
  String get dimensions => 'Dimensions: 384';

  @override
  String get embeddingModelBge => 'Embedding Model: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Take Photo';

  @override
  String get chooseFromGallery => 'Choose from Gallery';

  @override
  String get editNickname => 'Edit Nickname';

  @override
  String get enterNickname => 'Enter nickname';

  @override
  String get pleaseEnterNickname => 'Please enter a nickname';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Nickname already exists or is invalid';

  @override
  String get user => 'User';

  @override
  String get manageScheduledReminders =>
      'Manage scheduled reminders and alarms';

  @override
  String get imageFailedToLoad => 'Image failed to load. Please choose again.';

  @override
  String get imageIsStillLoading => 'Image is still loading';

  @override
  String get imageAreaNotReady => 'Image area is not ready. Please try again.';

  @override
  String get cropFrameNotReady => 'Crop frame is not ready. Please try again.';

  @override
  String get invalidCropArea => 'Invalid crop area. Please try again.';

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
  String get noContent => 'Enweghị ọdịnaya';

  @override
  String get diaryNotFound => 'Ahụghị akwụkwọ akụkọ';

  @override
  String get diaryNotFoundShort => 'Ahụghị ndekọ';

  @override
  String get aiSummary => 'Nchịkọta AI';

  @override
  String get microphoneInterrupted => 'Ekwenyere igwe okwu, kwụsịrị ndekọ.';

  @override
  String get bold => 'Obi ike';

  @override
  String get italic => 'Italic';

  @override
  String get strikethrough => 'Strikethrough';

  @override
  String get image => 'Onyonyo';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR adịghị. Ndekọ ka na-arụ ọrụ.';

  @override
  String get writeYourEntry => 'Dee ntinye gị...';

  @override
  String get writeYourContent => 'Dee ọdịnaya gị...';

  @override
  String microphoneStartFailed(String error) {
    return 'Ịmalite igwe okwu: _PH_0__';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Ekwenyere igwe okwu, kwụsịrị ndekọ.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR na-ejikọghachi: _PH_0__';
  }

  @override
  String imageInserted(String name) {
    return 'Etinyere foto: _PH_0__';
  }

  @override
  String voiceError(String error) {
    return 'Njehie olu: _PH_0__';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Ndo, ọrụ AI adịghị ugbu a: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Ịkekọrịta agaghị eme: _PH_0__';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '_PH_0__ · _PH_1__ kụrụ';
  }

  @override
  String matchCount(int count) {
    return 'Dakọtara: _PH_0__';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Isi mmalite: $source';
  }

  @override
  String get createNew => 'Mepụta';

  @override
  String micStartFailed(String error) {
    return 'Mmalite igwe okwu dara: _PH_0__';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Akaụntụ: +$created / emelitere $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Akwụkwọ akụkọ: +$created / emelitere $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Ihe ncheta: +$created / emelitere $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Mafere: _PH_0__';
  }

  @override
  String importResultTotal(int count) {
    return 'Mkpokọta gbanwere: _PH_0__';
  }

  @override
  String get settingsApplied => 'etinyere ntọala ndabere.';

  @override
  String get settingsNotApplied => 'E tinyeghị ntọala ndabere.';

  @override
  String backupExported(String path) {
    return 'Ebupụrụ ndabere: _PH_0__';
  }

  @override
  String exportFailed(String error) {
    return 'Mbupu emezughị: _PH_0__';
  }

  @override
  String importFailed(String error) {
    return 'Mbubata emezughị: _PH_0__';
  }
}

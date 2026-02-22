// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get languageName => 'नेपाली';

  @override
  String get languageNameEn => 'Nepali';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'सेटिङ';

  @override
  String get account => 'खाता';

  @override
  String get reminders => 'रिमाइन्डरहरू';

  @override
  String get language => 'भाषा';

  @override
  String get appLanguage => 'एप भाषा';

  @override
  String get appearance => 'देखिने';

  @override
  String get themeMode => 'थीम मोड';

  @override
  String get dark => 'डार्क';

  @override
  String get light => 'लाइट';

  @override
  String get system => 'प्रणाली';

  @override
  String get aiService => 'AI सेवा';

  @override
  String get aiChatProvider => 'AI च्याट प्रदायक';

  @override
  String get chatModel => 'च्याट मोडल';

  @override
  String get localModel => 'स्थानीय मोडल';

  @override
  String get localModelDefault => 'स्थानीय मोडल (पूर्वानुमान)';

  @override
  String get ollamaEndpoint => 'Ollama एन्डपोइन्ट';

  @override
  String get ollamaModel => 'Ollama मोडल';

  @override
  String get openAiEndpoint => 'OpenAI एन्डपोइन्ट';

  @override
  String get openAiApiKey => 'OpenAI API कुञ्जी';

  @override
  String get openAiModel => 'OpenAI मोडल';

  @override
  String get geminiEndpoint => 'Gemini एन्डपोइन्ट';

  @override
  String get geminiApiKey => 'Gemini API कुञ्जी';

  @override
  String get geminiModel => 'Gemini मोडल';

  @override
  String get anthropicEndpoint => 'Anthropic एन्डपोइन्ट';

  @override
  String get anthropicApiKey => 'Anthropic API कुञ्जी';

  @override
  String get anthropicModel => 'Anthropic मोडल';

  @override
  String get customProtocol => 'कस्टम प्रोटोकल';

  @override
  String get protocol => 'प्रोटोकल';

  @override
  String get customEndpoint => 'कस्टम एन्डपोइन्ट';

  @override
  String get customApiKey => 'कस्टम API कुञ्जी';

  @override
  String get customModel => 'कस्टम मोडल';

  @override
  String get optionalForLocalServers =>
      'स्थानीय/कस्टम सर्भरहरूको लागि वैकल्पिक';

  @override
  String get speechRecognitionEngine => 'भाषण पहिचान इन्जिन';

  @override
  String get local => 'स्थानीय';

  @override
  String get endpoint => 'एन्डपोइन्ट';

  @override
  String get localSpeechModel => 'स्थानीय भाषण मोडल';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (उपकरणमा)';

  @override
  String get systemSpeechRecognition => 'प्रणाली भाषण पहिचान';

  @override
  String get systemRecognitionAndroidIos => 'प्रणाली पहिचान (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'एन्डपोइन्ट पहिचान (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'निर्मित Android / iOS पहिचानकर्ता प्रयोग गर्नुहोस् (क्लाउड प्रयोग गर्न सक्छ)';

  @override
  String get voiceAiEndpoint => 'भ्वाइस AI एन्डपोइन्ट';

  @override
  String get embeddingModel => 'एम्बेडिङ मोडल';

  @override
  String get crossDeviceSync => 'क्रस-डिभाइस सिंक';

  @override
  String get sendToOtherDevices => 'अन्य डिभाइसहरूमा पठाउनुहोस् (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'ब्याकअप निर्यात गर्नुहोस् र शेयर मार्फत पठाउनुहोस्';

  @override
  String get importFromLocalSend => 'LocalSend बाट आयात गर्नुहोस्';

  @override
  String get selectBackupJson =>
      'ब्याकअप JSON चयन गर्नुहोस् र स्थानीय डेटा मर्ज गर्नुहोस्';

  @override
  String get autoGeneration => 'स्वतः उत्पादन';

  @override
  String get autoGenerateSummary => 'स्वतः सारांश उत्पादन गर्नुहोस्';

  @override
  String get generateAiSummaryForNewEntries =>
      'नयाँ प्रविष्टिहरूको लागि AI सारांश उत्पादन गर्नुहोस्';

  @override
  String get autoGenerateEmbedding => 'स्वतः एम्बेडिङ उत्पादन गर्नुहोस्';

  @override
  String get generateVectorEmbedding =>
      'खोजको लागि भेक्टर एम्बेडिङ उत्पादन गर्नुहोस्';

  @override
  String get enableNetworkSearch => 'नेटवर्क खोज सक्षम पार्नुहोस्';

  @override
  String get allowOnlineRetrieval =>
      'खोज र AI च्याटको लागि अनलाइन पुनर्प्राप्तिको अनुमति दिनुहोस् (पूर्वानुमान बंद)';

  @override
  String get about => 'बारेमा';

  @override
  String version(String version) {
    return 'संस्करण $version';
  }

  @override
  String get database => 'डेटाबेस';

  @override
  String get objectBoxWithHnsw => 'HNSW इन्डेक्स सहित ObjectBox';

  @override
  String get logOut => 'लग आउट';

  @override
  String get custom => 'कस्टम';

  @override
  String get openAiCompatible => 'OpenAI अनुकूल';

  @override
  String get notSet => 'सेट गरिएको छैन';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... वा http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'स्थानीय/LAN/सार्वजनिक एन्डपोइन्टहरूलाई समर्थन गर्दछ';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend ब्याकअप';

  @override
  String get localBackupFromShiguang =>
      'Shiguang बाट स्थानीय ब्याकअप (LocalSend मार्फत प्राप्त गर्नुहोस्)';

  @override
  String get selectBackupFileFromLocalSend =>
      'LocalSend बाट प्राप्त ब्याकअप फाइल चयन गर्नुहोस्';

  @override
  String get failedToResolveFilePath =>
      'चयन गरिएको फाइल पथ समाधान गर्न असफल भयो';

  @override
  String get importOptions => 'आयात विकल्पहरू';

  @override
  String get importSettingsAsWell =>
      'सेटिङहरू पनि आयात गर्नुहोस्?\n(API कुञ्जीहरू अधिलेखित हुने छैनन्)';

  @override
  String get dataOnly => 'डेटा मात्र';

  @override
  String get dataAndSettings => 'डेटा + सेटिङहरू';

  @override
  String get importCompleted => 'आयात पूर्ण';

  @override
  String get settingsInBackupWereApplied => 'ब्याकअपमा सेटिङहरू लागू गरियो।';

  @override
  String get settingsInBackupWereNotApplied => 'ब्याकअपमा सेटिङहरू लागू गरिएन।';

  @override
  String get ok => 'ठिक छ';

  @override
  String get cancel => 'रद्द गर्नुहोस्';

  @override
  String get save => 'बचत गर्नुहोस्';

  @override
  String get delete => 'मेटाउनुहोस्';

  @override
  String get clear => 'खाली गर्नुहोस्';

  @override
  String get add => 'थप्नुहोस्';

  @override
  String get create => 'सिर्जना गर्नुहोस्';

  @override
  String get edit => 'सम्पादन गर्नुहोस्';

  @override
  String get search => 'खोज्नुहोस्';

  @override
  String get areYouSureYouWantToLogOut => 'तपाईं लग आउट गर्न चाहनुहुन्छ?';

  @override
  String get chooseLanguage => 'भाषा चयन गर्नुहोस्';

  @override
  String get databaseInfo => 'डेटाबेस जानकारी';

  @override
  String get storage => 'भण्डारण: ObjectBox';

  @override
  String get vectorIndex => 'भेक्टर इन्डेक्स: HNSW';

  @override
  String get dimensions => 'आयामहरू: 384';

  @override
  String get embeddingModelBge => 'एम्बेडिङ मोडल: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'फोटो लिनुहोस्';

  @override
  String get chooseFromGallery => 'ग्यालरीबाट चयन गर्नुहोस्';

  @override
  String get editNickname => 'उपनाम सम्पादन गर्नुहोस्';

  @override
  String get enterNickname => 'उपनाम प्रविष्ट गर्नुहोस्';

  @override
  String get pleaseEnterNickname => 'कृपया उपनाम प्रविष्ट गर्नुहोस्';

  @override
  String get nicknameAlreadyExistsOrInvalid => 'उपनाम पहिले नै छ वा अमान्य छ';

  @override
  String get user => 'प्रयोगकर्ता';

  @override
  String get manageScheduledReminders =>
      'निर्धारित रिमाइन्डरहरू र अलार्महरू व्यवस्थापन गर्नुहोस्';

  @override
  String get imageFailedToLoad =>
      'तस्वीर लोड हुन असफल भयो। कृपया फेरि चयन गर्नुहोस्।';

  @override
  String get imageIsStillLoading => 'तस्वीर अझै लोड हुँदै छ';

  @override
  String get imageAreaNotReady =>
      'तस्वीर क्षेत्र तयार छैन। कृपया फेरि प्रयास गर्नुहोस्।';

  @override
  String get cropFrameNotReady =>
      'क्रप फ्रेम तयार छैन। कृपया फेरि प्रयास गर्नुहोस्।';

  @override
  String get invalidCropArea =>
      'अमान्य क्रप क्षेत्र। कृपया फेरि प्रयास गर्नुहोस्।';

  @override
  String get cropFailed => 'क्रप असफल भयो। कृपया फेरि प्रयास गर्नुहोस्।';

  @override
  String get cropAvatar => 'अवाटार क्रप गर्नुहोस्';

  @override
  String get chooseAgain => 'फेरि चयन गर्नुहोस्';

  @override
  String get rotate90 => '90° घुमाउनुहोस्';

  @override
  String get dragFrameToMove =>
      'सार्नको लागि फ्रेम तान्नुहोस्, आकार बदल्नको लागि तल-दायाँ तान्नुहोस्; जुम र तस्वीर सार्नको लागि पिञ्च गर्नुहोस्।';

  @override
  String get pleaseFillInAllFields => 'कृपया सबै क्षेत्रहरू भर्नुहोस्';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN कम्तीमा 4 अंकको हुनुपर्छ';

  @override
  String get pinAtLeast4Digits => 'PIN कम्तीमा 4 अंकको हुनुपर्छ';

  @override
  String get invalidUsernameOrPin => 'अमान्य प्रयोगकर्ता नाम वा PIN';

  @override
  String get invalidUsernameOrPinError => 'अमान्य प्रयोगकर्ता नाम वा PIN';

  @override
  String get usernameAlreadyExists => 'प्रयोगकर्ता नाम पहिले नै छ';

  @override
  String get captureMomentsKeepMemories =>
      'पलहरू कैद गर्नुहोस्, सम्झनाहरू जोगाउनुहोस्';

  @override
  String get username => 'प्रयोगकर्ता नाम';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'लग इन';

  @override
  String get createAccount => 'खाता सिर्जना गर्नुहोस्';

  @override
  String get dontHaveAccountCreateOne => 'खाता छैन? एउटा सिर्जना गर्नुहोस्';

  @override
  String get alreadyHaveAccountLogin => 'खाता छ? लग इन गर्नुहोस्';

  @override
  String get pleaseEnterUsername => 'कृपया प्रयोगकर्ता नाम प्रविष्ट गर्नुहोस्';

  @override
  String get pinsDoNotMatch => 'PINहरू मेल खाँदैनन्';

  @override
  String get tapToAddAvatar => 'अवाटार थप्न ट्याप गर्नुहोस्';

  @override
  String get yourName => 'तपाईंको नाम';

  @override
  String get privatePinOptional => 'निजी PIN (वैकल्पिक)';

  @override
  String get usedToEncryptPrivateRecords =>
      'निजी अभिलेखहरू इन्क्रिप्ट गर्न प्रयोग गरिन्छ';

  @override
  String get privatePin => 'निजी PIN';

  @override
  String get leaveEmptyForNoEncryption => 'इन्क्रिप्सन नगर्न खाली छोड्नुहोस्';

  @override
  String get confirmPin => 'PIN पुष्टि गर्नुहोस्';

  @override
  String get getStarted => 'सुरू गर्नुहोस्';

  @override
  String get noReminders => 'कुनै रिमाइन्डरहरू छैनन्';

  @override
  String get addReminder => 'रिमाइन्डर थप्नुहोस्';

  @override
  String get title => 'शीर्षक';

  @override
  String get descriptionOptional => 'विवरण (वैकल्पिक)';

  @override
  String get microphonePermissionRequired => 'माइक्रोफोन अनुमति आवश्यक छ';

  @override
  String get aiAssistant => 'AI सहायक';

  @override
  String get listening => 'सुनिरहेको छ...';

  @override
  String get typeAMessage => 'सन्देश टाइप गर्नुहोस्...';

  @override
  String get aiChat => 'AI च्याट';

  @override
  String get startAConversation => 'कुराकानी सुरू गर्नुहोस्';

  @override
  String get typeYourMessage => 'तपाईंको सन्देश टाइप गर्नुहोस्...';

  @override
  String get asrReconnecting => 'ASR पुनः जडान हुँदै छ...';

  @override
  String get write => 'लेख्नुहोस्';

  @override
  String get writeEntry => 'प्रविष्टि लेख्नुहोस्';

  @override
  String get noMemoriesYet => 'अझै कुनै सम्झना छैन';

  @override
  String get tapPlusToCapture => 'तपाईंका विचारहरू कैद गर्न + ट्याप गर्नुहोस्';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'तपाईंका विचारहरू कैद गर्न + ट्याप गर्नुहोस्';

  @override
  String get deleteMemory => 'सम्झना मेटाउनुहोस्';

  @override
  String get deleteRecord => 'अभिलेख मेटाउनुहोस्';

  @override
  String get thisEntryWillBeRemoved =>
      'यो प्रविष्टि तपाईंको टाइमलाइनबाट हटाइनेछ।';

  @override
  String get thisRecordWillBeRemoved =>
      'यो अभिलेख तपाईंको टाइमलाइनबाट हटाइनेछ।';

  @override
  String get searchYourRecords => 'तपाईंका अभिलेखहरू खोज्नुहोस्...';

  @override
  String get exactMatches => 'ठिक मिल्ने';

  @override
  String get noExactMatches => 'कुनै ठिक मिल्ने छैन';

  @override
  String get exact => 'ठिक';

  @override
  String get exactMatch => 'ठिक मिल्ने';

  @override
  String get fuzzyMatches => 'फज़ी मिल्ने';

  @override
  String get noFuzzyMatches => 'कुनै फज़ी मिल्ने छैन';

  @override
  String get vectorMatch => 'भेक्टर मिल्ने';

  @override
  String get networkMatches => 'नेटवर्क मिल्ने';

  @override
  String get noNetworkMatches => 'कुनै नेटवर्क मिल्ने छैन';

  @override
  String get networkSearchIsOff =>
      'नेटवर्क खोज बंद छ। सेटिङहरूमा सक्षम पार्नुहोस्।';

  @override
  String get network => 'नेटवर्क';

  @override
  String get networkMatch => 'नेटवर्क मिल्ने';

  @override
  String get noSearchHistory => 'कुनै खोज इतिहास छैन';

  @override
  String get searchHistory => 'खोज इतिहास';

  @override
  String get invalidLink => 'अमान्य लिंक';

  @override
  String get unableToOpenWebPage => 'वेब पेज खोल्न असमर्थ';

  @override
  String get imageMemory => '[तस्वीर सम्झना]';

  @override
  String get tapToOpenWebPage => 'वेब पेज खोल्न ट्याप गर्नुहोस्';

  @override
  String get editEntry => 'प्रविष्टि सम्पादन गर्नुहोस्';

  @override
  String get entryDetails => 'प्रविष्टि विवरण';

  @override
  String get noContent => 'कुनै सामग्री छैन';

  @override
  String get diaryNotFound => 'डायरी फेरिएन';

  @override
  String get diaryNotFoundShort => 'अभिलेख फेरिएन';

  @override
  String get aiSummary => 'AI सारांश';

  @override
  String get microphoneInterrupted => 'माइक्रोफोन बाधित, रेकर्डिङ रोकियो।';

  @override
  String get bold => 'बोल्ड';

  @override
  String get italic => 'इटालिक';

  @override
  String get strikethrough => 'स्ट्राइकथ्रू';

  @override
  String get image => 'तस्वीर';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR उपलब्ध छैन। रेकर्डिङ अझै सक्रिय छ।';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'तपाईंको प्रविष्टि लेख्नुहोस्...';

  @override
  String get writeYourContent => 'तपाईंको सामग्री लेख्नुहोस्...';

  @override
  String microphoneStartFailed(String error) {
    return 'माइक्रोफोन सुरू गर्न असफल भयो: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'माइक्रोफोन बाधित, रेकर्डिङ रोकियो।';

  @override
  String asrReconnectingError(String error) {
    return 'ASR पुनः जडान हुँदै छ: $error';
  }

  @override
  String imageInserted(String name) {
    return 'तस्वीर सम्मिलित: $name';
  }

  @override
  String voiceError(String error) {
    return 'भ्वाइस त्रुटि: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'माफ गर्नुहोस्, AI सेवा हाल उपलब्ध छैन: $error';
  }

  @override
  String shareFailed(String error) {
    return 'शेयर गर्न असफल भयो: $error';
  }

  @override
  String get shareSaving => 'Saving...';

  @override
  String get shareRenderingImage => 'Rendering share image...';

  @override
  String get shareRenderImageFailed => 'Failed to render share image';

  @override
  String get shareSavingToGallery => 'Saving to system gallery...';

  @override
  String get shareSavedToGallery => 'Saved successfully to gallery (Shiguang)';

  @override
  String get shareSavePermissionRequired =>
      'Save failed: allow Photos & Videos permission and retry';

  @override
  String get htmlVideo => 'Video';

  @override
  String get htmlAudio => 'Audio';

  @override
  String get htmlOpen => 'Open';

  @override
  String get htmlDetails => 'Details';

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count हिटहरू';
  }

  @override
  String matchCount(int count) {
    return 'मिल्ने: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'स्रोत: $source';
  }

  @override
  String get createNew => 'सिर्जना गर्नुहोस्';

  @override
  String micStartFailed(String error) {
    return 'माइक सुरू गर्न असफल भयो: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'खाताहरू: +$created / अपडेट $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'डायरीहरू: +$created / अपडेट $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'रिमाइन्डरहरू: +$created / अपडेट $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'छोडियो: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'जम्मा परिवर्तन: $count';
  }

  @override
  String get settingsApplied => 'ब्याकअपमा सेटिङहरू लागू गरियो।';

  @override
  String get settingsNotApplied => 'ब्याकअपमा सेटिङहरू लागू गरिएन।';

  @override
  String backupExported(String path) {
    return 'ब्याकअप निर्यात भयो: $path';
  }

  @override
  String exportFailed(String error) {
    return 'निर्यात असफल भयो: $error';
  }

  @override
  String importFailed(String error) {
    return 'आयात असफल भयो: $error';
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

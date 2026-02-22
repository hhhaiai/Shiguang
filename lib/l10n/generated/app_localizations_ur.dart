// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get languageName => 'اردو';

  @override
  String get languageNameEn => 'Urdu';

  @override
  String get appTitle => 'شگوانگ';

  @override
  String get settings => 'ترتیبات';

  @override
  String get account => 'اکاؤنٹ';

  @override
  String get reminders => 'یاد دہانیاں';

  @override
  String get language => 'زبان';

  @override
  String get appLanguage => 'ایپ زبان';

  @override
  String get appearance => 'ظہور';

  @override
  String get themeMode => 'تھیم موڈ';

  @override
  String get dark => 'اندھرا';

  @override
  String get light => 'روشن';

  @override
  String get system => 'سسٹم';

  @override
  String get aiService => 'AI سروس';

  @override
  String get aiChatProvider => 'AI چیٹ فراہم کنندہ';

  @override
  String get chatModel => 'چیٹ ماڈل';

  @override
  String get localModel => 'لوکل ماڈل';

  @override
  String get localModelDefault => 'لوکل ماڈل (طے شدہ)';

  @override
  String get ollamaEndpoint => 'Ollama اینڈپوائنٹ';

  @override
  String get ollamaModel => 'Ollama ماڈل';

  @override
  String get openAiEndpoint => 'OpenAI اینڈپوائنٹ';

  @override
  String get openAiApiKey => 'OpenAI API کلید';

  @override
  String get openAiModel => 'OpenAI ماڈل';

  @override
  String get geminiEndpoint => 'Gemini اینڈپوائنٹ';

  @override
  String get geminiApiKey => 'Gemini API کلید';

  @override
  String get geminiModel => 'Gemini ماڈل';

  @override
  String get anthropicEndpoint => 'Anthropic اینڈپوائنٹ';

  @override
  String get anthropicApiKey => 'Anthropic API کلید';

  @override
  String get anthropicModel => 'Anthropic ماڈل';

  @override
  String get customProtocol => 'اکثری پروٹوکول';

  @override
  String get protocol => 'پروٹوکول';

  @override
  String get customEndpoint => 'اکثری اینڈپوائنٹ';

  @override
  String get customApiKey => 'اکثری API کلید';

  @override
  String get customModel => 'اکثری ماڈل';

  @override
  String get optionalForLocalServers => 'لوکل/اکثری سرورز کے لیے اخیتیاری';

  @override
  String get speechRecognitionEngine => 'تقریر شناسی انجن';

  @override
  String get local => 'لوکل';

  @override
  String get endpoint => 'اینڈپوائنٹ';

  @override
  String get localSpeechModel => 'لوکل تقریر ماڈل';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (ڈیوائس پر)';

  @override
  String get systemSpeechRecognition => 'سسٹم تقریر شناسی';

  @override
  String get systemRecognitionAndroidIos => 'سسٹم شناسی (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'اینڈپوائنٹ شناسی (کلاؤڈ/WS)';

  @override
  String get useBuiltInRecognizer =>
      'بِلٹ ان Android / iOS ریکگنائزر کااستعمال کریں (کلاؤڈ کااستعمال کرسکتا ہے)';

  @override
  String get voiceAiEndpoint => 'ووائس AI اینڈپوائنٹ';

  @override
  String get embeddingModel => 'ایمبیڈنگ ماڈل';

  @override
  String get crossDeviceSync => 'کراس ڈیوائسزامنک';

  @override
  String get sendToOtherDevices => 'دیگر ڈیوائسز کو بھیجیں (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'بیک اپ ایکسپورٹ کریں اور شیئر شیٹ کے ذریعے بھیجیں';

  @override
  String get importFromLocalSend => 'LocalSend سے امپورٹ کریں';

  @override
  String get selectBackupJson =>
      'بیک اپ JSON سلیکٹ کریں اور لوکل ڈیٹا مارج کریں';

  @override
  String get autoGeneration => 'آٹو جنریشن';

  @override
  String get autoGenerateSummary => 'آٹو سمری جنریٹ';

  @override
  String get generateAiSummaryForNewEntries =>
      'نو انٹریز کے لیے AI سمری جنریٹ کریں';

  @override
  String get autoGenerateEmbedding => 'آٹو ایمبیڈنگ جنریٹ';

  @override
  String get generateVectorEmbedding => 'سرچ کے لیے ویکٹر ایمبیڈنگ جنریٹ کریں';

  @override
  String get enableNetworkSearch => 'نیٹ ورک سرچ فعال کریں';

  @override
  String get allowOnlineRetrieval =>
      'سرچ اور AI چیٹ کے لیے آن لائن ریٹریول کی اجازت دیں (طے شدہ طور پر بند)';

  @override
  String get about => 'کے بارے میں';

  @override
  String version(String version) {
    return 'ورژن $version';
  }

  @override
  String get database => 'ڈیٹابیس';

  @override
  String get objectBoxWithHnsw => 'HNSW انڈیکس کے ساتھ ObjectBox';

  @override
  String get logOut => 'لاگ آؤٹ';

  @override
  String get custom => 'اکثری';

  @override
  String get openAiCompatible => 'OpenAI موافق';

  @override
  String get notSet => 'سیٹ نہیں کیا گیا';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... یا http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'لوکل/LAN/پبلک اینڈپوائنٹس کی حمایت کرتا ہے';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend بیک اپ';

  @override
  String get localBackupFromShiguang =>
      'Shiguang سے لوکل بیک اپ (LocalSend کے ذریعے موصول کریں)';

  @override
  String get selectBackupFileFromLocalSend =>
      'LocalSend سے موصول بیک اپ فائل سلیکٹ کریں';

  @override
  String get failedToResolveFilePath =>
      'سلیکٹ کردہ فائل پاتھ حل کرنے میں ناکام';

  @override
  String get importOptions => 'امپورٹ آپشنز';

  @override
  String get importSettingsAsWell =>
      'ترتیبات بھی امپورٹ کریں؟\n(API کلیدز اوور رائٹ نہیں ہوں گی)';

  @override
  String get dataOnly => 'ڈیٹا فقط';

  @override
  String get dataAndSettings => 'ڈیٹا + ترتیبات';

  @override
  String get importCompleted => 'امپورٹ مکمل';

  @override
  String get settingsInBackupWereApplied => 'بیک اپ کی ترتیبات لاگو کی گئیں۔';

  @override
  String get settingsInBackupWereNotApplied =>
      'بیک اپ کی ترتیبات لاگو نہیں کی گئیں۔';

  @override
  String get ok => 'ٹھیک ہے';

  @override
  String get cancel => 'منسوخ';

  @override
  String get save => 'محفوظ کریں';

  @override
  String get delete => 'حذف کریں';

  @override
  String get clear => 'صاف کریں';

  @override
  String get add => 'شامل کریں';

  @override
  String get create => 'بنائیں';

  @override
  String get edit => 'ترمیم کریں';

  @override
  String get search => 'تلاش';

  @override
  String get areYouSureYouWantToLogOut =>
      'کیا آپ واقعی لاگ آؤٹ کرنا چاہتے ہیں؟';

  @override
  String get chooseLanguage => 'زبان چنیں';

  @override
  String get databaseInfo => 'ڈیٹابیس معلومات';

  @override
  String get storage => 'اسٹوریج: ObjectBox';

  @override
  String get vectorIndex => 'ویکٹر انڈیکس: HNSW';

  @override
  String get dimensions => 'جہتیں: 384';

  @override
  String get embeddingModelBge => 'ایمبیڈنگ ماڈل: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'فوٹو لیں';

  @override
  String get chooseFromGallery => 'گیلری سے چنیں';

  @override
  String get editNickname => 'عرف ترمیم کریں';

  @override
  String get enterNickname => 'عرف درج کریں';

  @override
  String get pleaseEnterNickname => 'براہ کرم ایک عرف درج کریں';

  @override
  String get nicknameAlreadyExistsOrInvalid => 'عرف پہلے سے موجود ہے یا غلط ہے';

  @override
  String get user => 'صارف';

  @override
  String get manageScheduledReminders =>
      'مقررہ یاد دہانیاں اور الارمز کا انتظام کریں';

  @override
  String get imageFailedToLoad =>
      'تصویر لوڈ ہونے میں ناکام۔ براہ کرم دوبارہ چنیں۔';

  @override
  String get imageIsStillLoading => 'تصویر ابھی لوڈ ہو رہی ہے';

  @override
  String get imageAreaNotReady =>
      'تصویر کا علاقہ تیار نہیں ہے۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get cropFrameNotReady =>
      'کراپ فریم تیار نہیں ہے۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get invalidCropArea => 'غلط کراپ علاقہ۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get cropFailed => 'کراپ ناکام۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get cropAvatar => 'اوتار کراپ کریں';

  @override
  String get chooseAgain => 'دوبارہ چنیں';

  @override
  String get rotate90 => '90° گھمائیں';

  @override
  String get dragFrameToMove =>
      'موومنٹ کے لیے فریم کو گھسیٹیں، سائز کے لیے نیچے-دائیں گھسیٹیں؛ زوم اور امیج موومنٹ کے لیے پنچ کریں۔';

  @override
  String get pleaseFillInAllFields => 'براہ کرم تمام فیلڈز پر کریں';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN کم از کم 4 ہندسے کا ہونا چاہیے';

  @override
  String get pinAtLeast4Digits => 'PIN کم از کم 4 ہندسے کا ہونا چاہیے';

  @override
  String get invalidUsernameOrPin => 'غلط صارف نام یا PIN';

  @override
  String get invalidUsernameOrPinError => 'غلط صارف نام یا PIN';

  @override
  String get usernameAlreadyExists => 'صارف نام پہلے سے موجود ہے';

  @override
  String get captureMomentsKeepMemories => 'لمحات کیپچر کریں، یادیں محفوظ کریں';

  @override
  String get username => 'صارف نام';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'لاگ ان';

  @override
  String get createAccount => 'اکاؤنٹ بنائیں';

  @override
  String get dontHaveAccountCreateOne => 'اکاؤنٹ نہیں ہے؟ ایک بنائیں';

  @override
  String get alreadyHaveAccountLogin => 'پہلے سے اکاؤنٹ ہے؟ لاگ ان کریں';

  @override
  String get pleaseEnterUsername => 'براہ کرم صارف نام درج کریں';

  @override
  String get pinsDoNotMatch => 'PIN مماثل نہیں ہیں';

  @override
  String get tapToAddAvatar => 'اوتار شامل کرنے کے لیے ٹیپ کریں';

  @override
  String get yourName => 'آپ کا نام';

  @override
  String get privatePinOptional => 'پرائیویٹ PIN (اختیاری)';

  @override
  String get usedToEncryptPrivateRecords =>
      'پرائیویٹ ریکارڈز انکرپٹ کرنے کے لیے_used';

  @override
  String get privatePin => 'پرائیویٹ PIN';

  @override
  String get leaveEmptyForNoEncryption => 'انکرپشن کے لیے خالی چھوڑیں';

  @override
  String get confirmPin => 'PIN کی تصدیق کریں';

  @override
  String get getStarted => 'شروع کریں';

  @override
  String get noReminders => 'کوئی یاد دہانی نہیں';

  @override
  String get addReminder => 'یاد دہانی شامل کریں';

  @override
  String get title => 'عنوان';

  @override
  String get descriptionOptional => 'تفصیل (اختیاری)';

  @override
  String get microphonePermissionRequired => 'مائیکروفون کی اجازت درکار ہے';

  @override
  String get aiAssistant => 'AI اسسٹنٹ';

  @override
  String get listening => 'سنا...';

  @override
  String get typeAMessage => 'ایک پیغام ٹائپ کریں...';

  @override
  String get aiChat => 'AI چیٹ';

  @override
  String get startAConversation => 'ایک گفتگو شروع کریں';

  @override
  String get typeYourMessage => 'اپنا پیغام ٹائپ کریں...';

  @override
  String get asrReconnecting => 'ASR دوبارہ جڑ رہا ہے...';

  @override
  String get write => 'لکھیں';

  @override
  String get writeEntry => 'انٹری لکھیں';

  @override
  String get noMemoriesYet => 'ابھی تک کوئی یادیں نہیں';

  @override
  String get tapPlusToCapture => 'اپنے خیالات کیپچر کرنے کے لیے + ٹیپ کریں';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'اپنے خیالات کیپچر کرنے کے لیے + ٹیپ کریں';

  @override
  String get deleteMemory => 'یاد حذف کریں';

  @override
  String get deleteRecord => 'ریکارڈ حذف کریں';

  @override
  String get thisEntryWillBeRemoved =>
      'یہ انٹری آپ کی ٹائم لائن سے ہٹا دی جائے گی۔';

  @override
  String get thisRecordWillBeRemoved =>
      'یہ ریکارڈ آپ کی ٹائم لائن سے ہٹا دیا جائے گا۔';

  @override
  String get searchYourRecords => 'اپنے ریکارڈز تلاش کریں...';

  @override
  String get exactMatches => 'بالکل مماثل';

  @override
  String get noExactMatches => 'کوئی بالکل مماثل نہیں';

  @override
  String get exact => 'بالکل';

  @override
  String get exactMatch => 'بالکل مماثل';

  @override
  String get fuzzyMatches => 'فازی مماثل';

  @override
  String get noFuzzyMatches => 'کوئی فازی مماثل نہیں';

  @override
  String get vectorMatch => 'ویکٹر مماثل';

  @override
  String get networkMatches => 'نیٹ ورک مماثل';

  @override
  String get noNetworkMatches => 'کوئی نیٹ ورک مماثل نہیں';

  @override
  String get networkSearchIsOff =>
      'نیٹ ورک سرچ بند ہے۔ ترتیبات میں اسے فعال کریں۔';

  @override
  String get network => 'نیٹ ورک';

  @override
  String get networkMatch => 'نیٹ ورک مماثل';

  @override
  String get noSearchHistory => 'کوئی سرچ ہسٹری نہیں';

  @override
  String get searchHistory => 'سرچ ہسٹری';

  @override
  String get invalidLink => 'غلط لنک';

  @override
  String get unableToOpenWebPage => 'ویب پیج کھولنے سے قاصر';

  @override
  String get imageMemory => '[تصویر کی یاد]';

  @override
  String get tapToOpenWebPage => 'ویب پیج کھولنے کے لیے ٹیپ کریں';

  @override
  String get editEntry => 'انٹری ترمیم کریں';

  @override
  String get entryDetails => 'انٹری کی تفصیلات';

  @override
  String get noContent => 'کوئی مواد نہیں';

  @override
  String get diaryNotFound => 'ڈائری نہیں ملی';

  @override
  String get diaryNotFoundShort => 'ریکارڈ نہیں ملا';

  @override
  String get aiSummary => 'AI سمری';

  @override
  String get microphoneInterrupted => 'مائیکروفون مکس ہو گیا، ریکارڈنگ رک گئی۔';

  @override
  String get bold => 'بولڈ';

  @override
  String get italic => 'اٹیلک';

  @override
  String get strikethrough => 'اسٹرائیک تھرو';

  @override
  String get image => 'تصویر';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR دستیاب نہیں۔ ریکارڈنگ ابھی بھی سرگرم ہے۔';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'اپنی انٹری لکھیں...';

  @override
  String get writeYourContent => 'اپنا مواد لکھیں...';

  @override
  String microphoneStartFailed(String error) {
    return 'مائیکروفون شروع کرنے میں ناکام: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'مائیکروفون مکس ہو گیا، ریکارڈنگ رک گئی۔';

  @override
  String asrReconnectingError(String error) {
    return 'ASR دوبارہ جڑ رہا ہے: $error';
  }

  @override
  String imageInserted(String name) {
    return 'تصویر داخل کی گئی: $name';
  }

  @override
  String voiceError(String error) {
    return 'ووائس ارر: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'معذرت، AI سروس فی الوقت دستیاب نہیں ہے: $error';
  }

  @override
  String shareFailed(String error) {
    return 'شیئر کرنے میں ناکام: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count ہٹس';
  }

  @override
  String matchCount(int count) {
    return 'مطابقت: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'ذریعہ: $source';
  }

  @override
  String get createNew => 'بنائیں';

  @override
  String micStartFailed(String error) {
    return 'مائک شروع کرنے میں ناکام: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'اکاؤنٹس: +$created / اپڈیٹ $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'ڈائریز: +$created / اپڈیٹ $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'یاد دہانیاں: +$created / اپڈیٹ $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'چھوڑا گیا: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'کل تبدیلیاں: $count';
  }

  @override
  String get settingsApplied => 'بیک اپ کی ترتیبات لاگو کی گئیں۔';

  @override
  String get settingsNotApplied => 'بیک اپ کی ترتیبات لاگو نہیں کی گئیں۔';

  @override
  String backupExported(String path) {
    return 'بیک اپ ایکسپورٹ ہوا: $path';
  }

  @override
  String exportFailed(String error) {
    return 'ایکسپورٹ ناکام: $error';
  }

  @override
  String importFailed(String error) {
    return 'امپورٹ ناکام: $error';
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

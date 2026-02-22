// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AppLocalizationsAm extends AppLocalizations {
  AppLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get languageName => 'አማርኛ';

  @override
  String get languageNameEn => 'Amharic';

  @override
  String get appTitle => 'ሽጉዋንግ';

  @override
  String get settings => 'ቅንብሮች';

  @override
  String get account => 'መለያ';

  @override
  String get reminders => 'አስታዋሾች';

  @override
  String get language => 'ቋንቋ';

  @override
  String get appLanguage => 'የመተግበሪያ ቋንቋ';

  @override
  String get appearance => 'መልክ';

  @override
  String get themeMode => 'ገጽታ ሁነታ';

  @override
  String get dark => 'ጨለማ';

  @override
  String get light => 'ብርሃን';

  @override
  String get system => 'ስርዓት';

  @override
  String get aiService => 'AI አገልግሎት';

  @override
  String get aiChatProvider => 'AI ውይይት አቅራቢ';

  @override
  String get chatModel => 'የውይይት ሞዴል';

  @override
  String get localModel => 'የአካባቢ ሞዴል';

  @override
  String get localModelDefault => 'የአካባቢ ሞዴል (ነባሪ)';

  @override
  String get ollamaEndpoint => 'ኦላማ የመጨረሻ ነጥብ';

  @override
  String get ollamaModel => 'ኦላማ ሞዴል';

  @override
  String get openAiEndpoint => 'ክፍት AI የመጨረሻ ነጥብ';

  @override
  String get openAiApiKey => 'ኤፒአይ ቁልፍን ክፈት';

  @override
  String get openAiModel => 'ክፍት AI ሞዴል';

  @override
  String get geminiEndpoint => 'ጀሚኒ የመጨረሻ ነጥብ';

  @override
  String get geminiApiKey => 'የጌሚኒ ኤፒአይ ቁልፍ';

  @override
  String get geminiModel => 'የጌሚኒ ሞዴሎች';

  @override
  String get anthropicEndpoint => 'አንትሮፖኒክ የመጨረሻ ነጥብ';

  @override
  String get anthropicApiKey => 'አንትሮፒክ ኤፒአይ ቁልፍ';

  @override
  String get anthropicModel => 'አንትሮፖክ ሞዴል';

  @override
  String get customProtocol => 'ብጁ ፕሮቶኮል';

  @override
  String get protocol => 'ፕሮቶኮል';

  @override
  String get customEndpoint => 'ብጁ የመጨረሻ ነጥብ';

  @override
  String get customApiKey => 'ብጁ የኤፒአይ ቁልፍ';

  @override
  String get customModel => 'ብጁ ሞዴል';

  @override
  String get optionalForLocalServers => 'ለአካባቢያዊ/ብጁ አገልጋዮች አማራጭ';

  @override
  String get speechRecognitionEngine => 'የንግግር ማወቂያ ሞተር';

  @override
  String get local => 'አካባቢያዊ';

  @override
  String get endpoint => 'የመጨረሻ ነጥብ';

  @override
  String get localSpeechModel => 'የአካባቢ የንግግር ሞዴል';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (በመሣሪያ ላይ)';

  @override
  String get systemSpeechRecognition => 'የስርዓት ንግግር እውቅና';

  @override
  String get systemRecognitionAndroidIos => 'የስርዓት እውቅና (አንድሮይድ/አይኦኤስ)';

  @override
  String get endpointRecognitionCloudWs => 'የመጨረሻ ነጥብ ማወቂያ (ክላውድ/ደብሊውኤስ)';

  @override
  String get useBuiltInRecognizer =>
      'አብሮ የተሰራ አንድሮይድ/iOS ማወቂያን ተጠቀም (ዳመናን ሊጠቀም ይችላል)';

  @override
  String get voiceAiEndpoint => 'የድምጽ AI የመጨረሻ ነጥብ';

  @override
  String get embeddingModel => 'መክተቻ ሞዴል';

  @override
  String get crossDeviceSync => 'መሳሪያ ተሻጋሪ ማመሳሰል';

  @override
  String get sendToOtherDevices => 'ወደ ሌሎች መሳሪያዎች ላክ (አካባቢያዊ ላክ)';

  @override
  String get exportBackupAndSend => 'ምትኬን ወደ ውጭ ይላኩ እና በአጋራ ሉህ ይላኩ።';

  @override
  String get importFromLocalSend => 'ከLocalSend አስመጣ';

  @override
  String get selectBackupJson => 'JSON ምትኬን ይምረጡ እና የአካባቢ ውሂብን ያዋህዱ';

  @override
  String get autoGeneration => 'አውቶማቲክ ማመንጨት';

  @override
  String get autoGenerateSummary => 'ራስ-ሰር ማጠቃለያ';

  @override
  String get generateAiSummaryForNewEntries => 'ለአዲስ ግቤቶች የ AI ማጠቃለያ ይፍጠሩ';

  @override
  String get autoGenerateEmbedding => 'መክተትን በራስ-ሰር ይፍጠሩ';

  @override
  String get generateVectorEmbedding => 'ለፍለጋ የቬክተር መክተትን ይፍጠሩ';

  @override
  String get enableNetworkSearch => 'የአውታረ መረብ ፍለጋን አንቃ';

  @override
  String get allowOnlineRetrieval =>
      'ለፍለጋ እና AI ውይይት በመስመር ላይ ሰርስሮ ለማውጣት ፍቀድ (በነባሪ ጠፍቷል)';

  @override
  String get about => 'ስለ';

  @override
  String version(String version) {
    return 'ስሪት $version';
  }

  @override
  String get database => 'የውሂብ ጎታ';

  @override
  String get objectBoxWithHnsw => 'ObjectBox ከHNSW መረጃ ጠቋሚ ጋር';

  @override
  String get logOut => 'ውጣ';

  @override
  String get custom => 'ብጁ';

  @override
  String get openAiCompatible => 'ክፍት AI ተኳሃኝ';

  @override
  String get notSet => 'አልተዘጋጀም።';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'የአካባቢ/ላን/የሕዝብ የመጨረሻ ነጥቦችን ይደግፋል';

  @override
  String get shiguangLocalSendBackup => 'Shiguang የአካባቢ ላክ ምትኬ';

  @override
  String get localBackupFromShiguang =>
      'ከShiguang የአካባቢ ምትኬ (በ LocalSend በኩል መቀበል)';

  @override
  String get selectBackupFileFromLocalSend =>
      'ከLocalSend የተቀበለውን የመጠባበቂያ ፋይል ይምረጡ';

  @override
  String get failedToResolveFilePath => 'የተመረጠውን የፋይል መንገድ መፍታት አልተሳካም።';

  @override
  String get importOptions => 'የማስመጣት አማራጮች';

  @override
  String get importSettingsAsWell => 'ቅንጅቶችም ያስመጡ?\n(ኤፒአይ ቁልፎች አይገለበጡም)';

  @override
  String get dataOnly => 'ውሂብ ብቻ';

  @override
  String get dataAndSettings => 'ውሂብ + ቅንብሮች';

  @override
  String get importCompleted => 'ማስመጣት ተጠናቅቋል';

  @override
  String get settingsInBackupWereApplied => 'በመጠባበቂያ ውስጥ ያሉ ቅንብሮች ተተግብረዋል።';

  @override
  String get settingsInBackupWereNotApplied => 'በመጠባበቂያ ውስጥ ያሉ ቅንብሮች አልተተገበሩም።';

  @override
  String get ok => 'እሺ';

  @override
  String get cancel => 'ሰርዝ';

  @override
  String get save => 'አስቀምጥ';

  @override
  String get delete => 'ሰርዝ';

  @override
  String get clear => 'ግልጽ';

  @override
  String get add => 'አክል';

  @override
  String get create => 'ፍጠር';

  @override
  String get edit => 'አርትዕ';

  @override
  String get search => 'ፈልግ';

  @override
  String get areYouSureYouWantToLogOut => 'እርግጠኛ ነህ ዘግተህ መውጣት ትፈልጋለህ?';

  @override
  String get chooseLanguage => 'ቋንቋ ይምረጡ';

  @override
  String get databaseInfo => 'የውሂብ ጎታ መረጃ';

  @override
  String get storage => 'ማከማቻ፡ ObjectBox';

  @override
  String get vectorIndex => 'የቬክተር መረጃ ጠቋሚ፡ HNSW';

  @override
  String get dimensions => 'መጠን፡ 384';

  @override
  String get embeddingModelBge => 'የመክተት ሞዴል፡ bge-small-zh-v1.5';

  @override
  String get takePhoto => 'ፎቶ አንሳ';

  @override
  String get chooseFromGallery => 'ከጋለሪ ይምረጡ';

  @override
  String get editNickname => 'ቅጽል ስም ያርትዑ';

  @override
  String get enterNickname => 'ቅጽል ስም አስገባ';

  @override
  String get pleaseEnterNickname => 'እባክዎ ቅጽል ስም ያስገቡ';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'ቅጽል ስም አስቀድሞ አለ ወይም ልክ ያልሆነ ነው።';

  @override
  String get user => 'ተጠቃሚ';

  @override
  String get manageScheduledReminders => 'የታቀዱ አስታዋሾችን እና ማንቂያዎችን ያስተዳድሩ';

  @override
  String get imageFailedToLoad => 'ምስል መጫን አልቻለም። እባክዎ እንደገና ይምረጡ።';

  @override
  String get imageIsStillLoading => 'ምስል አሁንም እየተጫነ ነው።';

  @override
  String get imageAreaNotReady => 'የምስል ቦታ ዝግጁ አይደለም። እባክህ እንደገና ሞክር።';

  @override
  String get cropFrameNotReady => 'ፍሬም ከርክም ዝግጁ አይደለም። እባክህ እንደገና ሞክር።';

  @override
  String get invalidCropArea => 'ልክ ያልሆነ የሰብል አካባቢ። እባክህ እንደገና ሞክር።';

  @override
  String get cropFailed => 'መከሩ አልተሳካም። እባክህ እንደገና ሞክር።';

  @override
  String get cropAvatar => 'አምሳያ ይከርክሙ';

  @override
  String get chooseAgain => 'እንደገና ይምረጡ';

  @override
  String get rotate90 => '90° አሽከርክር';

  @override
  String get dragFrameToMove =>
      'ለማንቀሳቀስ ክፈፉን ይጎትቱት፣ መጠኑን ለመቀየር ከታች ወደ ቀኝ ይጎትቱ። ምስልን ለማጉላት እና ለማንቀሳቀስ መቆንጠጥ።';

  @override
  String get pleaseFillInAllFields => 'እባክዎ ሁሉንም መስኮች ይሙሉ';

  @override
  String get pinMustBeAtLeast4Digits => 'ፒን ቢያንስ 4 አሃዞች መሆን አለበት።';

  @override
  String get pinAtLeast4Digits => 'ፒን ቢያንስ 4 አሃዞች መሆን አለበት።';

  @override
  String get invalidUsernameOrPin => 'የተሳሳተ የተጠቃሚ ስም ወይም ፒን';

  @override
  String get invalidUsernameOrPinError => 'የተሳሳተ የተጠቃሚ ስም ወይም ፒን';

  @override
  String get usernameAlreadyExists => 'የተጠቃሚ ስም አስቀድሞ አለ።';

  @override
  String get captureMomentsKeepMemories => 'አፍታዎችን ያንሱ፣ ትውስታዎችን ያስቀምጡ';

  @override
  String get username => 'የተጠቃሚ ስም';

  @override
  String get pin => 'ፒን';

  @override
  String get login => 'ግባ';

  @override
  String get createAccount => 'መለያ ፍጠር';

  @override
  String get dontHaveAccountCreateOne => 'መለያ የለህም? አንድ ፍጠር';

  @override
  String get alreadyHaveAccountLogin => 'መለያ አለህ? ግባ';

  @override
  String get pleaseEnterUsername => 'እባክዎ የተጠቃሚ ስም ያስገቡ';

  @override
  String get pinsDoNotMatch => 'ፒኖች አይዛመዱም።';

  @override
  String get tapToAddAvatar => 'አምሳያ ለመጨመር መታ ያድርጉ';

  @override
  String get yourName => 'የእርስዎ ስም';

  @override
  String get privatePinOptional => 'የግል ፒን (አማራጭ)';

  @override
  String get usedToEncryptPrivateRecords => 'የግል መዝገቦችን ለማመስጠር ይጠቅማል';

  @override
  String get privatePin => 'የግል ፒን';

  @override
  String get leaveEmptyForNoEncryption => 'ምንም ምስጠራ እንዳይኖር ባዶ ይተውት።';

  @override
  String get confirmPin => 'ፒን ያረጋግጡ';

  @override
  String get getStarted => 'እንጀምር';

  @override
  String get noReminders => 'ምንም አስታዋሾች የሉም';

  @override
  String get addReminder => 'አስታዋሽ ጨምር';

  @override
  String get title => 'ርዕስ';

  @override
  String get descriptionOptional => 'መግለጫ (አማራጭ)';

  @override
  String get microphonePermissionRequired => 'የማይክሮፎን ፍቃድ ያስፈልጋል';

  @override
  String get aiAssistant => 'AI ረዳት';

  @override
  String get listening => 'በማዳመጥ ላይ...';

  @override
  String get typeAMessage => 'መልዕክት ይተይቡ...';

  @override
  String get aiChat => 'AI ውይይት';

  @override
  String get startAConversation => 'ውይይት ጀምር';

  @override
  String get typeYourMessage => 'መልእክትህን ተይብ...';

  @override
  String get asrReconnecting => 'ASR እንደገና በማገናኘት ላይ...';

  @override
  String get write => 'ጻፍ';

  @override
  String get writeEntry => 'ግቤት ፃፍ';

  @override
  String get noMemoriesYet => 'እስካሁን ምንም ትውስታዎች የሉም';

  @override
  String get tapPlusToCapture => 'ሃሳቦችዎን ለመያዝ + ነካ ያድርጉ';

  @override
  String get tapPlusToCaptureYourThoughts => 'ሃሳቦችዎን ለመያዝ + ነካ ያድርጉ';

  @override
  String get deleteMemory => 'ማህደረ ትውስታን ሰርዝ';

  @override
  String get deleteRecord => 'መዝገብ ሰርዝ';

  @override
  String get thisEntryWillBeRemoved => 'ይህ ግቤት ከጊዜ መስመርዎ ይወገዳል።';

  @override
  String get thisRecordWillBeRemoved => 'ይህ መዝገብ በጊዜ መስመርዎ ላይ ይወገዳል።';

  @override
  String get searchYourRecords => 'መዝገቦችህን ፈልግ...';

  @override
  String get exactMatches => 'ትክክለኛ ግጥሚያዎች';

  @override
  String get noExactMatches => 'ምንም ትክክለኛ ተዛማጅ የለም።';

  @override
  String get exact => 'በትክክል';

  @override
  String get exactMatch => 'ትክክለኛ ግጥሚያ';

  @override
  String get fuzzyMatches => 'ደብዛዛ ግጥሚያዎች';

  @override
  String get noFuzzyMatches => 'ምንም ደብዛዛ ግጥሚያዎች የሉም';

  @override
  String get vectorMatch => 'የቬክተር ተዛማጅ';

  @override
  String get networkMatches => 'የአውታረ መረብ ግጥሚያዎች';

  @override
  String get noNetworkMatches => 'ምንም የአውታረ መረብ ግጥሚያ የለም።';

  @override
  String get networkSearchIsOff => 'የአውታረ መረብ ፍለጋ ጠፍቷል። በቅንብሮች ውስጥ አንቃው።';

  @override
  String get network => 'አውታረ መረብ';

  @override
  String get networkMatch => 'የአውታረ መረብ ተዛማጅ';

  @override
  String get noSearchHistory => 'የፍለጋ ታሪክ የለም።';

  @override
  String get searchHistory => 'የፍለጋ ታሪክ';

  @override
  String get invalidLink => 'ልክ ያልሆነ አገናኝ';

  @override
  String get unableToOpenWebPage => 'ድረ-ገጽ መክፈት አልተቻለም';

  @override
  String get imageMemory => '[የምስል ማህደረ ትውስታ]';

  @override
  String get tapToOpenWebPage => 'ድረ-ገጽ ለመክፈት መታ ያድርጉ';

  @override
  String get editEntry => 'ግቤትን ያርትዑ';

  @override
  String get entryDetails => 'የመግቢያ ዝርዝሮች';

  @override
  String get noContent => 'ምንም ይዘት የለም።';

  @override
  String get diaryNotFound => 'ማስታወሻ ደብተር አልተገኘም።';

  @override
  String get diaryNotFoundShort => 'መዝገብ አልተገኘም።';

  @override
  String get aiSummary => 'AI ማጠቃለያ';

  @override
  String get microphoneInterrupted => 'ማይክሮፎን ተቋርጧል፣ ቀረጻ ቆሟል።';

  @override
  String get bold => 'ደፋር';

  @override
  String get italic => 'ኢታሊክ';

  @override
  String get strikethrough => 'አድማ';

  @override
  String get image => 'ምስል';

  @override
  String get asrUnavailableRecordingActive => 'ASR አይገኝም። ቀረጻ አሁንም ንቁ ነው።';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'ግቤትህን ጻፍ...';

  @override
  String get writeYourContent => 'ይዘትህን ጻፍ...';

  @override
  String microphoneStartFailed(String error) {
    return 'ማይክሮፎን መጀመር አልተሳካም፦ _PH_0__';
  }

  @override
  String get microphoneInterruptedRecordingStopped => 'ማይክሮፎን ተቋርጧል፣ ቀረጻ ቆሟል።';

  @override
  String asrReconnectingError(String error) {
    return 'ASR እንደገና በመገናኘት ላይ፡ _PH_0__';
  }

  @override
  String imageInserted(String name) {
    return 'ምስል ገብቷል፡ _PH_0__';
  }

  @override
  String voiceError(String error) {
    return 'የድምጽ ስህተት፡ _PH_0__';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'ይቅርታ፣ የAI አገልግሎት በአሁኑ ጊዜ የለም፡ $error';
  }

  @override
  String shareFailed(String error) {
    return 'ማጋራት አልተሳካም፦ _PH_0__';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '_PH_0__ · _PH_1__ መታ';
  }

  @override
  String matchCount(int count) {
    return 'ተዛማጅ፡ _PH_0__';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'ምንጭ፡ _PH_0__';
  }

  @override
  String get createNew => 'ፍጠር';

  @override
  String micStartFailed(String error) {
    return 'የማይክሮፎን ጅምር አልተሳካም፦ _PH_0__';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'መለያዎች፡ +$created / የዘመነ $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'ማስታወሻ ደብተር፦ +$created / የዘመነ $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'አስታዋሾች፡ +$created / የዘመነ $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'ተዘሏል፡ _PH_0__';
  }

  @override
  String importResultTotal(int count) {
    return 'ጠቅላላ ተቀይሯል፡ _PH_0__';
  }

  @override
  String get settingsApplied => 'በመጠባበቂያ ውስጥ ያሉ ቅንብሮች ተተግብረዋል።';

  @override
  String get settingsNotApplied => 'በመጠባበቂያ ውስጥ ያሉ ቅንብሮች አልተተገበሩም።';

  @override
  String backupExported(String path) {
    return 'ምትኬ ወደ ውጭ ተልኳል፡ _PH_0__';
  }

  @override
  String exportFailed(String error) {
    return 'ወደ ውጭ መላክ አልተሳካም፦ _PH_0__';
  }

  @override
  String importFailed(String error) {
    return 'ማስመጣት አልተሳካም፦ _PH_0__';
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

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Mongolian (`mn`).
class AppLocalizationsMn extends AppLocalizations {
  AppLocalizationsMn([String locale = 'mn']) : super(locale);

  @override
  String get languageName => 'Монгол';

  @override
  String get languageNameEn => 'Mongolian';

  @override
  String get appTitle => 'Шигуан';

  @override
  String get settings => 'Тохиргоо';

  @override
  String get account => 'Данс';

  @override
  String get reminders => 'Сануулга';

  @override
  String get language => 'Хэл';

  @override
  String get appLanguage => 'Програмын хэл';

  @override
  String get appearance => 'Гадаад төрх';

  @override
  String get themeMode => 'Загварын горим';

  @override
  String get dark => 'Харанхуй';

  @override
  String get light => 'Гэрэл';

  @override
  String get system => 'Систем';

  @override
  String get aiService => 'AI үйлчилгээ';

  @override
  String get aiChatProvider => 'AI чат үйлчилгээ үзүүлэгч';

  @override
  String get chatModel => 'Чатын загвар';

  @override
  String get localModel => 'Орон нутгийн загвар';

  @override
  String get localModelDefault => 'Орон нутгийн загвар (Өгөгдмөл)';

  @override
  String get ollamaEndpoint => 'Оллама төгсгөлийн цэг';

  @override
  String get ollamaModel => 'Оллама загвар';

  @override
  String get openAiEndpoint => 'OpenAI төгсгөлийн цэг';

  @override
  String get openAiApiKey => 'OpenAI API түлхүүр';

  @override
  String get openAiModel => 'OpenAI загвар';

  @override
  String get geminiEndpoint => 'Gemini төгсгөлийн цэг';

  @override
  String get geminiApiKey => 'Gemini API түлхүүр';

  @override
  String get geminiModel => 'Gemini загварууд';

  @override
  String get anthropicEndpoint => 'Антропик төгсгөлийн цэг';

  @override
  String get anthropicApiKey => 'Антропик API түлхүүр';

  @override
  String get anthropicModel => 'Антроп загвар';

  @override
  String get customProtocol => 'Захиалгат протокол';

  @override
  String get protocol => 'Протокол';

  @override
  String get customEndpoint => 'Захиалгат төгсгөлийн цэг';

  @override
  String get customApiKey => 'Тусгай API түлхүүр';

  @override
  String get customModel => 'Захиалгат загвар';

  @override
  String get optionalForLocalServers =>
      'Орон нутгийн/захиалгат серверүүдэд нэмэлт';

  @override
  String get speechRecognitionEngine => 'Яриа таних хөдөлгүүр';

  @override
  String get local => 'Орон нутгийн';

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
      'Тохиргоог бас импортлох уу?\n(API түлхүүрүүдийг дарж бичихгүй)';

  @override
  String get dataOnly => 'Зөвхөн өгөгдөл';

  @override
  String get dataAndSettings => 'Өгөгдөл + Тохиргоо';

  @override
  String get importCompleted => 'Импорт хийж дууслаа';

  @override
  String get settingsInBackupWereApplied => 'Нөөцлөлтийн тохиргоог ашигласан.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Нөөцлөлтийн тохиргоог ашиглаагүй.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Цуцлах';

  @override
  String get save => 'Хадгалах';

  @override
  String get delete => 'Устгах';

  @override
  String get clear => 'Тодорхой';

  @override
  String get add => 'Нэмэх';

  @override
  String get create => 'Үүсгэх';

  @override
  String get edit => 'Засварлах';

  @override
  String get search => 'Хайх';

  @override
  String get areYouSureYouWantToLogOut => 'Та гарахдаа итгэлтэй байна уу?';

  @override
  String get chooseLanguage => 'Хэл сонгоно уу';

  @override
  String get databaseInfo => 'Өгөгдлийн сангийн мэдээлэл';

  @override
  String get storage => 'Хадгалах: ObjectBox';

  @override
  String get vectorIndex => 'Вектор индекс: HNSW';

  @override
  String get dimensions => 'Хэмжээ: 384';

  @override
  String get embeddingModelBge => 'Оруулсан загвар: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Зураг авах';

  @override
  String get chooseFromGallery => 'Галерейгаас сонгоно уу';

  @override
  String get editNickname => 'Хоч засах';

  @override
  String get enterNickname => 'Хоч оруулна уу';

  @override
  String get pleaseEnterNickname => 'Хоч оруулна уу';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Хоч аль хэдийн байгаа эсвэл хүчингүй байна';

  @override
  String get user => 'Хэрэглэгч';

  @override
  String get manageScheduledReminders =>
      'Хуваарьт сануулагч болон сэрүүлгийг удирдах';

  @override
  String get imageFailedToLoad => 'Зургийг ачаалж чадсангүй. Дахин сонгоно уу.';

  @override
  String get imageIsStillLoading => 'Зургийг ачаалж байна';

  @override
  String get imageAreaNotReady =>
      'Зургийн хэсэг бэлэн биш байна. Дахин оролдоно уу.';

  @override
  String get cropFrameNotReady =>
      'Тайрах хүрээ бэлэн биш байна. Дахин оролдоно уу.';

  @override
  String get invalidCropArea =>
      'Тариалангийн талбай буруу байна. Дахин оролдоно уу.';

  @override
  String get cropFailed => 'Тасалж чадсангүй. Дахин оролдоно уу.';

  @override
  String get cropAvatar => 'Аватар тайрах';

  @override
  String get chooseAgain => 'Дахин сонгоно уу';

  @override
  String get rotate90 => '90° эргүүлнэ';

  @override
  String get dragFrameToMove =>
      'Зөөх бол хүрээг чирнэ үү, хэмжээг өөрчлөхийн тулд баруун доод талд чирнэ үү; зургийг томруулж, зөөхийн тулд чимхээрэй.';

  @override
  String get pleaseFillInAllFields => 'Бүх талбарыг бөглөнө үү';

  @override
  String get pinMustBeAtLeast4Digits => 'ПИН код дор хаяж 4 оронтой байх ёстой';

  @override
  String get pinAtLeast4Digits => 'ПИН код дор хаяж 4 оронтой байх ёстой';

  @override
  String get invalidUsernameOrPin =>
      'Хэрэглэгчийн нэр эсвэл ПИН код буруу байна';

  @override
  String get invalidUsernameOrPinError =>
      'Хэрэглэгчийн нэр эсвэл ПИН код буруу байна';

  @override
  String get usernameAlreadyExists => 'Хэрэглэгчийн нэр аль хэдийн байна';

  @override
  String get captureMomentsKeepMemories => 'Агшин мөчүүдийг авч, дурсамж үлдээ';

  @override
  String get username => 'Хэрэглэгчийн нэр';

  @override
  String get pin => 'ПИН';

  @override
  String get login => 'Нэвтрэх';

  @override
  String get createAccount => 'Бүртгэл үүсгэх';

  @override
  String get dontHaveAccountCreateOne => 'Бүртгэлгүй юу? Нэгийг үүсгэ';

  @override
  String get alreadyHaveAccountLogin => 'Бүртгэлтэй юу? Нэвтрэх';

  @override
  String get pleaseEnterUsername => 'Хэрэглэгчийн нэр оруулна уу';

  @override
  String get pinsDoNotMatch => 'ПИН код таарахгүй байна';

  @override
  String get tapToAddAvatar => 'Аватар нэмэхийн тулд товшино уу';

  @override
  String get yourName => 'Таны нэр';

  @override
  String get privatePinOptional => 'Хувийн ПИН (заавал биш)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Хувийн бичлэгийг шифрлэхэд ашигладаг';

  @override
  String get privatePin => 'Хувийн ПИН';

  @override
  String get leaveEmptyForNoEncryption =>
      'Шифрлэлт хийхгүйн тулд хоосон орхино уу';

  @override
  String get confirmPin => 'ПИН кодоо баталгаажуулна уу';

  @override
  String get getStarted => 'Эхлэх';

  @override
  String get noReminders => 'Сануулагч байхгүй';

  @override
  String get addReminder => 'Сануулагч нэмэх';

  @override
  String get title => 'Гарчиг';

  @override
  String get descriptionOptional => 'Тодорхойлолт (заавал биш)';

  @override
  String get microphonePermissionRequired => 'Микрофоны зөвшөөрөл шаардлагатай';

  @override
  String get aiAssistant => 'AI туслах';

  @override
  String get listening => 'Сонсож байна...';

  @override
  String get typeAMessage => 'Зурвас бичнэ үү...';

  @override
  String get aiChat => 'AI чат';

  @override
  String get startAConversation => 'Ярилцлага эхлүүлэх';

  @override
  String get typeYourMessage => 'Зурвасаа бичнэ үү...';

  @override
  String get asrReconnecting => 'ASR дахин холбогдож байна...';

  @override
  String get write => 'бичих';

  @override
  String get writeEntry => 'Оруулга бичих';

  @override
  String get noMemoriesYet => 'Одоохондоо дурсамж байхгүй';

  @override
  String get tapPlusToCapture => 'Санал бодлоо бичихийн тулд + товшино уу';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Санал бодлоо бичихийн тулд + товшино уу';

  @override
  String get deleteMemory => 'Санах ойг устгах';

  @override
  String get deleteRecord => 'Бичлэг устгах';

  @override
  String get thisEntryWillBeRemoved =>
      'Энэ оруулгыг таны он цагийн хэлхээсээс хасах болно.';

  @override
  String get thisRecordWillBeRemoved =>
      'Энэ бичлэгийг таны он цагийн хэлхээсээс хасах болно.';

  @override
  String get searchYourRecords => 'Бичлэгээ хайх...';

  @override
  String get exactMatches => 'Яг тохирч байна';

  @override
  String get noExactMatches => 'Яг тохирох зүйл байхгүй';

  @override
  String get exact => 'Яг';

  @override
  String get exactMatch => 'Яг таарч байна';

  @override
  String get fuzzyMatches => 'Fuzzy matches';

  @override
  String get noFuzzyMatches => 'Тодорхойгүй тохирол байхгүй';

  @override
  String get vectorMatch => 'Вектор тохирох';

  @override
  String get networkMatches => 'Сүлжээний тохирол';

  @override
  String get noNetworkMatches => 'Сүлжээ таарахгүй байна';

  @override
  String get networkSearchIsOff =>
      'Сүлжээний хайлт идэвхгүй байна. Үүнийг Тохиргоо дотроос идэвхжүүлнэ үү.';

  @override
  String get network => 'Сүлжээ';

  @override
  String get networkMatch => 'Сүлжээний тохирол';

  @override
  String get noSearchHistory => 'Хайлтын түүх байхгүй';

  @override
  String get searchHistory => 'Хайлтын түүх';

  @override
  String get invalidLink => 'Буруу холбоос';

  @override
  String get unableToOpenWebPage => 'Вэб хуудсыг нээх боломжгүй байна';

  @override
  String get imageMemory => '[Зургийн санах ой]';

  @override
  String get tapToOpenWebPage => 'Вэб хуудсыг нээхийн тулд товшино уу';

  @override
  String get editEntry => 'Бичлэгийг засах';

  @override
  String get entryDetails => 'Нэвтрэх дэлгэрэнгүй мэдээлэл';

  @override
  String get noContent => 'No content';

  @override
  String get diaryNotFound => 'Diary not found';

  @override
  String get diaryNotFoundShort => 'Record not found';

  @override
  String get aiSummary => 'AI Summary';

  @override
  String get microphoneInterrupted =>
      'Microphone interrupted, recording stopped.';

  @override
  String get bold => 'Bold';

  @override
  String get italic => 'Italic';

  @override
  String get strikethrough => 'Strikethrough';

  @override
  String get image => 'Image';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR unavailable. Recording is still active.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Write your entry...';

  @override
  String get writeYourContent => 'Write your content...';

  @override
  String microphoneStartFailed(String error) {
    return 'Failed to start microphone: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Microphone interrupted, recording stopped.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR reconnecting: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Image inserted: $name';
  }

  @override
  String voiceError(String error) {
    return 'Voice error: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Sorry, AI service is currently unavailable: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Failed to share: $error';
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
    return '$matchType · $count hits';
  }

  @override
  String matchCount(int count) {
    return 'Match: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Source: $source';
  }

  @override
  String get createNew => 'Create';

  @override
  String micStartFailed(String error) {
    return 'Mic start failed: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Accounts: +$created / updated $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Diaries: +$created / updated $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Reminders: +$created / updated $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Skipped: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Total changed: $count';
  }

  @override
  String get settingsApplied => 'Settings in backup were applied.';

  @override
  String get settingsNotApplied => 'Settings in backup were not applied.';

  @override
  String backupExported(String path) {
    return 'Backup exported: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Export failed: $error';
  }

  @override
  String importFailed(String error) {
    return 'Import failed: $error';
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

/// The translations for Mongolian, using the Mongolian script (`mn_Mong`).
class AppLocalizationsMnMong extends AppLocalizationsMn {
  AppLocalizationsMnMong() : super('mn_Mong');

  @override
  String get languageName => 'ᠮᠣᠩᠭᠣᠯ';

  @override
  String get languageNameEn => 'Mongolian (Traditional script)';

  @override
  String get appTitle => 'Шигуан';

  @override
  String get settings => 'Тохиргоо';

  @override
  String get account => 'Данс';

  @override
  String get reminders => 'Сануулга';

  @override
  String get language => 'Хэл';

  @override
  String get appLanguage => 'Програмын хэл';

  @override
  String get appearance => 'Гадаад төрх';

  @override
  String get themeMode => 'Загварын горим';

  @override
  String get dark => 'Харанхуй';

  @override
  String get light => 'Гэрэл';

  @override
  String get system => 'Систем';

  @override
  String get aiService => 'AI үйлчилгээ';

  @override
  String get aiChatProvider => 'AI чат үйлчилгээ үзүүлэгч';

  @override
  String get chatModel => 'Чатын загвар';

  @override
  String get localModel => 'Орон нутгийн загвар';

  @override
  String get localModelDefault => 'Орон нутгийн загвар (Өгөгдмөл)';

  @override
  String get ollamaEndpoint => 'Оллама төгсгөлийн цэг';

  @override
  String get ollamaModel => 'Оллама загвар';

  @override
  String get openAiEndpoint => 'OpenAI төгсгөлийн цэг';

  @override
  String get openAiApiKey => 'OpenAI API түлхүүр';

  @override
  String get openAiModel => 'OpenAI загвар';

  @override
  String get geminiEndpoint => 'Gemini төгсгөлийн цэг';

  @override
  String get geminiApiKey => 'Gemini API түлхүүр';

  @override
  String get geminiModel => 'Gemini загварууд';

  @override
  String get anthropicEndpoint => 'Антропик төгсгөлийн цэг';

  @override
  String get anthropicApiKey => 'Антропик API түлхүүр';

  @override
  String get anthropicModel => 'Антроп загвар';

  @override
  String get customProtocol => 'Захиалгат протокол';

  @override
  String get protocol => 'Протокол';

  @override
  String get customEndpoint => 'Захиалгат төгсгөлийн цэг';

  @override
  String get customApiKey => 'Тусгай API түлхүүр';

  @override
  String get customModel => 'Захиалгат загвар';

  @override
  String get optionalForLocalServers =>
      'Орон нутгийн/захиалгат серверүүдэд нэмэлт';

  @override
  String get speechRecognitionEngine => 'Яриа таних хөдөлгүүр';

  @override
  String get local => 'Орон нутгийн';

  @override
  String get endpoint => 'Төгсгөлийн цэг';

  @override
  String get localSpeechModel => 'Орон нутгийн ярианы загвар';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (төхөөрөмж дээр)';

  @override
  String get systemSpeechRecognition => 'Системийн яриа таних';

  @override
  String get systemRecognitionAndroidIos => 'Системийг таних (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Төгсгөлийн цэгийг таних (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Суурилагдсан Android / iOS танигч ашиглах (үүл ашиглаж болно)';

  @override
  String get voiceAiEndpoint => 'Дуут хиймэл оюун ухааны төгсгөлийн цэг';

  @override
  String get embeddingModel => 'Оруулсан загвар';

  @override
  String get crossDeviceSync => 'Төхөөрөмж хоорондын синк';

  @override
  String get sendToOtherDevices => 'Бусад төхөөрөмж рүү илгээх (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Нөөцлөлтийг экспорт хийж, хуваалцах хуудсыг ашиглан илгээнэ үү';

  @override
  String get importFromLocalSend => 'LocalSend-ээс импортлох';

  @override
  String get selectBackupJson =>
      'Нөөц JSON-г сонгоод дотоод өгөгдлийг нэгтгэнэ үү';

  @override
  String get autoGeneration => 'Автомат үүсгэх';

  @override
  String get autoGenerateSummary => 'Хураангуйг автоматаар үүсгэх';

  @override
  String get generateAiSummaryForNewEntries =>
      'Шинэ оруулгуудад зориулж AI-ийн хураангуйг үүсгэх';

  @override
  String get autoGenerateEmbedding => 'Оруулсан суулгацыг автоматаар үүсгэх';

  @override
  String get generateVectorEmbedding => 'Хайлтын хувьд вектор оруулга үүсгэх';

  @override
  String get enableNetworkSearch => 'Сүлжээний хайлтыг идэвхжүүл';

  @override
  String get allowOnlineRetrieval =>
      'Хайлт болон AI чатын онлайн хайлтыг зөвшөөрөх (өгөгдмөлөөр унтраалттай)';

  @override
  String get about => 'тухай';

  @override
  String version(String version) {
    return 'Хувилбар $version';
  }

  @override
  String get database => 'Өгөгдлийн сан';

  @override
  String get objectBoxWithHnsw => 'HNSW индекстэй ObjectBox';

  @override
  String get logOut => 'Гарах';

  @override
  String get custom => 'Захиалгат';

  @override
  String get openAiCompatible => 'OpenAI нийцтэй';

  @override
  String get notSet => 'Тохируулаагүй';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Орон нутгийн/LAN/нийтийн төгсгөлийн цэгүүдийг дэмждэг';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend нөөцлөлт';

  @override
  String get localBackupFromShiguang =>
      'Шигуангаас локал нөөцлөлт (LocalSend-ээр хүлээн авах)';

  @override
  String get selectBackupFileFromLocalSend =>
      'LocalSend-ээс хүлээн авсан нөөц файлыг сонгоно уу';

  @override
  String get failedToResolveFilePath =>
      'Сонгосон файлын замыг шийдэж чадсангүй';

  @override
  String get importOptions => 'Импортын сонголтууд';

  @override
  String get importSettingsAsWell =>
      'Тохиргоог бас импортлох уу?\n(API түлхүүрүүдийг дарж бичихгүй)';

  @override
  String get dataOnly => 'Зөвхөн өгөгдөл';

  @override
  String get dataAndSettings => 'Өгөгдөл + Тохиргоо';

  @override
  String get importCompleted => 'Импорт хийж дууслаа';

  @override
  String get settingsInBackupWereApplied => 'Нөөцлөлтийн тохиргоог ашигласан.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Нөөцлөлтийн тохиргоог ашиглаагүй.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Цуцлах';

  @override
  String get save => 'Хадгалах';

  @override
  String get delete => 'Устгах';

  @override
  String get clear => 'Тодорхой';

  @override
  String get add => 'Нэмэх';

  @override
  String get create => 'Үүсгэх';

  @override
  String get edit => 'Засварлах';

  @override
  String get search => 'Хайх';

  @override
  String get areYouSureYouWantToLogOut => 'Та гарахдаа итгэлтэй байна уу?';

  @override
  String get chooseLanguage => 'Хэл сонгоно уу';

  @override
  String get databaseInfo => 'Өгөгдлийн сангийн мэдээлэл';

  @override
  String get storage => 'Хадгалах: ObjectBox';

  @override
  String get vectorIndex => 'Вектор индекс: HNSW';

  @override
  String get dimensions => 'Хэмжээ: 384';

  @override
  String get embeddingModelBge => 'Оруулсан загвар: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Зураг авах';

  @override
  String get chooseFromGallery => 'Галерейгаас сонгоно уу';

  @override
  String get editNickname => 'Хоч засах';

  @override
  String get enterNickname => 'Хоч оруулна уу';

  @override
  String get pleaseEnterNickname => 'Хоч оруулна уу';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Хоч аль хэдийн байгаа эсвэл хүчингүй байна';

  @override
  String get user => 'Хэрэглэгч';

  @override
  String get manageScheduledReminders =>
      'Хуваарьт сануулагч болон сэрүүлгийг удирдах';

  @override
  String get imageFailedToLoad => 'Зургийг ачаалж чадсангүй. Дахин сонгоно уу.';

  @override
  String get imageIsStillLoading => 'Зургийг ачаалж байна';

  @override
  String get imageAreaNotReady =>
      'Зургийн хэсэг бэлэн биш байна. Дахин оролдоно уу.';

  @override
  String get cropFrameNotReady =>
      'Тайрах хүрээ бэлэн биш байна. Дахин оролдоно уу.';

  @override
  String get invalidCropArea =>
      'Тариалангийн талбай буруу байна. Дахин оролдоно уу.';

  @override
  String get cropFailed => 'Тасалж чадсангүй. Дахин оролдоно уу.';

  @override
  String get cropAvatar => 'Аватар тайрах';

  @override
  String get chooseAgain => 'Дахин сонгоно уу';

  @override
  String get rotate90 => '90° эргүүлнэ';

  @override
  String get dragFrameToMove =>
      'Зөөх бол хүрээг чирнэ үү, хэмжээг өөрчлөхийн тулд баруун доод талд чирнэ үү; зургийг томруулж, зөөхийн тулд чимхээрэй.';

  @override
  String get pleaseFillInAllFields => 'Бүх талбарыг бөглөнө үү';

  @override
  String get pinMustBeAtLeast4Digits => 'ПИН код дор хаяж 4 оронтой байх ёстой';

  @override
  String get pinAtLeast4Digits => 'ПИН код дор хаяж 4 оронтой байх ёстой';

  @override
  String get invalidUsernameOrPin =>
      'Хэрэглэгчийн нэр эсвэл ПИН код буруу байна';

  @override
  String get invalidUsernameOrPinError =>
      'Хэрэглэгчийн нэр эсвэл ПИН код буруу байна';

  @override
  String get usernameAlreadyExists => 'Хэрэглэгчийн нэр аль хэдийн байна';

  @override
  String get captureMomentsKeepMemories => 'Агшин мөчүүдийг авч, дурсамж үлдээ';

  @override
  String get username => 'Хэрэглэгчийн нэр';

  @override
  String get pin => 'ПИН';

  @override
  String get login => 'Нэвтрэх';

  @override
  String get createAccount => 'Бүртгэл үүсгэх';

  @override
  String get dontHaveAccountCreateOne => 'Бүртгэлгүй юу? Нэгийг үүсгэ';

  @override
  String get alreadyHaveAccountLogin => 'Бүртгэлтэй юу? Нэвтрэх';

  @override
  String get pleaseEnterUsername => 'Хэрэглэгчийн нэр оруулна уу';

  @override
  String get pinsDoNotMatch => 'ПИН код таарахгүй байна';

  @override
  String get tapToAddAvatar => 'Аватар нэмэхийн тулд товшино уу';

  @override
  String get yourName => 'Таны нэр';

  @override
  String get privatePinOptional => 'Хувийн ПИН (заавал биш)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Хувийн бичлэгийг шифрлэхэд ашигладаг';

  @override
  String get privatePin => 'Хувийн ПИН';

  @override
  String get leaveEmptyForNoEncryption =>
      'Шифрлэлт хийхгүйн тулд хоосон орхино уу';

  @override
  String get confirmPin => 'ПИН кодоо баталгаажуулна уу';

  @override
  String get getStarted => 'Эхлэх';

  @override
  String get noReminders => 'Сануулагч байхгүй';

  @override
  String get addReminder => 'Сануулагч нэмэх';

  @override
  String get title => 'Гарчиг';

  @override
  String get descriptionOptional => 'Тодорхойлолт (заавал биш)';

  @override
  String get microphonePermissionRequired => 'Микрофоны зөвшөөрөл шаардлагатай';

  @override
  String get aiAssistant => 'AI туслах';

  @override
  String get listening => 'Сонсож байна...';

  @override
  String get typeAMessage => 'Зурвас бичнэ үү...';

  @override
  String get aiChat => 'AI чат';

  @override
  String get startAConversation => 'Ярилцлага эхлүүлэх';

  @override
  String get typeYourMessage => 'Зурвасаа бичнэ үү...';

  @override
  String get asrReconnecting => 'ASR дахин холбогдож байна...';

  @override
  String get write => 'бичих';

  @override
  String get writeEntry => 'Оруулга бичих';

  @override
  String get noMemoriesYet => 'Одоохондоо дурсамж байхгүй';

  @override
  String get tapPlusToCapture =>
      'Бодол санаагаа бичихийн тулд + дээр товшино уу';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Бодол санаагаа бичихийн тулд + дээр товшино уу';

  @override
  String get deleteMemory => 'Санах ойг устгах';

  @override
  String get deleteRecord => 'Бичлэг устгах';

  @override
  String get thisEntryWillBeRemoved =>
      'Энэ оруулгыг таны он цагийн хэлхээсээс хасах болно.';

  @override
  String get thisRecordWillBeRemoved =>
      'Энэ бичлэгийг таны он цагийн хэлхээсээс хасах болно.';

  @override
  String get searchYourRecords => 'Бичлэгээ хайх...';

  @override
  String get exactMatches => 'Яг тохирч байна';

  @override
  String get noExactMatches => 'Яг тохирох зүйл байхгүй';

  @override
  String get exact => 'Яг';

  @override
  String get exactMatch => 'Яг таарч байна';

  @override
  String get fuzzyMatches => 'Fuzzy matches';

  @override
  String get noFuzzyMatches => 'Тодорхойгүй тохирол байхгүй';

  @override
  String get vectorMatch => 'Вектор тохирох';

  @override
  String get networkMatches => 'Сүлжээний тохирол';

  @override
  String get noNetworkMatches => 'Сүлжээ таарахгүй байна';

  @override
  String get networkSearchIsOff =>
      'Сүлжээний хайлт идэвхгүй байна. Үүнийг Тохиргоо дотроос идэвхжүүлнэ үү.';

  @override
  String get network => 'Сүлжээ';

  @override
  String get networkMatch => 'Сүлжээний тохирол';

  @override
  String get noSearchHistory => 'Хайлтын түүх байхгүй';

  @override
  String get searchHistory => 'Хайлтын түүх';

  @override
  String get invalidLink => 'Буруу холбоос';

  @override
  String get unableToOpenWebPage => 'Вэб хуудсыг нээх боломжгүй байна';

  @override
  String get imageMemory => '[Зургийн санах ой]';

  @override
  String get tapToOpenWebPage => 'Вэб хуудсыг нээхийн тулд товшино уу';

  @override
  String get editEntry => 'Бичлэгийг засах';

  @override
  String get entryDetails => 'Нэвтрэх дэлгэрэнгүй мэдээлэл';

  @override
  String get noContent => 'Агуулга байхгүй';

  @override
  String get diaryNotFound => 'Өдрийн тэмдэглэл олдсонгүй';

  @override
  String get diaryNotFoundShort => 'Бичлэг олдсонгүй';

  @override
  String get aiSummary => 'AI хураангуй';

  @override
  String get microphoneInterrupted => 'Микрофон тасарсан, бичлэг зогссон.';

  @override
  String get bold => 'Зоригтой';

  @override
  String get italic => 'Налуу';

  @override
  String get strikethrough => 'Зураас';

  @override
  String get image => 'Зураг';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR боломжгүй. Бичлэг идэвхтэй хэвээр байна.';

  @override
  String get writeYourEntry => 'Бичлэгээ бичээрэй...';

  @override
  String get writeYourContent => 'Агуулгаа бичээрэй...';

  @override
  String microphoneStartFailed(String error) {
    return 'Микрофоныг эхлүүлж чадсангүй: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Микрофон тасарсан, бичлэг зогссон.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR дахин холбогдож байна: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Зураг оруулсан: $name';
  }

  @override
  String voiceError(String error) {
    return 'Дууны алдаа: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Уучлаарай, AI үйлчилгээ одоогоор боломжгүй байна: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Хуваалцаж чадсангүй: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count хит';
  }

  @override
  String matchCount(int count) {
    return 'Тохирох: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Эх сурвалж: $source';
  }

  @override
  String get createNew => 'Үүсгэх';

  @override
  String micStartFailed(String error) {
    return 'Микрофоныг эхлүүлж чадсангүй: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Бүртгэлүүд: +$created / шинэчлэгдсэн $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Өдрийн тэмдэглэл: +$created / шинэчлэгдсэн $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Сануулагч: +$created / шинэчлэгдсэн $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Алгассан: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Нийт өөрчлөгдсөн: $count';
  }

  @override
  String get settingsApplied => 'Нөөцлөлтийн тохиргоог ашигласан.';

  @override
  String get settingsNotApplied => 'Нөөцлөлтийн тохиргоог ашиглаагүй.';

  @override
  String backupExported(String path) {
    return 'Нөөцлөлтийг экспорт хийсэн: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Экспорт хийж чадсангүй: $error';
  }

  @override
  String importFailed(String error) {
    return 'Импорт хийж чадсангүй: $error';
  }
}

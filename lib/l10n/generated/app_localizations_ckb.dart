// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Central Kurdish (`ckb`).
class AppLocalizationsCkb extends AppLocalizations {
  AppLocalizationsCkb([String locale = 'ckb']) : super(locale);

  @override
  String get languageName => 'کوردی سۆرانی';

  @override
  String get languageNameEn => 'Kurdish (Sorani)';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Settings';

  @override
  String get account => 'Konto';

  @override
  String get reminders => 'Reminders';

  @override
  String get language => 'Ziman';

  @override
  String get appLanguage => 'Ziman App';

  @override
  String get appearance => 'Xuyabûnî';

  @override
  String get themeMode => 'Moda Mijarê';

  @override
  String get dark => 'Tarî';

  @override
  String get light => 'Sivik';

  @override
  String get system => 'Sîstem';

  @override
  String get aiService => 'AI Service';

  @override
  String get aiChatProvider => 'AI Chat Provider';

  @override
  String get chatModel => 'Modela Chat';

  @override
  String get localModel => 'Modela Herêmî';

  @override
  String get localModelDefault => 'Modela Herêmî (Destpêk)';

  @override
  String get ollamaEndpoint => 'Ollama Endpoint';

  @override
  String get ollamaModel => 'Modela Olama';

  @override
  String get openAiEndpoint => 'OpenAI Endpoint';

  @override
  String get openAiApiKey => 'Mifteya API-ya OpenAI';

  @override
  String get openAiModel => 'Modela OpenAI';

  @override
  String get geminiEndpoint => 'Gemini Endpoint';

  @override
  String get geminiApiKey => 'Bişkojka API-ê ya Gemini';

  @override
  String get geminiModel => 'Modelên Gemini';

  @override
  String get anthropicEndpoint => 'Anthropic Endpoint';

  @override
  String get anthropicApiKey => 'Mifteya API-ya Antropîk';

  @override
  String get anthropicModel => 'Modela Antropîk';

  @override
  String get customProtocol => 'Protokola Custom';

  @override
  String get protocol => 'Protokol';

  @override
  String get customEndpoint => 'Endpoint Custom';

  @override
  String get customApiKey => 'Mifteya API-ê ya Xweser';

  @override
  String get customModel => 'Model Custom';

  @override
  String get optionalForLocalServers =>
      'Ji bo pêşkêşkerên herêmî / xwerû vebijarkî';

  @override
  String get speechRecognitionEngine => 'Motora naskirina axaftinê';

  @override
  String get local => 'Herêmî';

  @override
  String get endpoint => 'Endpoint';

  @override
  String get localSpeechModel => 'Modela Axaftina Herêmî';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (li ser cîhazê)';

  @override
  String get systemSpeechRecognition => 'Naskirina Axaftina Pergalê';

  @override
  String get systemRecognitionAndroidIos => 'Naskirina Pergalê (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Naskirina xala dawîn (Ewr/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Nasnameya Android / iOS-ê ya çêkirî bikar bînin (dibe ku ewr bikar bînin)';

  @override
  String get voiceAiEndpoint => 'Deng AI Endpoint';

  @override
  String get embeddingModel => 'Modela Embedding';

  @override
  String get crossDeviceSync => 'Cross-Device Sync';

  @override
  String get sendToOtherDevices => 'Bişîne Amûrên Din (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Piştgiriyê derxînin û bi riya pelê parvekirinê bişînin';

  @override
  String get importFromLocalSend => 'Import ji LocalSend';

  @override
  String get selectBackupJson =>
      'JSON hilanînê hilbijêrin û daneyên herêmî bi hev re bikin';

  @override
  String get autoGeneration => 'Auto Generation';

  @override
  String get autoGenerateSummary => 'Xweseriya Xweseriya Xweseriyê';

  @override
  String get generateAiSummaryForNewEntries =>
      'Ji bo navnîşên nû kurteya AI-ê biafirînin';

  @override
  String get autoGenerateEmbedding => 'Veavakirina Xweserî Hilberîne';

  @override
  String get generateVectorEmbedding =>
      'Ji bo lêgerînê vektora vektorê biafirînin';

  @override
  String get enableNetworkSearch => 'Lêgerîna torê çalak bike';

  @override
  String get allowOnlineRetrieval =>
      'Destûrê bide vegerandina serhêl ji bo lêgerîn û sohbeta AI (ji hêla xwerû veqetandî)';

  @override
  String get about => 'Ji dor';

  @override
  String version(String version) {
    return 'Guhertoya $version';
  }

  @override
  String get database => 'Database';

  @override
  String get objectBoxWithHnsw => 'ObjectBox bi index HNSW';

  @override
  String get logOut => 'Derkeve';

  @override
  String get custom => 'Hûnbunî';

  @override
  String get openAiCompatible => 'OpenAI Compatible';

  @override
  String get notSet => 'Not set';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Xalên dawî yên herêmî / LAN / gelemperî piştgirî dike';

  @override
  String get shiguangLocalSendBackup => 'Backup Shiguang LocalSend';

  @override
  String get localBackupFromShiguang =>
      'Piştgiriya herêmî ji Shiguang (bi navgîniya LocalSend bistînin)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Pelê hilanînê ku ji LocalSend hatî wergirtin hilbijêrin';

  @override
  String get failedToResolveFilePath =>
      'Çareserkirina riya pelê hilbijartî bi ser neket';

  @override
  String get importOptions => 'Vebijêrkên Import';

  @override
  String get importSettingsAsWell =>
      'Mîhengên import jî?\n(Bişkojkên API-ê dê neyên nivîsandin)';

  @override
  String get dataOnly => 'Daneyên Tenê';

  @override
  String get dataAndSettings => 'Daneyên + Mîhengan';

  @override
  String get importCompleted => 'Import Qediya';

  @override
  String get settingsInBackupWereApplied =>
      'Mîhengên di hilanînê de hatin sepandin.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Mîhengên di hilanînê de nehatin sepandin.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Bişûndekirin';

  @override
  String get save => 'Rizgarkirin';

  @override
  String get delete => 'Jêbirin';

  @override
  String get clear => 'Zelal';

  @override
  String get add => 'Lêzêdekirin';

  @override
  String get create => 'Xûliqandin';

  @override
  String get edit => 'Weşandin';

  @override
  String get search => 'Gerr';

  @override
  String get areYouSureYouWantToLogOut => 'Ma tu bi rastî dixwazî ​​derkevî?';

  @override
  String get chooseLanguage => 'Ziman hilbijêrin';

  @override
  String get databaseInfo => 'Database Info';

  @override
  String get storage => 'Storage: ObjectBox';

  @override
  String get vectorIndex => 'Indeksa Vektor: HNSW';

  @override
  String get dimensions => 'Pîvan: 384';

  @override
  String get embeddingModelBge => 'Modela vegirtinê: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Wêne bigirin';

  @override
  String get chooseFromGallery => 'Ji Galeriyê hilbijêrin';

  @override
  String get editNickname => 'Biguherîne Nasnav';

  @override
  String get enterNickname => 'Nasnavê binivîse';

  @override
  String get pleaseEnterNickname => 'Ji kerema xwe navekî binivîsin';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Nasnav jixwe heye an nederbasdar e';

  @override
  String get user => 'Bikaranîvan';

  @override
  String get manageScheduledReminders =>
      'Bîranîn û alarmên plansazkirî birêve bibin';

  @override
  String get imageFailedToLoad =>
      'Wêne nehat barkirin. Ji kerema xwe dîsa hilbijêre.';

  @override
  String get imageIsStillLoading => 'Wêne hîn jî tê barkirin';

  @override
  String get imageAreaNotReady =>
      'Qada wêneyê ne amade ye. Ji kerema xwe dîsa biceribîne.';

  @override
  String get cropFrameNotReady =>
      'Çarçoveya çandiniyê ne amade ye. Ji kerema xwe dîsa biceribîne.';

  @override
  String get invalidCropArea =>
      'Qada çandina nederbasdar. Ji kerema xwe dîsa biceribîne.';

  @override
  String get cropFailed => 'Crop têk çû. Ji kerema xwe dîsa biceribîne.';

  @override
  String get cropAvatar => 'Crop Avatar';

  @override
  String get chooseAgain => 'Dîsa Hilbijêre';

  @override
  String get rotate90 => 'Bizivirîne 90°';

  @override
  String get dragFrameToMove =>
      'Çarçoveyê kaş bikin da ku biguhezînin, ji bo mezinbûnê li jêr-rastê kaş bikin; pêç bikin ku wêneyê mezin bikin û biguhezînin.';

  @override
  String get pleaseFillInAllFields => 'Ji kerema xwe hemû qadan dagirin';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN divê herî kêm 4 jimar be';

  @override
  String get pinAtLeast4Digits => 'PIN divê herî kêm 4 jimar be';

  @override
  String get invalidUsernameOrPin => 'Navê bikarhêner an PIN nederbasdar e';

  @override
  String get invalidUsernameOrPinError =>
      'Navê bikarhêner an PIN nederbasdar e';

  @override
  String get usernameAlreadyExists => 'Ev nav tê bikaranîn';

  @override
  String get captureMomentsKeepMemories => 'Deqan bikişîne, bîranînan biparêze';

  @override
  String get username => 'Navê bikarhêner';

  @override
  String get pin => 'DERZÎ';

  @override
  String get login => 'Login';

  @override
  String get createAccount => 'Hesab biafirîne';

  @override
  String get dontHaveAccountCreateOne => 'Hesabê we tune? Yek çêbikin';

  @override
  String get alreadyHaveAccountLogin => 'Jixwe hesabek heye? Login';

  @override
  String get pleaseEnterUsername => 'Ji kerema xwe navekî bikarhêner binivîse';

  @override
  String get pinsDoNotMatch => 'PIN li hev nakin';

  @override
  String get tapToAddAvatar => 'Ji bo lê zêdekirina avatarê bikirtînin';

  @override
  String get yourName => 'Navê te';

  @override
  String get privatePinOptional => 'PIN-a taybet (vebijarkî)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Ji bo şîfrekirina tomarên taybet tê bikar anîn';

  @override
  String get privatePin => 'PIN taybet';

  @override
  String get leaveEmptyForNoEncryption => 'Ji bo tu şîfrekirinê vala bihêlin';

  @override
  String get confirmPin => 'PIN-ê piştrast bikin';

  @override
  String get getStarted => 'Dest pê bike';

  @override
  String get noReminders => 'Bê bîranîn';

  @override
  String get addReminder => 'Bîranîn lê zêde bike';

  @override
  String get title => 'Nav';

  @override
  String get descriptionOptional => 'Danasîn (vebijarkî)';

  @override
  String get microphonePermissionRequired => 'Destûra mîkrofonê pêwîst e';

  @override
  String get aiAssistant => 'Alîkarê AI';

  @override
  String get listening => 'Guhdarîkirin...';

  @override
  String get typeAMessage => 'Peyamek binivîse...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Axaftinek dest pê bikin';

  @override
  String get typeYourMessage => 'Peyama xwe binivîse...';

  @override
  String get asrReconnecting => 'ASR ji nû ve tê girêdan...';

  @override
  String get write => 'Nivîsîn';

  @override
  String get writeEntry => 'Têketinê binivîse';

  @override
  String get noMemoriesYet => 'Bîranîn tune';

  @override
  String get tapPlusToCapture => 'Bikirtînin + da ku ramanên xwe bigirin';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Bikirtînin + da ku ramanên xwe bigirin';

  @override
  String get deleteMemory => 'Bîra jêbirin';

  @override
  String get deleteRecord => 'Record jêbirin';

  @override
  String get thisEntryWillBeRemoved =>
      'Ev têketin dê ji rêzika we were rakirin.';

  @override
  String get thisRecordWillBeRemoved =>
      'Ev tomar dê ji rêzika we were rakirin.';

  @override
  String get searchYourRecords => 'Li tomarên xwe bigerin...';

  @override
  String get exactMatches => 'Maçên Rast';

  @override
  String get noExactMatches => 'Maçên rast tune';

  @override
  String get exact => 'Tam';

  @override
  String get exactMatch => 'Maça Rast';

  @override
  String get fuzzyMatches => 'Matches Fuzzy';

  @override
  String get noFuzzyMatches => 'No maçên fuzzy';

  @override
  String get vectorMatch => 'Vector Match';

  @override
  String get networkMatches => 'Maçên Torê';

  @override
  String get noNetworkMatches => 'No maçên torê';

  @override
  String get networkSearchIsOff =>
      'Lêgerîna torê qut e. Di Mîhengan de çalak bike.';

  @override
  String get network => 'Network';

  @override
  String get networkMatch => 'Tora Match';

  @override
  String get noSearchHistory => 'Dîroka lêgerînê tune';

  @override
  String get searchHistory => 'Dîroka Lêgerînê';

  @override
  String get invalidLink => 'Girêdana nederbasdar';

  @override
  String get unableToOpenWebPage => 'Nikare rûpela malperê veke';

  @override
  String get imageMemory => '[bîra wêneyê]';

  @override
  String get tapToOpenWebPage => 'Ji bo vekirina rûpela malperê bikirtînin';

  @override
  String get editEntry => 'Edit Entry';

  @override
  String get entryDetails => 'Details Entry';

  @override
  String get noContent => 'Naverok tune';

  @override
  String get diaryNotFound => 'Rojnivîsk nehat dîtin';

  @override
  String get diaryNotFoundShort => 'Qeyd nehat dîtin';

  @override
  String get aiSummary => 'AI Summary';

  @override
  String get microphoneInterrupted => 'Mîkrofon qut bû, tomar rawestiya.';

  @override
  String get bold => 'Hesabî';

  @override
  String get italic => 'Îtalîk';

  @override
  String get strikethrough => 'Strikethrough';

  @override
  String get image => 'Wêne';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR ne berdest e. Tomarkirin hîn çalak e.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Têketina xwe binivîsin...';

  @override
  String get writeYourContent => 'Naveroka xwe binivîsin...';

  @override
  String microphoneStartFailed(String error) {
    return 'Mîkrofon dest pê nekir: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mîkrofon qut bû, tomar rawestiya.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR ji nû ve tê girêdan: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Wêneyê têxe: $name';
  }

  @override
  String voiceError(String error) {
    return 'Çewtiya deng: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Bibore, karûbarê AI-ê niha ne berdest e: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Parvekirin têkçû: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count lêdan';
  }

  @override
  String matchCount(int count) {
    return 'Maç: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Çavkanî: $source';
  }

  @override
  String get createNew => 'Xûliqandin';

  @override
  String micStartFailed(String error) {
    return 'Destpêka mîkrofê têk çû: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Hesab: +$created / nûkirin $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Rojnivîsk: +$created / nûkirin $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Bîranîn: +$created / nûkirin $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Derket: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Tevahiya guhertin: $count';
  }

  @override
  String get settingsApplied => 'Mîhengên di hilanînê de hatin sepandin.';

  @override
  String get settingsNotApplied => 'Mîhengên di hilanînê de nehatin sepandin.';

  @override
  String backupExported(String path) {
    return 'Backup hat hinartin: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Hinardekirin têk çû: $error';
  }

  @override
  String importFailed(String error) {
    return 'Import têk çû: $error';
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

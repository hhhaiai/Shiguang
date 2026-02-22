// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Somali (`so`).
class AppLocalizationsSo extends AppLocalizations {
  AppLocalizationsSo([String locale = 'so']) : super(locale);

  @override
  String get languageName => 'Soomaali';

  @override
  String get languageNameEn => 'Somali';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Dejinta';

  @override
  String get account => 'Xisaab';

  @override
  String get reminders => 'Xusuusin';

  @override
  String get language => 'Luuqad';

  @override
  String get appLanguage => 'Luuqada App-ka';

  @override
  String get appearance => 'Muuqashada';

  @override
  String get themeMode => 'Qaabka Mawduuca';

  @override
  String get dark => 'Madow';

  @override
  String get light => 'Iftiin';

  @override
  String get system => 'Nidaamka';

  @override
  String get aiService => 'Adeegga AI';

  @override
  String get aiChatProvider => 'Bixiyaha Chat AI';

  @override
  String get chatModel => 'Qaab sheekeysi';

  @override
  String get localModel => 'Qaabka Maxalliga';

  @override
  String get localModelDefault => 'Qaabka Maxalliga ah (Ugu tala galay)';

  @override
  String get ollamaEndpoint => 'Ollama Endpoint';

  @override
  String get ollamaModel => 'Ollaama Model';

  @override
  String get openAiEndpoint => 'Meesha dhamaadka AI ee furan';

  @override
  String get openAiApiKey => 'Furaha API Furaha';

  @override
  String get openAiModel => 'Modelka OpenAI';

  @override
  String get geminiEndpoint => 'Gemini Endpoint';

  @override
  String get geminiApiKey => 'Gemini API Furaha';

  @override
  String get geminiModel => 'Noocyada Gemini';

  @override
  String get anthropicEndpoint => 'Dhibicda Anthropic';

  @override
  String get anthropicApiKey => 'Furaha API Anthropic';

  @override
  String get anthropicModel => 'Qaabka Anthropic';

  @override
  String get customProtocol => 'Hab-maamuuska gaarka ah';

  @override
  String get protocol => 'Baratakoolka';

  @override
  String get customEndpoint => 'Meesha dhamaadka gaarka ah';

  @override
  String get customApiKey => 'Furaha API Custom';

  @override
  String get customModel => 'Qaabka gaarka ah';

  @override
  String get optionalForLocalServers =>
      'Ikhtiyaar u ah adeegayaasha maxalliga ah/caadada';

  @override
  String get speechRecognitionEngine => 'Mashiinka Aqoonsiga Hadalka';

  @override
  String get local => 'Deegaanka';

  @override
  String get endpoint => 'Dhamaadka';

  @override
  String get localSpeechModel => 'Qaabka Hadalka Maxaliga';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (qalabka)';

  @override
  String get systemSpeechRecognition => 'Aqoonsiga Hadalka Nidaamka';

  @override
  String get systemRecognitionAndroidIos => 'Aqoonsiga Nidaamka (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Aqoonsiga barta dhamaadka (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Adeegso garashada Android/iOS ee ku dhex dhisan (waxa laga yaabaa inay isticmaasho daruur)';

  @override
  String get voiceAiEndpoint => 'Goobta dhamaadka Codka AI';

  @override
  String get embeddingModel => 'Model-ku-xidhka';

  @override
  String get crossDeviceSync => 'Isku-darka Qalabka';

  @override
  String get sendToOtherDevices => 'U dir Aalado Kale (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Soo rar kaydinta kuna soo dir xaashi wadaag';

  @override
  String get importFromLocalSend => 'Ka soo dejinta LocalSend';

  @override
  String get selectBackupJson => 'Dooro kaydka JSON oo ku biir xogta deegaanka';

  @override
  String get autoGeneration => 'Jiilkii Baabuurka';

  @override
  String get autoGenerateSummary => 'Soo koobid Atooto ah';

  @override
  String get generateAiSummaryForNewEntries =>
      'Samee soo koobida AI ee gelitaannada cusub';

  @override
  String get autoGenerateEmbedding => 'Soo-saar otomaatig ah Isku-xidhka';

  @override
  String get generateVectorEmbedding => 'Abuur vector-ka-soo-saarka raadinta';

  @override
  String get enableNetworkSearch => 'Daar raadinta Shabakadda';

  @override
  String get allowOnlineRetrieval =>
      'Oggolow dib u soo celinta khadka tooska ah raadinta iyo wada sheekeysiga AI (damsan si caadi ah)';

  @override
  String get about => 'Ku saabsan';

  @override
  String version(String version) {
    return 'Nooca $version';
  }

  @override
  String get database => 'Database';

  @override
  String get objectBoxWithHnsw => 'ObjectBox oo leh index HNSW';

  @override
  String get logOut => 'Ka bax';

  @override
  String get custom => 'Caadiyan';

  @override
  String get openAiCompatible => 'FurAI Waafaqsan';

  @override
  String get notSet => 'Lama dejin';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Waxay taageertaa meelaha ugu dambeeya ee deegaanka/LAN/dadweynaha';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend Backup';

  @override
  String get localBackupFromShiguang =>
      'Kaabta maxaliga ah ee Shiguang (ku hel LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Dooro faylka kaydka ah ee laga helay LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Ku guuldareystay in la xaliyo dariiqa faylka la doortay';

  @override
  String get importOptions => 'Soo dejinta Ikhtiyaarada';

  @override
  String get importSettingsAsWell =>
      'Soo deji dejinta sidoo kale?\n(furayaasha API dib looma qori doono)';

  @override
  String get dataOnly => 'Xogta Kaliya';

  @override
  String get dataAndSettings => 'Xogta + Dejinta';

  @override
  String get importCompleted => 'Soo dejinta waa la dhameeyay';

  @override
  String get settingsInBackupWereApplied =>
      'Dejinta kaydinta ayaa lagu dabaqay';

  @override
  String get settingsInBackupWereNotApplied => 'Dejinta kaydinta lama dabaqin';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Jooji';

  @override
  String get save => 'Badbaadin';

  @override
  String get delete => 'Tirtir';

  @override
  String get clear => 'Cad';

  @override
  String get add => 'Ku darso';

  @override
  String get create => 'Abuur';

  @override
  String get edit => 'Wax ka beddel';

  @override
  String get search => 'Raadi';

  @override
  String get areYouSureYouWantToLogOut =>
      'Ma hubtaa inaad doonayso inaad ka baxdo?';

  @override
  String get chooseLanguage => 'Dooro Luuqad';

  @override
  String get databaseInfo => 'Xogta Keydka';

  @override
  String get storage => 'Kaydinta: ObjectBox';

  @override
  String get vectorIndex => 'Tusmada Vector: HNSW';

  @override
  String get dimensions => 'Cabirka: 384';

  @override
  String get embeddingModelBge => 'Model ku dhejisan: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Sawir qaad';

  @override
  String get chooseFromGallery => 'Ka dooro Gallery';

  @override
  String get editNickname => 'Wax ka beddel naaneesta';

  @override
  String get enterNickname => 'Geli naanays';

  @override
  String get pleaseEnterNickname => 'Fadlan geli naaneyska';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Naanaysta ayaa horay u jirtay ama aan sax ahayn';

  @override
  String get user => 'Isticmaale';

  @override
  String get manageScheduledReminders =>
      'Maamul xasuusinta la qorsheeyay iyo qaylo dhaanta';

  @override
  String get imageFailedToLoad =>
      'Sawirku wuu ku guul daraystay in la shubo Fadlan mar kale dooro';

  @override
  String get imageIsStillLoading => 'Sawirku wali waa soo raraya';

  @override
  String get imageAreaNotReady =>
      'Goobta sawirku diyaar uma aha Fadlan isku day mar kale';

  @override
  String get cropFrameNotReady =>
      'Qaabka dalaggu diyaar uma aha Fadlan isku day mar kale';

  @override
  String get invalidCropArea =>
      'Aagga dalagga aan ansax ahayn Fadlan isku day mar kale';

  @override
  String get cropFailed => 'Dalagga ayaa fashilmay Fadlan isku day mar kale';

  @override
  String get cropAvatar => 'Dalagga Avatar';

  @override
  String get chooseAgain => 'Mar labaad dooro';

  @override
  String get rotate90 => 'Wareeg 90°';

  @override
  String get dragFrameToMove =>
      'Jiid jirku si aad u dhaqaaqdo, jiid xagga hoose-midig si aad u cabbirto; qanji si aad u soo dhawayso oo u dhaqaajiso sawirka.';

  @override
  String get pleaseFillInAllFields => 'Fadlan buuxi dhammaan goobaha';

  @override
  String get pinMustBeAtLeast4Digits =>
      'PIN waa inuu noqdaa ugu yaraan 4 nambar';

  @override
  String get pinAtLeast4Digits => 'PIN waa inuu noqdaa ugu yaraan 4 nambar';

  @override
  String get invalidUsernameOrPin => 'Magaca isticmaale ama PIN aan sax ahayn';

  @override
  String get invalidUsernameOrPinError =>
      'Magaca isticmaale ama PIN aan sax ahayn';

  @override
  String get usernameAlreadyExists => 'Magaca isticmaalaha ayaa hore u jiray';

  @override
  String get captureMomentsKeepMemories => 'Qabo daqiiqado, xasuuso';

  @override
  String get username => 'Magaca isticmaale';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Soo gal';

  @override
  String get createAccount => 'Abuur Account';

  @override
  String get dontHaveAccountCreateOne => 'Xisaab ma lihid? Hal abuur';

  @override
  String get alreadyHaveAccountLogin => 'Horeba akoon baad u leedahay? Soo gal';

  @override
  String get pleaseEnterUsername => 'Fadlan geli magaca isticmaale';

  @override
  String get pinsDoNotMatch => 'PIN-yadu isma dhigmaan';

  @override
  String get tapToAddAvatar => 'Taabo si aad ugu darto avatar';

  @override
  String get yourName => 'Magacaaga';

  @override
  String get privatePinOptional => 'PIN gaar ah (ikhtiyaar)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Loo isticmaalo in lagu sireeyo diiwaannada gaarka ah';

  @override
  String get privatePin => 'PIN gaar ah';

  @override
  String get leaveEmptyForNoEncryption =>
      'Ka tag faaruq si aan qarsoodi lahayn';

  @override
  String get confirmPin => 'Xaqiiji PIN';

  @override
  String get getStarted => 'Bilow';

  @override
  String get noReminders => 'Xusuusin';

  @override
  String get addReminder => 'Kudar Xusuusin';

  @override
  String get title => 'Ciwaanka';

  @override
  String get descriptionOptional => 'Sharaxaad (ikhtiyaar)';

  @override
  String get microphonePermissionRequired =>
      'Ogolaanshaha makarafoonka ayaa loo baahan yahay';

  @override
  String get aiAssistant => 'Kaaliyaha AI';

  @override
  String get listening => 'Dhegeysi...';

  @override
  String get typeAMessage => 'Ku qor fariin...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Bilow wada hadal';

  @override
  String get typeYourMessage => 'Ku qor fariintaada...';

  @override
  String get asrReconnecting => 'ASR dib u xidhidh...';

  @override
  String get write => 'Qor';

  @override
  String get writeEntry => 'Qor Gelitaanka';

  @override
  String get noMemoriesYet => 'Wali xasuus malaha';

  @override
  String get tapPlusToCapture => 'Taabo + si aad fikradahaaga u qabsato';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Taabo + si aad u qabsato fikradahaaga';

  @override
  String get deleteMemory => 'Tirtir Xusuusta';

  @override
  String get deleteRecord => 'Tirtir Diiwaanka';

  @override
  String get thisEntryWillBeRemoved =>
      'Gelitaankan ayaa laga saari doonaa wakhtigaaga';

  @override
  String get thisRecordWillBeRemoved =>
      'Diiwaankan ayaa laga saari doonaa wakhtigaaga';

  @override
  String get searchYourRecords => 'Raadi diiwaankaaga...';

  @override
  String get exactMatches => 'Kulamada saxda ah';

  @override
  String get noExactMatches => 'Ma jiraan wax u dhigma';

  @override
  String get exact => 'Sax';

  @override
  String get exactMatch => 'Ciyaarta saxda ah';

  @override
  String get fuzzyMatches => 'Kulamada Dawakhsan';

  @override
  String get noFuzzyMatches => 'Ma jiro kulan dawakhsan';

  @override
  String get vectorMatch => 'Ciyaarta Vector';

  @override
  String get networkMatches => 'Ciyaaraha Shabakadda';

  @override
  String get noNetworkMatches => 'Ma jiro shabakad u dhigma';

  @override
  String get networkSearchIsOff =>
      'Raadinta shabakadu waa dansan tahay Ka yeel Settings';

  @override
  String get network => 'Shabakadda';

  @override
  String get networkMatch => 'Isku xirka Shabakadda';

  @override
  String get noSearchHistory => 'Taariikh raadin ma jirto';

  @override
  String get searchHistory => 'Taariikhda Raadinta';

  @override
  String get invalidLink => 'Xiriirin aan sax ahayn';

  @override
  String get unableToOpenWebPage => 'Ma furi karo bogga shabakadda';

  @override
  String get imageMemory => '[Xusuusta sawirka]';

  @override
  String get tapToOpenWebPage => 'Taabo si aad u furto bogga shabakadda';

  @override
  String get editEntry => 'Wax ka beddel gelida';

  @override
  String get entryDetails => 'Faahfaahinta Gelitaanka';

  @override
  String get noContent => 'Ma jiro wax ka kooban';

  @override
  String get diaryNotFound => 'Xusuus qorka lama helin';

  @override
  String get diaryNotFoundShort => 'Diiwaanka lama helin';

  @override
  String get aiSummary => 'AI oo kooban';

  @override
  String get microphoneInterrupted =>
      'Makarafoonku waa go\'ay, duubistii waa la joojiyay.';

  @override
  String get bold => 'Dhiirran';

  @override
  String get italic => 'Italic';

  @override
  String get strikethrough => 'Guul-daro';

  @override
  String get image => 'Sawirka';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR lama heli karo Duubista ayaa wali shaqaynaysa';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Qor gelidaada...';

  @override
  String get writeYourContent => 'Qor nuxurkaaga...';

  @override
  String microphoneStartFailed(String error) {
    return 'Ku guuldareystay inuu bilaabo makarafoon: _PH_0__';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Makarafoonku waa go\'ay, duubistii waa la joojiyay.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR dib u xidhidh: _PH_0__';
  }

  @override
  String imageInserted(String name) {
    return 'Sawirka la galiyay: _PH_0__';
  }

  @override
  String voiceError(String error) {
    return 'Khaladka codka: _PH_0__';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Waan ka xunahay, adeegga AI hadda lama heli karo: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Ku guuldareystay in la wadaago: _PH_0__';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '_PH_0__ · $count garaacid';
  }

  @override
  String matchCount(int count) {
    return 'Ciyaarta: _PH_0__';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Xigasho: $source';
  }

  @override
  String get createNew => 'Abuur';

  @override
  String micStartFailed(String error) {
    return 'Bilawga makarafoonku wuu fashilmay: _PH_0__';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Xisaabaadka: +$created / la cusboonaysiiyay $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Xusuus qor: +$created / la cusboonaysiiyay $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Xusuusin: +$created / la cusboonaysiiyay $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Ka booday: _PH_0__';
  }

  @override
  String importResultTotal(int count) {
    return 'Wadarta la beddelay: _PH_0__';
  }

  @override
  String get settingsApplied => 'Dejinta kaydinta ayaa lagu dabaqay';

  @override
  String get settingsNotApplied => 'Dejinta kaydinta lama dabaqin';

  @override
  String backupExported(String path) {
    return 'Kaabta waa la dhoofiyay: _PH_0__';
  }

  @override
  String exportFailed(String error) {
    return 'Dhoofintu waa fashilantay: _PH_0__';
  }

  @override
  String importFailed(String error) {
    return 'Soo dejinta waa fashilantay: _PH_0__';
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

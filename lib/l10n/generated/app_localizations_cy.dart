// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Welsh (`cy`).
class AppLocalizationsCy extends AppLocalizations {
  AppLocalizationsCy([String locale = 'cy']) : super(locale);

  @override
  String get languageName => 'Cymraeg';

  @override
  String get languageNameEn => 'Welsh';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Gosodiadau';

  @override
  String get account => 'Cyfrif';

  @override
  String get reminders => 'Atgofion';

  @override
  String get language => 'Iaith';

  @override
  String get appLanguage => 'Iaith Ap';

  @override
  String get appearance => 'Ymddangosiad';

  @override
  String get themeMode => 'Modd Thema';

  @override
  String get dark => 'Tywyll';

  @override
  String get light => 'Ysgafn';

  @override
  String get system => 'System';

  @override
  String get aiService => 'Gwasanaeth AI';

  @override
  String get aiChatProvider => 'Darparwr Sgwrs AI';

  @override
  String get chatModel => 'Model Sgwrsio';

  @override
  String get localModel => 'Model Lleol';

  @override
  String get localModelDefault => 'Model Lleol (Diofyn)';

  @override
  String get ollamaEndpoint => 'Ollama Endpoint';

  @override
  String get ollamaModel => 'Model Olama';

  @override
  String get openAiEndpoint => 'Diweddbwynt OpenAI';

  @override
  String get openAiApiKey => 'Allwedd API OpenAI';

  @override
  String get openAiModel => 'Model OpenAI';

  @override
  String get geminiEndpoint => 'Diweddbwynt Gemini';

  @override
  String get geminiApiKey => 'Allwedd Gemini API';

  @override
  String get geminiModel => 'Modelau Gemini';

  @override
  String get anthropicEndpoint => 'Diweddbwynt Anthropig';

  @override
  String get anthropicApiKey => 'Allwedd API Anthropig';

  @override
  String get anthropicModel => 'Model Anthropig';

  @override
  String get customProtocol => 'Protocol Personol';

  @override
  String get protocol => 'Protocol';

  @override
  String get customEndpoint => 'Diweddbwynt Personol';

  @override
  String get customApiKey => 'Allwedd API Custom';

  @override
  String get customModel => 'Model Custom';

  @override
  String get optionalForLocalServers =>
      'Dewisol ar gyfer gweinyddwyr lleol/custom';

  @override
  String get speechRecognitionEngine => 'Peiriant Adnabod Lleferydd';

  @override
  String get local => 'Lleol';

  @override
  String get endpoint => 'Diweddbwynt';

  @override
  String get localSpeechModel => 'Model Lleferydd Lleol';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (ar y ddyfais)';

  @override
  String get systemSpeechRecognition => 'Cydnabod Lleferydd System';

  @override
  String get systemRecognitionAndroidIos => 'Cydnabod System (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Cydnabod Diweddbwynt (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Defnyddiwch adnabyddydd Android / iOS adeiledig (gall ddefnyddio cwmwl)';

  @override
  String get voiceAiEndpoint => 'Llais AI Diweddbwynt';

  @override
  String get embeddingModel => 'Model Ymgorffori';

  @override
  String get crossDeviceSync => 'Cysoni Traws-Dyfais';

  @override
  String get sendToOtherDevices => 'Anfon i Ddyfeisiadau Eraill (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Allforio copi wrth gefn a\'i anfon trwy daflen rannu';

  @override
  String get importFromLocalSend => 'Mewnforio o LocalSend';

  @override
  String get selectBackupJson => 'Dewiswch JSON wrth gefn ac uno data lleol';

  @override
  String get autoGeneration => 'Cynhyrchu Auto';

  @override
  String get autoGenerateSummary => 'Awto Cynhyrchu Crynodeb';

  @override
  String get generateAiSummaryForNewEntries =>
      'Cynhyrchu crynodeb AI ar gyfer cofnodion newydd';

  @override
  String get autoGenerateEmbedding => 'Auto Cynhyrchu Mewnosod';

  @override
  String get generateVectorEmbedding =>
      'Cynhyrchu mewnosod fector ar gyfer chwilio';

  @override
  String get enableNetworkSearch => 'Galluogi Chwiliad Rhwydwaith';

  @override
  String get allowOnlineRetrieval =>
      'Caniatáu adalw ar-lein ar gyfer chwilio a sgwrsio AI (i ffwrdd yn ddiofyn)';

  @override
  String get about => 'Ynghylch';

  @override
  String version(String version) {
    return 'Fersiwn _PH_0__';
  }

  @override
  String get database => 'Cronfa Ddata';

  @override
  String get objectBoxWithHnsw => 'ObjectBox gyda mynegai HNSW';

  @override
  String get logOut => 'Allgofnodi';

  @override
  String get custom => 'Custom';

  @override
  String get openAiCompatible => 'Yn gydnaws ag OpenAI';

  @override
  String get notSet => 'Heb ei osod';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... neu http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Yn cefnogi pwyntiau terfyn lleol/LAN/cyhoeddus';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend wrth gefn';

  @override
  String get localBackupFromShiguang =>
      'Copi wrth gefn lleol gan Shiguang (derbyn trwy LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Dewiswch ffeil wrth gefn a dderbyniwyd gan LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Wedi methu â datrys y llwybr ffeil a ddewiswyd';

  @override
  String get importOptions => 'Opsiynau Mewnforio';

  @override
  String get importSettingsAsWell =>
      'Mewnforio gosodiadau hefyd?\n(Ni fydd allweddi API yn cael eu trosysgrifo)';

  @override
  String get dataOnly => 'Data yn unig';

  @override
  String get dataAndSettings => 'Data + Gosodiadau';

  @override
  String get importCompleted => 'Mewnforio wedi\'i Gwblhau';

  @override
  String get settingsInBackupWereApplied => 'Gosodwyd gosodiadau wrth gefn.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Ni weithredwyd gosodiadau wrth gefn.';

  @override
  String get ok => 'iawn';

  @override
  String get cancel => 'Canslo';

  @override
  String get save => 'Arbed';

  @override
  String get delete => 'Dileu';

  @override
  String get clear => 'Clir';

  @override
  String get add => 'Ychwanegu';

  @override
  String get create => 'Creu';

  @override
  String get edit => 'Golygu';

  @override
  String get search => 'Chwiliwch';

  @override
  String get areYouSureYouWantToLogOut =>
      'Ydych chi\'n siŵr eich bod am allgofnodi?';

  @override
  String get chooseLanguage => 'Dewiswch Iaith';

  @override
  String get databaseInfo => 'Gwybodaeth Cronfa Ddata';

  @override
  String get storage => 'Storio: ObjectBox';

  @override
  String get vectorIndex => 'Mynegai Fector: HNSW';

  @override
  String get dimensions => 'Dimensiynau: 384';

  @override
  String get embeddingModelBge => 'Model Ymgorffori: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Tynnu Llun';

  @override
  String get chooseFromGallery => 'Dewiswch o\'r Oriel';

  @override
  String get editNickname => 'Golygu Llysenw';

  @override
  String get enterNickname => 'Rhowch y llysenw';

  @override
  String get pleaseEnterNickname => 'Rhowch lysenw';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Mae llysenw eisoes yn bodoli neu\'n annilys';

  @override
  String get user => 'Defnyddiwr';

  @override
  String get manageScheduledReminders =>
      'Rheoli nodiadau atgoffa a larymau sydd wedi\'u hamserlennu';

  @override
  String get imageFailedToLoad =>
      'Ni fu modd llwytho\'r ddelwedd. Dewiswch eto.';

  @override
  String get imageIsStillLoading => 'Mae\'r llun yn dal i lwytho';

  @override
  String get imageAreaNotReady =>
      'Nid yw ardal y ddelwedd yn barod. Ceisiwch eto.';

  @override
  String get cropFrameNotReady => 'Nid yw ffrâm cnwd yn barod. Ceisiwch eto.';

  @override
  String get invalidCropArea => 'Ardal gnwd annilys. Ceisiwch eto.';

  @override
  String get cropFailed => 'Methodd y cnwd. Ceisiwch eto.';

  @override
  String get cropAvatar => 'Avatar Cnwd';

  @override
  String get chooseAgain => 'Dewiswch Eto';

  @override
  String get rotate90 => 'Cylchdroi 90°';

  @override
  String get dragFrameToMove =>
      'Llusgwch y ffrâm i symud, llusgo gwaelod-dde i newid maint; pinsio i chwyddo a symud delwedd.';

  @override
  String get pleaseFillInAllFields => 'Llenwch bob maes';

  @override
  String get pinMustBeAtLeast4Digits => 'Rhaid i\'r PIN fod o leiaf 4 digid';

  @override
  String get pinAtLeast4Digits => 'Rhaid i PIN fod o leiaf 4 digid';

  @override
  String get invalidUsernameOrPin => 'Enw defnyddiwr neu PIN annilys';

  @override
  String get invalidUsernameOrPinError => 'Enw defnyddiwr neu PIN annilys';

  @override
  String get usernameAlreadyExists => 'Mae enw defnyddiwr eisoes yn bodoli';

  @override
  String get captureMomentsKeepMemories => 'Dal eiliadau, cadw atgofion';

  @override
  String get username => 'Enw defnyddiwr';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Mewngofnodi';

  @override
  String get createAccount => 'Creu Cyfrif';

  @override
  String get dontHaveAccountCreateOne => 'Dim cyfrif? Creu un';

  @override
  String get alreadyHaveAccountLogin =>
      'Oes gennych chi gyfrif yn barod? Mewngofnodi';

  @override
  String get pleaseEnterUsername => 'Rhowch enw defnyddiwr';

  @override
  String get pinsDoNotMatch => 'Nid yw PINs yn cyfateb';

  @override
  String get tapToAddAvatar => 'Tapiwch i ychwanegu avatar';

  @override
  String get yourName => 'Eich Enw';

  @override
  String get privatePinOptional => 'PIN preifat (dewisol)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Fe\'i defnyddir i amgryptio cofnodion preifat';

  @override
  String get privatePin => 'PIN preifat';

  @override
  String get leaveEmptyForNoEncryption => 'Gadewch yn wag heb unrhyw amgryptio';

  @override
  String get confirmPin => 'Cadarnhau PIN';

  @override
  String get getStarted => 'Cychwyn Arni';

  @override
  String get noReminders => 'Dim nodiadau atgoffa';

  @override
  String get addReminder => 'Ychwanegu Nodyn Atgoffa';

  @override
  String get title => 'Teitl';

  @override
  String get descriptionOptional => 'Disgrifiad (dewisol)';

  @override
  String get microphonePermissionRequired => 'Mae angen caniatâd meicroffon';

  @override
  String get aiAssistant => 'Cynorthwy-ydd AI';

  @override
  String get listening => 'Wrth wrando...';

  @override
  String get typeAMessage => 'Teipiwch neges...';

  @override
  String get aiChat => 'Sgwrs AI';

  @override
  String get startAConversation => 'Dechreuwch sgwrs';

  @override
  String get typeYourMessage => 'Teipiwch eich neges...';

  @override
  String get asrReconnecting => 'ASR yn ailgysylltu...';

  @override
  String get write => 'Ysgrifena';

  @override
  String get writeEntry => 'Ysgrifennu Cofnod';

  @override
  String get noMemoriesYet => 'Dim atgofion eto';

  @override
  String get tapPlusToCapture => 'Tap + i ddal eich meddyliau';

  @override
  String get tapPlusToCaptureYourThoughts => 'Tap + i ddal eich meddyliau';

  @override
  String get deleteMemory => 'Dileu Cof';

  @override
  String get deleteRecord => 'Dileu Cofnod';

  @override
  String get thisEntryWillBeRemoved =>
      'Bydd y cofnod hwn yn cael ei ddileu o\'ch llinell amser.';

  @override
  String get thisRecordWillBeRemoved =>
      'Bydd y cofnod hwn yn cael ei ddileu o\'ch llinell amser.';

  @override
  String get searchYourRecords => 'Chwiliwch eich cofnodion...';

  @override
  String get exactMatches => 'Cyfatebiaethau Union';

  @override
  String get noExactMatches => 'Dim cyfatebiaeth union';

  @override
  String get exact => 'Yn union';

  @override
  String get exactMatch => 'Cydweddiad Union';

  @override
  String get fuzzyMatches => 'Gemau Fuzzy';

  @override
  String get noFuzzyMatches => 'Dim gemau niwlog';

  @override
  String get vectorMatch => 'Gêm Fector';

  @override
  String get networkMatches => 'Gemau Rhwydwaith';

  @override
  String get noNetworkMatches => 'Dim rhwydwaith yn cyfateb';

  @override
  String get networkSearchIsOff =>
      'Mae chwiliad rhwydwaith wedi\'i ddiffodd. Ei alluogi yn y Gosodiadau.';

  @override
  String get network => 'Rhwydwaith';

  @override
  String get networkMatch => 'Cydweddiad Rhwydwaith';

  @override
  String get noSearchHistory => 'Dim hanes chwilio';

  @override
  String get searchHistory => 'Hanes Chwilio';

  @override
  String get invalidLink => 'Dolen annilys';

  @override
  String get unableToOpenWebPage => 'Methu agor tudalen we';

  @override
  String get imageMemory => '[Cof delwedd]';

  @override
  String get tapToOpenWebPage => 'Tapiwch i agor tudalen we';

  @override
  String get editEntry => 'Golygu Cofnod';

  @override
  String get entryDetails => 'Manylion Mynediad';

  @override
  String get noContent => 'Dim cynnwys';

  @override
  String get diaryNotFound => 'Dyddiadur heb ei ddarganfod';

  @override
  String get diaryNotFoundShort => 'Heb ganfod y cofnod';

  @override
  String get aiSummary => 'Crynodeb AI';

  @override
  String get microphoneInterrupted =>
      'Torri ar draws meicroffon, stopiodd recordio.';

  @override
  String get bold => 'Beiddgar';

  @override
  String get italic => 'Italaidd';

  @override
  String get strikethrough => 'Streic drwodd';

  @override
  String get image => 'Delwedd';

  @override
  String get asrUnavailableRecordingActive =>
      'Nid yw ASR ar gael. Mae recordio yn dal yn weithredol.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Ysgrifennwch eich cofnod...';

  @override
  String get writeYourContent => 'Ysgrifennwch eich cynnwys...';

  @override
  String microphoneStartFailed(String error) {
    return 'Wedi methu cychwyn meicroffon: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Torri ar draws meicroffon, stopiodd recordio.';

  @override
  String asrReconnectingError(String error) {
    return 'Ailgysylltu ASR: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Delwedd wedi\'i mewnosod: _PH_0__';
  }

  @override
  String voiceError(String error) {
    return 'Gwall llais: _PH_0__';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Mae\'n ddrwg gennym, nid yw gwasanaeth AI ar gael ar hyn o bryd: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Wedi methu rhannu: _PH_0__';
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
    return '_PH_0__ · $count hits';
  }

  @override
  String matchCount(int count) {
    return 'Cyfateb: _PH_0__';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Ffynhonnell: _PH_0__';
  }

  @override
  String get createNew => 'Creu';

  @override
  String micStartFailed(String error) {
    return 'Methodd cychwyn y meic: _PH_0__';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Cyfrifon: +$created / diweddaru $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Dyddiaduron: +$created / diweddaru $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Nodyn atgoffa: +_PH_0__ / diweddaru $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Wedi\'i hepgor: _PH_0__';
  }

  @override
  String importResultTotal(int count) {
    return 'Cyfanswm wedi\'i newid: _PH_0__';
  }

  @override
  String get settingsApplied => 'Gosodwyd gosodiadau wrth gefn.';

  @override
  String get settingsNotApplied => 'Ni weithredwyd gosodiadau wrth gefn.';

  @override
  String backupExported(String path) {
    return 'Copi wrth gefn wedi\'i allforio: _PH_0__';
  }

  @override
  String exportFailed(String error) {
    return 'Wedi methu allforio: _PH_0__';
  }

  @override
  String importFailed(String error) {
    return 'Methodd mewnforio: _PH_0__';
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

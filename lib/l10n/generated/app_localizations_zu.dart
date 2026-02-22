// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Zulu (`zu`).
class AppLocalizationsZu extends AppLocalizations {
  AppLocalizationsZu([String locale = 'zu']) : super(locale);

  @override
  String get languageName => 'isiZulu';

  @override
  String get languageNameEn => 'Zulu';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Izilungiselelo';

  @override
  String get account => 'I-akhawunti';

  @override
  String get reminders => 'Izikhumbuzi';

  @override
  String get language => 'Ulimi';

  @override
  String get appLanguage => 'Ulimi Lokusebenza';

  @override
  String get appearance => 'Ukubukeka';

  @override
  String get themeMode => 'Imodi yetimu';

  @override
  String get dark => 'Kumnyama';

  @override
  String get light => 'Ukukhanya';

  @override
  String get system => 'Uhlelo';

  @override
  String get aiService => 'Isevisi ye-AI';

  @override
  String get aiChatProvider => 'I-AI Chat Provider';

  @override
  String get chatModel => 'Imodeli Yengxoxo';

  @override
  String get localModel => 'Imodeli Yasendaweni';

  @override
  String get localModelDefault => 'Imodeli Yasendaweni (Okuzenzakalelayo)';

  @override
  String get ollamaEndpoint => 'I-Ollama Endpoint';

  @override
  String get ollamaModel => 'Ollama Model';

  @override
  String get openAiEndpoint => 'Iphoyinti lokugcina le-OpenAI';

  @override
  String get openAiApiKey => 'Ukhiye we-OpenAI API';

  @override
  String get openAiModel => 'Imodeli ye-OpenAI';

  @override
  String get geminiEndpoint => 'I-Gemini Endpoint';

  @override
  String get geminiApiKey => 'Ukhiye we-Gemini API';

  @override
  String get geminiModel => 'Amamodeli weGemini';

  @override
  String get anthropicEndpoint => 'I-Anthropic Endpoint';

  @override
  String get anthropicApiKey => 'Ukhiye we-Anthropic API';

  @override
  String get anthropicModel => 'Imodeli ye-Anthropic';

  @override
  String get customProtocol => 'Iphrothokholi Yangokwezifiso';

  @override
  String get protocol => 'Iphrothokholi';

  @override
  String get customEndpoint => 'Iphoyinti lokugcina langokwezifiso';

  @override
  String get customApiKey => 'Ukhiye we-API wangokwezifiso';

  @override
  String get customModel => 'Imodeli Yangokwezifiso';

  @override
  String get optionalForLocalServers =>
      'Ongakukhetha kumaseva endawo/angokwezifiso';

  @override
  String get speechRecognitionEngine => 'Injini Yokuqaphela Inkulumo';

  @override
  String get local => 'Indawo';

  @override
  String get endpoint => 'Iphoyinti lokugcina';

  @override
  String get localSpeechModel => 'Imodeli Yenkulumo Yasendaweni';

  @override
  String get senseVoiceOnnx => 'I-SenseVoice ONNX (kudivayisi)';

  @override
  String get systemSpeechRecognition => 'Ukuqashelwa Kwenkulumo Yesistimu';

  @override
  String get systemRecognitionAndroidIos =>
      'Ukuqashelwa Kwesistimu (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'I-Endpoint Recognition (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Sebenzisa isiboni se-Android/iOS esakhelwe ngaphakathi (singasebenzisa ifu)';

  @override
  String get voiceAiEndpoint => 'I-Voice AI Endpoint';

  @override
  String get embeddingModel => 'Imodeli yokushumeka';

  @override
  String get crossDeviceSync => 'I-Cross-Device Sync';

  @override
  String get sendToOtherDevices => 'Thumela kwamanye Amadivayisi (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Khipha isipele futhi uthumele ngeshidi lokwabelana';

  @override
  String get importFromLocalSend => 'Ngenisa kusuka ku-LocalSend';

  @override
  String get selectBackupJson =>
      'Khetha i-JSON eyisipele bese uhlanganisa idatha yendawo';

  @override
  String get autoGeneration => 'Auto Generation';

  @override
  String get autoGenerateSummary => 'Khiqiza Okuzenzakalelayo Isifinyezo';

  @override
  String get generateAiSummaryForNewEntries =>
      'Khiqiza isifinyezo se-AI kokufakiwe okusha';

  @override
  String get autoGenerateEmbedding => 'Khiqiza Okuzenzakalelayo Ukushumeka';

  @override
  String get generateVectorEmbedding =>
      'Khiqiza ukushumeka kwe-vector ukuze useshe';

  @override
  String get enableNetworkSearch => 'Nika amandla Usesho Lwenethiwekhi';

  @override
  String get allowOnlineRetrieval =>
      'Vumela ukubuyiswa ku-inthanethi kokusesha kanye nengxoxo ye-AI (ivaliwe ngokuzenzakalelayo)';

  @override
  String get about => 'Mayelana';

  @override
  String version(String version) {
    return 'Inguqulo $version';
  }

  @override
  String get database => 'Isizindalwazi';

  @override
  String get objectBoxWithHnsw => 'ObjectBox nge HNSW index';

  @override
  String get logOut => 'Phuma';

  @override
  String get custom => 'Ngokwezifiso';

  @override
  String get openAiCompatible => 'I-OpenAI Iyahambisana';

  @override
  String get notSet => 'Akusethiwe';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Isekela iziphetho zendawo/LAN/zomphakathi';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalThumela Isipele';

  @override
  String get localBackupFromShiguang =>
      'Ikhophi yasenqolobaneni yendawo evela ku-Shiguang (thola nge-LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Khetha ifayela eliyisipele elitholwe ku-LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Yehlulekile ukuxazulula indlela yefayela ekhethiwe';

  @override
  String get importOptions => 'Izinketho Zokungenisa';

  @override
  String get importSettingsAsWell =>
      'Ngenisa nezilungiselelo?\n(Okhiye be-API ngeke babhalwe ngaphezulu)';

  @override
  String get dataOnly => 'Idatha Kuphela';

  @override
  String get dataAndSettings => 'Idatha + Izilungiselelo';

  @override
  String get importCompleted => 'Ukungenisa Kuqediwe';

  @override
  String get settingsInBackupWereApplied =>
      'Izilungiselelo eziyisipele zisetshenzisiwe.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Izilungiselelo eziyisipele azizange zisetshenziswe.';

  @override
  String get ok => 'KULUNGILE';

  @override
  String get cancel => 'Khansela';

  @override
  String get save => 'Londoloza';

  @override
  String get delete => 'Susa';

  @override
  String get clear => 'Kucace';

  @override
  String get add => 'Engeza';

  @override
  String get create => 'Dala';

  @override
  String get edit => 'Hlela';

  @override
  String get search => 'Sesha';

  @override
  String get areYouSureYouWantToLogOut => 'Uqinisekile ukuthi ufuna ukuphuma?';

  @override
  String get chooseLanguage => 'Khetha Ulimi';

  @override
  String get databaseInfo => 'Ulwazi Lwesizindalwazi';

  @override
  String get storage => 'Isitoreji: ObjectBox';

  @override
  String get vectorIndex => 'Inkomba yeVector: HNSW';

  @override
  String get dimensions => 'Ubukhulu: 384';

  @override
  String get embeddingModelBge => 'Imodeli yokushumeka: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Thatha Isithombe';

  @override
  String get chooseFromGallery => 'Khetha kokuthi Igalari';

  @override
  String get editNickname => 'Hlela isiteketiso';

  @override
  String get enterNickname => 'Faka isiteketiso';

  @override
  String get pleaseEnterNickname => 'Sicela ufake isiteketiso';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Isiteketiso sesivele sikhona noma asivumelekile';

  @override
  String get user => 'Umsebenzisi';

  @override
  String get manageScheduledReminders =>
      'Phatha izikhumbuzi ezihleliwe nama-alamu';

  @override
  String get imageFailedToLoad =>
      'Isithombe sihlulekile ukulayishwa. Sicela ukhethe futhi.';

  @override
  String get imageIsStillLoading => 'Isithombe sisalayisha';

  @override
  String get imageAreaNotReady =>
      'Indawo yesithombe ayilungile. Sicela uzame futhi.';

  @override
  String get cropFrameNotReady =>
      'Uhlaka lokunqampuna alulungile. Sicela uzame futhi.';

  @override
  String get invalidCropArea =>
      'Indawo yokunqampuna engavumelekile. Sicela uzame futhi.';

  @override
  String get cropFailed => 'Ukunqampuna kuhlulekile. Sicela uzame futhi.';

  @override
  String get cropAvatar => 'Nqampuna i-Avatar';

  @override
  String get chooseAgain => 'Khetha Futhi';

  @override
  String get rotate90 => 'Zungezisa ngo-90°';

  @override
  String get dragFrameToMove =>
      'Hudula uhlaka ukuze uhambe, hudula phansi kwesokudla ukuze ushintshe usayizi; ncinza ukuze usondeze futhi uhambise isithombe.';

  @override
  String get pleaseFillInAllFields => 'Sicela ugcwalise zonke izinkambu';

  @override
  String get pinMustBeAtLeast4Digits =>
      'Iphinikhodi kufanele okungenani ibe namadijithi angu-4';

  @override
  String get pinAtLeast4Digits =>
      'Iphinikhodi kufanele okungenani ibe namadijithi angu-4';

  @override
  String get invalidUsernameOrPin =>
      'Igama lomsebenzisi elingavumelekile noma i-PIN';

  @override
  String get invalidUsernameOrPinError =>
      'Igama lomsebenzisi elingavumelekile noma i-PIN';

  @override
  String get usernameAlreadyExists => 'Igama lomsebenzisi selivele likhona';

  @override
  String get captureMomentsKeepMemories =>
      'Thatha izikhathi, gcina izinkumbulo';

  @override
  String get username => 'Igama lomsebenzisi';

  @override
  String get pin => 'I-PIN';

  @override
  String get login => 'Ngena ngemvume';

  @override
  String get createAccount => 'Yenza i-akhawunti';

  @override
  String get dontHaveAccountCreateOne => 'Awunayo i-akhawunti? Dala eyodwa';

  @override
  String get alreadyHaveAccountLogin =>
      'Usuvele unayo i-akhawunti? Ngena ngemvume';

  @override
  String get pleaseEnterUsername => 'Sicela ufake igama lomsebenzisi';

  @override
  String get pinsDoNotMatch => 'Ama-PIN awafani';

  @override
  String get tapToAddAvatar => 'Thepha ukuze wengeze isithombe';

  @override
  String get yourName => 'Igama lakho';

  @override
  String get privatePinOptional => 'Iphinikhodi eyimfihlo (uyazikhethela)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Isetshenziselwa ukubethela amarekhodi ayimfihlo';

  @override
  String get privatePin => 'Iphinikhodi eyimfihlo';

  @override
  String get leaveEmptyForNoEncryption =>
      'Shiya kungenalutho lapho kungekho ukubethela';

  @override
  String get confirmPin => 'Qinisekisa iphinikhodi';

  @override
  String get getStarted => 'Qalisa';

  @override
  String get noReminders => 'Azikho izikhumbuzi';

  @override
  String get addReminder => 'Engeza Isikhumbuzi';

  @override
  String get title => 'Isihloko';

  @override
  String get descriptionOptional => 'Incazelo (kuyakhetheka)';

  @override
  String get microphonePermissionRequired => 'Kudingeka imvume yemakrofoni';

  @override
  String get aiAssistant => 'Umsizi we-AI';

  @override
  String get listening => 'Ilalele...';

  @override
  String get typeAMessage => 'Thayipha umlayezo...';

  @override
  String get aiChat => 'Ingxoxo ye-AI';

  @override
  String get startAConversation => 'Qala ingxoxo';

  @override
  String get typeYourMessage => 'Thayipha umlayezo wakho...';

  @override
  String get asrReconnecting => 'I-ASR iyaxhuma kabusha...';

  @override
  String get write => 'Bhala';

  @override
  String get writeEntry => 'Bhala Okufakiwe';

  @override
  String get noMemoriesYet => 'Azikho izinkumbulo okwamanje';

  @override
  String get tapPlusToCapture => 'Thepha + ukuze uthwebule imicabango yakho';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Thepha + ukuze uthwebule imicabango yakho';

  @override
  String get deleteMemory => 'Susa Inkumbulo';

  @override
  String get deleteRecord => 'Susa Irekhodi';

  @override
  String get thisEntryWillBeRemoved =>
      'Lokhu okufakile kuzosuswa emugqeni wakho wesikhathi.';

  @override
  String get thisRecordWillBeRemoved =>
      'Leli rekhodi lizosuswa emugqeni wakho wesikhathi.';

  @override
  String get searchYourRecords => 'Sesha amarekhodi akho...';

  @override
  String get exactMatches => 'Ukufana Okuqondile';

  @override
  String get noExactMatches => 'Akukho okufanayo okuqondile';

  @override
  String get exact => 'Impela';

  @override
  String get exactMatch => 'Ukufana Okuqondile';

  @override
  String get fuzzyMatches => 'Ukufana Okungaqondakali';

  @override
  String get noFuzzyMatches => 'Akukho okufanayo okungaqondakali';

  @override
  String get vectorMatch => 'I-Vector Match';

  @override
  String get networkMatches => 'Okufanayo Kwenethiwekhi';

  @override
  String get noNetworkMatches => 'Akukho okufanayo kwenethiwekhi';

  @override
  String get networkSearchIsOff =>
      'Ukusesha kwenethiwekhi kuvaliwe. Inike amandla kokuthi Izilungiselelo.';

  @override
  String get network => 'Inethiwekhi';

  @override
  String get networkMatch => 'I-Network Match';

  @override
  String get noSearchHistory => 'Awukho umlando wosesho';

  @override
  String get searchHistory => 'Umlando Wokusesha';

  @override
  String get invalidLink => 'Isixhumanisi esingavumelekile';

  @override
  String get unableToOpenWebPage => 'Ayikwazi ukuvula ikhasi lewebhu';

  @override
  String get imageMemory => '[Inkumbulo yesithombe]';

  @override
  String get tapToOpenWebPage => 'Thepha ukuze uvule ikhasi lewebhu';

  @override
  String get editEntry => 'Hlela Okungenayo';

  @override
  String get entryDetails => 'Imininingwane Yokungena';

  @override
  String get noContent => 'Akukho okuqukethwe';

  @override
  String get diaryNotFound => 'Idayari ayitholakali';

  @override
  String get diaryNotFoundShort => 'Irekhodi alitholakali';

  @override
  String get aiSummary => 'Isifinyezo se-AI';

  @override
  String get microphoneInterrupted =>
      'Imakrofoni iphazamisekile, ukurekhoda kumisiwe.';

  @override
  String get bold => 'Okugqamile';

  @override
  String get italic => 'I-ithalikhi';

  @override
  String get strikethrough => 'I-Strikethrough';

  @override
  String get image => 'Isithombe';

  @override
  String get asrUnavailableRecordingActive =>
      'I-ASR ayitholakali. Ukurekhoda kusasebenza.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Bhala okufakile...';

  @override
  String get writeYourContent => 'Bhala okuqukethwe kwakho...';

  @override
  String microphoneStartFailed(String error) {
    return 'Yehlulekile ukuqalisa imakrofoni: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Imakrofoni iphazamisekile, ukurekhoda kumisiwe.';

  @override
  String asrReconnectingError(String error) {
    return 'I-ASR iyaxhuma kabusha: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Isithombe sifakiwe: $name';
  }

  @override
  String voiceError(String error) {
    return 'Iphutha lezwi: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Uxolo, isevisi ye-AI ayitholakali okwamanje: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Yehlulekile ukwabelana: $error';
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
    return '$matchType · $count amahithi';
  }

  @override
  String matchCount(int count) {
    return 'Fanisa: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Umthombo: $source';
  }

  @override
  String get createNew => 'Dala';

  @override
  String micStartFailed(String error) {
    return 'Ukuqala kwemakrofoni kuhlulekile: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Ama-akhawunti: +$created / abuyekeziwe $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Idayari: +$created / ibuyekeziwe $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Izikhumbuzi: +$created / zibuyekeziwe $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Kweqiwe: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Inani elishintshiwe: $count';
  }

  @override
  String get settingsApplied => 'Izilungiselelo eziyisipele zisetshenzisiwe.';

  @override
  String get settingsNotApplied =>
      'Izilungiselelo eziyisipele azizange zisetshenziswe.';

  @override
  String backupExported(String path) {
    return 'Isipele sikhishiwe: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Ukukhipha kuhlulekile: $error';
  }

  @override
  String importFailed(String error) {
    return 'Ukungenisa kwehlulekile: $error';
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

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Icelandic (`is`).
class AppLocalizationsIs extends AppLocalizations {
  AppLocalizationsIs([String locale = 'is']) : super(locale);

  @override
  String get languageName => 'Íslenska';

  @override
  String get languageNameEn => 'Icelandic';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Stillingar';

  @override
  String get account => 'Reikningur';

  @override
  String get reminders => 'Áminningar';

  @override
  String get language => 'Tungumál';

  @override
  String get appLanguage => 'Tungumál apps';

  @override
  String get appearance => 'Útlit';

  @override
  String get themeMode => 'Þemahamur';

  @override
  String get dark => 'Myrkur';

  @override
  String get light => 'Ljós';

  @override
  String get system => 'Kerfi';

  @override
  String get aiService => 'AI þjónusta';

  @override
  String get aiChatProvider => 'AI spjallveita';

  @override
  String get chatModel => 'Spjall líkan';

  @override
  String get localModel => 'Staðbundið líkan';

  @override
  String get localModelDefault => 'Staðbundið líkan (sjálfgefið)';

  @override
  String get ollamaEndpoint => 'Ollama endapunktur';

  @override
  String get ollamaModel => 'Ollama fyrirmynd';

  @override
  String get openAiEndpoint => 'OpenAI endapunktur';

  @override
  String get openAiApiKey => 'OpenAI API lykill';

  @override
  String get openAiModel => 'OpenAI líkan';

  @override
  String get geminiEndpoint => 'Gemini endapunktur';

  @override
  String get geminiApiKey => 'Gemini API lykill';

  @override
  String get geminiModel => 'Gemini líkan';

  @override
  String get anthropicEndpoint => 'Antropískur endapunktur';

  @override
  String get anthropicApiKey => 'Anthropic API lykill';

  @override
  String get anthropicModel => 'Mannræn fyrirmynd';

  @override
  String get customProtocol => 'Sérsniðin bókun';

  @override
  String get protocol => 'Bókun';

  @override
  String get customEndpoint => 'Sérsniðinn endapunktur';

  @override
  String get customApiKey => 'Sérsniðinn API lykill';

  @override
  String get customModel => 'Sérsniðin líkan';

  @override
  String get optionalForLocalServers =>
      'Valfrjálst fyrir staðbundna/sérsniðna netþjóna';

  @override
  String get speechRecognitionEngine => 'Talgreiningarvél';

  @override
  String get local => 'Staðbundið';

  @override
  String get endpoint => 'Endapunktur';

  @override
  String get localSpeechModel => 'Staðbundið tallíkan';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (í tæki)';

  @override
  String get systemSpeechRecognition => 'Kerfistalgreining';

  @override
  String get systemRecognitionAndroidIos => 'Kerfisþekking (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Endpunktagreining (ský/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Notaðu innbyggða Android / iOS auðkenningu (má nota ský)';

  @override
  String get voiceAiEndpoint => 'Rödd AI endapunktur';

  @override
  String get embeddingModel => 'Innfelling líkan';

  @override
  String get crossDeviceSync => 'Samstilling yfir tæki';

  @override
  String get sendToOtherDevices => 'Senda í önnur tæki (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Flyttu út öryggisafrit og sendu í gegnum deiliblað';

  @override
  String get importFromLocalSend => 'Flytja inn frá LocalSend';

  @override
  String get selectBackupJson =>
      'Veldu öryggisafrit af JSON og sameinaðu staðbundin gögn';

  @override
  String get autoGeneration => 'Sjálfvirk kynslóð';

  @override
  String get autoGenerateSummary => 'Mynda sjálfkrafa samantekt';

  @override
  String get generateAiSummaryForNewEntries =>
      'Búðu til gervigreindarsamantekt fyrir nýjar færslur';

  @override
  String get autoGenerateEmbedding => 'Mynda innfellingu sjálfkrafa';

  @override
  String get generateVectorEmbedding => 'Búðu til vektorinnfellingu fyrir leit';

  @override
  String get enableNetworkSearch => 'Virkja netleit';

  @override
  String get allowOnlineRetrieval =>
      'Leyfa sókn á netinu fyrir leit og gervigreind spjall (slökkt sjálfgefið)';

  @override
  String get about => 'Um';

  @override
  String version(String version) {
    return 'Útgáfa $version';
  }

  @override
  String get database => 'Gagnagrunnur';

  @override
  String get objectBoxWithHnsw => 'ObjectBox með HNSW vísitölu';

  @override
  String get logOut => 'Skráðu þig út';

  @override
  String get custom => 'Sérsniðin';

  @override
  String get openAiCompatible => 'OpenAI samhæft';

  @override
  String get notSet => 'Ekki stillt';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... eða http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Styður staðbundna/LAN/opinbera endapunkta';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend öryggisafrit';

  @override
  String get localBackupFromShiguang =>
      'Staðbundið öryggisafrit frá Shiguang (móttaka með LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Veldu öryggisafrit sem var móttekin frá LocalSend';

  @override
  String get failedToResolveFilePath => 'Mistókst að leysa valda skráarslóð';

  @override
  String get importOptions => 'Innflutningsvalkostir';

  @override
  String get importSettingsAsWell =>
      'Flytja líka inn stillingar?\n(API lyklum verður ekki skrifað yfir)';

  @override
  String get dataOnly => 'Aðeins gögn';

  @override
  String get dataAndSettings => 'Gögn + Stillingar';

  @override
  String get importCompleted => 'Innflutningi lokið';

  @override
  String get settingsInBackupWereApplied =>
      'Stillingar í öryggisafriti voru notaðar.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Stillingar í öryggisafriti voru ekki notaðar.';

  @override
  String get ok => 'Allt í lagi';

  @override
  String get cancel => 'Hætta við';

  @override
  String get save => 'Vista';

  @override
  String get delete => 'Eyða';

  @override
  String get clear => 'Hreinsa';

  @override
  String get add => 'Bæta við';

  @override
  String get create => 'Búa til';

  @override
  String get edit => 'Breyta';

  @override
  String get search => 'Leita';

  @override
  String get areYouSureYouWantToLogOut =>
      'Ertu viss um að þú viljir skrá þig út?';

  @override
  String get chooseLanguage => 'Veldu Tungumál';

  @override
  String get databaseInfo => 'Upplýsingar um gagnagrunn';

  @override
  String get storage => 'Geymsla: ObjectBox';

  @override
  String get vectorIndex => 'Vektorvísitala: HNSW';

  @override
  String get dimensions => 'Stærðir: 384';

  @override
  String get embeddingModelBge => 'Innfelling líkan: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Taktu mynd';

  @override
  String get chooseFromGallery => 'Veldu úr Gallerí';

  @override
  String get editNickname => 'Breyta gælunafni';

  @override
  String get enterNickname => 'Sláðu inn gælunafn';

  @override
  String get pleaseEnterNickname => 'Vinsamlegast sláðu inn gælunafn';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Gælunafn er þegar til eða er ógilt';

  @override
  String get user => 'Notandi';

  @override
  String get manageScheduledReminders =>
      'Stjórna áætluðum áminningum og viðvörunum';

  @override
  String get imageFailedToLoad =>
      'Ekki tókst að hlaða mynd. Vinsamlegast veldu aftur.';

  @override
  String get imageIsStillLoading => 'Myndin er enn að hlaðast inn';

  @override
  String get imageAreaNotReady =>
      'Myndsvæði er ekki tilbúið. Vinsamlegast reyndu aftur.';

  @override
  String get cropFrameNotReady =>
      'Skurðarrammi er ekki tilbúinn. Vinsamlegast reyndu aftur.';

  @override
  String get invalidCropArea =>
      'Ógilt uppskerusvæði. Vinsamlegast reyndu aftur.';

  @override
  String get cropFailed => 'Skera mistókst. Vinsamlegast reyndu aftur.';

  @override
  String get cropAvatar => 'Skera Avatar';

  @override
  String get chooseAgain => 'Veldu aftur';

  @override
  String get rotate90 => 'Snúið 90°';

  @override
  String get dragFrameToMove =>
      'Dragðu rammann til að færa, dragðu neðst til hægri til að breyta stærð; klíptu til að þysja og færa mynd.';

  @override
  String get pleaseFillInAllFields => 'Vinsamlegast fylltu út alla reiti';

  @override
  String get pinMustBeAtLeast4Digits =>
      'PIN-númer verður að vera að minnsta kosti 4 tölustafir';

  @override
  String get pinAtLeast4Digits =>
      'PIN-númer verður að vera að minnsta kosti 4 tölustafir';

  @override
  String get invalidUsernameOrPin => 'Ógilt notendanafn eða PIN-númer';

  @override
  String get invalidUsernameOrPinError => 'Ógilt notendanafn eða PIN-númer';

  @override
  String get usernameAlreadyExists => 'Notandanafn er þegar til';

  @override
  String get captureMomentsKeepMemories => 'Fanga augnablik, geymdu minningar';

  @override
  String get username => 'Notandanafn';

  @override
  String get pin => 'PIN-númer';

  @override
  String get login => 'Innskráning';

  @override
  String get createAccount => 'Búðu til reikning';

  @override
  String get dontHaveAccountCreateOne =>
      'Ertu ekki með reikning? Búðu til einn';

  @override
  String get alreadyHaveAccountLogin =>
      'Ertu nú þegar með reikning? Innskráning';

  @override
  String get pleaseEnterUsername => 'Vinsamlegast sláðu inn notandanafn';

  @override
  String get pinsDoNotMatch => 'PIN-númer passa ekki saman';

  @override
  String get tapToAddAvatar => 'Pikkaðu til að bæta við avatar';

  @override
  String get yourName => 'Nafn þitt';

  @override
  String get privatePinOptional => 'Einka PIN (valfrjálst)';

  @override
  String get usedToEncryptPrivateRecords => 'Notað til að dulkóða einkagögn';

  @override
  String get privatePin => 'Einka PIN';

  @override
  String get leaveEmptyForNoEncryption =>
      'Skildu eftir tómt fyrir enga dulkóðun';

  @override
  String get confirmPin => 'Staðfestu PIN';

  @override
  String get getStarted => 'Byrjaðu';

  @override
  String get noReminders => 'Engar áminningar';

  @override
  String get addReminder => 'Bæta við áminningu';

  @override
  String get title => 'Titill';

  @override
  String get descriptionOptional => 'Lýsing (valfrjálst)';

  @override
  String get microphonePermissionRequired => 'Hljóðnemaheimild krafist';

  @override
  String get aiAssistant => 'AI aðstoðarmaður';

  @override
  String get listening => 'Hlustar...';

  @override
  String get typeAMessage => 'Sláðu inn skilaboð...';

  @override
  String get aiChat => 'AI spjall';

  @override
  String get startAConversation => 'Byrjaðu samtal';

  @override
  String get typeYourMessage => 'Sláðu inn skilaboðin þín...';

  @override
  String get asrReconnecting => 'ASR tengir aftur...';

  @override
  String get write => 'Skrifaðu';

  @override
  String get writeEntry => 'Skrifaðu færslu';

  @override
  String get noMemoriesYet => 'Engar minningar ennþá';

  @override
  String get tapPlusToCapture => 'Ýttu á + til að fanga hugsanir þínar';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Ýttu á + til að fanga hugsanir þínar';

  @override
  String get deleteMemory => 'Eyða minni';

  @override
  String get deleteRecord => 'Eyða skrá';

  @override
  String get thisEntryWillBeRemoved =>
      'Þessi færsla verður fjarlægð af tímalínunni þinni.';

  @override
  String get thisRecordWillBeRemoved =>
      'Þessi skrá verður fjarlægð af tímalínunni þinni.';

  @override
  String get searchYourRecords => 'Leitaðu í skránum þínum...';

  @override
  String get exactMatches => 'Nákvæmar samsvörun';

  @override
  String get noExactMatches => 'Engar nákvæmar samsvörun';

  @override
  String get exact => 'Nákvæmlega';

  @override
  String get exactMatch => 'Nákvæm samsvörun';

  @override
  String get fuzzyMatches => 'Óljósar eldspýtur';

  @override
  String get noFuzzyMatches => 'Engar óljósar samsvörun';

  @override
  String get vectorMatch => 'Vector Match';

  @override
  String get networkMatches => 'Netsamsvörun';

  @override
  String get noNetworkMatches => 'Engin netsamsvörun';

  @override
  String get networkSearchIsOff =>
      'Slökkt er á netleit. Virkjaðu það í stillingum.';

  @override
  String get network => 'Net';

  @override
  String get networkMatch => 'Netsamsvörun';

  @override
  String get noSearchHistory => 'Enginn leitarferill';

  @override
  String get searchHistory => 'Leitarferill';

  @override
  String get invalidLink => 'Ógildur tengill';

  @override
  String get unableToOpenWebPage => 'Ekki tókst að opna vefsíðu';

  @override
  String get imageMemory => '[Myndarminni]';

  @override
  String get tapToOpenWebPage => 'Bankaðu til að opna vefsíðu';

  @override
  String get editEntry => 'Breyta færslu';

  @override
  String get entryDetails => 'Upplýsingar um inngöngu';

  @override
  String get noContent => 'Ekkert efni';

  @override
  String get diaryNotFound => 'Dagbók fannst ekki';

  @override
  String get diaryNotFoundShort => 'Skrá fannst ekki';

  @override
  String get aiSummary => 'AI samantekt';

  @override
  String get microphoneInterrupted => 'Hljóðnemi rofinn, upptaka stöðvuð.';

  @override
  String get bold => 'Djarft';

  @override
  String get italic => 'Skáletrun';

  @override
  String get strikethrough => 'Yfirstrikað';

  @override
  String get image => 'Mynd';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR ekki tiltækt. Upptaka er enn virk.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Skrifaðu færsluna þína...';

  @override
  String get writeYourContent => 'Skrifaðu efnið þitt...';

  @override
  String microphoneStartFailed(String error) {
    return 'Mistókst að ræsa hljóðnemann: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Hljóðnemi rofinn, upptaka stöðvuð.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR tengir aftur: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Mynd sett inn: $name';
  }

  @override
  String voiceError(String error) {
    return 'Raddvilla: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Því miður er gervigreind þjónusta ekki tiltæk eins og er: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Mistókst að deila: $error';
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
    return 'Samsvörun: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Heimild: $source';
  }

  @override
  String get createNew => 'Búa til';

  @override
  String micStartFailed(String error) {
    return 'Ekki tókst að ræsa hljóðnema: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Reikningar: +$created / uppfært $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Dagbækur: +$created / uppfært $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Áminningar: +$created / uppfært $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Sleppt: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Samtals breytt: $count';
  }

  @override
  String get settingsApplied => 'Stillingar í öryggisafriti voru notaðar.';

  @override
  String get settingsNotApplied =>
      'Stillingar í öryggisafriti voru ekki notaðar.';

  @override
  String backupExported(String path) {
    return 'Afrit flutt út: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Útflutningur mistókst: $error';
  }

  @override
  String importFailed(String error) {
    return 'Innflutningur mistókst: $error';
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

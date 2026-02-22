// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get languageName => 'Dansk';

  @override
  String get languageNameEn => 'Danish';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Indstillinger';

  @override
  String get account => 'Konto';

  @override
  String get reminders => 'Påmindelser';

  @override
  String get language => 'Sprog';

  @override
  String get appLanguage => 'App sprog';

  @override
  String get appearance => 'Udseende';

  @override
  String get themeMode => 'Tematilstand';

  @override
  String get dark => 'Mørk';

  @override
  String get light => 'Lys';

  @override
  String get system => 'System';

  @override
  String get aiService => 'AI Service';

  @override
  String get aiChatProvider => 'AI-chatudbyder';

  @override
  String get chatModel => 'Chat model';

  @override
  String get localModel => 'Lokal model';

  @override
  String get localModelDefault => 'Lokal model (standard)';

  @override
  String get ollamaEndpoint => 'Ollama endepunkt';

  @override
  String get ollamaModel => 'Ollama model';

  @override
  String get openAiEndpoint => 'OpenAI-endepunkt';

  @override
  String get openAiApiKey => 'OpenAI API nøgle';

  @override
  String get openAiModel => 'OpenAI model';

  @override
  String get geminiEndpoint => 'Gemini-endepunkt';

  @override
  String get geminiApiKey => 'Gemini API nøgle';

  @override
  String get geminiModel => 'Gemini model';

  @override
  String get anthropicEndpoint => 'Antropisk endepunkt';

  @override
  String get anthropicApiKey => 'Antropisk API-nøgle';

  @override
  String get anthropicModel => 'Antropisk model';

  @override
  String get customProtocol => 'Brugerdefineret protokol';

  @override
  String get protocol => 'Protokol';

  @override
  String get customEndpoint => 'Brugerdefineret slutpunkt';

  @override
  String get customApiKey => 'Brugerdefineret API-nøgle';

  @override
  String get customModel => 'Brugerdefineret model';

  @override
  String get optionalForLocalServers =>
      'Valgfrit for lokale/brugerdefinerede servere';

  @override
  String get speechRecognitionEngine => 'Talegenkendelsesmotor';

  @override
  String get local => 'Lokal';

  @override
  String get endpoint => 'Slutpunkt';

  @override
  String get localSpeechModel => 'Lokal talemodel';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (på enheden)';

  @override
  String get systemSpeechRecognition => 'System talegenkendelse';

  @override
  String get systemRecognitionAndroidIos => 'Systemgenkendelse (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Endpoint-genkendelse (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Brug indbygget Android / iOS-genkendelse (kan bruge cloud)';

  @override
  String get voiceAiEndpoint => 'Voice AI-endepunkt';

  @override
  String get embeddingModel => 'Indlejringsmodel';

  @override
  String get crossDeviceSync => 'Synkronisering på tværs af enheder';

  @override
  String get sendToOtherDevices => 'Send til andre enheder (LocalSend)';

  @override
  String get exportBackupAndSend => 'Eksporter backup og send via deleark';

  @override
  String get importFromLocalSend => 'Importer fra LocalSend';

  @override
  String get selectBackupJson => 'Vælg backup JSON og flet lokale data';

  @override
  String get autoGeneration => 'Autogenerering';

  @override
  String get autoGenerateSummary => 'Generer automatisk oversigt';

  @override
  String get generateAiSummaryForNewEntries =>
      'Generer AI-oversigt for nye poster';

  @override
  String get autoGenerateEmbedding => 'Generer automatisk indlejring';

  @override
  String get generateVectorEmbedding => 'Generer vektorindlejring til søgning';

  @override
  String get enableNetworkSearch => 'Aktiver netværkssøgning';

  @override
  String get allowOnlineRetrieval =>
      'Tillad online-hentning til søgning og AI-chat (deaktiveret som standard)';

  @override
  String get about => 'Om';

  @override
  String version(String version) {
    return 'Version $version';
  }

  @override
  String get database => 'Database';

  @override
  String get objectBoxWithHnsw => 'ObjectBox med HNSW indeks';

  @override
  String get logOut => 'Log ud';

  @override
  String get custom => 'Skik';

  @override
  String get openAiCompatible => 'OpenAI-kompatibel';

  @override
  String get notSet => 'Ikke indstillet';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... eller http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Understøtter lokale/LAN/offentlige endepunkter';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend Backup';

  @override
  String get localBackupFromShiguang =>
      'Lokal backup fra Shiguang (modtag via LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Vælg backupfil modtaget fra LocalSend';

  @override
  String get failedToResolveFilePath => 'Den valgte filsti kunne ikke løses';

  @override
  String get importOptions => 'Importindstillinger';

  @override
  String get importSettingsAsWell =>
      'Vil du også importere indstillinger?\n(API-nøgler vil ikke blive overskrevet)';

  @override
  String get dataOnly => 'Kun data';

  @override
  String get dataAndSettings => 'Data + Indstillinger';

  @override
  String get importCompleted => 'Import afsluttet';

  @override
  String get settingsInBackupWereApplied =>
      'Indstillinger i backup blev anvendt.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Indstillinger i backup blev ikke anvendt.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Ophæve';

  @override
  String get save => 'Spare';

  @override
  String get delete => 'Slet';

  @override
  String get clear => 'Klar';

  @override
  String get add => 'Tilføje';

  @override
  String get create => 'Skabe';

  @override
  String get edit => 'Redigere';

  @override
  String get search => 'Søge';

  @override
  String get areYouSureYouWantToLogOut =>
      'Er du sikker på, at du vil logge ud?';

  @override
  String get chooseLanguage => 'Vælg sprog';

  @override
  String get databaseInfo => 'Database info';

  @override
  String get storage => 'Opbevaring: ObjectBox';

  @override
  String get vectorIndex => 'Vektorindeks: HNSW';

  @override
  String get dimensions => 'Dimensioner: 384';

  @override
  String get embeddingModelBge => 'Indlejringsmodel: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Tag billede';

  @override
  String get chooseFromGallery => 'Vælg fra Galleri';

  @override
  String get editNickname => 'Rediger kaldenavn';

  @override
  String get enterNickname => 'Indtast kaldenavn';

  @override
  String get pleaseEnterNickname => 'Indtast venligst et kaldenavn';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Kaldenavnet findes allerede eller er ugyldigt';

  @override
  String get user => 'Bruger';

  @override
  String get manageScheduledReminders =>
      'Administrer planlagte påmindelser og alarmer';

  @override
  String get imageFailedToLoad =>
      'Billedet kunne ikke indlæses. Vælg venligst igen.';

  @override
  String get imageIsStillLoading => 'Billedet indlæses stadig';

  @override
  String get imageAreaNotReady =>
      'Billedområdet er ikke klar. Prøv venligst igen.';

  @override
  String get cropFrameNotReady =>
      'Beskæringsrammen er ikke klar. Prøv venligst igen.';

  @override
  String get invalidCropArea => 'Ugyldigt afgrødeområde. Prøv venligst igen.';

  @override
  String get cropFailed => 'Beskæring mislykkedes. Prøv venligst igen.';

  @override
  String get cropAvatar => 'Beskær avatar';

  @override
  String get chooseAgain => 'Vælg igen';

  @override
  String get rotate90 => 'Drej 90°';

  @override
  String get dragFrameToMove =>
      'Træk rammen for at flytte, træk nederst til højre for at ændre størrelsen; knib for at zoome og flytte billedet.';

  @override
  String get pleaseFillInAllFields => 'Udfyld venligst alle felter';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN-koden skal være på mindst 4 cifre';

  @override
  String get pinAtLeast4Digits => 'PIN-koden skal være på mindst 4 cifre';

  @override
  String get invalidUsernameOrPin => 'Ugyldigt brugernavn eller pinkode';

  @override
  String get invalidUsernameOrPinError => 'Ugyldigt brugernavn eller pinkode';

  @override
  String get usernameAlreadyExists => 'Brugernavn eksisterer allerede';

  @override
  String get captureMomentsKeepMemories => 'Fang øjeblikke, bevar minder';

  @override
  String get username => 'Brugernavn';

  @override
  String get pin => 'STIFT';

  @override
  String get login => 'Log ind';

  @override
  String get createAccount => 'Opret konto';

  @override
  String get dontHaveAccountCreateOne => 'Har du ikke en konto? Opret en';

  @override
  String get alreadyHaveAccountLogin => 'Har du allerede en konto? Log ind';

  @override
  String get pleaseEnterUsername => 'Indtast venligst et brugernavn';

  @override
  String get pinsDoNotMatch => 'PIN-koder stemmer ikke overens';

  @override
  String get tapToAddAvatar => 'Tryk for at tilføje avatar';

  @override
  String get yourName => 'Dit navn';

  @override
  String get privatePinOptional => 'Privat pinkode (valgfrit)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Bruges til at kryptere private optegnelser';

  @override
  String get privatePin => 'Privat pinkode';

  @override
  String get leaveEmptyForNoEncryption => 'Lad være tomt for ingen kryptering';

  @override
  String get confirmPin => 'Bekræft PIN-kode';

  @override
  String get getStarted => 'Kom i gang';

  @override
  String get noReminders => 'Ingen påmindelser';

  @override
  String get addReminder => 'Tilføj påmindelse';

  @override
  String get title => 'Titel';

  @override
  String get descriptionOptional => 'Beskrivelse (valgfrit)';

  @override
  String get microphonePermissionRequired => 'Mikrofontilladelse påkrævet';

  @override
  String get aiAssistant => 'AI assistent';

  @override
  String get listening => 'Lytter...';

  @override
  String get typeAMessage => 'Skriv en besked...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Start en samtale';

  @override
  String get typeYourMessage => 'Skriv din besked...';

  @override
  String get asrReconnecting => 'ASR genopretter forbindelse...';

  @override
  String get write => 'Skrive';

  @override
  String get writeEntry => 'Skriv indlæg';

  @override
  String get noMemoriesYet => 'Ingen minder endnu';

  @override
  String get tapPlusToCapture => 'Tryk på + for at fange dine tanker';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Tryk på + for at fange dine tanker';

  @override
  String get deleteMemory => 'Slet hukommelse';

  @override
  String get deleteRecord => 'Slet post';

  @override
  String get thisEntryWillBeRemoved =>
      'Denne post vil blive fjernet fra din tidslinje.';

  @override
  String get thisRecordWillBeRemoved =>
      'Denne registrering vil blive fjernet fra din tidslinje.';

  @override
  String get searchYourRecords => 'Søg i dine poster...';

  @override
  String get exactMatches => 'Præcise matcher';

  @override
  String get noExactMatches => 'Ingen nøjagtige matcher';

  @override
  String get exact => 'Nøjagtig';

  @override
  String get exactMatch => 'Præcis match';

  @override
  String get fuzzyMatches => 'Fuzzy kampe';

  @override
  String get noFuzzyMatches => 'Ingen fuzzy kampe';

  @override
  String get vectorMatch => 'Vektor Match';

  @override
  String get networkMatches => 'Netværkskampe';

  @override
  String get noNetworkMatches => 'Ingen netværk matcher';

  @override
  String get networkSearchIsOff =>
      'Netværkssøgning er slået fra. Aktiver det i Indstillinger.';

  @override
  String get network => 'Netværk';

  @override
  String get networkMatch => 'Netværksmatch';

  @override
  String get noSearchHistory => 'Ingen søgehistorik';

  @override
  String get searchHistory => 'Søgehistorik';

  @override
  String get invalidLink => 'Ugyldigt link';

  @override
  String get unableToOpenWebPage => 'Kan ikke åbne websiden';

  @override
  String get imageMemory => '[Billedhukommelse]';

  @override
  String get tapToOpenWebPage => 'Tryk for at åbne webside';

  @override
  String get editEntry => 'Rediger indtastning';

  @override
  String get entryDetails => 'Indgangsdetaljer';

  @override
  String get noContent => 'Intet indhold';

  @override
  String get diaryNotFound => 'Dagbog ikke fundet';

  @override
  String get diaryNotFoundShort => 'Optegnelsen blev ikke fundet';

  @override
  String get aiSummary => 'AI oversigt';

  @override
  String get microphoneInterrupted => 'Mikrofon afbrudt, optagelse stoppet.';

  @override
  String get bold => 'Dristig';

  @override
  String get italic => 'Kursiv';

  @override
  String get strikethrough => 'Gennemstregning';

  @override
  String get image => 'Billede';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR er ikke tilgængelig. Optagelsen er stadig aktiv.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Skriv dit indlæg...';

  @override
  String get writeYourContent => 'Skriv dit indhold...';

  @override
  String microphoneStartFailed(String error) {
    return 'Kunne ikke starte mikrofon: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofon afbrudt, optagelse stoppet.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR genopretter forbindelse: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Billede indsat: $name';
  }

  @override
  String voiceError(String error) {
    return 'Stemmefejl: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Beklager, AI-tjeneste er i øjeblikket ikke tilgængelig: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Kunne ikke dele: $error';
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
    return 'Kilde: $source';
  }

  @override
  String get createNew => 'Skabe';

  @override
  String micStartFailed(String error) {
    return 'Mikrofonstart mislykkedes: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Konti: +$created / opdateret $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Dagbøger: +$created / opdateret $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Påmindelser: +$created / opdateret $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Sprang over: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Samlet ændret: $count';
  }

  @override
  String get settingsApplied => 'Indstillinger i backup blev anvendt.';

  @override
  String get settingsNotApplied => 'Indstillinger i backup blev ikke anvendt.';

  @override
  String backupExported(String path) {
    return 'Sikkerhedskopiering eksporteret: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Eksport mislykkedes: $error';
  }

  @override
  String importFailed(String error) {
    return 'Import mislykkedes: $error';
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

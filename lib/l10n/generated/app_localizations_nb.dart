// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get languageName => 'Norsk bokmål';

  @override
  String get languageNameEn => 'Norwegian Bokmal';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Innstillinger';

  @override
  String get account => 'Konto';

  @override
  String get reminders => 'Påminnelser';

  @override
  String get language => 'Språk';

  @override
  String get appLanguage => 'App-språk';

  @override
  String get appearance => 'Utseende';

  @override
  String get themeMode => 'Temamodus';

  @override
  String get dark => 'Mørk';

  @override
  String get light => 'Lys';

  @override
  String get system => 'System';

  @override
  String get aiService => 'AI-tjeneste';

  @override
  String get aiChatProvider => 'AI Chat-leverandør';

  @override
  String get chatModel => 'Chat modell';

  @override
  String get localModel => 'Lokal modell';

  @override
  String get localModelDefault => 'Lokal modell (standard)';

  @override
  String get ollamaEndpoint => 'Ollama endepunkt';

  @override
  String get ollamaModel => 'Ollama modell';

  @override
  String get openAiEndpoint => 'OpenAI-endepunkt';

  @override
  String get openAiApiKey => 'OpenAI API-nøkkel';

  @override
  String get openAiModel => 'OpenAI-modell';

  @override
  String get geminiEndpoint => 'Gemini-endepunkt';

  @override
  String get geminiApiKey => 'Gemini API-nøkkel';

  @override
  String get geminiModel => 'Gemini modeller';

  @override
  String get anthropicEndpoint => 'Antropisk endepunkt';

  @override
  String get anthropicApiKey => 'Antropisk API-nøkkel';

  @override
  String get anthropicModel => 'Antropisk modell';

  @override
  String get customProtocol => 'Egendefinert protokoll';

  @override
  String get protocol => 'Protokoll';

  @override
  String get customEndpoint => 'Egendefinert endepunkt';

  @override
  String get customApiKey => 'Egendefinert API-nøkkel';

  @override
  String get customModel => 'Egendefinert modell';

  @override
  String get optionalForLocalServers =>
      'Valgfritt for lokale/tilpassede servere';

  @override
  String get speechRecognitionEngine => 'Motor for talegjenkjenning';

  @override
  String get local => 'Lokalt';

  @override
  String get endpoint => 'Endepunkt';

  @override
  String get localSpeechModel => 'Lokal talemodell';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (på enheten)';

  @override
  String get systemSpeechRecognition => 'System talegjenkjenning';

  @override
  String get systemRecognitionAndroidIos => 'Systemgjenkjenning (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Endpoint Recognition (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Bruk innebygd Android / iOS-gjenkjenner (kan bruke sky)';

  @override
  String get voiceAiEndpoint => 'Voice AI-endepunkt';

  @override
  String get embeddingModel => 'Innebyggingsmodell';

  @override
  String get crossDeviceSync => 'Synkronisering på tvers av enheter';

  @override
  String get sendToOtherDevices => 'Send til andre enheter (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Eksporter sikkerhetskopi og send via deleark';

  @override
  String get importFromLocalSend => 'Importer fra LocalSend';

  @override
  String get selectBackupJson => 'Velg backup JSON og slå sammen lokale data';

  @override
  String get autoGeneration => 'Auto generasjon';

  @override
  String get autoGenerateSummary => 'Generer sammendrag automatisk';

  @override
  String get generateAiSummaryForNewEntries =>
      'Generer AI-sammendrag for nye oppføringer';

  @override
  String get autoGenerateEmbedding => 'Autogenerer innebygging';

  @override
  String get generateVectorEmbedding => 'Generer vektorinnbygging for søk';

  @override
  String get enableNetworkSearch => 'Aktiver nettverkssøk';

  @override
  String get allowOnlineRetrieval =>
      'Tillat henting på nettet for søk og AI-chat (av som standard)';

  @override
  String get about => 'Om';

  @override
  String version(String version) {
    return 'Versjon $version';
  }

  @override
  String get database => 'Database';

  @override
  String get objectBoxWithHnsw => 'ObjectBox med HNSW-indeks';

  @override
  String get logOut => 'Logg ut';

  @override
  String get custom => 'Skikk';

  @override
  String get openAiCompatible => 'OpenAI-kompatibel';

  @override
  String get notSet => 'Ikke satt';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... eller http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Støtter lokale/LAN/offentlige endepunkter';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend Backup';

  @override
  String get localBackupFromShiguang =>
      'Lokal sikkerhetskopi fra Shiguang (motta via LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Velg sikkerhetskopifil mottatt fra LocalSend';

  @override
  String get failedToResolveFilePath => 'Kunne ikke løse valgt filbane';

  @override
  String get importOptions => 'Importalternativer';

  @override
  String get importSettingsAsWell =>
      'Vil du også importere innstillinger?\n(API-nøkler vil ikke bli overskrevet)';

  @override
  String get dataOnly => 'Kun data';

  @override
  String get dataAndSettings => 'Data + Innstillinger';

  @override
  String get importCompleted => 'Import fullført';

  @override
  String get settingsInBackupWereApplied =>
      'Innstillinger i sikkerhetskopiering ble brukt.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Innstillinger i sikkerhetskopiering ble ikke brukt.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Kansellere';

  @override
  String get save => 'Spare';

  @override
  String get delete => 'Slett';

  @override
  String get clear => 'Klar';

  @override
  String get add => 'Legge til';

  @override
  String get create => 'Skape';

  @override
  String get edit => 'Redigere';

  @override
  String get search => 'Søk';

  @override
  String get areYouSureYouWantToLogOut => 'Er du sikker på at du vil logge ut?';

  @override
  String get chooseLanguage => 'Velg Språk';

  @override
  String get databaseInfo => 'Database info';

  @override
  String get storage => 'Oppbevaring: ObjectBox';

  @override
  String get vectorIndex => 'Vektorindeks: HNSW';

  @override
  String get dimensions => 'Dimensjoner: 384';

  @override
  String get embeddingModelBge => 'Innebyggingsmodell: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Ta bilde';

  @override
  String get chooseFromGallery => 'Velg fra Galleri';

  @override
  String get editNickname => 'Rediger kallenavn';

  @override
  String get enterNickname => 'Skriv inn kallenavn';

  @override
  String get pleaseEnterNickname => 'Vennligst skriv inn et kallenavn';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Kallenavnet finnes allerede eller er ugyldig';

  @override
  String get user => 'Bruker';

  @override
  String get manageScheduledReminders =>
      'Administrer planlagte påminnelser og alarmer';

  @override
  String get imageFailedToLoad =>
      'Bildet kunne ikke lastes inn. Vennligst velg på nytt.';

  @override
  String get imageIsStillLoading => 'Bildet lastes fortsatt inn';

  @override
  String get imageAreaNotReady =>
      'Bildeområdet er ikke klart. Vennligst prøv igjen.';

  @override
  String get cropFrameNotReady =>
      'Beskjæringsrammen er ikke klar. Vennligst prøv igjen.';

  @override
  String get invalidCropArea =>
      'Ugyldig beskjæringsområde. Vennligst prøv igjen.';

  @override
  String get cropFailed => 'Beskjæringen mislyktes. Vennligst prøv igjen.';

  @override
  String get cropAvatar => 'Beskjær Avatar';

  @override
  String get chooseAgain => 'Velg på nytt';

  @override
  String get rotate90 => 'Roter 90°';

  @override
  String get dragFrameToMove =>
      'Dra rammen for å flytte, dra nederst til høyre for å endre størrelse; klyp for å zoome og flytte bildet.';

  @override
  String get pleaseFillInAllFields => 'Vennligst fyll ut alle feltene';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN-koden må bestå av minst 4 sifre';

  @override
  String get pinAtLeast4Digits => 'PIN-koden må bestå av minst 4 sifre';

  @override
  String get invalidUsernameOrPin => 'Ugyldig brukernavn eller PIN-kode';

  @override
  String get invalidUsernameOrPinError => 'Ugyldig brukernavn eller PIN-kode';

  @override
  String get usernameAlreadyExists => 'Brukernavnet eksisterer allerede';

  @override
  String get captureMomentsKeepMemories => 'Fang øyeblikk, bevar minner';

  @override
  String get username => 'Brukernavn';

  @override
  String get pin => 'PIN-kode';

  @override
  String get login => 'Logg inn';

  @override
  String get createAccount => 'Opprett konto';

  @override
  String get dontHaveAccountCreateOne => 'Har du ikke en konto? Lag en';

  @override
  String get alreadyHaveAccountLogin => 'Har du allerede en konto? Logg inn';

  @override
  String get pleaseEnterUsername => 'Vennligst skriv inn et brukernavn';

  @override
  String get pinsDoNotMatch => 'PIN-kodene stemmer ikke overens';

  @override
  String get tapToAddAvatar => 'Trykk for å legge til avatar';

  @override
  String get yourName => 'Ditt navn';

  @override
  String get privatePinOptional => 'Privat PIN-kode (valgfritt)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Brukes til å kryptere private poster';

  @override
  String get privatePin => 'Privat PIN-kode';

  @override
  String get leaveEmptyForNoEncryption => 'La stå tomt for ingen kryptering';

  @override
  String get confirmPin => 'Bekreft PIN';

  @override
  String get getStarted => 'Kom i gang';

  @override
  String get noReminders => 'Ingen påminnelser';

  @override
  String get addReminder => 'Legg til påminnelse';

  @override
  String get title => 'Tittel';

  @override
  String get descriptionOptional => 'Beskrivelse (valgfritt)';

  @override
  String get microphonePermissionRequired => 'Mikrofontillatelse kreves';

  @override
  String get aiAssistant => 'AI-assistent';

  @override
  String get listening => 'Lytter...';

  @override
  String get typeAMessage => 'Skriv inn en melding...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Start en samtale';

  @override
  String get typeYourMessage => 'Skriv inn meldingen din...';

  @override
  String get asrReconnecting => 'ASR kobler til på nytt...';

  @override
  String get write => 'Skrive';

  @override
  String get writeEntry => 'Skriv oppføring';

  @override
  String get noMemoriesYet => 'Ingen minner ennå';

  @override
  String get tapPlusToCapture => 'Trykk på + for å fange tankene dine';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Trykk på + for å fange tankene dine';

  @override
  String get deleteMemory => 'Slett minne';

  @override
  String get deleteRecord => 'Slett post';

  @override
  String get thisEntryWillBeRemoved =>
      'Denne oppføringen vil bli fjernet fra tidslinjen din.';

  @override
  String get thisRecordWillBeRemoved =>
      'Denne posten vil bli fjernet fra tidslinjen din.';

  @override
  String get searchYourRecords => 'Søk i postene dine...';

  @override
  String get exactMatches => 'Nøyaktige treff';

  @override
  String get noExactMatches => 'Ingen eksakte treff';

  @override
  String get exact => 'Nøyaktig';

  @override
  String get exactMatch => 'Nøyaktig match';

  @override
  String get fuzzyMatches => 'Fuzzy fyrstikker';

  @override
  String get noFuzzyMatches => 'Ingen uklare kamper';

  @override
  String get vectorMatch => 'Vektor Match';

  @override
  String get networkMatches => 'Nettverksmatcher';

  @override
  String get noNetworkMatches => 'Ingen nettverk samsvarer';

  @override
  String get networkSearchIsOff =>
      'Nettverkssøk er av. Aktiver det i Innstillinger.';

  @override
  String get network => 'Nettverk';

  @override
  String get networkMatch => 'Nettverksmatch';

  @override
  String get noSearchHistory => 'Ingen søkehistorikk';

  @override
  String get searchHistory => 'Søkehistorikk';

  @override
  String get invalidLink => 'Ugyldig link';

  @override
  String get unableToOpenWebPage => 'Kan ikke åpne nettsiden';

  @override
  String get imageMemory => '[Bildeminne]';

  @override
  String get tapToOpenWebPage => 'Trykk for å åpne nettsiden';

  @override
  String get editEntry => 'Rediger oppføring';

  @override
  String get entryDetails => 'Oppføringsdetaljer';

  @override
  String get noContent => 'Ikke noe innhold';

  @override
  String get diaryNotFound => 'Dagbok ikke funnet';

  @override
  String get diaryNotFoundShort => 'Finner ikke posten';

  @override
  String get aiSummary => 'Sammendrag av AI';

  @override
  String get microphoneInterrupted => 'Mikrofon avbrutt, opptaket stoppet.';

  @override
  String get bold => 'Fet';

  @override
  String get italic => 'Kursiv';

  @override
  String get strikethrough => 'Gjennomstreking';

  @override
  String get image => 'Bilde';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR utilgjengelig. Opptaket er fortsatt aktivt.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Skriv innlegget ditt...';

  @override
  String get writeYourContent => 'Skriv innholdet ditt...';

  @override
  String microphoneStartFailed(String error) {
    return 'Kunne ikke starte mikrofonen: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofon avbrutt, opptaket stoppet.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR kobler til på nytt: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Bilde satt inn: $name';
  }

  @override
  String voiceError(String error) {
    return 'Stemmefeil: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Beklager, AI-tjenesten er for øyeblikket utilgjengelig: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Kunne ikke dele: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count treff';
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
  String get createNew => 'Skape';

  @override
  String micStartFailed(String error) {
    return 'Mikrofonstart mislyktes: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Kontoer: +$created / oppdatert $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Dagbøker: +$created / oppdatert $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Påminnelser: +$created / oppdatert $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Hoppet over: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Totalt endret: $count';
  }

  @override
  String get settingsApplied =>
      'Innstillinger i sikkerhetskopiering ble brukt.';

  @override
  String get settingsNotApplied =>
      'Innstillinger i sikkerhetskopiering ble ikke brukt.';

  @override
  String backupExported(String path) {
    return 'Eksportert sikkerhetskopi: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Eksport mislyktes: $error';
  }

  @override
  String importFailed(String error) {
    return 'Import mislyktes: $error';
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

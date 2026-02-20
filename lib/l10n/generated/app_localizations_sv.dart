// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get languageName => 'Svenska';

  @override
  String get languageNameEn => 'Swedish';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Inställningar';

  @override
  String get account => 'Konto';

  @override
  String get reminders => 'Påminnelser';

  @override
  String get language => 'Språk';

  @override
  String get appLanguage => 'Appens språk';

  @override
  String get appearance => 'Utseende';

  @override
  String get themeMode => 'Temaläge';

  @override
  String get dark => 'Mörk';

  @override
  String get light => 'Ljus';

  @override
  String get system => 'System';

  @override
  String get aiService => 'AI-tjänst';

  @override
  String get aiChatProvider => 'AI-chattleverantör';

  @override
  String get chatModel => 'Chattmodell';

  @override
  String get localModel => 'Lokal modell';

  @override
  String get localModelDefault => 'Lokal modell (standard)';

  @override
  String get ollamaEndpoint => 'Ollama slutpunkt';

  @override
  String get ollamaModel => 'Ollama modell';

  @override
  String get openAiEndpoint => 'OpenAI Endpoint';

  @override
  String get openAiApiKey => 'OpenAI API-nyckel';

  @override
  String get openAiModel => 'OpenAI-modell';

  @override
  String get geminiEndpoint => 'Gemini Endpoint';

  @override
  String get geminiApiKey => 'Gemini API-nyckel';

  @override
  String get geminiModel => 'Gemini modeller';

  @override
  String get anthropicEndpoint => 'Antropisk slutpunkt';

  @override
  String get anthropicApiKey => 'Antropisk API-nyckel';

  @override
  String get anthropicModel => 'Antropisk modell';

  @override
  String get customProtocol => 'Anpassat protokoll';

  @override
  String get protocol => 'Protokoll';

  @override
  String get customEndpoint => 'Anpassad slutpunkt';

  @override
  String get customApiKey => 'Anpassad API-nyckel';

  @override
  String get customModel => 'Anpassad modell';

  @override
  String get optionalForLocalServers => 'Valfritt för lokala/anpassade servrar';

  @override
  String get speechRecognitionEngine => 'Taligenkänningsmotor';

  @override
  String get local => 'Lokal';

  @override
  String get endpoint => 'Slutpunkt';

  @override
  String get localSpeechModel => 'Lokal talmodell';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (på enheten)';

  @override
  String get systemSpeechRecognition => 'System taligenkänning';

  @override
  String get systemRecognitionAndroidIos => 'Systemigenkänning (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Slutpunktsigenkänning (moln/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Använd inbyggd Android / iOS-identifierare (kan använda moln)';

  @override
  String get voiceAiEndpoint => 'Voice AI Endpoint';

  @override
  String get embeddingModel => 'Inbäddningsmodell';

  @override
  String get crossDeviceSync => 'Synkronisering över flera enheter';

  @override
  String get sendToOtherDevices => 'Skicka till andra enheter (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Exportera säkerhetskopia och skicka via delningsark';

  @override
  String get importFromLocalSend => 'Importera från LocalSend';

  @override
  String get selectBackupJson => 'Välj backup JSON och slå samman lokala data';

  @override
  String get autoGeneration => 'Autogenerering';

  @override
  String get autoGenerateSummary => 'Generera sammanfattning automatiskt';

  @override
  String get generateAiSummaryForNewEntries =>
      'Generera AI-sammanfattning för nya poster';

  @override
  String get autoGenerateEmbedding => 'Generera inbäddning automatiskt';

  @override
  String get generateVectorEmbedding => 'Generera vektorinbäddning för sökning';

  @override
  String get enableNetworkSearch => 'Aktivera nätverkssökning';

  @override
  String get allowOnlineRetrieval =>
      'Tillåt hämtning online för sökning och AI-chatt (av som standard)';

  @override
  String get about => 'Om';

  @override
  String version(String version) {
    return 'Version $version';
  }

  @override
  String get database => 'Databas';

  @override
  String get objectBoxWithHnsw => 'ObjectBox med HNSW-index';

  @override
  String get logOut => 'Logga ut';

  @override
  String get custom => 'Beställnings';

  @override
  String get openAiCompatible => 'OpenAI-kompatibel';

  @override
  String get notSet => 'Inte inställt';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... eller http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'Stöder lokala/LAN/publika slutpunkter';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend Backup';

  @override
  String get localBackupFromShiguang =>
      'Lokal säkerhetskopiering från Shiguang (ta emot via LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Välj säkerhetskopia som tagits emot från LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Det gick inte att lösa den valda filsökvägen';

  @override
  String get importOptions => 'Importalternativ';

  @override
  String get importSettingsAsWell =>
      'Importera inställningar också?\n(API-nycklar kommer inte att skrivas över)';

  @override
  String get dataOnly => 'Endast data';

  @override
  String get dataAndSettings => 'Data + Inställningar';

  @override
  String get importCompleted => 'Importen slutförd';

  @override
  String get settingsInBackupWereApplied =>
      'Inställningar för säkerhetskopiering tillämpades.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Inställningar för säkerhetskopiering tillämpades inte.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Avboka';

  @override
  String get save => 'Spara';

  @override
  String get delete => 'Radera';

  @override
  String get clear => 'Rensa';

  @override
  String get add => 'Tillägga';

  @override
  String get create => 'Skapa';

  @override
  String get edit => 'Redigera';

  @override
  String get search => 'Söka';

  @override
  String get areYouSureYouWantToLogOut =>
      'Är du säker på att du vill logga ut?';

  @override
  String get chooseLanguage => 'Välj Språk';

  @override
  String get databaseInfo => 'Databas info';

  @override
  String get storage => 'Förvaring: ObjectBox';

  @override
  String get vectorIndex => 'Vektorindex: HNSW';

  @override
  String get dimensions => 'Mått: 384';

  @override
  String get embeddingModelBge => 'Inbäddningsmodell: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Ta foto';

  @override
  String get chooseFromGallery => 'Välj från Galleri';

  @override
  String get editNickname => 'Redigera smeknamn';

  @override
  String get enterNickname => 'Ange smeknamn';

  @override
  String get pleaseEnterNickname => 'Vänligen ange ett smeknamn';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Smeknamnet finns redan eller är ogiltigt';

  @override
  String get user => 'Användare';

  @override
  String get manageScheduledReminders =>
      'Hantera schemalagda påminnelser och larm';

  @override
  String get imageFailedToLoad =>
      'Det gick inte att ladda bilden. Vänligen välj igen.';

  @override
  String get imageIsStillLoading => 'Bilden laddas fortfarande';

  @override
  String get imageAreaNotReady => 'Bildområdet är inte klart. Försök igen.';

  @override
  String get cropFrameNotReady => 'Beskärningsramen är inte klar. Försök igen.';

  @override
  String get invalidCropArea => 'Ogiltigt odlingsområde. Försök igen.';

  @override
  String get cropFailed => 'Beskärningen misslyckades. Försök igen.';

  @override
  String get cropAvatar => 'Beskär Avatar';

  @override
  String get chooseAgain => 'Välj igen';

  @override
  String get rotate90 => 'Vrid 90°';

  @override
  String get dragFrameToMove =>
      'Dra ramen för att flytta, dra nere till höger för att ändra storlek; nyp för att zooma och flytta bilden.';

  @override
  String get pleaseFillInAllFields => 'Vänligen fyll i alla fält';

  @override
  String get pinMustBeAtLeast4Digits =>
      'PIN-koden måste vara minst fyra siffror';

  @override
  String get pinAtLeast4Digits => 'PIN-koden måste vara minst fyra siffror';

  @override
  String get invalidUsernameOrPin => 'Ogiltigt användarnamn eller PIN-kod';

  @override
  String get invalidUsernameOrPinError => 'Ogiltigt användarnamn eller PIN-kod';

  @override
  String get usernameAlreadyExists => 'Användarnamnet finns redan';

  @override
  String get captureMomentsKeepMemories => 'Fånga ögonblick, bevara minnen';

  @override
  String get username => 'Användarnamn';

  @override
  String get pin => 'STIFT';

  @override
  String get login => 'Inloggning';

  @override
  String get createAccount => 'Skapa konto';

  @override
  String get dontHaveAccountCreateOne => 'Har du inget konto? Skapa en';

  @override
  String get alreadyHaveAccountLogin => 'Har du redan ett konto? Inloggning';

  @override
  String get pleaseEnterUsername => 'Vänligen ange ett användarnamn';

  @override
  String get pinsDoNotMatch => 'PIN-koderna stämmer inte överens';

  @override
  String get tapToAddAvatar => 'Tryck för att lägga till avatar';

  @override
  String get yourName => 'Ditt namn';

  @override
  String get privatePinOptional => 'Privat PIN-kod (valfritt)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Används för att kryptera privata register';

  @override
  String get privatePin => 'Privat PIN-kod';

  @override
  String get leaveEmptyForNoEncryption => 'Lämna tomt för ingen kryptering';

  @override
  String get confirmPin => 'Bekräfta PIN-koden';

  @override
  String get getStarted => 'Kom igång';

  @override
  String get noReminders => 'Inga påminnelser';

  @override
  String get addReminder => 'Lägg till påminnelse';

  @override
  String get title => 'Titel';

  @override
  String get descriptionOptional => 'Beskrivning (valfritt)';

  @override
  String get microphonePermissionRequired => 'Mikrofontillstånd krävs';

  @override
  String get aiAssistant => 'AI-assistent';

  @override
  String get listening => 'Lyssnande...';

  @override
  String get typeAMessage => 'Skriv ett meddelande...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Starta en konversation';

  @override
  String get typeYourMessage => 'Skriv ditt meddelande...';

  @override
  String get asrReconnecting => 'ASR återansluter...';

  @override
  String get write => 'Skriva';

  @override
  String get writeEntry => 'Skriv inlägg';

  @override
  String get noMemoriesYet => 'Inga minnen än';

  @override
  String get tapPlusToCapture => 'Tryck på + för att fånga dina tankar';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Tryck på + för att fånga dina tankar';

  @override
  String get deleteMemory => 'Radera minne';

  @override
  String get deleteRecord => 'Ta bort post';

  @override
  String get thisEntryWillBeRemoved =>
      'Det här inlägget kommer att tas bort från din tidslinje.';

  @override
  String get thisRecordWillBeRemoved =>
      'Denna post kommer att tas bort från din tidslinje.';

  @override
  String get searchYourRecords => 'Sök i dina register...';

  @override
  String get exactMatches => 'Exakta matchningar';

  @override
  String get noExactMatches => 'Inga exakta matchningar';

  @override
  String get exact => 'Exakt';

  @override
  String get exactMatch => 'Exakt matchning';

  @override
  String get fuzzyMatches => 'Luddiga matcher';

  @override
  String get noFuzzyMatches => 'Inga luddiga matcher';

  @override
  String get vectorMatch => 'Vektor Match';

  @override
  String get networkMatches => 'Nätverksmatchningar';

  @override
  String get noNetworkMatches => 'Inga nätverksmatchningar';

  @override
  String get networkSearchIsOff =>
      'Nätverkssökning är avstängd. Aktivera det i Inställningar.';

  @override
  String get network => 'Nätverk';

  @override
  String get networkMatch => 'Nätverksmatchning';

  @override
  String get noSearchHistory => 'Ingen sökhistorik';

  @override
  String get searchHistory => 'Sökhistorik';

  @override
  String get invalidLink => 'Ogiltig länk';

  @override
  String get unableToOpenWebPage => 'Det går inte att öppna webbsidan';

  @override
  String get imageMemory => '[Bildminne]';

  @override
  String get tapToOpenWebPage => 'Tryck för att öppna webbsidan';

  @override
  String get editEntry => 'Redigera post';

  @override
  String get entryDetails => 'Inträdesdetaljer';

  @override
  String get noContent => 'Inget innehåll';

  @override
  String get diaryNotFound => 'Dagbok hittades inte';

  @override
  String get diaryNotFoundShort => 'Posten hittades inte';

  @override
  String get aiSummary => 'Sammanfattning av AI';

  @override
  String get microphoneInterrupted =>
      'Mikrofonen avbröts, inspelningen stoppades.';

  @override
  String get bold => 'Djärv';

  @override
  String get italic => 'Kursiv';

  @override
  String get strikethrough => 'Genomstruken';

  @override
  String get image => 'Bild';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR inte tillgänglig. Inspelningen är fortfarande aktiv.';

  @override
  String get writeYourEntry => 'Skriv ditt bidrag...';

  @override
  String get writeYourContent => 'Skriv ditt innehåll...';

  @override
  String microphoneStartFailed(String error) {
    return 'Det gick inte att starta mikrofonen: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofonen avbröts, inspelningen stoppades.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR återansluter: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Bild infogade: $name';
  }

  @override
  String voiceError(String error) {
    return 'Röstfel: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Tyvärr, AI-tjänsten är inte tillgänglig för närvarande: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Det gick inte att dela: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count träffar';
  }

  @override
  String matchCount(int count) {
    return 'Matchning: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Källa: $source';
  }

  @override
  String get createNew => 'Skapa';

  @override
  String micStartFailed(String error) {
    return 'Mikrofonstart misslyckades: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Konton: +$created / uppdaterad $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Dagböcker: +$created / uppdaterad $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Påminnelser: +$created / uppdaterad $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Hoppade över: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Totalt ändrat: $count';
  }

  @override
  String get settingsApplied =>
      'Inställningar för säkerhetskopiering tillämpades.';

  @override
  String get settingsNotApplied =>
      'Inställningar för säkerhetskopiering tillämpades inte.';

  @override
  String backupExported(String path) {
    return 'Säkerhetskopiering exporterad: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Export misslyckades: $error';
  }

  @override
  String importFailed(String error) {
    return 'Import misslyckades: $error';
  }
}

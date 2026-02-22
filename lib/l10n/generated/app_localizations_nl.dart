// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get languageName => 'Nederlands';

  @override
  String get languageNameEn => 'Dutch';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Instellingen';

  @override
  String get account => 'Rekening';

  @override
  String get reminders => 'Herinneringen';

  @override
  String get language => 'Taal';

  @override
  String get appLanguage => 'App-taal';

  @override
  String get appearance => 'Uiterlijk';

  @override
  String get themeMode => 'Themamodus';

  @override
  String get dark => 'Donker';

  @override
  String get light => 'Licht';

  @override
  String get system => 'Systeem';

  @override
  String get aiService => 'AI-service';

  @override
  String get aiChatProvider => 'AI-chatprovider';

  @override
  String get chatModel => 'Chatmodel';

  @override
  String get localModel => 'Lokaal model';

  @override
  String get localModelDefault => 'Lokaal model (Standaard)';

  @override
  String get ollamaEndpoint => 'Ollama-eindpunt';

  @override
  String get ollamaModel => 'Ollama-model';

  @override
  String get openAiEndpoint => 'OpenAI-eindpunt';

  @override
  String get openAiApiKey => 'OpenAI API-sleutel';

  @override
  String get openAiModel => 'OpenAI-model';

  @override
  String get geminiEndpoint => 'Gemini-eindpunt';

  @override
  String get geminiApiKey => 'Gemini API-sleutel';

  @override
  String get geminiModel => 'Gemini-model';

  @override
  String get anthropicEndpoint => 'Anthropic-eindpunt';

  @override
  String get anthropicApiKey => 'Anthropic API-sleutel';

  @override
  String get anthropicModel => 'Anthropic-model';

  @override
  String get customProtocol => 'Aangepast protocol';

  @override
  String get protocol => 'Protocol';

  @override
  String get customEndpoint => 'Aangepast eindpunt';

  @override
  String get customApiKey => 'Aangepaste API-sleutel';

  @override
  String get customModel => 'Aangepast model';

  @override
  String get optionalForLocalServers =>
      'Optioneel voor lokale/aangepaste servers';

  @override
  String get speechRecognitionEngine => 'Spraakherkenningsengine';

  @override
  String get local => 'Lokaal';

  @override
  String get endpoint => 'Eindpunt';

  @override
  String get localSpeechModel => 'Lokaal spraakmodel';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (op apparaat)';

  @override
  String get systemSpeechRecognition => 'Systeem spraakherkenning';

  @override
  String get systemRecognitionAndroidIos => 'Systeemherkenning (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Eindpuntherkenning (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Gebruik ingebouwde Android/iOS-herkenner (kan cloud gebruiken)';

  @override
  String get voiceAiEndpoint => 'Voice AI-eindpunt';

  @override
  String get embeddingModel => 'Embedding-model';

  @override
  String get crossDeviceSync => 'Apparaatoverschrijdende synchronisatie';

  @override
  String get sendToOtherDevices => 'Naar andere apparaten sturen (LocalSend)';

  @override
  String get exportBackupAndSend => 'Backup exporteren en versturen';

  @override
  String get importFromLocalSend => 'Van LocalSend importeren';

  @override
  String get selectBackupJson =>
      'Backup JSON selecteren en lokale gegevens samenvoegen';

  @override
  String get autoGeneration => 'Automatische generatie';

  @override
  String get autoGenerateSummary => 'Automatisch samenvatting genereren';

  @override
  String get generateAiSummaryForNewEntries =>
      'AI-samenvatting genereren voor nieuwe items';

  @override
  String get autoGenerateEmbedding => 'Automatisch embedding genereren';

  @override
  String get generateVectorEmbedding =>
      'Vector embedding genereren voor zoeken';

  @override
  String get enableNetworkSearch => 'Netwerkzoeken inschakelen';

  @override
  String get allowOnlineRetrieval =>
      'Online ophalen toestaan voor zoeken en AI-chat (standaard uit)';

  @override
  String get about => 'Over';

  @override
  String version(String version) {
    return 'Versie $version';
  }

  @override
  String get database => 'Database';

  @override
  String get objectBoxWithHnsw => 'ObjectBox met HNSW-index';

  @override
  String get logOut => 'Uitloggen';

  @override
  String get custom => 'Aangepast';

  @override
  String get openAiCompatible => 'OpenAI-compatibel';

  @override
  String get notSet => 'Niet ingesteld';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... of http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Ondersteunt lokale/LAN/openbare eindpunten';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend-backup';

  @override
  String get localBackupFromShiguang =>
      'Lokale backup van Shiguang (ontvangen via LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Selecteer backup-bestand ontvangen van LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Kon geselecteerde bestandspad niet oplossen';

  @override
  String get importOptions => 'Importopties';

  @override
  String get importSettingsAsWell =>
      'Instellingen ook importeren?\n(API-sleutels worden niet overschreven)';

  @override
  String get dataOnly => 'Alleen gegevens';

  @override
  String get dataAndSettings => 'Gegevens + Instellingen';

  @override
  String get importCompleted => 'Import voltooid';

  @override
  String get settingsInBackupWereApplied =>
      'Instellingen in backup zijn toegepast.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Instellingen in backup zijn niet toegepast.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Annuleren';

  @override
  String get save => 'Opslaan';

  @override
  String get delete => 'Verwijderen';

  @override
  String get clear => 'Wissen';

  @override
  String get add => 'Toevoegen';

  @override
  String get create => 'Maken';

  @override
  String get edit => 'Bewerken';

  @override
  String get search => 'Zoeken';

  @override
  String get areYouSureYouWantToLogOut => 'Weet u zeker dat u wilt uitloggen?';

  @override
  String get chooseLanguage => 'Taal kiezen';

  @override
  String get databaseInfo => 'Database-informatie';

  @override
  String get storage => 'Opslag: ObjectBox';

  @override
  String get vectorIndex => 'Vectorindex: HNSW';

  @override
  String get dimensions => 'Dimensies: 384';

  @override
  String get embeddingModelBge => 'Embedding-model: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Foto maken';

  @override
  String get chooseFromGallery => 'Uit galerie kiezen';

  @override
  String get editNickname => 'Bijnaam bewerken';

  @override
  String get enterNickname => 'Bijnaam invoeren';

  @override
  String get pleaseEnterNickname => 'Voer een bijnaam in';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Bijnaam bestaat al of is ongeldig';

  @override
  String get user => 'Gebruiker';

  @override
  String get manageScheduledReminders =>
      'Geplande herinneringen en alarmen beheren';

  @override
  String get imageFailedToLoad => 'Afbeelding laden mislukt. Kies opnieuw.';

  @override
  String get imageIsStillLoading => 'Afbeelding wordt nog geladen';

  @override
  String get imageAreaNotReady =>
      'Afbeeldingsgebied niet klaar. Probeer opnieuw.';

  @override
  String get cropFrameNotReady => 'Snijframe niet klaar. Probeer opnieuw.';

  @override
  String get invalidCropArea => 'Ongeldig snijgebied. Probeer opnieuw.';

  @override
  String get cropFailed => 'Snijden mislukt. Probeer opnieuw.';

  @override
  String get cropAvatar => 'Avatar bijsnijden';

  @override
  String get chooseAgain => 'Opnieuw kiezen';

  @override
  String get rotate90 => '90 graden draaien';

  @override
  String get dragFrameToMove =>
      'Frame slepen om te verplaatsen, rechtsonder slepen om te vergroten; knijpen om in te zoomen en afbeelding te verplaatsen.';

  @override
  String get pleaseFillInAllFields => 'Vul alle velden in';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN moet minimaal 4 cijfers hebben';

  @override
  String get pinAtLeast4Digits => 'PIN minimaal 4 cijfers';

  @override
  String get invalidUsernameOrPin => 'Ongeldige gebruikersnaam of PIN';

  @override
  String get invalidUsernameOrPinError => 'Ongeldige gebruikersnaam of PIN';

  @override
  String get usernameAlreadyExists => 'Gebruikersnaam bestaat al';

  @override
  String get captureMomentsKeepMemories =>
      'Momenten vastleggen, herinneringen bewaren';

  @override
  String get username => 'Gebruikersnaam';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Inloggen';

  @override
  String get createAccount => 'Account maken';

  @override
  String get dontHaveAccountCreateOne => 'Geen account? Maak er een';

  @override
  String get alreadyHaveAccountLogin => 'Al een account? Inloggen';

  @override
  String get pleaseEnterUsername => 'Voer een gebruikersnaam in';

  @override
  String get pinsDoNotMatch => 'PINs komen niet overeen';

  @override
  String get tapToAddAvatar => 'Tik om avatar toe te voegen';

  @override
  String get yourName => 'Jouw naam';

  @override
  String get privatePinOptional => 'Privé PIN (optioneel)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Gebruikt om privé records te versleutelen';

  @override
  String get privatePin => 'Privé PIN';

  @override
  String get leaveEmptyForNoEncryption => 'Leeglaten voor geen versleuteling';

  @override
  String get confirmPin => 'PIN bevestigen';

  @override
  String get getStarted => 'Beginnen';

  @override
  String get noReminders => 'Geen herinneringen';

  @override
  String get addReminder => 'Herinnering toevoegen';

  @override
  String get title => 'Titel';

  @override
  String get descriptionOptional => 'Beschrijving (optioneel)';

  @override
  String get microphonePermissionRequired => 'Microfoonmachtiging vereist';

  @override
  String get aiAssistant => 'AI-assistent';

  @override
  String get listening => 'Luisteren...';

  @override
  String get typeAMessage => 'Typ een bericht...';

  @override
  String get aiChat => 'AI-chat';

  @override
  String get startAConversation => 'Start een gesprek';

  @override
  String get typeYourMessage => 'Typ je bericht...';

  @override
  String get asrReconnecting => 'ASR opnieuw verbinden...';

  @override
  String get write => 'Schrijven';

  @override
  String get writeEntry => 'Item schrijven';

  @override
  String get noMemoriesYet => 'Nog geen herinneringen';

  @override
  String get tapPlusToCapture => 'Tik op + om je gedachten vast te leggen';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Tik op + om je gedachten vast te leggen';

  @override
  String get deleteMemory => 'Herinnering verwijderen';

  @override
  String get deleteRecord => 'Record verwijderen';

  @override
  String get thisEntryWillBeRemoved =>
      'Dit item wordt van je tijdlijn verwijderd.';

  @override
  String get thisRecordWillBeRemoved =>
      'Dit record wordt van je tijdlijn verwijderd.';

  @override
  String get searchYourRecords => 'Doorzoek je records...';

  @override
  String get exactMatches => 'Exacte overeenkomsten';

  @override
  String get noExactMatches => 'Geen exacte overeenkomsten';

  @override
  String get exact => 'Exact';

  @override
  String get exactMatch => 'Exacte overeenkomst';

  @override
  String get fuzzyMatches => 'Vage overeenkomsten';

  @override
  String get noFuzzyMatches => 'Geen vage overeenkomsten';

  @override
  String get vectorMatch => 'Vectorovereenkomst';

  @override
  String get networkMatches => 'Netwerkovereenkomsten';

  @override
  String get noNetworkMatches => 'Geen netwerkovereenkomsten';

  @override
  String get networkSearchIsOff =>
      'Netwerkzoeken is uit. Schakel het in in Instellingen.';

  @override
  String get network => 'Netwerk';

  @override
  String get networkMatch => 'Netwerkovereenkomst';

  @override
  String get noSearchHistory => 'Geen zoekgeschiedenis';

  @override
  String get searchHistory => 'Zoekgeschiedenis';

  @override
  String get invalidLink => 'Ongeldige link';

  @override
  String get unableToOpenWebPage => 'Kan webpagina niet openen';

  @override
  String get imageMemory => '[Afbeeldingsherinnering]';

  @override
  String get tapToOpenWebPage => 'Tik om webpagina te openen';

  @override
  String get editEntry => 'Item bewerken';

  @override
  String get entryDetails => 'Itemdetails';

  @override
  String get noContent => 'Geen inhoud';

  @override
  String get diaryNotFound => 'Dagboek niet gevonden';

  @override
  String get diaryNotFoundShort => 'Record niet gevonden';

  @override
  String get aiSummary => 'AI-samenvatting';

  @override
  String get microphoneInterrupted => 'Microfoon onderbroken, opname gestopt.';

  @override
  String get bold => 'Vet';

  @override
  String get italic => 'Cursief';

  @override
  String get strikethrough => 'Doorhalen';

  @override
  String get image => 'Afbeelding';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR niet beschikbaar. Opname is nog actief.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Schrijf je item...';

  @override
  String get writeYourContent => 'Schrijf je inhoud...';

  @override
  String microphoneStartFailed(String error) {
    return 'Microfoon starten mislukt: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Microfoon onderbroken, opname gestopt.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR opnieuw verbinden: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Afbeelding ingevoegd: $name';
  }

  @override
  String voiceError(String error) {
    return 'Spraakfout: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Sorry, AI-service is momenteel niet beschikbaar: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Delen mislukt: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count resultaten';
  }

  @override
  String matchCount(int count) {
    return 'Overeenkomst: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Bron: $source';
  }

  @override
  String get createNew => 'Maken';

  @override
  String micStartFailed(String error) {
    return 'Microfoon starten mislukt: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Accounts: +$created / bijgewerkt $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Dagboeken: +$created / bijgewerkt $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Herinneringen: +$created / bijgewerkt $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Overgeslagen: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Totaal gewijzigd: $count';
  }

  @override
  String get settingsApplied => 'Instellingen in backup zijn toegepast.';

  @override
  String get settingsNotApplied =>
      'Instellingen in backup zijn niet toegepast.';

  @override
  String backupExported(String path) {
    return 'Backup geëxporteerd: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Exporteren mislukt: $error';
  }

  @override
  String importFailed(String error) {
    return 'Importeren mislukt: $error';
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

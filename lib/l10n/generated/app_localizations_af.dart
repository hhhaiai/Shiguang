// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Afrikaans (`af`).
class AppLocalizationsAf extends AppLocalizations {
  AppLocalizationsAf([String locale = 'af']) : super(locale);

  @override
  String get languageName => 'Afrikaans';

  @override
  String get languageNameEn => 'Afrikaans';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Instellings';

  @override
  String get account => 'Rekening';

  @override
  String get reminders => 'Herinneringe';

  @override
  String get language => 'Taal';

  @override
  String get appLanguage => 'App Taal';

  @override
  String get appearance => 'Voorkoms';

  @override
  String get themeMode => 'Tema-modus';

  @override
  String get dark => 'Donker';

  @override
  String get light => 'Lig';

  @override
  String get system => 'Stelsel';

  @override
  String get aiService => 'KI diens';

  @override
  String get aiChatProvider => 'AI Chat Verskaffer';

  @override
  String get chatModel => 'Kletsmodel';

  @override
  String get localModel => 'Plaaslike Model';

  @override
  String get localModelDefault => 'Plaaslike model (verstek)';

  @override
  String get ollamaEndpoint => 'Ollama Eindpunt';

  @override
  String get ollamaModel => 'Ollama Model';

  @override
  String get openAiEndpoint => 'OpenAI Eindpunt';

  @override
  String get openAiApiKey => 'OpenAI API-sleutel';

  @override
  String get openAiModel => 'OpenAI Model';

  @override
  String get geminiEndpoint => 'Tweeling eindpunt';

  @override
  String get geminiApiKey => 'Tweeling API-sleutel';

  @override
  String get geminiModel => 'Tweeling modelle';

  @override
  String get anthropicEndpoint => 'Antropiese eindpunt';

  @override
  String get anthropicApiKey => 'Antropiese API-sleutel';

  @override
  String get anthropicModel => 'Antropiese model';

  @override
  String get customProtocol => 'Pasgemaakte protokol';

  @override
  String get protocol => 'Protokol';

  @override
  String get customEndpoint => 'Pasgemaakte eindpunt';

  @override
  String get customApiKey => 'Pasgemaakte API-sleutel';

  @override
  String get customModel => 'Pasgemaakte model';

  @override
  String get optionalForLocalServers =>
      'Opsioneel vir plaaslike/pasgemaakte bedieners';

  @override
  String get speechRecognitionEngine => 'Spraakherkenningsenjin';

  @override
  String get local => 'Plaaslik';

  @override
  String get endpoint => 'Eindpunt';

  @override
  String get localSpeechModel => 'Plaaslike spraakmodel';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (op toestel)';

  @override
  String get systemSpeechRecognition => 'Stelsel spraakherkenning';

  @override
  String get systemRecognitionAndroidIos => 'Stelselherkenning (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Eindpuntherkenning (Wolk/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Gebruik ingeboude Android / iOS-herkenner (kan wolk gebruik)';

  @override
  String get voiceAiEndpoint => 'Stem AI Eindpunt';

  @override
  String get embeddingModel => 'Inbedding Model';

  @override
  String get crossDeviceSync => 'Kruis-toestel-sinkronisering';

  @override
  String get sendToOtherDevices => 'Stuur na ander toestelle (LocalSend)';

  @override
  String get exportBackupAndSend => 'Voer rugsteun uit en stuur via deelblad';

  @override
  String get importFromLocalSend => 'Voer in vanaf LocalSend';

  @override
  String get selectBackupJson =>
      'Kies rugsteun JSON en voeg plaaslike data saam';

  @override
  String get autoGeneration => 'Auto Generasie';

  @override
  String get autoGenerateSummary => 'Genereer outomaties opsomming';

  @override
  String get generateAiSummaryForNewEntries =>
      'Genereer KI-opsomming vir nuwe inskrywings';

  @override
  String get autoGenerateEmbedding => 'Genereer outomaties inbedding';

  @override
  String get generateVectorEmbedding => 'Genereer vektor-inbedding vir soek';

  @override
  String get enableNetworkSearch => 'Aktiveer netwerksoektog';

  @override
  String get allowOnlineRetrieval =>
      'Laat aanlyn herwinning toe vir soektog en KI-klets (by verstek af)';

  @override
  String get about => 'Oor';

  @override
  String version(String version) {
    return 'Weergawe $version';
  }

  @override
  String get database => 'Databasis';

  @override
  String get objectBoxWithHnsw => 'ObjectBox met HNSW-indeks';

  @override
  String get logOut => 'Teken uit';

  @override
  String get custom => 'Pasgemaak';

  @override
  String get openAiCompatible => 'OpenAI-versoenbaar';

  @override
  String get notSet => 'Nie gestel nie';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Ondersteun plaaslike/LAN/publieke eindpunte';

  @override
  String get shiguangLocalSendBackup => 'Shiguang Plaaslik Stuur rugsteun';

  @override
  String get localBackupFromShiguang =>
      'Plaaslike rugsteun van Shiguang (ontvang via LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Kies rugsteunlêer wat vanaf LocalSend ontvang is';

  @override
  String get failedToResolveFilePath =>
      'Kon nie geselekteerde lêerpad oplos nie';

  @override
  String get importOptions => 'Invoeropsies';

  @override
  String get importSettingsAsWell =>
      'Voer instellings ook in?\n(API-sleutels sal nie oorskryf word nie)';

  @override
  String get dataOnly => 'Slegs data';

  @override
  String get dataAndSettings => 'Data + instellings';

  @override
  String get importCompleted => 'Invoer voltooi';

  @override
  String get settingsInBackupWereApplied =>
      'Instellings in rugsteun is toegepas.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Instellings in rugsteun is nie toegepas nie.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Kanselleer';

  @override
  String get save => 'Stoor';

  @override
  String get delete => 'Vee uit';

  @override
  String get clear => 'Duidelik';

  @override
  String get add => 'Voeg by';

  @override
  String get create => 'Skep';

  @override
  String get edit => 'Wysig';

  @override
  String get search => 'Soek';

  @override
  String get areYouSureYouWantToLogOut => 'Is jy seker jy wil afmeld?';

  @override
  String get chooseLanguage => 'Kies Taal';

  @override
  String get databaseInfo => 'Databasis inligting';

  @override
  String get storage => 'Berging: ObjectBox';

  @override
  String get vectorIndex => 'Vektorindeks: HNSW';

  @override
  String get dimensions => 'Afmetings: 384';

  @override
  String get embeddingModelBge => 'Inbeddingsmodel: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Neem Foto';

  @override
  String get chooseFromGallery => 'Kies uit Gallery';

  @override
  String get editNickname => 'Wysig bynaam';

  @override
  String get enterNickname => 'Voer bynaam in';

  @override
  String get pleaseEnterNickname => 'Voer asseblief \'n bynaam in';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Bynaam bestaan ​​reeds of is ongeldig';

  @override
  String get user => 'Gebruiker';

  @override
  String get manageScheduledReminders =>
      'Bestuur geskeduleerde aanmanings en alarms';

  @override
  String get imageFailedToLoad =>
      'Kon nie prent laai nie. Kies asseblief weer.';

  @override
  String get imageIsStillLoading => 'Prent laai steeds';

  @override
  String get imageAreaNotReady =>
      'Prentarea is nie gereed nie. Probeer asseblief weer.';

  @override
  String get cropFrameNotReady =>
      'Snyraam is nie gereed nie. Probeer asseblief weer.';

  @override
  String get invalidCropArea => 'Ongeldige oesarea. Probeer asseblief weer.';

  @override
  String get cropFailed => 'Sny het misluk. Probeer asseblief weer.';

  @override
  String get cropAvatar => 'Sny Avatar';

  @override
  String get chooseAgain => 'Kies weer';

  @override
  String get rotate90 => 'Draai 90°';

  @override
  String get dragFrameToMove =>
      'Sleep die raam om te beweeg, sleep regs onder om die grootte te verander; knyp om te zoem en prent te skuif.';

  @override
  String get pleaseFillInAllFields => 'Vul asseblief alle velde in';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN moet ten minste 4 syfers wees';

  @override
  String get pinAtLeast4Digits => 'PIN moet ten minste 4 syfers wees';

  @override
  String get invalidUsernameOrPin => 'Ongeldige gebruikernaam of PIN';

  @override
  String get invalidUsernameOrPinError => 'Ongeldige gebruikernaam of PIN';

  @override
  String get usernameAlreadyExists => 'Gebruikersnaam bestaan ​​reeds';

  @override
  String get captureMomentsKeepMemories =>
      'Vang oomblikke vas, hou herinneringe';

  @override
  String get username => 'Gebruikersnaam';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Teken in';

  @override
  String get createAccount => 'Skep rekening';

  @override
  String get dontHaveAccountCreateOne =>
      'Het jy nie \'n rekening nie? Skep een';

  @override
  String get alreadyHaveAccountLogin => 'Het jy reeds \'n rekening? Teken in';

  @override
  String get pleaseEnterUsername => 'Voer asseblief \'n gebruikernaam in';

  @override
  String get pinsDoNotMatch => 'PIN\'s stem nie ooreen nie';

  @override
  String get tapToAddAvatar => 'Tik om avatar by te voeg';

  @override
  String get yourName => 'Jou Naam';

  @override
  String get privatePinOptional => 'Privaat PIN (opsioneel)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Word gebruik om privaat rekords te enkripteer';

  @override
  String get privatePin => 'Privaat PIN';

  @override
  String get leaveEmptyForNoEncryption => 'Laat leeg vir geen enkripsie';

  @override
  String get confirmPin => 'Bevestig PIN';

  @override
  String get getStarted => 'Begin';

  @override
  String get noReminders => 'Geen aanmanings nie';

  @override
  String get addReminder => 'Voeg herinnering by';

  @override
  String get title => 'Titel';

  @override
  String get descriptionOptional => 'Beskrywing (opsioneel)';

  @override
  String get microphonePermissionRequired => 'Mikrofoontoestemming word vereis';

  @override
  String get aiAssistant => 'KI assistent';

  @override
  String get listening => 'Luister tans...';

  @override
  String get typeAMessage => 'Tik \'n boodskap...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Begin \'n gesprek';

  @override
  String get typeYourMessage => 'Tik jou boodskap...';

  @override
  String get asrReconnecting => 'ASR koppel tans weer …';

  @override
  String get write => 'Skryf';

  @override
  String get writeEntry => 'Skryf Inskrywing';

  @override
  String get noMemoriesYet => 'Nog geen herinneringe nie';

  @override
  String get tapPlusToCapture => 'Tik op + om jou gedagtes vas te vang';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Tik op + om jou gedagtes vas te vang';

  @override
  String get deleteMemory => 'Vee geheue uit';

  @override
  String get deleteRecord => 'Vee Rekord uit';

  @override
  String get thisEntryWillBeRemoved =>
      'Hierdie inskrywing sal van jou tydlyn verwyder word.';

  @override
  String get thisRecordWillBeRemoved =>
      'Hierdie rekord sal van jou tydlyn verwyder word.';

  @override
  String get searchYourRecords => 'Deursoek jou rekords...';

  @override
  String get exactMatches => 'Presiese passings';

  @override
  String get noExactMatches => 'Geen presiese passings nie';

  @override
  String get exact => 'Presies';

  @override
  String get exactMatch => 'Presiese passing';

  @override
  String get fuzzyMatches => 'Fuzzy Wedstryde';

  @override
  String get noFuzzyMatches => 'Geen fuzzy wedstryde nie';

  @override
  String get vectorMatch => 'Vector Match';

  @override
  String get networkMatches => 'Netwerk wedstryde';

  @override
  String get noNetworkMatches => 'Geen netwerk pas nie';

  @override
  String get networkSearchIsOff =>
      'Netwerksoektog is af. Aktiveer dit in Instellings.';

  @override
  String get network => 'Netwerk';

  @override
  String get networkMatch => 'Netwerk Match';

  @override
  String get noSearchHistory => 'Geen soekgeskiedenis nie';

  @override
  String get searchHistory => 'Soek Geskiedenis';

  @override
  String get invalidLink => 'Ongeldige skakel';

  @override
  String get unableToOpenWebPage => 'Kan nie webblad oopmaak nie';

  @override
  String get imageMemory => '[Beeld geheue]';

  @override
  String get tapToOpenWebPage => 'Tik om webblad oop te maak';

  @override
  String get editEntry => 'Wysig inskrywing';

  @override
  String get entryDetails => 'Inskrywing Besonderhede';

  @override
  String get noContent => 'Geen inhoud nie';

  @override
  String get diaryNotFound => 'Dagboek nie gevind nie';

  @override
  String get diaryNotFoundShort => 'Rekord nie gevind nie';

  @override
  String get aiSummary => 'KI Opsomming';

  @override
  String get microphoneInterrupted => 'Mikrofoon onderbreek, opname gestop.';

  @override
  String get bold => 'Vet';

  @override
  String get italic => 'Kursief';

  @override
  String get strikethrough => 'Strek deur';

  @override
  String get image => 'Beeld';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR nie beskikbaar nie. Opname is steeds aktief.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Skryf jou inskrywing...';

  @override
  String get writeYourContent => 'Skryf jou inhoud...';

  @override
  String microphoneStartFailed(String error) {
    return 'Kon nie mikrofoon begin nie: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofoon onderbreek, opname gestop.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR herkoppel: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Prent ingevoeg: $name';
  }

  @override
  String voiceError(String error) {
    return 'Stemfout: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Jammer, KI-diens is tans nie beskikbaar nie: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Kon nie deel nie: $error';
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
    return '$matchType · $count treffers';
  }

  @override
  String matchCount(int count) {
    return 'Pas: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Bron: $source';
  }

  @override
  String get createNew => 'Skep';

  @override
  String micStartFailed(String error) {
    return 'Kon nie mikrofoon begin nie: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Rekeninge: +$created / opgedateer $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Dagboeke: +$created / opgedateer $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Onthounotas: +$created / opgedateer $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Oorgeslaan: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Totaal verander: $count';
  }

  @override
  String get settingsApplied => 'Instellings in rugsteun is toegepas.';

  @override
  String get settingsNotApplied =>
      'Instellings in rugsteun is nie toegepas nie.';

  @override
  String backupExported(String path) {
    return 'Rugsteun uitgevoer: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Uitvoer het misluk: $error';
  }

  @override
  String importFailed(String error) {
    return 'Invoer het misluk: $error';
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

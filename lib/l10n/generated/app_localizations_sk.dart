// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get languageName => 'Slovenčina';

  @override
  String get languageNameEn => 'Slovak';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Nastavenia';

  @override
  String get account => 'účtu';

  @override
  String get reminders => 'Pripomienky';

  @override
  String get language => 'Jazyk';

  @override
  String get appLanguage => 'Jazyk aplikácie';

  @override
  String get appearance => 'Vzhľad';

  @override
  String get themeMode => 'Režim témy';

  @override
  String get dark => 'Tmavý';

  @override
  String get light => 'Svetlo';

  @override
  String get system => 'systém';

  @override
  String get aiService => 'Služba AI';

  @override
  String get aiChatProvider => 'Poskytovateľ chatu AI';

  @override
  String get chatModel => 'Model chatu';

  @override
  String get localModel => 'Miestny model';

  @override
  String get localModelDefault => 'Miestny model (predvolené)';

  @override
  String get ollamaEndpoint => 'Koncový bod Ollama';

  @override
  String get ollamaModel => 'Model Olama';

  @override
  String get openAiEndpoint => 'Koncový bod OpenAI';

  @override
  String get openAiApiKey => 'OpenAI API kľúč';

  @override
  String get openAiModel => 'Model OpenAI';

  @override
  String get geminiEndpoint => 'Koncový bod Gemini';

  @override
  String get geminiApiKey => 'Gemini API kľúč';

  @override
  String get geminiModel => 'Modely Blížencov';

  @override
  String get anthropicEndpoint => 'Antropický koncový bod';

  @override
  String get anthropicApiKey => 'Antropický kľúč API';

  @override
  String get anthropicModel => 'Antropický model';

  @override
  String get customProtocol => 'Custom Protocol';

  @override
  String get protocol => 'Protokol';

  @override
  String get customEndpoint => 'Vlastný koncový bod';

  @override
  String get customApiKey => 'Vlastný kľúč API';

  @override
  String get customModel => 'Vlastný model';

  @override
  String get optionalForLocalServers => 'Voliteľné pre lokálne/vlastné servery';

  @override
  String get speechRecognitionEngine => 'Nástroj na rozpoznávanie reči';

  @override
  String get local => 'Miestne';

  @override
  String get endpoint => 'Koncový bod';

  @override
  String get localSpeechModel => 'Model lokálnej reči';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (na zariadení)';

  @override
  String get systemSpeechRecognition => 'Systémové rozpoznávanie reči';

  @override
  String get systemRecognitionAndroidIos =>
      'Rozpoznávanie systému (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Rozpoznávanie koncových bodov (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Použiť vstavaný rozpoznávač Android / iOS (môže používať cloud)';

  @override
  String get voiceAiEndpoint => 'Koncový bod hlasovej AI';

  @override
  String get embeddingModel => 'Model vkladania';

  @override
  String get crossDeviceSync => 'Synchronizácia medzi zariadeniami';

  @override
  String get sendToOtherDevices => 'Odoslať do iných zariadení (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Exportujte zálohu a odošlite ju prostredníctvom zdieľaného hárka';

  @override
  String get importFromLocalSend => 'Importovať z LocalSend';

  @override
  String get selectBackupJson => 'Vyberte zálohu JSON a zlúčte miestne údaje';

  @override
  String get autoGeneration => 'Automatické generovanie';

  @override
  String get autoGenerateSummary => 'Automatické generovanie súhrnu';

  @override
  String get generateAiSummaryForNewEntries =>
      'Vytvorte súhrn AI pre nové položky';

  @override
  String get autoGenerateEmbedding => 'Automatické generovanie vkladania';

  @override
  String get generateVectorEmbedding =>
      'Vytvorte vektorové vkladanie pre vyhľadávanie';

  @override
  String get enableNetworkSearch => 'Povoliť vyhľadávanie v sieti';

  @override
  String get allowOnlineRetrieval =>
      'Povoliť online získavanie pre vyhľadávanie a chat AI (predvolene vypnuté)';

  @override
  String get about => 'O';

  @override
  String version(String version) {
    return 'Verzia $version';
  }

  @override
  String get database => 'Databáza';

  @override
  String get objectBoxWithHnsw => 'ObjectBox s indexom HNSW';

  @override
  String get logOut => 'Odhlásiť sa';

  @override
  String get custom => 'Vlastné';

  @override
  String get openAiCompatible => 'Kompatibilné s OpenAI';

  @override
  String get notSet => 'Nie je nastavené';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... alebo http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Podporuje lokálne/LAN/verejné koncové body';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend Backup';

  @override
  String get localBackupFromShiguang =>
      'Miestna záloha zo Shiguang (prijatie cez LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Vyberte záložný súbor prijatý z LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Nepodarilo sa vyriešiť vybratú cestu k súboru';

  @override
  String get importOptions => 'Možnosti importu';

  @override
  String get importSettingsAsWell =>
      'Importovať aj nastavenia?\n(Kľúče API nebudú prepísané)';

  @override
  String get dataOnly => 'Iba údaje';

  @override
  String get dataAndSettings => 'Údaje + Nastavenia';

  @override
  String get importCompleted => 'Import dokončený';

  @override
  String get settingsInBackupWereApplied => 'Nastavenia v zálohe boli použité.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Nastavenia v zálohe neboli použité.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Zrušiť';

  @override
  String get save => 'Uložiť';

  @override
  String get delete => 'Odstrániť';

  @override
  String get clear => 'Jasné';

  @override
  String get add => 'Pridať';

  @override
  String get create => 'Vytvorte';

  @override
  String get edit => 'Upraviť';

  @override
  String get search => 'Hľadať';

  @override
  String get areYouSureYouWantToLogOut => 'Naozaj sa chcete odhlásiť?';

  @override
  String get chooseLanguage => 'Vyberte Jazyk';

  @override
  String get databaseInfo => 'Informácie o databáze';

  @override
  String get storage => 'Skladovanie: ObjectBox';

  @override
  String get vectorIndex => 'Index vektora: HNSW';

  @override
  String get dimensions => 'Rozmery: 384';

  @override
  String get embeddingModelBge => 'Model vkladania: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Odfotiť';

  @override
  String get chooseFromGallery => 'Vyberte si z Galérie';

  @override
  String get editNickname => 'Upraviť prezývku';

  @override
  String get enterNickname => 'Zadajte prezývku';

  @override
  String get pleaseEnterNickname => 'Zadajte prezývku';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Prezývka už existuje alebo je neplatná';

  @override
  String get user => 'Používateľ';

  @override
  String get manageScheduledReminders =>
      'Spravujte naplánované pripomienky a budíky';

  @override
  String get imageFailedToLoad =>
      'Obrázok sa nepodarilo načítať. Vyberte si znova.';

  @override
  String get imageIsStillLoading => 'Obrázok sa stále načítava';

  @override
  String get imageAreaNotReady =>
      'Oblasť obrázka nie je pripravená. Skúste to znova.';

  @override
  String get cropFrameNotReady =>
      'Rám orezania nie je pripravený. Skúste to znova.';

  @override
  String get invalidCropArea => 'Neplatná oblasť orezania. Skúste to znova.';

  @override
  String get cropFailed => 'Orezanie zlyhalo. Skúste to znova.';

  @override
  String get cropAvatar => 'Orezať avatara';

  @override
  String get chooseAgain => 'Vyberte znova';

  @override
  String get rotate90 => 'Otočiť o 90°';

  @override
  String get dragFrameToMove =>
      'Potiahnutím rámu sa presuniete, potiahnutím vpravo dole zmeníte veľkosť; priblížením a posunutím obrazu.';

  @override
  String get pleaseFillInAllFields => 'Vyplňte všetky polia';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN musí mať aspoň 4 číslice';

  @override
  String get pinAtLeast4Digits => 'PIN musí mať aspoň 4 číslice';

  @override
  String get invalidUsernameOrPin => 'Neplatné používateľské meno alebo PIN';

  @override
  String get invalidUsernameOrPinError =>
      'Neplatné používateľské meno alebo PIN';

  @override
  String get usernameAlreadyExists => 'Používateľské meno už existuje';

  @override
  String get captureMomentsKeepMemories =>
      'Zachyťte okamihy, uchovajte spomienky';

  @override
  String get username => 'Používateľské meno';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Prihláste sa';

  @override
  String get createAccount => 'Vytvoriť účet';

  @override
  String get dontHaveAccountCreateOne => 'Nemáte účet? Vytvorte si ho';

  @override
  String get alreadyHaveAccountLogin => 'Už máte účet? Prihláste sa';

  @override
  String get pleaseEnterUsername => 'Zadajte používateľské meno';

  @override
  String get pinsDoNotMatch => 'Kódy PIN sa nezhodujú';

  @override
  String get tapToAddAvatar => 'Klepnutím pridáte avatara';

  @override
  String get yourName => 'Vaše meno';

  @override
  String get privatePinOptional => 'Súkromný PIN (voliteľné)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Používa sa na šifrovanie súkromných záznamov';

  @override
  String get privatePin => 'Súkromný PIN';

  @override
  String get leaveEmptyForNoEncryption =>
      'Ak nechcete šifrovať, ponechajte prázdne';

  @override
  String get confirmPin => 'Potvrďte PIN';

  @override
  String get getStarted => 'Začíname';

  @override
  String get noReminders => 'Žiadne pripomienky';

  @override
  String get addReminder => 'Pridať pripomenutie';

  @override
  String get title => 'Názov';

  @override
  String get descriptionOptional => 'Popis (voliteľné)';

  @override
  String get microphonePermissionRequired =>
      'Vyžaduje sa povolenie pre mikrofón';

  @override
  String get aiAssistant => 'Asistent AI';

  @override
  String get listening => 'Počúvanie...';

  @override
  String get typeAMessage => 'Napíšte správu...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Začnite konverzáciu';

  @override
  String get typeYourMessage => 'Napíšte svoju správu...';

  @override
  String get asrReconnecting => 'ASR sa znova pripája...';

  @override
  String get write => 'Napíšte';

  @override
  String get writeEntry => 'Napíšte Vstup';

  @override
  String get noMemoriesYet => 'Zatiaľ žiadne spomienky';

  @override
  String get tapPlusToCapture => 'Klepnutím na + zachytíte svoje myšlienky';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Klepnutím na + zachytíte svoje myšlienky';

  @override
  String get deleteMemory => 'Vymazať pamäť';

  @override
  String get deleteRecord => 'Odstrániť záznam';

  @override
  String get thisEntryWillBeRemoved =>
      'Tento záznam bude odstránený z vašej časovej osi.';

  @override
  String get thisRecordWillBeRemoved =>
      'Tento záznam bude odstránený z vašej časovej osi.';

  @override
  String get searchYourRecords => 'Hľadajte vo svojich záznamoch...';

  @override
  String get exactMatches => 'Presné zhody';

  @override
  String get noExactMatches => 'Žiadne presné zhody';

  @override
  String get exact => 'Presne';

  @override
  String get exactMatch => 'Presná zhoda';

  @override
  String get fuzzyMatches => 'Fuzzy zápasy';

  @override
  String get noFuzzyMatches => 'Žiadne nejasné zhody';

  @override
  String get vectorMatch => 'Vektorový zápas';

  @override
  String get networkMatches => 'Zhody siete';

  @override
  String get noNetworkMatches => 'Žiadna sieť sa nezhoduje';

  @override
  String get networkSearchIsOff =>
      'Vyhľadávanie siete je vypnuté. Povoľte ho v Nastaveniach.';

  @override
  String get network => 'sieť';

  @override
  String get networkMatch => 'Network Match';

  @override
  String get noSearchHistory => 'Žiadna história vyhľadávania';

  @override
  String get searchHistory => 'História vyhľadávania';

  @override
  String get invalidLink => 'Neplatný odkaz';

  @override
  String get unableToOpenWebPage => 'Nie je možné otvoriť webovú stránku';

  @override
  String get imageMemory => '[Obrazová pamäť]';

  @override
  String get tapToOpenWebPage => 'Klepnutím otvoríte webovú stránku';

  @override
  String get editEntry => 'Upraviť záznam';

  @override
  String get entryDetails => 'Vstupné podrobnosti';

  @override
  String get noContent => 'Žiadny obsah';

  @override
  String get diaryNotFound => 'Denník sa nenašiel';

  @override
  String get diaryNotFoundShort => 'Záznam sa nenašiel';

  @override
  String get aiSummary => 'Súhrn AI';

  @override
  String get microphoneInterrupted =>
      'Mikrofón prerušený, nahrávanie zastavené.';

  @override
  String get bold => 'Tučné';

  @override
  String get italic => 'kurzíva';

  @override
  String get strikethrough => 'Prečiarknuté';

  @override
  String get image => 'Obrázok';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR nie je k dispozícii. Nahrávanie je stále aktívne.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Napíšte svoj príspevok...';

  @override
  String get writeYourContent => 'Napíšte svoj obsah...';

  @override
  String microphoneStartFailed(String error) {
    return 'Nepodarilo sa spustiť mikrofón: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofón prerušený, nahrávanie zastavené.';

  @override
  String asrReconnectingError(String error) {
    return 'Opätovné pripojenie ASR: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Vložený obrázok: $name';
  }

  @override
  String voiceError(String error) {
    return 'Chyba hlasu: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Ľutujeme, služba AI je momentálne nedostupná: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Zdieľanie zlyhalo: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count prístupov';
  }

  @override
  String matchCount(int count) {
    return 'Zhoda: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Zdroj: $source';
  }

  @override
  String get createNew => 'Vytvorte';

  @override
  String micStartFailed(String error) {
    return 'Spustenie mikrofónu zlyhalo: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Účty: +$created / aktualizované $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Denníky: +$created / aktualizované $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Pripomienky: +$created / aktualizované $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Preskočené: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Celkom zmenené: $count';
  }

  @override
  String get settingsApplied => 'Nastavenia v zálohe boli použité.';

  @override
  String get settingsNotApplied => 'Nastavenia v zálohe neboli použité.';

  @override
  String backupExported(String path) {
    return 'Exportovaná záloha: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Export zlyhal: $error';
  }

  @override
  String importFailed(String error) {
    return 'Import zlyhal: $error';
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

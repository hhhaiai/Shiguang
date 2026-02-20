// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get languageName => 'Čeština';

  @override
  String get languageNameEn => 'Czech';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Nastavení';

  @override
  String get account => 'Účet';

  @override
  String get reminders => 'Připomenutí';

  @override
  String get language => 'Jazyk';

  @override
  String get appLanguage => 'Jazyk aplikace';

  @override
  String get appearance => 'Vzhled';

  @override
  String get themeMode => 'Režim motivu';

  @override
  String get dark => 'Tmavý';

  @override
  String get light => 'Světlo';

  @override
  String get system => 'Systém';

  @override
  String get aiService => 'Služba AI';

  @override
  String get aiChatProvider => 'Poskytovatel chatu AI';

  @override
  String get chatModel => 'Model chatu';

  @override
  String get localModel => 'Místní model';

  @override
  String get localModelDefault => 'Místní model (výchozí)';

  @override
  String get ollamaEndpoint => 'Koncový bod Ollama';

  @override
  String get ollamaModel => 'Model Ollama';

  @override
  String get openAiEndpoint => 'OpenAI Endpoint';

  @override
  String get openAiApiKey => 'Klíč API OpenAI';

  @override
  String get openAiModel => 'Model OpenAI';

  @override
  String get geminiEndpoint => 'Koncový bod Gemini';

  @override
  String get geminiApiKey => 'Gemini API klíč';

  @override
  String get geminiModel => 'Modely Blíženců';

  @override
  String get anthropicEndpoint => 'Antropický koncový bod';

  @override
  String get anthropicApiKey => 'Antropický klíč API';

  @override
  String get anthropicModel => 'Antropický model';

  @override
  String get customProtocol => 'Vlastní protokol';

  @override
  String get protocol => 'Protokol';

  @override
  String get customEndpoint => 'Vlastní koncový bod';

  @override
  String get customApiKey => 'Vlastní klíč API';

  @override
  String get customModel => 'Vlastní model';

  @override
  String get optionalForLocalServers => 'Volitelné pro místní/vlastní servery';

  @override
  String get speechRecognitionEngine => 'Engine pro rozpoznávání řeči';

  @override
  String get local => 'Místní';

  @override
  String get endpoint => 'Koncový bod';

  @override
  String get localSpeechModel => 'Model místní řeči';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (na zařízení)';

  @override
  String get systemSpeechRecognition => 'Systémové rozpoznávání řeči';

  @override
  String get systemRecognitionAndroidIos =>
      'Rozpoznávání systému (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Rozpoznávání koncových bodů (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Použít vestavěný rozpoznávač Android / iOS (může používat cloud)';

  @override
  String get voiceAiEndpoint => 'Koncový bod hlasové umělé inteligence';

  @override
  String get embeddingModel => 'Model vkládání';

  @override
  String get crossDeviceSync => 'Synchronizace mezi zařízeními';

  @override
  String get sendToOtherDevices => 'Odeslat na jiná zařízení (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Exportujte zálohu a odešlete ji prostřednictvím sdíleného listu';

  @override
  String get importFromLocalSend => 'Import z LocalSend';

  @override
  String get selectBackupJson => 'Vyberte záložní JSON a sloučte místní data';

  @override
  String get autoGeneration => 'Automatické generování';

  @override
  String get autoGenerateSummary => 'Automatické generování souhrnu';

  @override
  String get generateAiSummaryForNewEntries =>
      'Generovat souhrn AI pro nové položky';

  @override
  String get autoGenerateEmbedding => 'Automatické generování vkládání';

  @override
  String get generateVectorEmbedding =>
      'Vygenerujte vektorové vkládání pro vyhledávání';

  @override
  String get enableNetworkSearch => 'Povolit vyhledávání v síti';

  @override
  String get allowOnlineRetrieval =>
      'Povolit online načítání pro vyhledávání a chat AI (ve výchozím nastavení vypnuto)';

  @override
  String get about => 'O';

  @override
  String version(String version) {
    return 'Verze $version';
  }

  @override
  String get database => 'Databáze';

  @override
  String get objectBoxWithHnsw => 'ObjectBox s indexem HNSW';

  @override
  String get logOut => 'Odhlásit se';

  @override
  String get custom => 'Zvyk';

  @override
  String get openAiCompatible => 'Kompatibilní s OpenAI';

  @override
  String get notSet => 'Nenastaveno';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... nebo http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Podporuje místní/LAN/veřejné koncové body';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend Backup';

  @override
  String get localBackupFromShiguang =>
      'Místní záloha z Shiguang (příjem přes LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Vyberte záložní soubor přijatý z LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Nepodařilo se vyřešit vybranou cestu k souboru';

  @override
  String get importOptions => 'Možnosti importu';

  @override
  String get importSettingsAsWell =>
      'Importovat také nastavení?\n(klíče API nebudou přepsány)';

  @override
  String get dataOnly => 'Pouze data';

  @override
  String get dataAndSettings => 'Data + Nastavení';

  @override
  String get importCompleted => 'Import dokončen';

  @override
  String get settingsInBackupWereApplied => 'Nastavení v záloze byla použita.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Nastavení v záloze nebyla použita.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Zrušit';

  @override
  String get save => 'Uložit';

  @override
  String get delete => 'Vymazat';

  @override
  String get clear => 'Jasný';

  @override
  String get add => 'Přidat';

  @override
  String get create => 'Vytvořit';

  @override
  String get edit => 'Upravit';

  @override
  String get search => 'Vyhledávání';

  @override
  String get areYouSureYouWantToLogOut => 'Opravdu se chcete odhlásit?';

  @override
  String get chooseLanguage => 'Vyberte Jazyk';

  @override
  String get databaseInfo => 'Informace o databázi';

  @override
  String get storage => 'Úložiště: ObjectBox';

  @override
  String get vectorIndex => 'Index vektoru: HNSW';

  @override
  String get dimensions => 'Rozměry: 384';

  @override
  String get embeddingModelBge => 'Model vkládání: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Vyfotit';

  @override
  String get chooseFromGallery => 'Vyberte si z Galerie';

  @override
  String get editNickname => 'Upravit přezdívku';

  @override
  String get enterNickname => 'Zadejte přezdívku';

  @override
  String get pleaseEnterNickname => 'Zadejte přezdívku';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Přezdívka již existuje nebo je neplatná';

  @override
  String get user => 'Uživatel';

  @override
  String get manageScheduledReminders =>
      'Správa naplánovaných připomenutí a budíků';

  @override
  String get imageFailedToLoad =>
      'Obrázek se nepodařilo načíst. Vyberte prosím znovu.';

  @override
  String get imageIsStillLoading => 'Obrázek se stále načítá';

  @override
  String get imageAreaNotReady =>
      'Obrazová oblast není připravena. Zkuste to znovu.';

  @override
  String get cropFrameNotReady =>
      'Rám oříznutí není připraven. Zkuste to znovu.';

  @override
  String get invalidCropArea => 'Neplatná oblast oříznutí. Zkuste to znovu.';

  @override
  String get cropFailed => 'Oříznutí se nezdařilo. Zkuste to znovu.';

  @override
  String get cropAvatar => 'Oříznout avatara';

  @override
  String get chooseAgain => 'Vyberte znovu';

  @override
  String get rotate90 => 'Otočit o 90°';

  @override
  String get dragFrameToMove =>
      'Přetažením rámečku přesunete, přetažením vpravo dole změníte velikost; sevřením prstů přiblížíte a přesunete obrázek.';

  @override
  String get pleaseFillInAllFields => 'Vyplňte prosím všechna pole';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN musí mít alespoň 4 číslice';

  @override
  String get pinAtLeast4Digits => 'PIN musí mít alespoň 4 číslice';

  @override
  String get invalidUsernameOrPin => 'Neplatné uživatelské jméno nebo PIN';

  @override
  String get invalidUsernameOrPinError => 'Neplatné uživatelské jméno nebo PIN';

  @override
  String get usernameAlreadyExists => 'Uživatelské jméno již existuje';

  @override
  String get captureMomentsKeepMemories =>
      'Zachyťte okamžiky, uchovejte vzpomínky';

  @override
  String get username => 'Uživatelské jméno';

  @override
  String get pin => 'KOLÍK';

  @override
  String get login => 'Přihlášení';

  @override
  String get createAccount => 'Vytvořit účet';

  @override
  String get dontHaveAccountCreateOne => 'Nemáte účet? Vytvořte jeden';

  @override
  String get alreadyHaveAccountLogin => 'Už máte účet? Přihlášení';

  @override
  String get pleaseEnterUsername => 'Zadejte uživatelské jméno';

  @override
  String get pinsDoNotMatch => 'Kódy PIN se neshodují';

  @override
  String get tapToAddAvatar => 'Klepnutím přidáte avatara';

  @override
  String get yourName => 'Vaše jméno';

  @override
  String get privatePinOptional => 'Soukromý PIN (volitelné)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Používá se k šifrování soukromých záznamů';

  @override
  String get privatePin => 'Soukromý PIN';

  @override
  String get leaveEmptyForNoEncryption =>
      'Nechejte prázdné, nechcete-li šifrovat';

  @override
  String get confirmPin => 'Potvrďte PIN';

  @override
  String get getStarted => 'Začněte';

  @override
  String get noReminders => 'Žádné připomenutí';

  @override
  String get addReminder => 'Přidat připomenutí';

  @override
  String get title => 'Titul';

  @override
  String get descriptionOptional => 'Popis (volitelné)';

  @override
  String get microphonePermissionRequired =>
      'Je vyžadováno povolení k mikrofonu';

  @override
  String get aiAssistant => 'Asistent AI';

  @override
  String get listening => 'Naslouchání...';

  @override
  String get typeAMessage => 'Napište zprávu...';

  @override
  String get aiChat => 'AI chat';

  @override
  String get startAConversation => 'Zahajte konverzaci';

  @override
  String get typeYourMessage => 'Napište svou zprávu...';

  @override
  String get asrReconnecting => 'ASR se znovu připojuje...';

  @override
  String get write => 'Napsat';

  @override
  String get writeEntry => 'Napište Vstup';

  @override
  String get noMemoriesYet => 'Zatím žádné vzpomínky';

  @override
  String get tapPlusToCapture => 'Klepnutím na + zachytíte své myšlenky';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Klepnutím na + zachytíte své myšlenky';

  @override
  String get deleteMemory => 'Vymazat paměť';

  @override
  String get deleteRecord => 'Smazat záznam';

  @override
  String get thisEntryWillBeRemoved =>
      'Tento záznam bude odstraněn z vaší časové osy.';

  @override
  String get thisRecordWillBeRemoved =>
      'Tento záznam bude odstraněn z vaší časové osy.';

  @override
  String get searchYourRecords => 'Prohledejte své záznamy...';

  @override
  String get exactMatches => 'Přesné shody';

  @override
  String get noExactMatches => 'Žádné přesné shody';

  @override
  String get exact => 'Přesný';

  @override
  String get exactMatch => 'Přesná shoda';

  @override
  String get fuzzyMatches => 'Fuzzy zápasy';

  @override
  String get noFuzzyMatches => 'Žádné nejasné shody';

  @override
  String get vectorMatch => 'Vektorový zápas';

  @override
  String get networkMatches => 'Síťové shody';

  @override
  String get noNetworkMatches => 'Žádná síť neodpovídá';

  @override
  String get networkSearchIsOff =>
      'Vyhledávání sítě je vypnuté. Povolte jej v Nastavení.';

  @override
  String get network => 'Síť';

  @override
  String get networkMatch => 'Network Match';

  @override
  String get noSearchHistory => 'Žádná historie vyhledávání';

  @override
  String get searchHistory => 'Historie vyhledávání';

  @override
  String get invalidLink => 'Neplatný odkaz';

  @override
  String get unableToOpenWebPage => 'Nelze otevřít webovou stránku';

  @override
  String get imageMemory => '[Obrazová paměť]';

  @override
  String get tapToOpenWebPage => 'Klepnutím otevřete webovou stránku';

  @override
  String get editEntry => 'Upravit záznam';

  @override
  String get entryDetails => 'Vstupní podrobnosti';

  @override
  String get noContent => 'Žádný obsah';

  @override
  String get diaryNotFound => 'Deník nenalezen';

  @override
  String get diaryNotFoundShort => 'Záznam nenalezen';

  @override
  String get aiSummary => 'Shrnutí AI';

  @override
  String get microphoneInterrupted => 'Mikrofon přerušen, nahrávání zastaveno.';

  @override
  String get bold => 'Tučné';

  @override
  String get italic => 'kurzíva';

  @override
  String get strikethrough => 'Přeškrtnutí';

  @override
  String get image => 'Obraz';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR není k dispozici. Nahrávání je stále aktivní.';

  @override
  String get writeYourEntry => 'Napište svůj příspěvek...';

  @override
  String get writeYourContent => 'Napište svůj obsah...';

  @override
  String microphoneStartFailed(String error) {
    return 'Nepodařilo se spustit mikrofon: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofon přerušen, nahrávání zastaveno.';

  @override
  String asrReconnectingError(String error) {
    return 'Opětovné připojení ASR: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Vložený obrázek: $name';
  }

  @override
  String voiceError(String error) {
    return 'Chyba hlasu: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Omlouváme se, služba AI je momentálně nedostupná: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Sdílení se nezdařilo: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count zásahů';
  }

  @override
  String matchCount(int count) {
    return 'Shoda: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Zdroj: $source';
  }

  @override
  String get createNew => 'Vytvořit';

  @override
  String micStartFailed(String error) {
    return 'Spuštění mikrofonu se nezdařilo: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Účty: +$created / aktualizováno $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Deníky: +$created / aktualizováno $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Připomenutí: +$created / aktualizováno $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Přeskočeno: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Celkem změněno: $count';
  }

  @override
  String get settingsApplied => 'Nastavení v záloze byla použita.';

  @override
  String get settingsNotApplied => 'Nastavení v záloze nebyla použita.';

  @override
  String backupExported(String path) {
    return 'Exportovaná záloha: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Export se nezdařil: $error';
  }

  @override
  String importFailed(String error) {
    return 'Import se nezdařil: $error';
  }
}

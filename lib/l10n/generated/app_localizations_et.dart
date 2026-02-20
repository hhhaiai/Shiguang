// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get languageName => 'Eesti';

  @override
  String get languageNameEn => 'Estonian';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Seaded';

  @override
  String get account => 'konto';

  @override
  String get reminders => 'Meeldetuletused';

  @override
  String get language => 'Keel';

  @override
  String get appLanguage => 'Rakenduse keel';

  @override
  String get appearance => 'Välimus';

  @override
  String get themeMode => 'Teema režiim';

  @override
  String get dark => 'Tume';

  @override
  String get light => 'Valgus';

  @override
  String get system => 'Süsteem';

  @override
  String get aiService => 'AI teenus';

  @override
  String get aiChatProvider => 'AI vestluse pakkuja';

  @override
  String get chatModel => 'Vestlusmudel';

  @override
  String get localModel => 'Kohalik mudel';

  @override
  String get localModelDefault => 'Kohalik mudel (vaikimisi)';

  @override
  String get ollamaEndpoint => 'Ollama lõpp-punkt';

  @override
  String get ollamaModel => 'Ollama mudel';

  @override
  String get openAiEndpoint => 'OpenAI lõpp-punkt';

  @override
  String get openAiApiKey => 'OpenAI API võti';

  @override
  String get openAiModel => 'OpenAI mudel';

  @override
  String get geminiEndpoint => 'Kaksikute lõpp-punkt';

  @override
  String get geminiApiKey => 'Gemini API võti';

  @override
  String get geminiModel => 'Kaksikute mudelid';

  @override
  String get anthropicEndpoint => 'Antroopiline lõpp-punkt';

  @override
  String get anthropicApiKey => 'Antroopiline API võti';

  @override
  String get anthropicModel => 'Antroopiline mudel';

  @override
  String get customProtocol => 'Kohandatud protokoll';

  @override
  String get protocol => 'Protokoll';

  @override
  String get customEndpoint => 'Kohandatud lõpp-punkt';

  @override
  String get customApiKey => 'Kohandatud API võti';

  @override
  String get customModel => 'Kohandatud mudel';

  @override
  String get optionalForLocalServers =>
      'Kohalike/kohandatud serverite jaoks valikuline';

  @override
  String get speechRecognitionEngine => 'Kõnetuvastusmootor';

  @override
  String get local => 'Kohalik';

  @override
  String get endpoint => 'Lõpp-punkt';

  @override
  String get localSpeechModel => 'Kohalik kõnemudel';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (seadmes)';

  @override
  String get systemSpeechRecognition => 'Süsteemne kõnetuvastus';

  @override
  String get systemRecognitionAndroidIos => 'Süsteemituvastus (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Lõpp-punkti tuvastamine (pilv/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Kasutage sisseehitatud Androidi / iOS-i tuvastajat (võib kasutada pilve)';

  @override
  String get voiceAiEndpoint => 'Voice AI lõpp-punkt';

  @override
  String get embeddingModel => 'Mudeli manustamine';

  @override
  String get crossDeviceSync => 'Seadmetevaheline sünkroonimine';

  @override
  String get sendToOtherDevices => 'Saada teistele seadmetele (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Eksportige varukoopia ja saatke jagamislehe kaudu';

  @override
  String get importFromLocalSend => 'Importige teenusest LocalSend';

  @override
  String get selectBackupJson =>
      'Valige varu JSON ja ühendage kohalikud andmed';

  @override
  String get autoGeneration => 'Automaatne genereerimine';

  @override
  String get autoGenerateSummary => 'Loo kokkuvõte automaatselt';

  @override
  String get generateAiSummaryForNewEntries =>
      'Looge uute kirjete jaoks tehisintellekti kokkuvõte';

  @override
  String get autoGenerateEmbedding => 'Manustamise automaatne loomine';

  @override
  String get generateVectorEmbedding => 'Genereerige otsinguks vektormanustus';

  @override
  String get enableNetworkSearch => 'Luba võrguotsing';

  @override
  String get allowOnlineRetrieval =>
      'Otsingu ja tehisintellekti vestluse jaoks võrgust toomise lubamine (vaikimisi väljas)';

  @override
  String get about => 'Umbes';

  @override
  String version(String version) {
    return 'Versioon $version';
  }

  @override
  String get database => 'Andmebaas';

  @override
  String get objectBoxWithHnsw => 'ObjectBox HNSW indeksiga';

  @override
  String get logOut => 'Logi välja';

  @override
  String get custom => 'Kohandatud';

  @override
  String get openAiCompatible => 'OpenAI-ga ühilduv';

  @override
  String get notSet => 'Pole määratud';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... või http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Toetab kohalikke/LAN/avalikke lõpp-punkte';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSendi varukoopia';

  @override
  String get localBackupFromShiguang =>
      'Kohalik varukoopia Shiguangist (saamine LocalSendi kaudu)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Valige LocalSendilt saadud varukoopiafail';

  @override
  String get failedToResolveFilePath =>
      'Valitud failitee lahendamine ebaõnnestus';

  @override
  String get importOptions => 'Impordivalikud';

  @override
  String get importSettingsAsWell =>
      'Kas importida ka sätteid?\n(API võtmeid ei kirjutata üle)';

  @override
  String get dataOnly => 'Ainult andmed';

  @override
  String get dataAndSettings => 'Andmed + Seaded';

  @override
  String get importCompleted => 'Import on lõpetatud';

  @override
  String get settingsInBackupWereApplied => 'Varunduse sätted rakendati.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Varunduse sätteid ei rakendatud.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Tühista';

  @override
  String get save => 'Salvesta';

  @override
  String get delete => 'Kustuta';

  @override
  String get clear => 'Selge';

  @override
  String get add => 'Lisa';

  @override
  String get create => 'Loo';

  @override
  String get edit => 'Muuda';

  @override
  String get search => 'Otsi';

  @override
  String get areYouSureYouWantToLogOut => 'Kas soovite kindlasti välja logida?';

  @override
  String get chooseLanguage => 'Valige keel';

  @override
  String get databaseInfo => 'Andmebaasi teave';

  @override
  String get storage => 'Salvestusruum: ObjectBox';

  @override
  String get vectorIndex => 'Vektorindeks: HNSW';

  @override
  String get dimensions => 'Mõõdud: 384';

  @override
  String get embeddingModelBge => 'Manusmudel: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Pildista';

  @override
  String get chooseFromGallery => 'Valige galeriist';

  @override
  String get editNickname => 'Redigeeri hüüdnime';

  @override
  String get enterNickname => 'Sisestage hüüdnimi';

  @override
  String get pleaseEnterNickname => 'Palun sisestage hüüdnimi';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Hüüdnimi on juba olemas või on kehtetu';

  @override
  String get user => 'Kasutaja';

  @override
  String get manageScheduledReminders =>
      'Hallake ajastatud meeldetuletusi ja häireid';

  @override
  String get imageFailedToLoad =>
      'Pildi laadimine ebaõnnestus. Palun valige uuesti.';

  @override
  String get imageIsStillLoading => 'Pilti laaditakse endiselt';

  @override
  String get imageAreaNotReady => 'Pildiala pole valmis. Palun proovi uuesti.';

  @override
  String get cropFrameNotReady =>
      'Kärpimisraam pole valmis. Palun proovi uuesti.';

  @override
  String get invalidCropArea => 'Kehtetu kärpimisala. Palun proovi uuesti.';

  @override
  String get cropFailed => 'Kärpimine ebaõnnestus. Palun proovi uuesti.';

  @override
  String get cropAvatar => 'Kärbi avatari';

  @override
  String get chooseAgain => 'Valige uuesti';

  @override
  String get rotate90 => 'Pöörake 90°';

  @override
  String get dragFrameToMove =>
      'Liigutamiseks lohistage raami, suuruse muutmiseks lohistage alt paremale; pildi suumimiseks ja liigutamiseks pigistage kokku.';

  @override
  String get pleaseFillInAllFields => 'Palun täitke kõik väljad';

  @override
  String get pinMustBeAtLeast4Digits =>
      'PIN-kood peab olema vähemalt 4-kohaline';

  @override
  String get pinAtLeast4Digits => 'PIN-kood peab olema vähemalt 4-kohaline';

  @override
  String get invalidUsernameOrPin => 'Kehtetu kasutajanimi või PIN-kood';

  @override
  String get invalidUsernameOrPinError => 'Kehtetu kasutajanimi või PIN-kood';

  @override
  String get usernameAlreadyExists => 'Kasutajanimi on juba olemas';

  @override
  String get captureMomentsKeepMemories =>
      'Jäädvustage hetki, hoidke mälestusi';

  @override
  String get username => 'Kasutajanimi';

  @override
  String get pin => 'PIN-kood';

  @override
  String get login => 'Logi sisse';

  @override
  String get createAccount => 'Loo konto';

  @override
  String get dontHaveAccountCreateOne => 'Kas teil pole kontot? Looge üks';

  @override
  String get alreadyHaveAccountLogin => 'Kas teil on juba konto? Logi sisse';

  @override
  String get pleaseEnterUsername => 'Palun sisesta kasutajanimi';

  @override
  String get pinsDoNotMatch => 'PIN-koodid ei ühti';

  @override
  String get tapToAddAvatar => 'Avatari lisamiseks puudutage';

  @override
  String get yourName => 'Sinu nimi';

  @override
  String get privatePinOptional => 'Privaatne PIN-kood (valikuline)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Kasutatakse privaatsete kirjete krüptimiseks';

  @override
  String get privatePin => 'Privaatne PIN-kood';

  @override
  String get leaveEmptyForNoEncryption =>
      'Krüptimise vältimiseks jätke tühjaks';

  @override
  String get confirmPin => 'Kinnitage PIN-kood';

  @override
  String get getStarted => 'Alustage';

  @override
  String get noReminders => 'Ei mingeid meeldetuletusi';

  @override
  String get addReminder => 'Lisa meeldetuletus';

  @override
  String get title => 'Pealkiri';

  @override
  String get descriptionOptional => 'Kirjeldus (valikuline)';

  @override
  String get microphonePermissionRequired => 'Vajalik mikrofoni luba';

  @override
  String get aiAssistant => 'AI assistent';

  @override
  String get listening => 'Kuulan...';

  @override
  String get typeAMessage => 'Sisestage sõnum...';

  @override
  String get aiChat => 'AI vestlus';

  @override
  String get startAConversation => 'Alustage vestlust';

  @override
  String get typeYourMessage => 'Sisestage oma sõnum...';

  @override
  String get asrReconnecting => 'ASR-i taasühendamine...';

  @override
  String get write => 'Kirjutage';

  @override
  String get writeEntry => 'Kirjuta kanne';

  @override
  String get noMemoriesYet => 'Pole veel mälestusi';

  @override
  String get tapPlusToCapture => 'Puudutage oma mõtete jäädvustamiseks nuppu +';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Puudutage oma mõtete jäädvustamiseks nuppu +';

  @override
  String get deleteMemory => 'Kustuta mälu';

  @override
  String get deleteRecord => 'Kustuta kirje';

  @override
  String get thisEntryWillBeRemoved =>
      'See kirje eemaldatakse teie ajaskaalalt.';

  @override
  String get thisRecordWillBeRemoved =>
      'See kirje eemaldatakse teie ajaskaalalt.';

  @override
  String get searchYourRecords => 'Otsige oma kirjeid...';

  @override
  String get exactMatches => 'Täpsed vasted';

  @override
  String get noExactMatches => 'Täpseid vasteid pole';

  @override
  String get exact => 'Täpne';

  @override
  String get exactMatch => 'Täpne vaste';

  @override
  String get fuzzyMatches => 'Hägused vasted';

  @override
  String get noFuzzyMatches => 'Hägusaid vasteid pole';

  @override
  String get vectorMatch => 'Vektori matš';

  @override
  String get networkMatches => 'Võrgu vasted';

  @override
  String get noNetworkMatches => 'Võrgustiku vasteid pole';

  @override
  String get networkSearchIsOff =>
      'Võrguotsing on välja lülitatud. Luba see seadetes.';

  @override
  String get network => 'Võrk';

  @override
  String get networkMatch => 'Võrgu vaste';

  @override
  String get noSearchHistory => 'Otsinguajalugu pole';

  @override
  String get searchHistory => 'Otsinguajalugu';

  @override
  String get invalidLink => 'Vigane link';

  @override
  String get unableToOpenWebPage => 'Veebilehte ei saa avada';

  @override
  String get imageMemory => '[Pildimälu]';

  @override
  String get tapToOpenWebPage => 'Puudutage veebilehe avamiseks';

  @override
  String get editEntry => 'Redigeeri kirjet';

  @override
  String get entryDetails => 'Sisenemise üksikasjad';

  @override
  String get noContent => 'Sisu puudub';

  @override
  String get diaryNotFound => 'Päevikut ei leitud';

  @override
  String get diaryNotFoundShort => 'Kirjet ei leitud';

  @override
  String get aiSummary => 'AI kokkuvõte';

  @override
  String get microphoneInterrupted =>
      'Mikrofon katkestatud, salvestamine peatatud.';

  @override
  String get bold => 'Paks';

  @override
  String get italic => 'Kursiiv';

  @override
  String get strikethrough => 'Läbikriipsutatud';

  @override
  String get image => 'Pilt';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR pole saadaval. Salvestamine on endiselt aktiivne.';

  @override
  String get writeYourEntry => 'Kirjutage oma sissekanne...';

  @override
  String get writeYourContent => 'Kirjutage oma sisu...';

  @override
  String microphoneStartFailed(String error) {
    return 'Mikrofoni käivitamine ebaõnnestus: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofon katkestatud, salvestamine peatatud.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR-i taasühendamine: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Pilt sisestatud: $name';
  }

  @override
  String voiceError(String error) {
    return 'Hääleviga: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Kahjuks pole AI teenus praegu saadaval: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Jagamine ebaõnnestus: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count tabamust';
  }

  @override
  String matchCount(int count) {
    return 'Vaste: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Allikas: $source';
  }

  @override
  String get createNew => 'Loo';

  @override
  String micStartFailed(String error) {
    return 'Mikrofoni käivitamine ebaõnnestus: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Kontod: +$created / värskendatud $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Päevikud: +$created / uuendatud $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Meeldetuletused: +$created / uuendatud $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Vahele jäetud: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Muudetud kokku: $count';
  }

  @override
  String get settingsApplied => 'Varunduse sätted rakendati.';

  @override
  String get settingsNotApplied => 'Varunduse sätteid ei rakendatud.';

  @override
  String backupExported(String path) {
    return 'Varukoopia eksporditud: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Eksport ebaõnnestus: $error';
  }

  @override
  String importFailed(String error) {
    return 'Import ebaõnnestus: $error';
  }
}

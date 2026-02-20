// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Basque (`eu`).
class AppLocalizationsEu extends AppLocalizations {
  AppLocalizationsEu([String locale = 'eu']) : super(locale);

  @override
  String get languageName => 'Euskara';

  @override
  String get languageNameEn => 'Basque';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Ezarpenak';

  @override
  String get account => 'Kontua';

  @override
  String get reminders => 'Oroigarriak';

  @override
  String get language => 'Hizkuntza';

  @override
  String get appLanguage => 'Aplikazioaren hizkuntza';

  @override
  String get appearance => 'Itxura';

  @override
  String get themeMode => 'Gaiaren modua';

  @override
  String get dark => 'Iluna';

  @override
  String get light => 'Argia';

  @override
  String get system => 'Sistema';

  @override
  String get aiService => 'AI Zerbitzua';

  @override
  String get aiChatProvider => 'AI Txat Hornitzailea';

  @override
  String get chatModel => 'Txat eredua';

  @override
  String get localModel => 'Tokiko Eredua';

  @override
  String get localModelDefault => 'Tokiko eredua (lehenetsia)';

  @override
  String get ollamaEndpoint => 'Ollama Endpoint';

  @override
  String get ollamaModel => 'Ollama eredua';

  @override
  String get openAiEndpoint => 'OpenAI Endpoint';

  @override
  String get openAiApiKey => 'OpenAI API gakoa';

  @override
  String get openAiModel => 'OpenAI eredua';

  @override
  String get geminiEndpoint => 'Gemini Endpoint';

  @override
  String get geminiApiKey => 'Gemini API gakoa';

  @override
  String get geminiModel => 'Gemini ereduak';

  @override
  String get anthropicEndpoint => 'Amaiera Antropikoa';

  @override
  String get anthropicApiKey => 'Anthropic API gakoa';

  @override
  String get anthropicModel => 'Eredu Antropikoa';

  @override
  String get customProtocol => 'Protokolo pertsonalizatua';

  @override
  String get protocol => 'Protokoloa';

  @override
  String get customEndpoint => 'Amaiera pertsonalizatua';

  @override
  String get customApiKey => 'API gako pertsonalizatua';

  @override
  String get customModel => 'Eredu pertsonalizatua';

  @override
  String get optionalForLocalServers =>
      'Zerbitzari lokal/pertsonalizatuetarako aukerakoa';

  @override
  String get speechRecognitionEngine => 'Ahotsa ezagutzeko motorra';

  @override
  String get local => 'Tokikoa';

  @override
  String get endpoint => 'Amaiera';

  @override
  String get localSpeechModel => 'Tokiko hizkera eredua';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (gailuan)';

  @override
  String get systemSpeechRecognition => 'Sistemaren ahots-ezagutza';

  @override
  String get systemRecognitionAndroidIos => 'Sistemaren ezagutza (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Amaiera-puntuak hautematea (Hodeia/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Erabili integratutako Android / iOS ezagutzailea (hodeia erabil daiteke)';

  @override
  String get voiceAiEndpoint => 'Voice AI Endpoint';

  @override
  String get embeddingModel => 'Kapsulatzeko eredua';

  @override
  String get crossDeviceSync => 'Gailuen arteko sinkronizazioa';

  @override
  String get sendToOtherDevices => 'Bidali beste gailu batzuetara (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Esportatu babeskopia eta bidali partekatzeko orri baten bidez';

  @override
  String get importFromLocalSend => 'Inportatu LocalSend-etik';

  @override
  String get selectBackupJson =>
      'Hautatu babeskopia JSON eta batu tokiko datuak';

  @override
  String get autoGeneration => 'Auto Sorkuntza';

  @override
  String get autoGenerateSummary => 'Sortu automatikoki laburpena';

  @override
  String get generateAiSummaryForNewEntries =>
      'Sortu AI laburpena sarrera berrietarako';

  @override
  String get autoGenerateEmbedding => 'Sortu automatikoki kapsulatzea';

  @override
  String get generateVectorEmbedding =>
      'Sortu txertaketa bektoriala bilaketarako';

  @override
  String get enableNetworkSearch => 'Gaitu sareko bilaketa';

  @override
  String get allowOnlineRetrieval =>
      'Onartu bilaketak eta AI txatak lineako berreskurapena (desaktibatuta lehenespenez)';

  @override
  String get about => 'Buruz';

  @override
  String version(String version) {
    return '$version bertsioa';
  }

  @override
  String get database => 'Datu-basea';

  @override
  String get objectBoxWithHnsw => 'ObjectBox HNSW indizearekin';

  @override
  String get logOut => 'Amaitu saioa';

  @override
  String get custom => 'Pertsonalizatua';

  @override
  String get openAiCompatible => 'OpenAI bateragarria';

  @override
  String get notSet => 'Ezarrita';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Tokiko/LAN/amaiera publikoak onartzen ditu';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend babeskopia';

  @override
  String get localBackupFromShiguang =>
      'Tokiko babeskopia Shiguang-en (jaso LocalSend bidez)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Hautatu LocalSend-etik jasotako babeskopia-fitxategia';

  @override
  String get failedToResolveFilePath =>
      'Ezin izan da ebatzi hautatutako fitxategi-bidea';

  @override
  String get importOptions => 'Inportazio aukerak';

  @override
  String get importSettingsAsWell =>
      'Ezarpenak ere inportatu?\n(API gakoak ez dira gainidatziko)';

  @override
  String get dataOnly => 'Datuak soilik';

  @override
  String get dataAndSettings => 'Datuak + Ezarpenak';

  @override
  String get importCompleted => 'Inportazioa osatu da';

  @override
  String get settingsInBackupWereApplied =>
      'Babeskopiako ezarpenak aplikatu dira.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Babeskopiako ezarpenak ez dira aplikatu.';

  @override
  String get ok => 'Ados';

  @override
  String get cancel => 'Utzi';

  @override
  String get save => 'Gorde';

  @override
  String get delete => 'Ezabatu';

  @override
  String get clear => 'Garbi';

  @override
  String get add => 'Gehitu';

  @override
  String get create => 'Sortu';

  @override
  String get edit => 'Editatu';

  @override
  String get search => 'Bilatu';

  @override
  String get areYouSureYouWantToLogOut => 'Ziur saioa amaitu nahi duzula?';

  @override
  String get chooseLanguage => 'Aukeratu Hizkuntza';

  @override
  String get databaseInfo => 'Datu-basearen informazioa';

  @override
  String get storage => 'Biltegiratzea: ObjectBox';

  @override
  String get vectorIndex => 'Bektore-indizea: HNSW';

  @override
  String get dimensions => 'Neurriak: 384';

  @override
  String get embeddingModelBge => 'Kapsulatzeko eredua: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Argazkia atera';

  @override
  String get chooseFromGallery => 'Aukeratu Galeriatik';

  @override
  String get editNickname => 'Editatu goitizena';

  @override
  String get enterNickname => 'Sartu ezizena';

  @override
  String get pleaseEnterNickname => 'Mesedez, sartu goitizen bat';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Ezizena dagoeneko badago edo baliogabea da';

  @override
  String get user => 'Erabiltzailea';

  @override
  String get manageScheduledReminders =>
      'Kudeatu programatutako abisuak eta alarmak';

  @override
  String get imageFailedToLoad =>
      'Ezin izan da kargatu irudia. Mesedez, aukeratu berriro.';

  @override
  String get imageIsStillLoading => 'Irudia oraindik kargatzen ari da';

  @override
  String get imageAreaNotReady =>
      'Irudiaren eremua ez dago prest. Mesedez, saiatu berriro.';

  @override
  String get cropFrameNotReady =>
      'Moztu markoa ez dago prest. Mesedez, saiatu berriro.';

  @override
  String get invalidCropArea =>
      'Mozte-eremu baliogabea. Mesedez, saiatu berriro.';

  @override
  String get cropFailed => 'Mozketak huts egin du. Mesedez, saiatu berriro.';

  @override
  String get cropAvatar => 'Moztu Avatarra';

  @override
  String get chooseAgain => 'Aukeratu Berriz';

  @override
  String get rotate90 => 'Biratu 90°';

  @override
  String get dragFrameToMove =>
      'Arrastatu markoa mugitzeko, arrastatu beheko eskuinera tamaina aldatzeko; atximurkatu irudia handitzeko eta mugitzeko.';

  @override
  String get pleaseFillInAllFields => 'Mesedez, bete eremu guztiak';

  @override
  String get pinMustBeAtLeast4Digits =>
      'PINak 4 digitu izan behar ditu gutxienez';

  @override
  String get pinAtLeast4Digits => 'PINak 4 digitu izan behar ditu gutxienez';

  @override
  String get invalidUsernameOrPin => 'Erabiltzaile-izena edo PIN baliogabea';

  @override
  String get invalidUsernameOrPinError =>
      'Erabiltzaile-izena edo PIN baliogabea';

  @override
  String get usernameAlreadyExists => 'Erabiltzaile izena badago jada';

  @override
  String get captureMomentsKeepMemories =>
      'Harrapatu uneak, gorde oroitzapenak';

  @override
  String get username => 'Erabiltzaile izena';

  @override
  String get pin => 'PINa';

  @override
  String get login => 'Saioa hasi';

  @override
  String get createAccount => 'Sortu kontua';

  @override
  String get dontHaveAccountCreateOne => 'Ez al duzu konturik? Sortu bat';

  @override
  String get alreadyHaveAccountLogin => 'Dagoeneko kontu bat duzu? Saioa hasi';

  @override
  String get pleaseEnterUsername => 'Mesedez, idatzi erabiltzaile-izen bat';

  @override
  String get pinsDoNotMatch => 'PINak ez datoz bat';

  @override
  String get tapToAddAvatar => 'Ukitu avatarra gehitzeko';

  @override
  String get yourName => 'Zure izena';

  @override
  String get privatePinOptional => 'PIN pribatua (aukerakoa)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Erregistro pribatuak enkriptatzeko erabiltzen da';

  @override
  String get privatePin => 'PIN pribatua';

  @override
  String get leaveEmptyForNoEncryption => 'Utzi hutsik zifratzerik ez izateko';

  @override
  String get confirmPin => 'Berretsi PINa';

  @override
  String get getStarted => 'Hasi';

  @override
  String get noReminders => 'Ez dago abisurik';

  @override
  String get addReminder => 'Gehitu abisua';

  @override
  String get title => 'Izenburua';

  @override
  String get descriptionOptional => 'Deskribapena (aukerakoa)';

  @override
  String get microphonePermissionRequired => 'Mikrofonoaren baimena behar da';

  @override
  String get aiAssistant => 'AI Laguntzailea';

  @override
  String get listening => 'Entzuten...';

  @override
  String get typeAMessage => 'Idatzi mezu bat...';

  @override
  String get aiChat => 'AI Txata';

  @override
  String get startAConversation => 'Hasi elkarrizketa';

  @override
  String get typeYourMessage => 'Idatzi zure mezua...';

  @override
  String get asrReconnecting => 'ASR berriro konektatzen...';

  @override
  String get write => 'Idatzi';

  @override
  String get writeEntry => 'Idatzi Sarrera';

  @override
  String get noMemoriesYet => 'Oraindik ez dago oroitzapenik';

  @override
  String get tapPlusToCapture => 'Sakatu + zure pentsamenduak jasotzeko';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Sakatu + zure pentsamenduak jasotzeko';

  @override
  String get deleteMemory => 'Ezabatu Memoria';

  @override
  String get deleteRecord => 'Ezabatu erregistroa';

  @override
  String get thisEntryWillBeRemoved =>
      'Sarrera hau zure denbora-lerrotik kenduko da.';

  @override
  String get thisRecordWillBeRemoved =>
      'Erregistro hau zure denbora-lerrotik kenduko da.';

  @override
  String get searchYourRecords => 'Bilatu zure erregistroak...';

  @override
  String get exactMatches => 'Partidu zehatzak';

  @override
  String get noExactMatches => 'Ez dago partida zehatzik';

  @override
  String get exact => 'Zehatza';

  @override
  String get exactMatch => 'Partida zehatza';

  @override
  String get fuzzyMatches => 'Partidu lausoak';

  @override
  String get noFuzzyMatches => 'Partidu lausorik ez';

  @override
  String get vectorMatch => 'Bektore partida';

  @override
  String get networkMatches => 'Sareko partidak';

  @override
  String get noNetworkMatches => 'Ez dago sareko parekorik';

  @override
  String get networkSearchIsOff =>
      'Sareko bilaketa desaktibatuta dago. Gaitu Ezarpenak atalean.';

  @override
  String get network => 'Sarea';

  @override
  String get networkMatch => 'Sareko partida';

  @override
  String get noSearchHistory => 'Ez dago bilaketa-historiarik';

  @override
  String get searchHistory => 'Bilaketa Historia';

  @override
  String get invalidLink => 'Esteka baliogabea';

  @override
  String get unableToOpenWebPage => 'Ezin da web orria ireki';

  @override
  String get imageMemory => '[Irudiaren memoria]';

  @override
  String get tapToOpenWebPage => 'Sakatu web orria irekitzeko';

  @override
  String get editEntry => 'Editatu sarrera';

  @override
  String get entryDetails => 'Sarreraren xehetasunak';

  @override
  String get noContent => 'Edukirik ez';

  @override
  String get diaryNotFound => 'Egunkaria ez da aurkitu';

  @override
  String get diaryNotFoundShort => 'Erregistroa ez da aurkitu';

  @override
  String get aiSummary => 'AIren laburpena';

  @override
  String get microphoneInterrupted =>
      'Mikrofonoa eten da, grabazioa gelditu da.';

  @override
  String get bold => 'Lodia';

  @override
  String get italic => 'Etzana';

  @override
  String get strikethrough => 'Markatua';

  @override
  String get image => 'Irudia';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR ez dago erabilgarri. Grabaketa aktibo dago oraindik.';

  @override
  String get writeYourEntry => 'Idatzi zure sarrera...';

  @override
  String get writeYourContent => 'Idatzi zure edukia...';

  @override
  String microphoneStartFailed(String error) {
    return 'Ezin izan da abiarazi mikrofonoa: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofonoa eten da, grabazioa gelditu da.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR berriro konektatzen: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Txertatu da irudia: $name';
  }

  @override
  String voiceError(String error) {
    return 'Ahots-errorea: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Barkatu, AI zerbitzua ez dago erabilgarri une honetan: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Ezin izan da partekatu: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count hits';
  }

  @override
  String matchCount(int count) {
    return 'Bat-etortzea: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Iturria: $source';
  }

  @override
  String get createNew => 'Sortu';

  @override
  String micStartFailed(String error) {
    return 'Mikrofonoa abiarazteko huts egin du: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Kontuak: +$created / eguneratua $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Egunkariak: +$created / eguneratua $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Abisuak: +$created / eguneratua $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Saltatu egin da: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Aldaketa guztira: $count';
  }

  @override
  String get settingsApplied => 'Babeskopiako ezarpenak aplikatu dira.';

  @override
  String get settingsNotApplied => 'Babeskopiako ezarpenak ez dira aplikatu.';

  @override
  String backupExported(String path) {
    return 'Esportatutako babeskopia: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Ezin izan da esportatu: $error';
  }

  @override
  String importFailed(String error) {
    return 'Ezin izan da inportatu: $error';
  }
}

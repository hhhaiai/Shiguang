// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get languageName => 'Hrvatski';

  @override
  String get languageNameEn => 'Croatian';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'postavke';

  @override
  String get account => 'Račun';

  @override
  String get reminders => 'Podsjetnici';

  @override
  String get language => 'Jezik';

  @override
  String get appLanguage => 'Jezik aplikacije';

  @override
  String get appearance => 'Izgled';

  @override
  String get themeMode => 'Način rada teme';

  @override
  String get dark => 'tamno';

  @override
  String get light => 'Svjetlo';

  @override
  String get system => 'sustav';

  @override
  String get aiService => 'AI usluga';

  @override
  String get aiChatProvider => 'AI Chat Provider';

  @override
  String get chatModel => 'Chat model';

  @override
  String get localModel => 'Lokalni model';

  @override
  String get localModelDefault => 'Lokalni model (zadano)';

  @override
  String get ollamaEndpoint => 'Krajnja točka Ollame';

  @override
  String get ollamaModel => 'Model Ollama';

  @override
  String get openAiEndpoint => 'Krajnja točka OpenAI';

  @override
  String get openAiApiKey => 'OpenAI API ključ';

  @override
  String get openAiModel => 'Model OpenAI';

  @override
  String get geminiEndpoint => 'Krajnja točka Gemini';

  @override
  String get geminiApiKey => 'Gemini API ključ';

  @override
  String get geminiModel => 'Modeli Blizanci';

  @override
  String get anthropicEndpoint => 'Antropska krajnja točka';

  @override
  String get anthropicApiKey => 'Anthropic API ključ';

  @override
  String get anthropicModel => 'Antropički model';

  @override
  String get customProtocol => 'Prilagođeni protokol';

  @override
  String get protocol => 'Protokol';

  @override
  String get customEndpoint => 'Prilagođena krajnja točka';

  @override
  String get customApiKey => 'Prilagođeni API ključ';

  @override
  String get customModel => 'Prilagođeni model';

  @override
  String get optionalForLocalServers =>
      'Izborno za lokalne/prilagođene poslužitelje';

  @override
  String get speechRecognitionEngine => 'Motor za prepoznavanje govora';

  @override
  String get local => 'Lokalno';

  @override
  String get endpoint => 'Krajnja točka';

  @override
  String get localSpeechModel => 'Model lokalnog govora';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (na uređaju)';

  @override
  String get systemSpeechRecognition => 'Sustav za prepoznavanje govora';

  @override
  String get systemRecognitionAndroidIos =>
      'Prepoznavanje sustava (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Prepoznavanje krajnje točke (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Koristite ugrađeni prepoznavač za Android / iOS (može koristiti oblak)';

  @override
  String get voiceAiEndpoint => 'Krajnja točka glasovne umjetne inteligencije';

  @override
  String get embeddingModel => 'Model ugradnje';

  @override
  String get crossDeviceSync => 'Sinkronizacija između uređaja';

  @override
  String get sendToOtherDevices => 'Pošalji na druge uređaje (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Izvezite sigurnosnu kopiju i pošaljite putem dijeljenog lista';

  @override
  String get importFromLocalSend => 'Uvoz iz LocalSend-a';

  @override
  String get selectBackupJson =>
      'Odaberite sigurnosnu kopiju JSON i spojite lokalne podatke';

  @override
  String get autoGeneration => 'Automatsko generiranje';

  @override
  String get autoGenerateSummary => 'Automatski generiraj sažetak';

  @override
  String get generateAiSummaryForNewEntries =>
      'Generirajte AI sažetak za nove unose';

  @override
  String get autoGenerateEmbedding => 'Automatski generiraj ugradnju';

  @override
  String get generateVectorEmbedding =>
      'Generirajte ugrađivanje vektora za pretraživanje';

  @override
  String get enableNetworkSearch => 'Omogući pretraživanje mreže';

  @override
  String get allowOnlineRetrieval =>
      'Dopusti online dohvaćanje za pretraživanje i AI chat (isključeno prema zadanim postavkama)';

  @override
  String get about => 'Oko';

  @override
  String version(String version) {
    return 'Verzija $version';
  }

  @override
  String get database => 'Baza podataka';

  @override
  String get objectBoxWithHnsw => 'ObjectBox s HNSW indeksom';

  @override
  String get logOut => 'Odjava';

  @override
  String get custom => 'Običaj';

  @override
  String get openAiCompatible => 'OpenAI kompatibilan';

  @override
  String get notSet => 'Nije postavljeno';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... ili http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Podržava lokalne/LAN/javne krajnje točke';

  @override
  String get shiguangLocalSendBackup => 'Sigurnosna kopija Shiguang LocalSend';

  @override
  String get localBackupFromShiguang =>
      'Lokalna sigurnosna kopija od Shiguanga (primite putem LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Odaberite datoteku sigurnosne kopije primljenu od LocalSend-a';

  @override
  String get failedToResolveFilePath =>
      'Neuspješno rješavanje odabrane putanje datoteke';

  @override
  String get importOptions => 'Opcije uvoza';

  @override
  String get importSettingsAsWell =>
      'Uvesti i postavke?\n(API ključevi neće biti prebrisani)';

  @override
  String get dataOnly => 'Samo podaci';

  @override
  String get dataAndSettings => 'Podaci + postavke';

  @override
  String get importCompleted => 'Uvoz dovršen';

  @override
  String get settingsInBackupWereApplied =>
      'Primijenjene su postavke u sigurnosnoj kopiji.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Postavke u sigurnosnoj kopiji nisu primijenjene.';

  @override
  String get ok => 'U REDU';

  @override
  String get cancel => 'Otkazati';

  @override
  String get save => 'Uštedjeti';

  @override
  String get delete => 'Izbrisati';

  @override
  String get clear => 'Jasan';

  @override
  String get add => 'Dodati';

  @override
  String get create => 'Stvoriti';

  @override
  String get edit => 'Uredi';

  @override
  String get search => 'Pretraživanje';

  @override
  String get areYouSureYouWantToLogOut =>
      'Jeste li sigurni da se želite odjaviti?';

  @override
  String get chooseLanguage => 'Odaberite jezik';

  @override
  String get databaseInfo => 'Informacije o bazi podataka';

  @override
  String get storage => 'Skladištenje: ObjectBox';

  @override
  String get vectorIndex => 'Vektorski indeks: HNSW';

  @override
  String get dimensions => 'Dimenzije: 384';

  @override
  String get embeddingModelBge => 'Model ugradnje: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Fotografiraj';

  @override
  String get chooseFromGallery => 'Odaberite iz galerije';

  @override
  String get editNickname => 'Uredi nadimak';

  @override
  String get enterNickname => 'Unesite nadimak';

  @override
  String get pleaseEnterNickname => 'Unesite nadimak';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Nadimak već postoji ili je nevažeći';

  @override
  String get user => 'Korisnik';

  @override
  String get manageScheduledReminders =>
      'Upravljajte zakazanim podsjetnicima i alarmima';

  @override
  String get imageFailedToLoad =>
      'Slika se nije uspjela učitati. Odaberite ponovno.';

  @override
  String get imageIsStillLoading => 'Slika se još učitava';

  @override
  String get imageAreaNotReady =>
      'Područje slike nije spremno. Molimo pokušajte ponovo.';

  @override
  String get cropFrameNotReady =>
      'Okvir za obrezivanje nije spreman. Molimo pokušajte ponovo.';

  @override
  String get invalidCropArea =>
      'Nevažeća površina usjeva. Molimo pokušajte ponovo.';

  @override
  String get cropFailed => 'Obrezivanje nije uspjelo. Molimo pokušajte ponovo.';

  @override
  String get cropAvatar => 'Izreži avatar';

  @override
  String get chooseAgain => 'Odaberite ponovno';

  @override
  String get rotate90 => 'Rotirajte 90°';

  @override
  String get dragFrameToMove =>
      'Povucite okvir za pomicanje, povucite dolje desno za promjenu veličine; stisnite prste za zumiranje i pomicanje slike.';

  @override
  String get pleaseFillInAllFields => 'Molimo ispunite sva polja';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN mora imati najmanje 4 znamenke';

  @override
  String get pinAtLeast4Digits => 'PIN mora imati najmanje 4 znamenke';

  @override
  String get invalidUsernameOrPin => 'Nevažeće korisničko ime ili PIN';

  @override
  String get invalidUsernameOrPinError => 'Nevažeće korisničko ime ili PIN';

  @override
  String get usernameAlreadyExists => 'Korisničko ime već postoji';

  @override
  String get captureMomentsKeepMemories =>
      'Uhvatite trenutke, sačuvajte uspomene';

  @override
  String get username => 'Korisničko ime';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Prijava';

  @override
  String get createAccount => 'Napravi račun';

  @override
  String get dontHaveAccountCreateOne => 'Nemate račun? Stvorite jedan';

  @override
  String get alreadyHaveAccountLogin => 'Već imate račun? Prijava';

  @override
  String get pleaseEnterUsername => 'Unesite korisničko ime';

  @override
  String get pinsDoNotMatch => 'PIN-ovi se ne podudaraju';

  @override
  String get tapToAddAvatar => 'Dodirnite za dodavanje avatara';

  @override
  String get yourName => 'Vaše ime';

  @override
  String get privatePinOptional => 'Privatni PIN (nije obavezno)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Koristi se za šifriranje privatnih zapisa';

  @override
  String get privatePin => 'Privatni PIN';

  @override
  String get leaveEmptyForNoEncryption => 'Ostavite prazno ako nema enkripcije';

  @override
  String get confirmPin => 'Potvrdite PIN';

  @override
  String get getStarted => 'Započnite';

  @override
  String get noReminders => 'Nema podsjetnika';

  @override
  String get addReminder => 'Dodaj podsjetnik';

  @override
  String get title => 'Titula';

  @override
  String get descriptionOptional => 'Opis (nije obavezno)';

  @override
  String get microphonePermissionRequired =>
      'Potrebno je dopuštenje za mikrofon';

  @override
  String get aiAssistant => 'AI pomoćnik';

  @override
  String get listening => 'Slušanje...';

  @override
  String get typeAMessage => 'Upišite poruku...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Započnite razgovor';

  @override
  String get typeYourMessage => 'Upišite svoju poruku...';

  @override
  String get asrReconnecting => 'ASR ponovno povezivanje...';

  @override
  String get write => 'Pisati';

  @override
  String get writeEntry => 'Napiši unos';

  @override
  String get noMemoriesYet => 'Još nema sjećanja';

  @override
  String get tapPlusToCapture => 'Dodirnite + da zabilježite svoje misli';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Dodirnite + da zabilježite svoje misli';

  @override
  String get deleteMemory => 'Izbriši memoriju';

  @override
  String get deleteRecord => 'Izbriši zapis';

  @override
  String get thisEntryWillBeRemoved =>
      'Ovaj će unos biti uklonjen s vaše vremenske trake.';

  @override
  String get thisRecordWillBeRemoved =>
      'Ovaj će zapis biti uklonjen s vaše vremenske trake.';

  @override
  String get searchYourRecords => 'Pretražite svoje zapise...';

  @override
  String get exactMatches => 'Točna podudaranja';

  @override
  String get noExactMatches => 'Nema točnih podudaranja';

  @override
  String get exact => 'Točan';

  @override
  String get exactMatch => 'Točno podudaranje';

  @override
  String get fuzzyMatches => 'Nejasna podudaranja';

  @override
  String get noFuzzyMatches => 'Nema nejasnih podudaranja';

  @override
  String get vectorMatch => 'Podudaranje vektora';

  @override
  String get networkMatches => 'Mrežne utakmice';

  @override
  String get noNetworkMatches => 'Nema mrežnih podudaranja';

  @override
  String get networkSearchIsOff =>
      'Pretraga mreže je isključena. Omogućite ga u postavkama.';

  @override
  String get network => 'Mreža';

  @override
  String get networkMatch => 'Podudaranje mreže';

  @override
  String get noSearchHistory => 'Nema povijesti pretraživanja';

  @override
  String get searchHistory => 'Povijest pretraživanja';

  @override
  String get invalidLink => 'Nevažeći link';

  @override
  String get unableToOpenWebPage => 'Nije moguće otvoriti web stranicu';

  @override
  String get imageMemory => '[Memorija slike]';

  @override
  String get tapToOpenWebPage => 'Dodirnite za otvaranje web stranice';

  @override
  String get editEntry => 'Uredi unos';

  @override
  String get entryDetails => 'Detalji unosa';

  @override
  String get noContent => 'Nema sadržaja';

  @override
  String get diaryNotFound => 'Dnevnik nije pronađen';

  @override
  String get diaryNotFoundShort => 'Zapis nije pronađen';

  @override
  String get aiSummary => 'AI Sažetak';

  @override
  String get microphoneInterrupted =>
      'Mikrofon prekinut, snimanje zaustavljeno.';

  @override
  String get bold => 'Podebljano';

  @override
  String get italic => 'kurziv';

  @override
  String get strikethrough => 'Precrtano';

  @override
  String get image => 'Slika';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR nedostupan. Snimanje je još uvijek aktivno.';

  @override
  String get writeYourEntry => 'Napišite svoj unos...';

  @override
  String get writeYourContent => 'Napišite svoj sadržaj...';

  @override
  String microphoneStartFailed(String error) {
    return 'Pokretanje mikrofona nije uspjelo: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofon prekinut, snimanje zaustavljeno.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR ponovno povezivanje: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Umetnuta slika: $name';
  }

  @override
  String voiceError(String error) {
    return 'Glasovna pogreška: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Nažalost, AI usluga trenutno nije dostupna: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Dijeljenje nije uspjelo: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count pogodaka';
  }

  @override
  String matchCount(int count) {
    return 'Podudaranje: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Izvor: $source';
  }

  @override
  String get createNew => 'Stvoriti';

  @override
  String micStartFailed(String error) {
    return 'Pokretanje mikrofona nije uspjelo: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Računi: +$created / ažurirano $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Dnevnici: +$created / ažurirano $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Podsjetnici: +$created / ažurirano $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Preskočeno: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Ukupno promijenjeno: $count';
  }

  @override
  String get settingsApplied =>
      'Primijenjene su postavke u sigurnosnoj kopiji.';

  @override
  String get settingsNotApplied =>
      'Postavke u sigurnosnoj kopiji nisu primijenjene.';

  @override
  String backupExported(String path) {
    return 'Izvezena sigurnosna kopija: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Izvoz nije uspio: $error';
  }

  @override
  String importFailed(String error) {
    return 'Uvoz nije uspio: $error';
  }
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bosnian (`bs`).
class AppLocalizationsBs extends AppLocalizations {
  AppLocalizationsBs([String locale = 'bs']) : super(locale);

  @override
  String get languageName => 'Bosanski';

  @override
  String get languageNameEn => 'Bosnian';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Postavke';

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
  String get themeMode => 'Theme Mode';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get system => 'Sistem';

  @override
  String get aiService => 'AI usluga';

  @override
  String get aiChatProvider => 'AI Chat Provider';

  @override
  String get chatModel => 'Chat Model';

  @override
  String get localModel => 'Lokalni model';

  @override
  String get localModelDefault => 'Lokalni model (zadano)';

  @override
  String get ollamaEndpoint => 'Ollama Endpoint';

  @override
  String get ollamaModel => 'Ollama model';

  @override
  String get openAiEndpoint => 'OpenAI krajnja tačka';

  @override
  String get openAiApiKey => 'OpenAI API ključ';

  @override
  String get openAiModel => 'OpenAI model';

  @override
  String get geminiEndpoint => 'Gemini Endpoint';

  @override
  String get geminiApiKey => 'Gemini API ključ';

  @override
  String get geminiModel => 'Gemini Models';

  @override
  String get anthropicEndpoint => 'Antropska krajnja tačka';

  @override
  String get anthropicApiKey => 'Antropski API ključ';

  @override
  String get anthropicModel => 'Antropski model';

  @override
  String get customProtocol => 'Custom Protocol';

  @override
  String get protocol => 'Protokol';

  @override
  String get customEndpoint => 'Custom Endpoint';

  @override
  String get customApiKey => 'Prilagođeni API ključ';

  @override
  String get customModel => 'Custom Model';

  @override
  String get optionalForLocalServers =>
      'Opciono za lokalne/prilagođene servere';

  @override
  String get speechRecognitionEngine => 'Motor za prepoznavanje govora';

  @override
  String get local => 'Lokalno';

  @override
  String get endpoint => 'Krajnja tačka';

  @override
  String get localSpeechModel => 'Lokalni govorni model';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (na uređaju)';

  @override
  String get systemSpeechRecognition => 'Sistemsko prepoznavanje govora';

  @override
  String get systemRecognitionAndroidIos =>
      'Sistemsko prepoznavanje (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Prepoznavanje krajnje tačke (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Koristite ugrađeni Android / iOS prepoznavač (može koristiti oblak)';

  @override
  String get voiceAiEndpoint => 'Glasovna AI krajnja tačka';

  @override
  String get embeddingModel => 'Embedding Model';

  @override
  String get crossDeviceSync => 'Sinhronizacija na različitim uređajima';

  @override
  String get sendToOtherDevices => 'Pošalji na druge uređaje (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Izvezite sigurnosnu kopiju i pošaljite putem dijeljenog lista';

  @override
  String get importFromLocalSend => 'Uvoz iz LocalSenda';

  @override
  String get selectBackupJson =>
      'Odaberite rezervni JSON i spojite lokalne podatke';

  @override
  String get autoGeneration => 'Auto Generation';

  @override
  String get autoGenerateSummary => 'Auto Generate Summary';

  @override
  String get generateAiSummaryForNewEntries =>
      'Generirajte AI sažetak za nove unose';

  @override
  String get autoGenerateEmbedding => 'Auto Generate Embedding';

  @override
  String get generateVectorEmbedding =>
      'Generirajte ugrađivanje vektora za pretragu';

  @override
  String get enableNetworkSearch => 'Omogućite pretragu mreže';

  @override
  String get allowOnlineRetrieval =>
      'Dozvoli online preuzimanje za pretraživanje i AI chat (isključeno prema zadanim postavkama)';

  @override
  String get about => 'O';

  @override
  String version(String version) {
    return 'Verzija $version';
  }

  @override
  String get database => 'Baza podataka';

  @override
  String get objectBoxWithHnsw => 'ObjectBox sa HNSW indeksom';

  @override
  String get logOut => 'Odjavite se';

  @override
  String get custom => 'Custom';

  @override
  String get openAiCompatible => 'OpenAI kompatibilan';

  @override
  String get notSet => 'Nije postavljeno';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Podržava lokalne/LAN/javne krajnje tačke';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend Backup';

  @override
  String get localBackupFromShiguang =>
      'Lokalna sigurnosna kopija od Shiguanga (primanje putem LocalSenda)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Odaberite datoteku sigurnosne kopije primljene od LocalSenda';

  @override
  String get failedToResolveFilePath =>
      'Nije uspjelo rješavanje odabrane putanje datoteke';

  @override
  String get importOptions => 'Opcije uvoza';

  @override
  String get importSettingsAsWell =>
      'I uvesti postavke?\n(API ključevi neće biti prepisani)';

  @override
  String get dataOnly => 'Samo podaci';

  @override
  String get dataAndSettings => 'Podaci + postavke';

  @override
  String get importCompleted => 'Uvoz je završen';

  @override
  String get settingsInBackupWereApplied =>
      'Primijenjene su postavke u sigurnosnoj kopiji.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Postavke u sigurnosnoj kopiji nisu primijenjene.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Otkaži';

  @override
  String get save => 'Sačuvaj';

  @override
  String get delete => 'Izbriši';

  @override
  String get clear => 'Jasno';

  @override
  String get add => 'Dodaj';

  @override
  String get create => 'Kreiraj';

  @override
  String get edit => 'Uredi';

  @override
  String get search => 'Traži';

  @override
  String get areYouSureYouWantToLogOut =>
      'Jeste li sigurni da se želite odjaviti?';

  @override
  String get chooseLanguage => 'Odaberite Jezik';

  @override
  String get databaseInfo => 'Podaci o bazi podataka';

  @override
  String get storage => 'Skladištenje: ObjectBox';

  @override
  String get vectorIndex => 'Vektorski indeks: HNSW';

  @override
  String get dimensions => 'Dimenzije: 384';

  @override
  String get embeddingModelBge => 'Model ugradnje: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Snimite fotografiju';

  @override
  String get chooseFromGallery => 'Odaberite iz Galerije';

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
      'Učitavanje slike nije uspjelo. Molimo izaberite ponovo.';

  @override
  String get imageIsStillLoading => 'Slika se još uvijek učitava';

  @override
  String get imageAreaNotReady =>
      'Područje slike nije spremno. Molimo pokušajte ponovo.';

  @override
  String get cropFrameNotReady =>
      'Okvir za izrezivanje nije spreman. Molimo pokušajte ponovo.';

  @override
  String get invalidCropArea =>
      'Nevažeća površina izrezivanja. Molimo pokušajte ponovo.';

  @override
  String get cropFailed => 'Obrezivanje nije uspjelo. Molimo pokušajte ponovo.';

  @override
  String get cropAvatar => 'Crop Avatar';

  @override
  String get chooseAgain => 'Izaberite ponovo';

  @override
  String get rotate90 => 'Rotirajte za 90°';

  @override
  String get dragFrameToMove =>
      'Prevucite okvir da biste pomerili, prevucite dole desno da biste promenili veličinu; stisnite prste za zumiranje i pomicanje slike.';

  @override
  String get pleaseFillInAllFields => 'Molimo popunite sva polja';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN mora imati najmanje 4 cifre';

  @override
  String get pinAtLeast4Digits => 'PIN mora imati najmanje 4 cifre';

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
  String get createAccount => 'Kreirajte nalog';

  @override
  String get dontHaveAccountCreateOne => 'Nemate račun? Napravite jedan';

  @override
  String get alreadyHaveAccountLogin => 'Već imate račun? Prijava';

  @override
  String get pleaseEnterUsername => 'Unesite korisničko ime';

  @override
  String get pinsDoNotMatch => 'PIN-ovi se ne podudaraju';

  @override
  String get tapToAddAvatar => 'Dodirnite da dodate avatar';

  @override
  String get yourName => 'Vaše ime';

  @override
  String get privatePinOptional => 'Privatni PIN (opcionalno)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Koristi se za šifriranje privatnih zapisa';

  @override
  String get privatePin => 'Privatni PIN';

  @override
  String get leaveEmptyForNoEncryption => 'Ostavite prazno jer nema šifriranja';

  @override
  String get confirmPin => 'Potvrdite PIN';

  @override
  String get getStarted => 'Započnite';

  @override
  String get noReminders => 'Nema podsjetnika';

  @override
  String get addReminder => 'Dodaj podsjetnik';

  @override
  String get title => 'Naslov';

  @override
  String get descriptionOptional => 'Opis (opcionalno)';

  @override
  String get microphonePermissionRequired => 'Potrebna je dozvola za mikrofon';

  @override
  String get aiAssistant => 'AI Assistant';

  @override
  String get listening => 'slušam...';

  @override
  String get typeAMessage => 'Upišite poruku...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Započnite razgovor';

  @override
  String get typeYourMessage => 'Upišite svoju poruku...';

  @override
  String get asrReconnecting => 'ASR se ponovo povezuje...';

  @override
  String get write => 'Pišite';

  @override
  String get writeEntry => 'Write Entry';

  @override
  String get noMemoriesYet => 'Još nema uspomena';

  @override
  String get tapPlusToCapture => 'Dodirnite + da uhvatite svoje misli';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Dodirnite + da uhvatite svoje misli';

  @override
  String get deleteMemory => 'Izbriši memoriju';

  @override
  String get deleteRecord => 'Izbriši zapis';

  @override
  String get thisEntryWillBeRemoved =>
      'Ovaj unos će biti uklonjen sa vaše vremenske linije.';

  @override
  String get thisRecordWillBeRemoved =>
      'Ovaj zapis će biti uklonjen sa vaše vremenske linije.';

  @override
  String get searchYourRecords => 'Pretražite svoju evidenciju...';

  @override
  String get exactMatches => 'Tačna podudaranja';

  @override
  String get noExactMatches => 'Nema tačnih podudaranja';

  @override
  String get exact => 'Tačno';

  @override
  String get exactMatch => 'Tačno podudaranje';

  @override
  String get fuzzyMatches => 'Fuzzy Matches';

  @override
  String get noFuzzyMatches => 'Nema nejasnih podudaranja';

  @override
  String get vectorMatch => 'Vector Match';

  @override
  String get networkMatches => 'Mrežne utakmice';

  @override
  String get noNetworkMatches => 'Nema podudaranja mreže';

  @override
  String get networkSearchIsOff =>
      'Pretraga mreže je isključena. Omogućite ga u Postavkama.';

  @override
  String get network => 'Mreža';

  @override
  String get networkMatch => 'Network Match';

  @override
  String get noSearchHistory => 'Nema historije pretraživanja';

  @override
  String get searchHistory => 'Povijest pretraživanja';

  @override
  String get invalidLink => 'Nevažeći link';

  @override
  String get unableToOpenWebPage => 'Nije moguće otvoriti web stranicu';

  @override
  String get imageMemory => '[Memorija slike]';

  @override
  String get tapToOpenWebPage => 'Dodirnite da otvorite web stranicu';

  @override
  String get editEntry => 'Uredi unos';

  @override
  String get entryDetails => 'Detalji o ulasku';

  @override
  String get noContent => 'Nema sadržaja';

  @override
  String get diaryNotFound => 'Dnevnik nije pronađen';

  @override
  String get diaryNotFoundShort => 'Zapis nije pronađen';

  @override
  String get aiSummary => 'AI sažetak';

  @override
  String get microphoneInterrupted =>
      'Mikrofon je prekinut, snimanje je zaustavljeno.';

  @override
  String get bold => 'Bold';

  @override
  String get italic => 'Kurziv';

  @override
  String get strikethrough => 'Precrtano';

  @override
  String get image => 'Slika';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR nedostupan. Snimanje je i dalje aktivno.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

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
      'Mikrofon je prekinut, snimanje je zaustavljeno.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR ponovno povezivanje: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Slika je umetnuta: $name';
  }

  @override
  String voiceError(String error) {
    return 'Glasovna greška: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Žao nam je, AI usluga trenutno nije dostupna: $error';
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
    return 'Utakmica: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Izvor: $source';
  }

  @override
  String get createNew => 'Kreiraj';

  @override
  String micStartFailed(String error) {
    return 'Pokretanje mikrofona nije uspjelo: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Računi: +$created / ažurirani $updated';
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

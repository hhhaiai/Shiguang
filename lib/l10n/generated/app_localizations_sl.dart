// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get languageName => 'Slovenščina';

  @override
  String get languageNameEn => 'Slovenian';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'nastavitve';

  @override
  String get account => 'Račun';

  @override
  String get reminders => 'Opomniki';

  @override
  String get language => 'Jezik';

  @override
  String get appLanguage => 'Jezik aplikacije';

  @override
  String get appearance => 'Videz';

  @override
  String get themeMode => 'Tematski način';

  @override
  String get dark => 'Temno';

  @override
  String get light => 'Svetloba';

  @override
  String get system => 'Sistem';

  @override
  String get aiService => 'Storitev AI';

  @override
  String get aiChatProvider => 'Ponudnik klepeta z umetno inteligenco';

  @override
  String get chatModel => 'Model klepeta';

  @override
  String get localModel => 'Lokalni model';

  @override
  String get localModelDefault => 'Lokalni model (privzeto)';

  @override
  String get ollamaEndpoint => 'Končna točka Ollama';

  @override
  String get ollamaModel => 'Model Ollama';

  @override
  String get openAiEndpoint => 'Končna točka OpenAI';

  @override
  String get openAiApiKey => 'OpenAI API ključ';

  @override
  String get openAiModel => 'Model OpenAI';

  @override
  String get geminiEndpoint => 'Končna točka Gemini';

  @override
  String get geminiApiKey => 'Gemini API ključ';

  @override
  String get geminiModel => 'Modeli Gemini';

  @override
  String get anthropicEndpoint => 'Antropična končna točka';

  @override
  String get anthropicApiKey => 'Anthropic API ključ';

  @override
  String get anthropicModel => 'Antropični model';

  @override
  String get customProtocol => 'Protokol po meri';

  @override
  String get protocol => 'Protokol';

  @override
  String get customEndpoint => 'Končna točka po meri';

  @override
  String get customApiKey => 'Ključ API po meri';

  @override
  String get customModel => 'Model po meri';

  @override
  String get optionalForLocalServers =>
      'Izbirno za lokalne strežnike/strežnike po meri';

  @override
  String get speechRecognitionEngine => 'Mehanizem za prepoznavanje govora';

  @override
  String get local => 'Lokalno';

  @override
  String get endpoint => 'Končna točka';

  @override
  String get localSpeechModel => 'Model lokalnega govora';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (v napravi)';

  @override
  String get systemSpeechRecognition => 'Sistem za prepoznavanje govora';

  @override
  String get systemRecognitionAndroidIos =>
      'Sistemsko prepoznavanje (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Prepoznavanje končne točke (oblak/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Uporaba vgrajenega prepoznavalnika za Android/iOS (lahko uporablja oblak)';

  @override
  String get voiceAiEndpoint => 'Končna točka glasovne umetne inteligence';

  @override
  String get embeddingModel => 'Model vdelave';

  @override
  String get crossDeviceSync => 'Sinhronizacija med napravami';

  @override
  String get sendToOtherDevices => 'Pošlji v druge naprave (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Izvozite varnostno kopijo in pošljite prek lista za skupno rabo';

  @override
  String get importFromLocalSend => 'Uvoz iz LocalSend';

  @override
  String get selectBackupJson =>
      'Izberite varnostno kopijo JSON in združite lokalne podatke';

  @override
  String get autoGeneration => 'Samodejno ustvarjanje';

  @override
  String get autoGenerateSummary => 'Samodejno ustvari povzetek';

  @override
  String get generateAiSummaryForNewEntries =>
      'Ustvari povzetek AI za nove vnose';

  @override
  String get autoGenerateEmbedding => 'Samodejno ustvari vdelavo';

  @override
  String get generateVectorEmbedding => 'Ustvarite vdelavo vektorja za iskanje';

  @override
  String get enableNetworkSearch => 'Omogoči iskanje omrežja';

  @override
  String get allowOnlineRetrieval =>
      'Dovoli spletno iskanje za iskanje in klepet z umetno inteligenco (privzeto izklopljeno)';

  @override
  String get about => 'O tem';

  @override
  String version(String version) {
    return 'Različica $version';
  }

  @override
  String get database => 'Baza podatkov';

  @override
  String get objectBoxWithHnsw => 'ObjectBox z indeksom HNSW';

  @override
  String get logOut => 'Odjava';

  @override
  String get custom => 'Po meri';

  @override
  String get openAiCompatible => 'Združljiv z OpenAI';

  @override
  String get notSet => 'Ni nastavljeno';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... ali http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'Podpira lokalne/LAN/javne končne točke';

  @override
  String get shiguangLocalSendBackup => 'Varnostna kopija Shiguang LocalSend';

  @override
  String get localBackupFromShiguang =>
      'Lokalna varnostna kopija od Shiguang (prejmi prek LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Izberite varnostno kopijo, prejeto od LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Izbrane poti datoteke ni bilo mogoče razrešiti';

  @override
  String get importOptions => 'Možnosti uvoza';

  @override
  String get importSettingsAsWell =>
      'Uvoziti tudi nastavitve?\n(Ključi API-ja ne bodo prepisani)';

  @override
  String get dataOnly => 'Samo podatki';

  @override
  String get dataAndSettings => 'Podatki + nastavitve';

  @override
  String get importCompleted => 'Uvoz končan';

  @override
  String get settingsInBackupWereApplied =>
      'Uporabljene so bile nastavitve v varnostni kopiji.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Nastavitve v varnostni kopiji niso bile uporabljene.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Prekliči';

  @override
  String get save => 'Shrani';

  @override
  String get delete => 'Izbriši';

  @override
  String get clear => 'jasno';

  @override
  String get add => 'Dodaj';

  @override
  String get create => 'Ustvari';

  @override
  String get edit => 'Uredi';

  @override
  String get search => 'Iskanje';

  @override
  String get areYouSureYouWantToLogOut =>
      'Ste prepričani, da se želite odjaviti?';

  @override
  String get chooseLanguage => 'Izberite jezik';

  @override
  String get databaseInfo => 'Informacije o bazi podatkov';

  @override
  String get storage => 'Shramba: ObjectBox';

  @override
  String get vectorIndex => 'Vektorski indeks: HNSW';

  @override
  String get dimensions => 'Dimenzije: 384';

  @override
  String get embeddingModelBge => 'Model vdelave: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Posnemi fotografijo';

  @override
  String get chooseFromGallery => 'Izberite iz galerije';

  @override
  String get editNickname => 'Uredi vzdevek';

  @override
  String get enterNickname => 'Vnesite vzdevek';

  @override
  String get pleaseEnterNickname => 'Vnesite vzdevek';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Vzdevek že obstaja ali pa ni veljaven';

  @override
  String get user => 'Uporabnik';

  @override
  String get manageScheduledReminders =>
      'Upravljajte načrtovane opomnike in alarme';

  @override
  String get imageFailedToLoad =>
      'Slike ni bilo mogoče naložiti. Prosimo izberite znova.';

  @override
  String get imageIsStillLoading => 'Slika se še nalaga';

  @override
  String get imageAreaNotReady =>
      'Območje slike ni pripravljeno. prosim poskusite znova';

  @override
  String get cropFrameNotReady =>
      'Okvir za obrezovanje ni pripravljen. prosim poskusite znova';

  @override
  String get invalidCropArea =>
      'Neveljavna površina posevka. prosim poskusite znova';

  @override
  String get cropFailed => 'Obrezovanje ni uspelo. prosim poskusite znova';

  @override
  String get cropAvatar => 'Obreži avatar';

  @override
  String get chooseAgain => 'Izberite Ponovno';

  @override
  String get rotate90 => 'Zasukaj za 90°';

  @override
  String get dragFrameToMove =>
      'Povlecite okvir za premikanje, povlecite spodaj desno za spreminjanje velikosti; stisnite za povečavo in premikanje slike.';

  @override
  String get pleaseFillInAllFields => 'Prosimo izpolnite vsa polja';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN mora imeti vsaj 4 števke';

  @override
  String get pinAtLeast4Digits => 'PIN mora imeti vsaj 4 števke';

  @override
  String get invalidUsernameOrPin => 'Neveljavno uporabniško ime ali PIN';

  @override
  String get invalidUsernameOrPinError => 'Neveljavno uporabniško ime ali PIN';

  @override
  String get usernameAlreadyExists => 'Uporabniško ime že obstaja';

  @override
  String get captureMomentsKeepMemories => 'Ujemite trenutke, ohranite spomine';

  @override
  String get username => 'Uporabniško ime';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Prijava';

  @override
  String get createAccount => 'Ustvari račun';

  @override
  String get dontHaveAccountCreateOne => 'Nimate računa? Ustvarite enega';

  @override
  String get alreadyHaveAccountLogin => 'Že imate račun? Prijava';

  @override
  String get pleaseEnterUsername => 'Vnesite uporabniško ime';

  @override
  String get pinsDoNotMatch => 'PIN-a se ne ujemata';

  @override
  String get tapToAddAvatar => 'Tapnite, da dodate avatar';

  @override
  String get yourName => 'Vaše ime';

  @override
  String get privatePinOptional => 'Zasebna koda PIN (neobvezno)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Uporablja se za šifriranje zasebnih zapisov';

  @override
  String get privatePin => 'Zasebni PIN';

  @override
  String get leaveEmptyForNoEncryption => 'Pustite prazno, če ni šifriranja';

  @override
  String get confirmPin => 'Potrdite PIN';

  @override
  String get getStarted => 'Začnite';

  @override
  String get noReminders => 'Brez opomnikov';

  @override
  String get addReminder => 'Dodaj opomnik';

  @override
  String get title => 'Naslov';

  @override
  String get descriptionOptional => 'Opis (neobvezno)';

  @override
  String get microphonePermissionRequired =>
      'Potrebno je dovoljenje za mikrofon';

  @override
  String get aiAssistant => 'Pomočnik AI';

  @override
  String get listening => 'Poslušanje ...';

  @override
  String get typeAMessage => 'Vnesite sporočilo ...';

  @override
  String get aiChat => 'AI Klepet';

  @override
  String get startAConversation => 'Začnite pogovor';

  @override
  String get typeYourMessage => 'Vnesite svoje sporočilo ...';

  @override
  String get asrReconnecting => 'Ponovna povezava ASR ...';

  @override
  String get write => 'Pišite';

  @override
  String get writeEntry => 'Napišite vnos';

  @override
  String get noMemoriesYet => 'Brez spominov še';

  @override
  String get tapPlusToCapture => 'Tapnite +, da zajamete svoje misli';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Tapnite +, da zajamete svoje misli';

  @override
  String get deleteMemory => 'Izbriši pomnilnik';

  @override
  String get deleteRecord => 'Izbriši zapis';

  @override
  String get thisEntryWillBeRemoved =>
      'Ta vnos bo odstranjen z vaše časovnice.';

  @override
  String get thisRecordWillBeRemoved =>
      'Ta zapis bo odstranjen z vaše časovnice.';

  @override
  String get searchYourRecords => 'Preiščite svoje zapise ...';

  @override
  String get exactMatches => 'Natančna ujemanja';

  @override
  String get noExactMatches => 'Ni natančnih ujemanj';

  @override
  String get exact => 'Točno';

  @override
  String get exactMatch => 'Natančno ujemanje';

  @override
  String get fuzzyMatches => 'Nejasna ujemanja';

  @override
  String get noFuzzyMatches => 'Ni nejasnih ujemanj';

  @override
  String get vectorMatch => 'Vektorsko ujemanje';

  @override
  String get networkMatches => 'Omrežne tekme';

  @override
  String get noNetworkMatches => 'Nobeno omrežje se ne ujema';

  @override
  String get networkSearchIsOff =>
      'Iskanje omrežja je izklopljeno. Omogočite ga v nastavitvah.';

  @override
  String get network => 'Omrežje';

  @override
  String get networkMatch => 'Omrežno ujemanje';

  @override
  String get noSearchHistory => 'Ni zgodovine iskanja';

  @override
  String get searchHistory => 'Zgodovina iskanja';

  @override
  String get invalidLink => 'Neveljavna povezava';

  @override
  String get unableToOpenWebPage => 'Spletne strani ni mogoče odpreti';

  @override
  String get imageMemory => '[Slikovni spomin]';

  @override
  String get tapToOpenWebPage => 'Tapnite, da odprete spletno stran';

  @override
  String get editEntry => 'Uredi vnos';

  @override
  String get entryDetails => 'Podrobnosti vnosa';

  @override
  String get noContent => 'Brez vsebine';

  @override
  String get diaryNotFound => 'Dnevnik ni bil najden';

  @override
  String get diaryNotFoundShort => 'Zapis ni bil najden';

  @override
  String get aiSummary => 'Povzetek AI';

  @override
  String get microphoneInterrupted =>
      'Mikrofon prekinjen, snemanje ustavljeno.';

  @override
  String get bold => 'Krepko';

  @override
  String get italic => 'Ležeče';

  @override
  String get strikethrough => 'Prečrtano';

  @override
  String get image => 'Slika';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR ni na voljo. Snemanje je še vedno aktivno.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Napišite svoj vnos ...';

  @override
  String get writeYourContent => 'Napišite svojo vsebino ...';

  @override
  String microphoneStartFailed(String error) {
    return 'Mikrofona ni bilo mogoče zagnati: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofon prekinjen, snemanje ustavljeno.';

  @override
  String asrReconnectingError(String error) {
    return 'Ponovna povezava ASR: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Vstavljena slika: $name';
  }

  @override
  String voiceError(String error) {
    return 'Glasovna napaka: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Žal storitev AI trenutno ni na voljo: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Skupna raba ni uspela: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count zadetkov';
  }

  @override
  String matchCount(int count) {
    return 'Ujemanje: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Vir: $source';
  }

  @override
  String get createNew => 'Ustvari';

  @override
  String micStartFailed(String error) {
    return 'Zagon mikrofona ni uspel: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Računi: +$created / posodobljeno $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Dnevniki: +$created / posodobljeno $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Opomniki: +$created / posodobljeno $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Preskočeno: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Skupno spremenjeno: $count';
  }

  @override
  String get settingsApplied =>
      'Uporabljene so bile nastavitve v varnostni kopiji.';

  @override
  String get settingsNotApplied =>
      'Nastavitve v varnostni kopiji niso bile uporabljene.';

  @override
  String backupExported(String path) {
    return 'Izvožena varnostna kopija: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Izvoz ni uspel: $error';
  }

  @override
  String importFailed(String error) {
    return 'Uvoz ni uspel: $error';
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

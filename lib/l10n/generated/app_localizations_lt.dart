// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get languageName => 'Lietuvių';

  @override
  String get languageNameEn => 'Lithuanian';

  @override
  String get appTitle => 'Šiguangas';

  @override
  String get settings => 'Nustatymai';

  @override
  String get account => 'sąskaita';

  @override
  String get reminders => 'Priminimai';

  @override
  String get language => 'Kalba';

  @override
  String get appLanguage => 'Programos kalba';

  @override
  String get appearance => 'Išvaizda';

  @override
  String get themeMode => 'Temos režimas';

  @override
  String get dark => 'Tamsus';

  @override
  String get light => 'Šviesa';

  @override
  String get system => 'Sistema';

  @override
  String get aiService => 'AI paslauga';

  @override
  String get aiChatProvider => 'AI pokalbių teikėjas';

  @override
  String get chatModel => 'Pokalbių modelis';

  @override
  String get localModel => 'Vietinis modelis';

  @override
  String get localModelDefault => 'Vietinis modelis (numatytasis)';

  @override
  String get ollamaEndpoint => 'Ollamos galutinis taškas';

  @override
  String get ollamaModel => 'Ollama modelis';

  @override
  String get openAiEndpoint => 'OpenAI galutinis taškas';

  @override
  String get openAiApiKey => 'OpenAI API raktas';

  @override
  String get openAiModel => 'OpenAI modelis';

  @override
  String get geminiEndpoint => 'Dvynių galutinis taškas';

  @override
  String get geminiApiKey => 'Gemini API raktas';

  @override
  String get geminiModel => 'Dvynių modeliai';

  @override
  String get anthropicEndpoint => 'Antropinis galutinis taškas';

  @override
  String get anthropicApiKey => 'Antropinis API raktas';

  @override
  String get anthropicModel => 'Antropinis modelis';

  @override
  String get customProtocol => 'Pasirinktinis protokolas';

  @override
  String get protocol => 'protokolas';

  @override
  String get customEndpoint => 'Pasirinktinis galutinis taškas';

  @override
  String get customApiKey => 'Pasirinktinis API raktas';

  @override
  String get customModel => 'Individualus modelis';

  @override
  String get optionalForLocalServers =>
      'Neprivaloma vietiniams / pasirinktiniams serveriams';

  @override
  String get speechRecognitionEngine => 'Kalbos atpažinimo variklis';

  @override
  String get local => 'Vietinis';

  @override
  String get endpoint => 'Galutinis taškas';

  @override
  String get localSpeechModel => 'Vietinis kalbos modelis';

  @override
  String get senseVoiceOnnx => '„SenseVoice ONNX“ (įrenginyje)';

  @override
  String get systemSpeechRecognition => 'Sistemos kalbos atpažinimas';

  @override
  String get systemRecognitionAndroidIos =>
      'Sistemos atpažinimas („Android“ / „iOS“)';

  @override
  String get endpointRecognitionCloudWs =>
      'Galinio taško atpažinimas (debesis / WS)';

  @override
  String get useBuiltInRecognizer =>
      'Naudokite įmontuotą Android / iOS atpažintuvą (gali naudoti debesį)';

  @override
  String get voiceAiEndpoint => 'Balso AI galutinis taškas';

  @override
  String get embeddingModel => 'Įdėjimo modelis';

  @override
  String get crossDeviceSync => 'Kelių įrenginių sinchronizavimas';

  @override
  String get sendToOtherDevices => 'Siųsti į kitus įrenginius (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Eksportuokite atsarginę kopiją ir išsiųskite per bendrinimo lapą';

  @override
  String get importFromLocalSend => 'Importuoti iš LocalSend';

  @override
  String get selectBackupJson =>
      'Pasirinkite atsarginę JSON kopiją ir sujunkite vietinius duomenis';

  @override
  String get autoGeneration => 'Auto generacija';

  @override
  String get autoGenerateSummary => 'Automatiškai generuoti suvestinę';

  @override
  String get generateAiSummaryForNewEntries =>
      'Sukurkite naujų įrašų AI suvestinę';

  @override
  String get autoGenerateEmbedding => 'Automatinis įterpimo generavimas';

  @override
  String get generateVectorEmbedding => 'Sukurkite vektorinį įterpimą paieškai';

  @override
  String get enableNetworkSearch => 'Įgalinti tinklo paiešką';

  @override
  String get allowOnlineRetrieval =>
      'Leisti paieškai ir AI pokalbiams gauti internete (išjungta pagal numatytuosius nustatymus)';

  @override
  String get about => 'Apie';

  @override
  String version(String version) {
    return '$version versija';
  }

  @override
  String get database => 'Duomenų bazė';

  @override
  String get objectBoxWithHnsw => 'ObjectBox su HNSW indeksu';

  @override
  String get logOut => 'Atsijungti';

  @override
  String get custom => 'Pasirinktinis';

  @override
  String get openAiCompatible => 'Suderinamas su OpenAI';

  @override
  String get notSet => 'Nenustatyta';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... arba http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Palaiko vietinius / LAN / viešuosius galinius taškus';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend atsarginė kopija';

  @override
  String get localBackupFromShiguang =>
      'Vietinė atsarginė kopija iš Shiguang (gauti per LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Pasirinkite atsarginės kopijos failą, gautą iš LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Nepavyko nustatyti pasirinkto failo kelio';

  @override
  String get importOptions => 'Importavimo parinktys';

  @override
  String get importSettingsAsWell =>
      'Taip pat importuoti nustatymus?\n(API raktai nebus perrašyti)';

  @override
  String get dataOnly => 'Tik duomenys';

  @override
  String get dataAndSettings => 'Duomenys + nustatymai';

  @override
  String get importCompleted => 'Importavimas baigtas';

  @override
  String get settingsInBackupWereApplied =>
      'Buvo pritaikyti atsarginės kopijos nustatymai.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Atsarginės kopijos nustatymai nebuvo pritaikyti.';

  @override
  String get ok => 'Gerai';

  @override
  String get cancel => 'Atšaukti';

  @override
  String get save => 'Išsaugoti';

  @override
  String get delete => 'Ištrinti';

  @override
  String get clear => 'Aišku';

  @override
  String get add => 'Pridėti';

  @override
  String get create => 'Sukurti';

  @override
  String get edit => 'Redaguoti';

  @override
  String get search => 'Ieškoti';

  @override
  String get areYouSureYouWantToLogOut => 'Ar tikrai norite atsijungti?';

  @override
  String get chooseLanguage => 'Pasirinkite Kalba';

  @override
  String get databaseInfo => 'Duomenų bazės informacija';

  @override
  String get storage => 'Saugykla: ObjectBox';

  @override
  String get vectorIndex => 'Vektorinis indeksas: HNSW';

  @override
  String get dimensions => 'Matmenys: 384';

  @override
  String get embeddingModelBge => 'Įdėjimo modelis: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Fotografuoti';

  @override
  String get chooseFromGallery => 'Pasirinkite iš galerijos';

  @override
  String get editNickname => 'Redaguoti slapyvardį';

  @override
  String get enterNickname => 'Įveskite slapyvardį';

  @override
  String get pleaseEnterNickname => 'Įveskite slapyvardį';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Slapyvardis jau egzistuoja arba neteisingas';

  @override
  String get user => 'Vartotojas';

  @override
  String get manageScheduledReminders =>
      'Tvarkykite suplanuotus priminimus ir pavojaus signalus';

  @override
  String get imageFailedToLoad =>
      'Nepavyko įkelti vaizdo. Pasirinkite dar kartą.';

  @override
  String get imageIsStillLoading => 'Vaizdas vis dar įkeliamas';

  @override
  String get imageAreaNotReady =>
      'Vaizdo sritis neparengta. Bandykite dar kartą.';

  @override
  String get cropFrameNotReady =>
      'Apkarpymo rėmelis neparengtas. Bandykite dar kartą.';

  @override
  String get invalidCropArea =>
      'Netinkamas pasėlių plotas. Bandykite dar kartą.';

  @override
  String get cropFailed => 'Apkarpymas nepavyko. Bandykite dar kartą.';

  @override
  String get cropAvatar => 'Apkarpyti avatarą';

  @override
  String get chooseAgain => 'Pasirinkite Dar kartą';

  @override
  String get rotate90 => 'Pasukite 90°';

  @override
  String get dragFrameToMove =>
      'Vilkite rėmelį, kad perkeltumėte, vilkite į apačią į dešinę, kad pakeistumėte dydį; suimkite, kad padidintumėte ir perkeltumėte vaizdą.';

  @override
  String get pleaseFillInAllFields => 'Prašome užpildyti visus laukus';

  @override
  String get pinMustBeAtLeast4Digits =>
      'PIN kodą turi sudaryti bent 4 skaitmenys';

  @override
  String get pinAtLeast4Digits => 'PIN kodą turi sudaryti bent 4 skaitmenys';

  @override
  String get invalidUsernameOrPin =>
      'Neteisingas vartotojo vardas arba PIN kodas';

  @override
  String get invalidUsernameOrPinError =>
      'Neteisingas vartotojo vardas arba PIN kodas';

  @override
  String get usernameAlreadyExists => 'Vartotojo vardas jau yra';

  @override
  String get captureMomentsKeepMemories =>
      'Užfiksuokite akimirkas, saugokite prisiminimus';

  @override
  String get username => 'Vartotojo vardas';

  @override
  String get pin => 'PIN kodas';

  @override
  String get login => 'Prisijungti';

  @override
  String get createAccount => 'Sukurti paskyrą';

  @override
  String get dontHaveAccountCreateOne => 'Neturite paskyros? Sukurkite vieną';

  @override
  String get alreadyHaveAccountLogin => 'Jau turite paskyrą? Prisijungti';

  @override
  String get pleaseEnterUsername => 'Įveskite vartotojo vardą';

  @override
  String get pinsDoNotMatch => 'PIN kodai nesutampa';

  @override
  String get tapToAddAvatar => 'Bakstelėkite, kad pridėtumėte avatarą';

  @override
  String get yourName => 'Jūsų Vardas';

  @override
  String get privatePinOptional => 'Privatus PIN (neprivaloma)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Naudojamas privačių įrašų šifravimui';

  @override
  String get privatePin => 'Privatus PIN kodas';

  @override
  String get leaveEmptyForNoEncryption =>
      'Palikite tuščią, kad nebūtų šifruojama';

  @override
  String get confirmPin => 'Patvirtinkite PIN kodą';

  @override
  String get getStarted => 'Pradėkite';

  @override
  String get noReminders => 'Jokių priminimų';

  @override
  String get addReminder => 'Pridėti priminimą';

  @override
  String get title => 'Pavadinimas';

  @override
  String get descriptionOptional => 'Aprašymas (nebūtina)';

  @override
  String get microphonePermissionRequired => 'Reikalingas mikrofono leidimas';

  @override
  String get aiAssistant => 'AI asistentas';

  @override
  String get listening => 'Klausau...';

  @override
  String get typeAMessage => 'Įveskite žinutę...';

  @override
  String get aiChat => 'AI pokalbis';

  @override
  String get startAConversation => 'Pradėkite pokalbį';

  @override
  String get typeYourMessage => 'Įveskite savo žinutę...';

  @override
  String get asrReconnecting => 'ASR vėl jungiasi...';

  @override
  String get write => 'Rašyti';

  @override
  String get writeEntry => 'Rašyti įrašą';

  @override
  String get noMemoriesYet => 'Atsiminimų dar nėra';

  @override
  String get tapPlusToCapture => 'Palieskite +, kad užfiksuotumėte savo mintis';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Palieskite +, kad užfiksuotumėte savo mintis';

  @override
  String get deleteMemory => 'Ištrinti atmintį';

  @override
  String get deleteRecord => 'Ištrinti įrašą';

  @override
  String get thisEntryWillBeRemoved =>
      'Šis įrašas bus pašalintas iš jūsų laiko juostos.';

  @override
  String get thisRecordWillBeRemoved =>
      'Šis įrašas bus pašalintas iš jūsų laiko juostos.';

  @override
  String get searchYourRecords => 'Ieškokite savo įrašų...';

  @override
  String get exactMatches => 'Tikslios rungtynės';

  @override
  String get noExactMatches => 'Tikslių atitikmenų nėra';

  @override
  String get exact => 'Tiksliai';

  @override
  String get exactMatch => 'Tiksli atitiktis';

  @override
  String get fuzzyMatches => 'Neaiškios rungtynės';

  @override
  String get noFuzzyMatches => 'Nėra neaiškių atitikmenų';

  @override
  String get vectorMatch => 'Vektorinės rungtynės';

  @override
  String get networkMatches => 'Tinklo rungtynės';

  @override
  String get noNetworkMatches => 'Nėra tinklo atitikčių';

  @override
  String get networkSearchIsOff =>
      'Tinklo paieška išjungta. Įgalinkite jį nustatymuose.';

  @override
  String get network => 'Tinklas';

  @override
  String get networkMatch => 'Tinklo rungtynės';

  @override
  String get noSearchHistory => 'Nėra paieškos istorijos';

  @override
  String get searchHistory => 'Paieškos istorija';

  @override
  String get invalidLink => 'Netinkama nuoroda';

  @override
  String get unableToOpenWebPage => 'Nepavyko atidaryti tinklalapio';

  @override
  String get imageMemory => '[vaizdo atmintis]';

  @override
  String get tapToOpenWebPage => 'Bakstelėkite, kad atidarytumėte tinklalapį';

  @override
  String get editEntry => 'Redaguoti įrašą';

  @override
  String get entryDetails => 'Įvesties informacija';

  @override
  String get noContent => 'Nėra turinio';

  @override
  String get diaryNotFound => 'Dienoraštis nerastas';

  @override
  String get diaryNotFoundShort => 'Įrašas nerastas';

  @override
  String get aiSummary => 'AI santrauka';

  @override
  String get microphoneInterrupted =>
      'Mikrofonas nutrūko, įrašymas sustabdytas.';

  @override
  String get bold => 'Paryškintas';

  @override
  String get italic => 'Kursyvas';

  @override
  String get strikethrough => 'Perbraukta';

  @override
  String get image => 'Vaizdas';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR nepasiekiamas. Įrašymas vis dar aktyvus.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Parašykite savo įrašą...';

  @override
  String get writeYourContent => 'Parašykite savo turinį...';

  @override
  String microphoneStartFailed(String error) {
    return 'Nepavyko paleisti mikrofono: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofonas nutrūko, įrašymas sustabdytas.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR prisijungimas iš naujo: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Įterptas vaizdas: $name';
  }

  @override
  String voiceError(String error) {
    return 'Balso klaida: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Atsiprašome, AI paslauga šiuo metu nepasiekiama: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Nepavyko bendrinti: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count paspaudimų';
  }

  @override
  String matchCount(int count) {
    return 'Atitiktis: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Šaltinis: $source';
  }

  @override
  String get createNew => 'Sukurti';

  @override
  String micStartFailed(String error) {
    return 'Nepavyko paleisti mikrofono: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Paskyros: +$created / atnaujinta $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Dienoraščiai: +$created / atnaujinta $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Priminimai: +$created / atnaujinta $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Praleista: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Iš viso pakeista: $count';
  }

  @override
  String get settingsApplied =>
      'Buvo pritaikyti atsarginės kopijos nustatymai.';

  @override
  String get settingsNotApplied =>
      'Atsarginės kopijos nustatymai nebuvo pritaikyti.';

  @override
  String backupExported(String path) {
    return 'Atsarginė kopija eksportuota: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Eksportuoti nepavyko: $error';
  }

  @override
  String importFailed(String error) {
    return 'Importuoti nepavyko: $error';
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

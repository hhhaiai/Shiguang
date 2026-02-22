// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Xhosa (`xh`).
class AppLocalizationsXh extends AppLocalizations {
  AppLocalizationsXh([String locale = 'xh']) : super(locale);

  @override
  String get languageName => 'isiXhosa';

  @override
  String get languageNameEn => 'Xhosa';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Iisetingi';

  @override
  String get account => 'Iakhawunti';

  @override
  String get reminders => 'Izikhumbuzo';

  @override
  String get language => 'Ulwimi';

  @override
  String get appLanguage => 'Ulwimi Losetyenziso';

  @override
  String get appearance => 'Imbonakalo';

  @override
  String get themeMode => 'IMowudi yomxholo';

  @override
  String get dark => 'Mnyama';

  @override
  String get light => 'Ukukhanya';

  @override
  String get system => 'Inkqubo';

  @override
  String get aiService => 'Inkonzo ye-AI';

  @override
  String get aiChatProvider => 'Umboneleli weNgxoxo ye-AI';

  @override
  String get chatModel => 'Ncokola iModeli';

  @override
  String get localModel => 'Imodeli yasekuhlaleni';

  @override
  String get localModelDefault => 'Imodeli yasekuhlaleni (Okuhlala kukho)';

  @override
  String get ollamaEndpoint => 'Ollama Endpoint';

  @override
  String get ollamaModel => 'Umzekelo kaOllama';

  @override
  String get openAiEndpoint => 'I-OpenAI Endpoint';

  @override
  String get openAiApiKey => 'I-OpenAI API Key';

  @override
  String get openAiModel => 'Imodeli ye-OpenAI';

  @override
  String get geminiEndpoint => 'Isiphelo seGemini';

  @override
  String get geminiApiKey => 'Gemini API Key';

  @override
  String get geminiModel => 'Iimodeli zeGemini';

  @override
  String get anthropicEndpoint => 'I-Anthropic Endpoint';

  @override
  String get anthropicApiKey => 'I-Anthropic API Key';

  @override
  String get anthropicModel => 'Umzekelo we-Anthropic';

  @override
  String get customProtocol => 'Umgaqo weSiko';

  @override
  String get protocol => 'Umgaqo-nkqubo';

  @override
  String get customEndpoint => 'Isiphelo seSiko';

  @override
  String get customApiKey => 'Custom API Key';

  @override
  String get customModel => 'Imodeli yesiko';

  @override
  String get optionalForLocalServers =>
      'Ukhetho lwasekuhlaleni/abancedisi besiko';

  @override
  String get speechRecognitionEngine => 'I-Speech Recognition injini';

  @override
  String get local => 'Indawo';

  @override
  String get endpoint => 'Isiphelo';

  @override
  String get localSpeechModel => 'Umzekelo weNtetho yasekuhlaleni';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (kwisixhobo)';

  @override
  String get systemSpeechRecognition => 'UkuQatshelwa kweNtetho yeNkqubo';

  @override
  String get systemRecognitionAndroidIos =>
      'Uqwalaselo lweNkqubo (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'I-Endpoint Recognition (Mafu/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Sebenzisa eyakhelwe-ngaphakathi i-Android / iOS isiqapheli (inokusebenzisa ilifu)';

  @override
  String get voiceAiEndpoint => 'I-Voice AI Endpoint';

  @override
  String get embeddingModel => 'Imodeli yokufakela';

  @override
  String get crossDeviceSync => 'I-Cross-Device Sync';

  @override
  String get sendToOtherDevices => 'Thumela kwezinye izixhobo (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Thumela i-backup kwaye uthumele ngephepha lokwabelana';

  @override
  String get importFromLocalSend => 'Ngenisa kwi-LocalSend';

  @override
  String get selectBackupJson =>
      'Khetha ugcino lwe-JSON kwaye udibanise idatha yendawo';

  @override
  String get autoGeneration => 'Isizukulwana esizenzekelayo';

  @override
  String get autoGenerateSummary => 'Ukuvelisa ngokuzenzekela isishwankathelo';

  @override
  String get generateAiSummaryForNewEntries =>
      'Yenza isishwankathelo se-AI kumangenelo amatsha';

  @override
  String get autoGenerateEmbedding => 'Ukuvelisa ngokuzenzekela kufakelo';

  @override
  String get generateVectorEmbedding => 'Veza ukufakela iVector kukhangelo';

  @override
  String get enableNetworkSearch => 'Vula uPhando lweNethiwekhi';

  @override
  String get allowOnlineRetrieval =>
      'Vumela ukufunyanwa kwi-intanethi kukhangelo kunye nencoko ye-AI (icinywe ngokuzenzekelayo)';

  @override
  String get about => 'Malunga';

  @override
  String version(String version) {
    return 'Inguqulelo $version';
  }

  @override
  String get database => 'Uvimba weenkcukacha';

  @override
  String get objectBoxWithHnsw => 'ObjectBox kunye HNSW index';

  @override
  String get logOut => 'Phuma';

  @override
  String get custom => 'Isiko';

  @override
  String get openAiCompatible => 'I-OpenAI iyahambelana';

  @override
  String get notSet => 'Akumiselwanga';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'Ixhasa isiphelo sendawo/yeLAN/soluntu';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend Backup';

  @override
  String get localBackupFromShiguang =>
      'Ugcino lwasekuhlaleni olusuka eShiguang (fumana ngeLocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Khetha ifayile egciniweyo efunyenwe kwi-LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Ayiphumelelanga ukusombulula indlela yefayile ekhethiweyo';

  @override
  String get importOptions => 'Iinketho Zokuthatha ngaphandle';

  @override
  String get importSettingsAsWell =>
      'Iisetingi zokuthatha ngaphandle nazo?\n(izitshixo zeAPI aziyi kubhalwa ngaphezulu)';

  @override
  String get dataOnly => 'Idatha Kuphela';

  @override
  String get dataAndSettings => 'Idatha + Izicwangciso';

  @override
  String get importCompleted => 'Ukungenisa elizweni Kugqityiwe';

  @override
  String get settingsInBackupWereApplied =>
      'Iisetingi ezikwi-backup ziye zasetyenziswa.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Iisetingi ezikwi-backup azifakwanga.';

  @override
  String get ok => 'KULUNGILE';

  @override
  String get cancel => 'Rhoxisa';

  @override
  String get save => 'Gcina';

  @override
  String get delete => 'Cima';

  @override
  String get clear => 'Cacileyo';

  @override
  String get add => 'Yongeza';

  @override
  String get create => 'Yenza';

  @override
  String get edit => 'Hlela';

  @override
  String get search => 'Khangela';

  @override
  String get areYouSureYouWantToLogOut => 'Uqinisekile ufuna ukuphuma?';

  @override
  String get chooseLanguage => 'Khetha ulwimi';

  @override
  String get databaseInfo => 'Ulwazi lweDatabase';

  @override
  String get storage => 'Ugcino: ObjectBox';

  @override
  String get vectorIndex => 'Isalathiso seVector: HNSW';

  @override
  String get dimensions => 'Imilinganiselo: 384';

  @override
  String get embeddingModelBge => 'Umzekelo wokufakela: bge-encinci-zh-v1.5';

  @override
  String get takePhoto => 'Thatha imifanekiso';

  @override
  String get chooseFromGallery => 'Khetha kwiGalari';

  @override
  String get editNickname => 'Hlela isiteketiso';

  @override
  String get enterNickname => 'Faka isiteketiso';

  @override
  String get pleaseEnterNickname => 'Nceda ngenisa igama lesiqhulo';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Igama lesiqhulo sele likhona okanye alisebenzi';

  @override
  String get user => 'Umsebenzisi';

  @override
  String get manageScheduledReminders =>
      'Lawula izikhumbuzo ezicwangcisiweyo kunye nee-alam';

  @override
  String get imageFailedToLoad =>
      'Umfanekiso awukwazanga ukulayishwa. Nceda ukhethe kwakhona.';

  @override
  String get imageIsStillLoading => 'Umfanekiso usalayisha';

  @override
  String get imageAreaNotReady =>
      'Indawo yomfanekiso ayilunganga. Nceda zama kwakhona.';

  @override
  String get cropFrameNotReady =>
      'Isakhelo sokutya asikalungi. Nceda zama kwakhona.';

  @override
  String get invalidCropArea =>
      'Indawo yesityalo engasebenziyo. Nceda zama kwakhona.';

  @override
  String get cropFailed => 'Isivuno asiphumelelanga. Nceda zama kwakhona.';

  @override
  String get cropAvatar => 'Isilimo seAvatar';

  @override
  String get chooseAgain => 'Khetha Kwakhona';

  @override
  String get rotate90 => 'Jikelezisa ngama-90 °';

  @override
  String get dragFrameToMove =>
      'Tsala isakhelo ukuhambisa, tsala ezantsi-ekunene ukwenza ubungakanani kwakhona; cinezela ukusondeza kwaye uhambise umfanekiso.';

  @override
  String get pleaseFillInAllFields => 'Nceda ugcwalise zonke iindawo';

  @override
  String get pinMustBeAtLeast4Digits =>
      'I-PIN kufuneka ibe namanani ama-4 ubuncinci';

  @override
  String get pinAtLeast4Digits => 'I-PIN kufuneka ibe namanani ama-4 ubuncinci';

  @override
  String get invalidUsernameOrPin =>
      'Igama lomsebenzisi elingasebenziyo okanye i-PIN';

  @override
  String get invalidUsernameOrPinError =>
      'Igama lomsebenzisi elingasebenziyo okanye i-PIN';

  @override
  String get usernameAlreadyExists => 'Igama lomsebenzisi sele likhona';

  @override
  String get captureMomentsKeepMemories => 'Thatha imizuzu, gcina iinkumbulo';

  @override
  String get username => 'Igama lomsebenzisi';

  @override
  String get pin => 'I-PIN';

  @override
  String get login => 'Ngema';

  @override
  String get createAccount => 'Dala i-akhawunti';

  @override
  String get dontHaveAccountCreateOne => 'Awunayo iakhawunti? Yenza enye';

  @override
  String get alreadyHaveAccountLogin => 'Ngaba sele unayo i-akhawunti? Ngema';

  @override
  String get pleaseEnterUsername => 'Nceda ngenisa igama lomsebenzisi';

  @override
  String get pinsDoNotMatch => 'Ii-PIN azihambelani';

  @override
  String get tapToAddAvatar => 'Cofa ukongeza i-avatar';

  @override
  String get yourName => 'Ingama lakho';

  @override
  String get privatePinOptional => 'I-PIN yabucala (ukhetho)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Isetyenziselwa ukufihla iirekhodi zabucala';

  @override
  String get privatePin => 'I-PIN yabucala';

  @override
  String get leaveEmptyForNoEncryption =>
      'Shiya ingenanto ukuze kungabikho uguqulelo oluntsonkothileyo';

  @override
  String get confirmPin => 'Qinisekisa i-PIN';

  @override
  String get getStarted => 'Qalisa';

  @override
  String get noReminders => 'Akukho zikhumbuzo';

  @override
  String get addReminder => 'Yongeza isikhumbuzi';

  @override
  String get title => 'Isihloko';

  @override
  String get descriptionOptional => 'Ingcaciso (uyazikhethela)';

  @override
  String get microphonePermissionRequired => 'Kufuneka imvume yemakrofoni';

  @override
  String get aiAssistant => 'Umncedisi we-AI';

  @override
  String get listening => 'Ndimamele...';

  @override
  String get typeAMessage => 'Chwetheza umyalezo...';

  @override
  String get aiChat => 'Incoko ye-AI';

  @override
  String get startAConversation => 'Qalisa incoko';

  @override
  String get typeYourMessage => 'Chwetheza umyalezo wakho...';

  @override
  String get asrReconnecting => 'I-ASR idibanisa kwakhona...';

  @override
  String get write => 'Bhala';

  @override
  String get writeEntry => 'Bhala Ngena';

  @override
  String get noMemoriesYet => 'Akukho zinkumbulo okwangoku';

  @override
  String get tapPlusToCapture => 'Thepha + ukuze ubambe iingcinga zakho';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Thepha + ukuze ubambe iingcinga zakho';

  @override
  String get deleteMemory => 'Cima iMemori';

  @override
  String get deleteRecord => 'Cima iRekhodi';

  @override
  String get thisEntryWillBeRemoved =>
      'Elingeno liza kususwa kumda wakho wexesha.';

  @override
  String get thisRecordWillBeRemoved =>
      'Le rekhodi iya kususwa kumgca wakho wexesha.';

  @override
  String get searchYourRecords => 'Phendla iirekhodi zakho...';

  @override
  String get exactMatches => 'Iimidlalo ezichanekileyo';

  @override
  String get noExactMatches => 'Akukho kungqamana ngqo';

  @override
  String get exact => 'Ngqo';

  @override
  String get exactMatch => 'Umdlalo ochanekileyo';

  @override
  String get fuzzyMatches => 'Iimidlalo eziFuzzy';

  @override
  String get noFuzzyMatches => 'Akukho midlalo inzima';

  @override
  String get vectorMatch => 'Umdlalo weVector';

  @override
  String get networkMatches => 'Iimidlalo zeNethiwekhi';

  @override
  String get noNetworkMatches => 'Akukho nethiwekhi ihambelanayo';

  @override
  String get networkSearchIsOff =>
      'Uphendlo lwenethiwekhi lucimile. Yenza ukuba isebenze kwiiSetingi.';

  @override
  String get network => 'Uthungelwano';

  @override
  String get networkMatch => 'Unxibelelwano lwenethiwekhi';

  @override
  String get noSearchHistory => 'Akukho mbali yokukhangela';

  @override
  String get searchHistory => 'Imbali yoPhendlo';

  @override
  String get invalidLink => 'ilinki engasebenziyo';

  @override
  String get unableToOpenWebPage => 'Ayikwazi ukuvula iphepha lewebhu';

  @override
  String get imageMemory => '[Inkumbulo yomfanekiso]';

  @override
  String get tapToOpenWebPage => 'Cofa ukuvula iphepha lewebhu';

  @override
  String get editEntry => 'Hlela ukungena';

  @override
  String get entryDetails => 'Iinkcukacha zokungena';

  @override
  String get noContent => 'Akukho mxholo';

  @override
  String get diaryNotFound => 'Idayari ayifunyenwanga';

  @override
  String get diaryNotFoundShort => 'Ingxelo ayifunyenwanga';

  @override
  String get aiSummary => 'AI isishwankathelo';

  @override
  String get microphoneInterrupted =>
      'Imakrofoni iphazamisekile, kuyekile ukurekhoda.';

  @override
  String get bold => 'Engqindilili';

  @override
  String get italic => 'akekeleyo';

  @override
  String get strikethrough => 'I-Strikethrough';

  @override
  String get image => 'Umfanekiso';

  @override
  String get asrUnavailableRecordingActive =>
      'I-ASR ayifumaneki. Ukurekhoda kusasebenza.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Bhala ingeniso yakho...';

  @override
  String get writeYourContent => 'Bhala umxholo wakho...';

  @override
  String microphoneStartFailed(String error) {
    return 'Ayiphumelelanga ukuqalisa umboko: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Imakrofoni iphazamisekile, kuyekile ukurekhoda.';

  @override
  String asrReconnectingError(String error) {
    return 'I-ASR idibanisa kwakhona: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Umfanekiso ufakiwe: $name';
  }

  @override
  String voiceError(String error) {
    return 'Impazamo yelizwi: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Uxolo, inkonzo ye-AI ayifumaneki okwangoku: $error';
  }

  @override
  String shareFailed(String error) {
    return 'kusilele ukwabelana: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count hits';
  }

  @override
  String matchCount(int count) {
    return 'Umdlalo: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Umthombo: $source';
  }

  @override
  String get createNew => 'Yenza';

  @override
  String micStartFailed(String error) {
    return 'Ukuqala kombhobho kusilele: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Iiakhawunti: +$created / zihlaziywe $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Iidayari: +$created / zihlaziywe $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Izikhumbuzo: +$created / ihlaziywe $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Itsityiwe: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Iyonke itshintshiwe: $count';
  }

  @override
  String get settingsApplied => 'Iisetingi ezikwi-backup ziye zasetyenziswa.';

  @override
  String get settingsNotApplied => 'Iisetingi ezikwi-backup azifakwanga.';

  @override
  String backupExported(String path) {
    return 'Ugcino luthunyelwe ngaphandle: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Ukuthunyelwa ngaphandle akuphumelelanga: $error';
  }

  @override
  String importFailed(String error) {
    return 'Ukuthathwa ngaphandle akuphumelelanga: $error';
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

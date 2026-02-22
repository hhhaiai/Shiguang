// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Irish (`ga`).
class AppLocalizationsGa extends AppLocalizations {
  AppLocalizationsGa([String locale = 'ga']) : super(locale);

  @override
  String get languageName => 'Gaeilge';

  @override
  String get languageNameEn => 'Irish';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Socruithe';

  @override
  String get account => 'Cuntas';

  @override
  String get reminders => 'Meabhrúcháin';

  @override
  String get language => 'Teanga';

  @override
  String get appLanguage => 'Teanga App';

  @override
  String get appearance => 'Dealramh';

  @override
  String get themeMode => 'Mód Téama';

  @override
  String get dark => 'Dorcha';

  @override
  String get light => 'Solas';

  @override
  String get system => 'Córas';

  @override
  String get aiService => 'Seirbhís AI';

  @override
  String get aiChatProvider => 'Soláthraí Comhrá AI';

  @override
  String get chatModel => 'Múnla Comhrá';

  @override
  String get localModel => 'Múnla Áitiúil';

  @override
  String get localModelDefault => 'Múnla Áitiúil (Réamhshocrú)';

  @override
  String get ollamaEndpoint => 'Críochphointe Olama';

  @override
  String get ollamaModel => 'Múnla Olama';

  @override
  String get openAiEndpoint => 'Críochphointe OpenAI';

  @override
  String get openAiApiKey => 'Eochair OpenAI API';

  @override
  String get openAiModel => 'Múnla OpenAI';

  @override
  String get geminiEndpoint => 'Críochphointe Cúpla';

  @override
  String get geminiApiKey => 'Eochair Gemini API';

  @override
  String get geminiModel => 'Múnla Gemini';

  @override
  String get anthropicEndpoint => 'Críochphointe Antraipeach';

  @override
  String get anthropicApiKey => 'Eochair Anthropic API';

  @override
  String get anthropicModel => 'Múnla Antraipeach';

  @override
  String get customProtocol => 'Prótacal Saincheaptha';

  @override
  String get protocol => 'Prótacal';

  @override
  String get customEndpoint => 'Críochphointe Saincheaptha';

  @override
  String get customApiKey => 'Eochair Saincheaptha API';

  @override
  String get customModel => 'Múnla Saincheaptha';

  @override
  String get optionalForLocalServers =>
      'Roghnach do fhreastalaithe áitiúla/saincheaptha';

  @override
  String get speechRecognitionEngine => 'Inneall Aitheanta Cainte';

  @override
  String get local => 'Áitiúil';

  @override
  String get endpoint => 'Críochphointe';

  @override
  String get localSpeechModel => 'Múnla Cainte Áitiúil';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (ar an ngléas)';

  @override
  String get systemSpeechRecognition => 'Aitheantas Urlabhra an Chórais';

  @override
  String get systemRecognitionAndroidIos => 'Aitheantas Córais (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Aitheantas Críochphointe (Scamall/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Úsáid aitheantóir ionsuite Android / iOS (is féidir scamall a úsáid)';

  @override
  String get voiceAiEndpoint => 'Guth AI Críochphointe';

  @override
  String get embeddingModel => 'Múnla Leabú';

  @override
  String get crossDeviceSync => 'Sync Tras-Ghléas';

  @override
  String get sendToOtherDevices => 'Seol chuig Gléasanna Eile (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Easpórtáil cúltaca agus seol trí scairbhileog';

  @override
  String get importFromLocalSend => 'Iompórtáil ó LocalSend';

  @override
  String get selectBackupJson =>
      'Roghnaigh cúltaca JSON agus cumasc sonraí áitiúla';

  @override
  String get autoGeneration => 'Giniúint Uathoibríoch';

  @override
  String get autoGenerateSummary => 'Auto Gin Achoimre';

  @override
  String get generateAiSummaryForNewEntries =>
      'Gin achoimre AI le haghaidh iontrálacha nua';

  @override
  String get autoGenerateEmbedding => 'Uath-Gin Leabú';

  @override
  String get generateVectorEmbedding =>
      'Gin leabú veicteora le haghaidh cuardaigh';

  @override
  String get enableNetworkSearch => 'Cumasaigh Cuardach Líonra';

  @override
  String get allowOnlineRetrieval =>
      'Ceadaigh aisghabháil ar líne le haghaidh cuardaigh agus comhrá AI (mídhleathach de réir réamhshocraithe)';

  @override
  String get about => 'Maidir';

  @override
  String version(String version) {
    return 'Leagan _PH_0__';
  }

  @override
  String get database => 'Bunachar Sonraí';

  @override
  String get objectBoxWithHnsw => 'ObjectBox le hinnéacs HNSW';

  @override
  String get logOut => 'Logáil Amach';

  @override
  String get custom => 'Saincheaptha';

  @override
  String get openAiCompatible => 'Comhoiriúnach le OpenAI';

  @override
  String get notSet => 'Gan socraithe';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/… nó http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Tacaíonn críochphointí áitiúla/LAN/poiblí';

  @override
  String get shiguangLocalSendBackup => 'Cúltaca Shiguang LocalSend';

  @override
  String get localBackupFromShiguang =>
      'Cúltaca áitiúil ó Shiguang (faigh trí LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Roghnaigh comhad cúltaca a fuarthas ó LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Theip ar chonair an chomhaid roghnaithe a réiteach';

  @override
  String get importOptions => 'Roghanna Iompórtála';

  @override
  String get importSettingsAsWell =>
      'Iompórtáil socruithe chomh maith?\n(Ní dhéanfar eochracha API a fhorscríobh)';

  @override
  String get dataOnly => 'Sonraí amháin';

  @override
  String get dataAndSettings => 'Sonraí + Socruithe';

  @override
  String get importCompleted => 'Iompórtáil Críochnaithe';

  @override
  String get settingsInBackupWereApplied =>
      'Cuireadh socruithe sa chúltaca i bhfeidhm.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Níor cuireadh socruithe sa chúltaca i bhfeidhm.';

  @override
  String get ok => 'ceart go leor';

  @override
  String get cancel => 'Cealaigh';

  @override
  String get save => 'Sábháil';

  @override
  String get delete => 'Scrios';

  @override
  String get clear => 'Glan';

  @override
  String get add => 'Cuir';

  @override
  String get create => 'Cruthaigh';

  @override
  String get edit => 'Cuir in eagar';

  @override
  String get search => 'Cuardach';

  @override
  String get areYouSureYouWantToLogOut =>
      'An bhfuil tú cinnte gur mhaith leat logáil amach?';

  @override
  String get chooseLanguage => 'Roghnaigh Teanga';

  @override
  String get databaseInfo => 'Eolas Bunachar Sonraí';

  @override
  String get storage => 'Stóráil: ObjectBox';

  @override
  String get vectorIndex => 'Innéacs Veicteoir: HNSW';

  @override
  String get dimensions => 'Toisí: 384';

  @override
  String get embeddingModelBge => 'Múnla Leabú: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Tóg Grianghraf';

  @override
  String get chooseFromGallery => 'Roghnaigh ón nGailearaí';

  @override
  String get editNickname => 'Cuir Leasainm in eagar';

  @override
  String get enterNickname => 'Cuir isteach leasainm';

  @override
  String get pleaseEnterNickname => 'Cuir isteach leasainm le do thoil';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Tá leasainm ann cheana nó tá sé neamhbhailí';

  @override
  String get user => 'Úsáideoir';

  @override
  String get manageScheduledReminders =>
      'Bainistigh meabhrúcháin agus aláraim sceidealaithe';

  @override
  String get imageFailedToLoad =>
      'Theip ar lódáil an íomhá. Roghnaigh arís le do thoil.';

  @override
  String get imageIsStillLoading => 'Tá an íomhá fós á luchtú';

  @override
  String get imageAreaNotReady =>
      'Níl an limistéar íomhá réidh. Bain triail eile as.';

  @override
  String get cropFrameNotReady =>
      'Níl fráma na mbarr réidh. Bain triail eile as.';

  @override
  String get invalidCropArea =>
      'Limistéar barr neamhbhailí. Bain triail eile as.';

  @override
  String get cropFailed => 'Theip ar an mbarr. Bain triail eile as.';

  @override
  String get cropAvatar => 'Avatar Barraí';

  @override
  String get chooseAgain => 'Roghnaigh Arís';

  @override
  String get rotate90 => 'Rothlaigh 90°';

  @override
  String get dragFrameToMove =>
      'Tarraing an fráma le bogadh, tarraing bun ar dheis chun méid a athrú; pinch chun zúmáil agus bogadh íomhá.';

  @override
  String get pleaseFillInAllFields => 'Líon isteach gach réimse le do thoil';

  @override
  String get pinMustBeAtLeast4Digits =>
      'Ní mór go mbeadh 4 dhigit ar a laghad ag an UAP';

  @override
  String get pinAtLeast4Digits =>
      'Ní mór go mbeadh 4 dhigit ar a laghad ag an UAP';

  @override
  String get invalidUsernameOrPin => 'Ainm úsáideora nó UAP neamhbhailí';

  @override
  String get invalidUsernameOrPinError => 'Ainm úsáideora nó UAP neamhbhailí';

  @override
  String get usernameAlreadyExists => 'Tá an t-ainm úsáideora ann cheana féin';

  @override
  String get captureMomentsKeepMemories =>
      'Gabh chuimhneacháin, coinnigh cuimhní cinn';

  @override
  String get username => 'Ainm úsáideora';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Logáil isteach';

  @override
  String get createAccount => 'Cruthaigh Cuntas';

  @override
  String get dontHaveAccountCreateOne =>
      'Nach bhfuil cuntas agat? Cruthaigh ceann';

  @override
  String get alreadyHaveAccountLogin =>
      'An bhfuil cuntas agat cheana féin? Logáil isteach';

  @override
  String get pleaseEnterUsername => 'Cuir isteach ainm úsáideora le do thoil';

  @override
  String get pinsDoNotMatch => 'Ní hionann PINanna';

  @override
  String get tapToAddAvatar => 'Tapáil chun avatar a chur leis';

  @override
  String get yourName => 'D\'Ainm';

  @override
  String get privatePinOptional => 'UAP príobháideach (roghnach)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Úsáidtear é chun taifid phríobháideacha a chriptiú';

  @override
  String get privatePin => 'UAP príobháideach';

  @override
  String get leaveEmptyForNoEncryption => 'Fág folamh gan aon chriptiú';

  @override
  String get confirmPin => 'Deimhnigh UAP';

  @override
  String get getStarted => 'Faigh Tosaigh';

  @override
  String get noReminders => 'Gan meabhrúcháin';

  @override
  String get addReminder => 'Cuir Meabhrúchán leis';

  @override
  String get title => 'Teideal';

  @override
  String get descriptionOptional => 'Cur síos (roghnach)';

  @override
  String get microphonePermissionRequired => 'Teastaíonn cead micreafón';

  @override
  String get aiAssistant => 'Cúntóir AI';

  @override
  String get listening => 'Ag éisteacht...';

  @override
  String get typeAMessage => 'Clóscríobh teachtaireacht...';

  @override
  String get aiChat => 'Comhrá AI';

  @override
  String get startAConversation => 'Cuir tús le comhrá';

  @override
  String get typeYourMessage => 'Clóscríobh do theachtaireacht...';

  @override
  String get asrReconnecting => 'ASR á athcheangal...';

  @override
  String get write => 'Scríobh';

  @override
  String get writeEntry => 'Scríobh Iontráil';

  @override
  String get noMemoriesYet => 'Gan cuimhní cinn fós';

  @override
  String get tapPlusToCapture => 'Tapáil + chun do chuid smaointe a ghabháil';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Tapáil + chun do chuid smaointe a ghabháil';

  @override
  String get deleteMemory => 'Scrios Cuimhne';

  @override
  String get deleteRecord => 'Scrios Taifead';

  @override
  String get thisEntryWillBeRemoved => 'Bainfear an iontráil seo de d\'amlíne.';

  @override
  String get thisRecordWillBeRemoved => 'Bainfear an taifead seo de d\'amlíne.';

  @override
  String get searchYourRecords => 'Cuardaigh do thaifid...';

  @override
  String get exactMatches => 'Meaitseanna beachta';

  @override
  String get noExactMatches => 'Níl aon mheaitseáil chruinn ann';

  @override
  String get exact => 'Beacht';

  @override
  String get exactMatch => 'Match Beacht';

  @override
  String get fuzzyMatches => 'Meaitseanna Doiléir';

  @override
  String get noFuzzyMatches => 'Uimh cluichí doiléir';

  @override
  String get vectorMatch => 'Cluiche Veicteoir';

  @override
  String get networkMatches => 'Meaitseanna Líonra';

  @override
  String get noNetworkMatches => 'Ní mheaitseálann líonra';

  @override
  String get networkSearchIsOff =>
      'Tá cuardach líonra múchta. Cumasaigh é i Socruithe.';

  @override
  String get network => 'Líonra';

  @override
  String get networkMatch => 'Cluiche Líonra';

  @override
  String get noSearchHistory => 'Gan stair chuardaigh';

  @override
  String get searchHistory => 'Stair Chuardaigh';

  @override
  String get invalidLink => 'Nasc neamhbhailí';

  @override
  String get unableToOpenWebPage => 'Ní féidir leathanach gréasáin a oscailt';

  @override
  String get imageMemory => '[Cuimhne íomhá]';

  @override
  String get tapToOpenWebPage => 'Tapáil chun leathanach gréasáin a oscailt';

  @override
  String get editEntry => 'Cuir Iontráil in Eagar';

  @override
  String get entryDetails => 'Sonraí Iontrála';

  @override
  String get noContent => 'Gan ábhar';

  @override
  String get diaryNotFound => 'Dialann gan aimsiú';

  @override
  String get diaryNotFoundShort => 'Taifead gan aimsiú';

  @override
  String get aiSummary => 'Achoimre AI';

  @override
  String get microphoneInterrupted =>
      'Idirbhriseadh an micreafón, cuireadh stop leis an taifeadadh.';

  @override
  String get bold => 'Trom';

  @override
  String get italic => 'iodálach';

  @override
  String get strikethrough => 'Stailc tríd';

  @override
  String get image => 'Íomhá';

  @override
  String get asrUnavailableRecordingActive =>
      'Níl ASR ar fáil. Tá an taifeadadh fós gníomhach.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Scríobh d’iontráil...';

  @override
  String get writeYourContent => 'Scríobh d’ábhar...';

  @override
  String microphoneStartFailed(String error) {
    return 'Theip ar an micreafón a thosú: _PH_0__';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Idirbhriseadh an micreafón, cuireadh stop leis an taifeadadh.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR ag athcheangal: _PH_0__';
  }

  @override
  String imageInserted(String name) {
    return 'Íomhá curtha isteach: _PH_0__';
  }

  @override
  String voiceError(String error) {
    return 'Earráid ghutha: _PH_0__';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Ár leithscéal, níl seirbhís AI ar fáil faoi láthair: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Theip ar roinnt: _PH_0__';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count amas';
  }

  @override
  String matchCount(int count) {
    return 'Meaitseáil: _PH_0__';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Foinse: _PH_0__';
  }

  @override
  String get createNew => 'Cruthaigh';

  @override
  String micStartFailed(String error) {
    return 'Theip ar thús an mhicreafóin: _PH_0__';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Cuntais: +_PH_0__ / nuashonraithe $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Dialanna: +_PH_0__ / nuashonraithe $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Meabhrúcháin: +_PH_0__ / nuashonraithe $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Léimte: _PH_0__';
  }

  @override
  String importResultTotal(int count) {
    return 'Iomlán athraithe: _PH_0__';
  }

  @override
  String get settingsApplied => 'Cuireadh socruithe sa chúltaca i bhfeidhm.';

  @override
  String get settingsNotApplied =>
      'Níor cuireadh socruithe sa chúltaca i bhfeidhm.';

  @override
  String backupExported(String path) {
    return 'Easpórtáil an cúltaca: _PH_0__';
  }

  @override
  String exportFailed(String error) {
    return 'Theip ar easpórtáil: _PH_0__';
  }

  @override
  String importFailed(String error) {
    return 'Theip ar an iompórtáil: _PH_0__';
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

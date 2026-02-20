// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Yoruba (`yo`).
class AppLocalizationsYo extends AppLocalizations {
  AppLocalizationsYo([String locale = 'yo']) : super(locale);

  @override
  String get languageName => 'Yorùbá';

  @override
  String get languageNameEn => 'Yoruba';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Eto';

  @override
  String get account => 'Iroyin';

  @override
  String get reminders => 'Awọn olurannileti';

  @override
  String get language => 'Ede';

  @override
  String get appLanguage => 'Ede App';

  @override
  String get appearance => 'Ifarahan';

  @override
  String get themeMode => 'Ipo Akori';

  @override
  String get dark => 'Dudu';

  @override
  String get light => 'Imọlẹ';

  @override
  String get system => 'Eto';

  @override
  String get aiService => 'AI Iṣẹ';

  @override
  String get aiChatProvider => 'AI Wiregbe Olupese';

  @override
  String get chatModel => 'Awoṣe iwiregbe';

  @override
  String get localModel => 'Awoṣe Agbegbe';

  @override
  String get localModelDefault => 'Awoṣe Agbegbe (Iyipada)';

  @override
  String get ollamaEndpoint => 'Ollama Ipari';

  @override
  String get ollamaModel => 'Ollama awoṣe';

  @override
  String get openAiEndpoint => 'OpenAI Ipari';

  @override
  String get openAiApiKey => 'Ṣii API Key';

  @override
  String get openAiModel => 'Ṣii Awoṣe';

  @override
  String get geminiEndpoint => 'Gemini Ipari';

  @override
  String get geminiApiKey => 'Gemini API Key';

  @override
  String get geminiModel => 'Awọn awoṣe Gemini';

  @override
  String get anthropicEndpoint => 'Anthropic Endpoint';

  @override
  String get anthropicApiKey => 'Anthropic API Key';

  @override
  String get anthropicModel => 'Awoṣe Anthropic';

  @override
  String get customProtocol => 'Ilana ti aṣa';

  @override
  String get protocol => 'Ilana';

  @override
  String get customEndpoint => 'Aṣa Ipari';

  @override
  String get customApiKey => 'Aṣa API Key';

  @override
  String get customModel => 'Aṣa Aṣa';

  @override
  String get optionalForLocalServers => 'Iyan fun agbegbe/aṣa olupin';

  @override
  String get speechRecognitionEngine => 'Engine idanimọ Ọrọ';

  @override
  String get local => 'Agbegbe';

  @override
  String get endpoint => 'Opin ipari';

  @override
  String get localSpeechModel => 'Awoṣe Ọrọ Agbegbe';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (lori ẹrọ)';

  @override
  String get systemSpeechRecognition => 'Idanimọ Ọrọ Ọrọ System';

  @override
  String get systemRecognitionAndroidIos => 'Idanimọ eto (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Idanimọ Ipari (Awọsanma/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Lo idanimọ Android / iOS ti a ṣe sinu (le lo awọsanma)';

  @override
  String get voiceAiEndpoint => 'Voice AI Endpoint';

  @override
  String get embeddingModel => 'Awoṣe ifibọ';

  @override
  String get crossDeviceSync => 'Agbelebu-Device Sync';

  @override
  String get sendToOtherDevices => 'Firanṣẹ si Awọn ẹrọ miiran (Send Local)';

  @override
  String get exportBackupAndSend =>
      'Ṣe okeere afẹyinti ati firanṣẹ nipasẹ iwe ipin';

  @override
  String get importFromLocalSend => 'Gbe wọle lati LocalSend';

  @override
  String get selectBackupJson => 'Yan afẹyinti JSON ki o si da data agbegbe pọ';

  @override
  String get autoGeneration => 'Auto generation';

  @override
  String get autoGenerateSummary => 'Auto ina Lakotan';

  @override
  String get generateAiSummaryForNewEntries =>
      'Ṣẹda akopọ AI fun awọn titẹ sii tuntun';

  @override
  String get autoGenerateEmbedding => 'Auto ina ifibọ';

  @override
  String get generateVectorEmbedding => 'Ṣe ina ifisinu fekito fun wiwa';

  @override
  String get enableNetworkSearch => 'Mu wiwa nẹtiwọki ṣiṣẹ';

  @override
  String get allowOnlineRetrieval =>
      'Gba igbasilẹ lori ayelujara fun wiwa ati iwiregbe AI (pa nipasẹ aiyipada)';

  @override
  String get about => 'Nipa';

  @override
  String version(String version) {
    return 'Ẹya _PH_0__';
  }

  @override
  String get database => 'Aaye data';

  @override
  String get objectBoxWithHnsw => 'ObjectBox pẹlu atọka HNSW';

  @override
  String get logOut => 'Jade jade';

  @override
  String get custom => 'Aṣa';

  @override
  String get openAiCompatible => 'OpenAI Ibaramu';

  @override
  String get notSet => 'Ko ṣeto';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Atilẹyin agbegbe / LAN / àkọsílẹ endpoints';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend Afẹyinti';

  @override
  String get localBackupFromShiguang =>
      'Afẹyinti agbegbe lati Shiguang (gba nipasẹ LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Yan faili afẹyinti ti o gba lati LocalSend';

  @override
  String get failedToResolveFilePath => 'Kuna lati yanju ọna faili ti o yan';

  @override
  String get importOptions => 'Gbe wọle Aw';

  @override
  String get importSettingsAsWell =>
      'Ṣe akowọle awọn eto bi daradara bi?\n(Awọn bọtini API kii yoo tun kọ)';

  @override
  String get dataOnly => 'Data Nikan';

  @override
  String get dataAndSettings => 'Data + Eto';

  @override
  String get importCompleted => 'Wọle ti Pari';

  @override
  String get settingsInBackupWereApplied => 'Awọn eto ni afẹyinti ni a lo.';

  @override
  String get settingsInBackupWereNotApplied => 'Awọn eto ni afẹyinti ko lo.';

  @override
  String get ok => 'O DARA';

  @override
  String get cancel => 'Fagilee';

  @override
  String get save => 'Fipamọ';

  @override
  String get delete => 'Paarẹ';

  @override
  String get clear => 'Ko o';

  @override
  String get add => 'Fi kun';

  @override
  String get create => 'Ṣẹda';

  @override
  String get edit => 'Ṣatunkọ';

  @override
  String get search => 'Wa';

  @override
  String get areYouSureYouWantToLogOut => 'Ṣe o da ọ loju pe o fẹ jade bi?';

  @override
  String get chooseLanguage => 'Yan Ede';

  @override
  String get databaseInfo => 'Alaye aaye data';

  @override
  String get storage => 'Ibi ipamọ: ObjectBox';

  @override
  String get vectorIndex => 'Atọka Vector: HNSW';

  @override
  String get dimensions => 'Awọn iwọn: 384';

  @override
  String get embeddingModelBge => 'Awoṣe ifibọ: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Ya Fọto';

  @override
  String get chooseFromGallery => 'Yan lati Gallery';

  @override
  String get editNickname => 'Ṣatunkọ Oruko apeso';

  @override
  String get enterNickname => 'Tẹ orukọ apeso sii';

  @override
  String get pleaseEnterNickname => 'Jọwọ tẹ orukọ apeso kan sii';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Oruko apeso ti wa tẹlẹ tabi ko wulo';

  @override
  String get user => 'Olumulo';

  @override
  String get manageScheduledReminders =>
      'Ṣakoso awọn olurannileti iṣeto ati awọn itaniji';

  @override
  String get imageFailedToLoad => 'Aworan kuna lati kojọpọ. Jọwọ yan lẹẹkansi.';

  @override
  String get imageIsStillLoading => 'Aworan ti wa ni ṣi ikojọpọ';

  @override
  String get imageAreaNotReady =>
      'Agbegbe aworan ko šetan. Jọwọ gbiyanju lẹẹkansi.';

  @override
  String get cropFrameNotReady =>
      'Irugbin irugbin ko šetan. Jọwọ gbiyanju lẹẹkansi.';

  @override
  String get invalidCropArea =>
      'Agbegbe irugbin ti ko tọ. Jọwọ gbiyanju lẹẹkansi.';

  @override
  String get cropFailed => 'Irugbin kuna. Jọwọ gbiyanju lẹẹkansi.';

  @override
  String get cropAvatar => 'Irugbin Afata';

  @override
  String get chooseAgain => 'Yan Lẹẹkansi';

  @override
  String get rotate90 => 'Yipada 90°';

  @override
  String get dragFrameToMove =>
      'Fa fireemu lati gbe, fa isalẹ-ọtun lati tun iwọn; fun pọ lati sun ati gbe aworan.';

  @override
  String get pleaseFillInAllFields => 'Jọwọ fọwọsi ni gbogbo awọn aaye';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN gbọdọ jẹ o kere ju awọn nọmba 4';

  @override
  String get pinAtLeast4Digits => 'PIN gbọdọ jẹ o kere ju awọn nọmba 4';

  @override
  String get invalidUsernameOrPin => 'Orukọ olumulo ti ko tọ tabi PIN';

  @override
  String get invalidUsernameOrPinError => 'Orukọ olumulo ti ko tọ tabi PIN';

  @override
  String get usernameAlreadyExists => 'Orukọ olumulo ti wa tẹlẹ';

  @override
  String get captureMomentsKeepMemories => 'Ya awọn akoko, pa awọn iranti';

  @override
  String get username => 'Orukọ olumulo';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Wo ile';

  @override
  String get createAccount => 'Se akanti fun ra re';

  @override
  String get dontHaveAccountCreateOne => 'Ṣe ko ni akọọlẹ kan? Ṣẹda ọkan';

  @override
  String get alreadyHaveAccountLogin => 'Ti ni iroyin tẹlẹ? Wo ile';

  @override
  String get pleaseEnterUsername => 'Jọwọ tẹ orukọ olumulo kan sii';

  @override
  String get pinsDoNotMatch => 'Awọn PIN ko baramu';

  @override
  String get tapToAddAvatar => 'Fọwọ ba lati fi avatar kun';

  @override
  String get yourName => 'Orukọ rẹ';

  @override
  String get privatePinOptional => 'PIN aladani (aṣayan)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Lo lati encrypt awọn igbasilẹ ikọkọ';

  @override
  String get privatePin => 'PIN aladani';

  @override
  String get leaveEmptyForNoEncryption => 'Fi sofo fun ko si ìsekóòdù';

  @override
  String get confirmPin => 'Jẹrisi PIN';

  @override
  String get getStarted => 'Bẹrẹ';

  @override
  String get noReminders => 'Ko si awọn olurannileti';

  @override
  String get addReminder => 'Fi Olurannileti kun';

  @override
  String get title => 'Title';

  @override
  String get descriptionOptional => 'Description (optional)';

  @override
  String get microphonePermissionRequired => 'Microphone permission required';

  @override
  String get aiAssistant => 'AI Assistant';

  @override
  String get listening => 'Listening...';

  @override
  String get typeAMessage => 'Type a message...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Start a conversation';

  @override
  String get typeYourMessage => 'Type your message...';

  @override
  String get asrReconnecting => 'ASR reconnecting...';

  @override
  String get write => 'Write';

  @override
  String get writeEntry => 'Write Entry';

  @override
  String get noMemoriesYet => 'No memories yet';

  @override
  String get tapPlusToCapture => 'Tap + to capture your thoughts';

  @override
  String get tapPlusToCaptureYourThoughts => 'Tap + to capture your thoughts';

  @override
  String get deleteMemory => 'Delete Memory';

  @override
  String get deleteRecord => 'Delete Record';

  @override
  String get thisEntryWillBeRemoved =>
      'This entry will be removed from your timeline.';

  @override
  String get thisRecordWillBeRemoved =>
      'This record will be removed from your timeline.';

  @override
  String get searchYourRecords => 'Search your records...';

  @override
  String get exactMatches => 'Exact Matches';

  @override
  String get noExactMatches => 'No exact matches';

  @override
  String get exact => 'Exact';

  @override
  String get exactMatch => 'Exact Match';

  @override
  String get fuzzyMatches => 'Fuzzy Matches';

  @override
  String get noFuzzyMatches => 'No fuzzy matches';

  @override
  String get vectorMatch => 'Vector Match';

  @override
  String get networkMatches => 'Network Matches';

  @override
  String get noNetworkMatches => 'No network matches';

  @override
  String get networkSearchIsOff =>
      'Network search is off. Enable it in Settings.';

  @override
  String get network => 'Network';

  @override
  String get networkMatch => 'Network Match';

  @override
  String get noSearchHistory => 'No search history';

  @override
  String get searchHistory => 'Search History';

  @override
  String get invalidLink => 'Invalid link';

  @override
  String get unableToOpenWebPage => 'Unable to open web page';

  @override
  String get imageMemory => '[Image memory]';

  @override
  String get tapToOpenWebPage => 'Tap to open web page';

  @override
  String get editEntry => 'Edit Entry';

  @override
  String get entryDetails => 'Entry Details';

  @override
  String get noContent => 'No content';

  @override
  String get diaryNotFound => 'Diary not found';

  @override
  String get diaryNotFoundShort => 'Record not found';

  @override
  String get aiSummary => 'AI Summary';

  @override
  String get microphoneInterrupted =>
      'Microphone interrupted, recording stopped.';

  @override
  String get bold => 'Igboya';

  @override
  String get italic => 'Italic';

  @override
  String get strikethrough => 'Isẹgun';

  @override
  String get image => 'Aworan';

  @override
  String get asrUnavailableRecordingActive => 'ASR ko si. Gbigbasilẹ ṣi ṣiṣẹ.';

  @override
  String get writeYourEntry => 'Kọ akọsilẹ rẹ ...';

  @override
  String get writeYourContent => 'Kọ akoonu rẹ...';

  @override
  String microphoneStartFailed(String error) {
    return 'Kuna lati bẹrẹ gbohungbohun: _PH_0__';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Gbohungbohun Idilọwọ, gbigbasilẹ duro.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR tun so pọ: _PH_0__';
  }

  @override
  String imageInserted(String name) {
    return 'Afi sii: _PH_0__';
  }

  @override
  String voiceError(String error) {
    return 'Aṣiṣe ohun: _PH_0__';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Ma binu, iṣẹ AI ko si lọwọlọwọ: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Kuna lati pin: _PH_0__';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '_PH_0__ · _PH_1__ deba';
  }

  @override
  String matchCount(int count) {
    return 'Baramu: _PH_0__';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Orisun: $source';
  }

  @override
  String get createNew => 'Ṣẹda';

  @override
  String micStartFailed(String error) {
    return 'Ibẹrẹ gbohungbohun kuna: _PH_0__';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Awọn akọọlẹ: +$created / imudojuiwọn $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Iwe akọọlẹ: +$created / imudojuiwọn $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Awọn olurannileti: +$created / imudojuiwọn $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Ti fo: _PH_0__';
  }

  @override
  String importResultTotal(int count) {
    return 'Lapapọ ti yipada: _PH_0__';
  }

  @override
  String get settingsApplied => 'Awọn eto ni afẹyinti ni a lo.';

  @override
  String get settingsNotApplied => 'Awọn eto ni afẹyinti ko lo.';

  @override
  String backupExported(String path) {
    return 'Afẹyinti ti a ṣe okeere: _PH_0__';
  }

  @override
  String exportFailed(String error) {
    return 'Ti kuna: _PH_0__';
  }

  @override
  String importFailed(String error) {
    return 'Ikuna agbewọle: _PH_0__';
  }
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Armenian (`hy`).
class AppLocalizationsHy extends AppLocalizations {
  AppLocalizationsHy([String locale = 'hy']) : super(locale);

  @override
  String get languageName => 'Հայերեն';

  @override
  String get languageNameEn => 'Armenian';

  @override
  String get appTitle => 'Շիգուանգ';

  @override
  String get settings => 'Կարգավորումներ';

  @override
  String get account => 'Հաշիվ';

  @override
  String get reminders => 'Հիշեցումներ';

  @override
  String get language => 'Լեզու';

  @override
  String get appLanguage => 'Հավելվածի լեզուն';

  @override
  String get appearance => 'Արտաքին տեսք';

  @override
  String get themeMode => 'Թեմայի ռեժիմ';

  @override
  String get dark => 'Մութ';

  @override
  String get light => 'Լույս';

  @override
  String get system => 'Համակարգ';

  @override
  String get aiService => 'AI ծառայություն';

  @override
  String get aiChatProvider => 'AI Chat մատակարար';

  @override
  String get chatModel => 'Զրույցի մոդել';

  @override
  String get localModel => 'Տեղական մոդել';

  @override
  String get localModelDefault => 'Տեղական մոդել (կանխադրված)';

  @override
  String get ollamaEndpoint => 'Օլլամայի վերջնակետ';

  @override
  String get ollamaModel => 'Օլլամա մոդել';

  @override
  String get openAiEndpoint => 'OpenAI վերջնակետ';

  @override
  String get openAiApiKey => 'OpenAI API բանալի';

  @override
  String get openAiModel => 'OpenAI մոդել';

  @override
  String get geminiEndpoint => 'Երկվորյակների վերջնակետ';

  @override
  String get geminiApiKey => 'Gemini API բանալի';

  @override
  String get geminiModel => 'Երկվորյակ մոդելներ';

  @override
  String get anthropicEndpoint => 'Անտրոպիկ վերջնակետ';

  @override
  String get anthropicApiKey => 'Anthropic API բանալի';

  @override
  String get anthropicModel => 'Անթրոպիկ մոդել';

  @override
  String get customProtocol => 'Պատվերով արձանագրություն';

  @override
  String get protocol => 'Արձանագրություն';

  @override
  String get customEndpoint => 'Պատվերով վերջնակետ';

  @override
  String get customApiKey => 'Հատուկ API բանալի';

  @override
  String get customModel => 'Պատվերով մոդել';

  @override
  String get optionalForLocalServers =>
      'Լոկալ/մաքսային սերվերների համար կամընտիր';

  @override
  String get speechRecognitionEngine => 'Խոսքի ճանաչման շարժիչ';

  @override
  String get local => 'Տեղական';

  @override
  String get endpoint => 'Վերջնակետ';

  @override
  String get localSpeechModel => 'Տեղական խոսքի մոդել';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (սարքի վրա)';

  @override
  String get systemSpeechRecognition => 'Համակարգի խոսքի ճանաչում';

  @override
  String get systemRecognitionAndroidIos => 'Համակարգի ճանաչում (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Վերջնական կետի ճանաչում (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Օգտագործեք ներկառուցված Android / iOS ճանաչիչ (կարող է օգտագործել ամպը)';

  @override
  String get voiceAiEndpoint => 'Ձայնային AI վերջնակետ';

  @override
  String get embeddingModel => 'Ներդրման մոդել';

  @override
  String get crossDeviceSync => 'Խաչաձև սարքի համաժամացում';

  @override
  String get sendToOtherDevices => 'Ուղարկել այլ սարքերի (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Արտահանեք կրկնօրինակը և ուղարկեք համօգտագործվող թերթիկի միջոցով';

  @override
  String get importFromLocalSend => 'Ներմուծում LocalSend-ից';

  @override
  String get selectBackupJson =>
      'Ընտրեք պահուստային JSON և միաձուլեք տեղական տվյալները';

  @override
  String get autoGeneration => 'Ավտոմատ սերունդ';

  @override
  String get autoGenerateSummary => 'Ավտոմատ ստեղծման ամփոփում';

  @override
  String get generateAiSummaryForNewEntries =>
      'Ստեղծեք AI ամփոփագիր նոր գրառումների համար';

  @override
  String get autoGenerateEmbedding => 'Ավտոմատ ստեղծեք ներկառուցում';

  @override
  String get generateVectorEmbedding =>
      'Ստեղծեք վեկտորի ներդրում որոնման համար';

  @override
  String get enableNetworkSearch => 'Միացնել ցանցի որոնումը';

  @override
  String get allowOnlineRetrieval =>
      'Թույլատրել առցանց որոնումը որոնման և AI զրույցի համար (կանխադրված անջատված է)';

  @override
  String get about => 'Մոտ';

  @override
  String version(String version) {
    return 'Տարբերակ $version';
  }

  @override
  String get database => 'Տվյալների բազա';

  @override
  String get objectBoxWithHnsw => 'ObjectBox HNSW ինդեքսով';

  @override
  String get logOut => 'Դուրս գալ';

  @override
  String get custom => 'Պատվերով';

  @override
  String get openAiCompatible => 'OpenAI Համատեղելի';

  @override
  String get notSet => 'Սահմանված չէ';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Աջակցում է տեղական / LAN / հանրային վերջնակետերին';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend Backup';

  @override
  String get localBackupFromShiguang =>
      'Տեղական կրկնօրինակում Shiguang-ից (ստացեք LocalSend-ի միջոցով)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Ընտրեք LocalSend-ից ստացված կրկնօրինակ ֆայլը';

  @override
  String get failedToResolveFilePath => 'Չհաջողվեց լուծել ընտրված ֆայլի ուղին';

  @override
  String get importOptions => 'Ներմուծման ընտրանքներ';

  @override
  String get importSettingsAsWell =>
      'Նաև ներմուծե՞լ կարգավորումները:\n(API ստեղները չեն վերագրվի)';

  @override
  String get dataOnly => 'Միայն տվյալներ';

  @override
  String get dataAndSettings => 'Տվյալներ + Կարգավորումներ';

  @override
  String get importCompleted => 'Ներմուծումն ավարտված է';

  @override
  String get settingsInBackupWereApplied =>
      'Կիրառվել են պահուստավորման կարգավորումները:';

  @override
  String get settingsInBackupWereNotApplied =>
      'Պահուստավորման կարգավորումները չեն կիրառվել:';

  @override
  String get ok => 'Լավ';

  @override
  String get cancel => 'Չեղարկել';

  @override
  String get save => 'Պահպանել';

  @override
  String get delete => 'Ջնջել';

  @override
  String get clear => 'Պարզ';

  @override
  String get add => 'Ավելացնել';

  @override
  String get create => 'Ստեղծել';

  @override
  String get edit => 'Խմբագրել';

  @override
  String get search => 'Որոնում';

  @override
  String get areYouSureYouWantToLogOut => 'Իսկապե՞ս ուզում եք դուրս գալ:';

  @override
  String get chooseLanguage => 'Ընտրեք Լեզուն';

  @override
  String get databaseInfo => 'Տվյալների բազայի տեղեկատվությունը';

  @override
  String get storage => 'Պահպանում՝ ObjectBox';

  @override
  String get vectorIndex => 'Վեկտորային ինդեքս՝ HNSW';

  @override
  String get dimensions => 'Չափերը՝ 384';

  @override
  String get embeddingModelBge => 'Ներկառուցման մոդել՝ bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Լուսանկարեք';

  @override
  String get chooseFromGallery => 'Ընտրեք Պատկերասրահից';

  @override
  String get editNickname => 'Խմբագրել մականունը';

  @override
  String get enterNickname => 'Մուտքագրեք մականունը';

  @override
  String get pleaseEnterNickname => 'Խնդրում ենք մուտքագրել մականուն';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Մականունն արդեն գոյություն ունի կամ անվավեր է';

  @override
  String get user => 'Օգտագործող';

  @override
  String get manageScheduledReminders =>
      'Կառավարեք պլանավորված հիշեցումները և ահազանգերը';

  @override
  String get imageFailedToLoad =>
      'Պատկերը չհաջողվեց բեռնել: Խնդրում ենք կրկին ընտրել:';

  @override
  String get imageIsStillLoading => 'Պատկերը դեռ բեռնվում է';

  @override
  String get imageAreaNotReady =>
      'Պատկերի տարածքը պատրաստ չէ: Խնդրում ենք կրկին փորձել:';

  @override
  String get cropFrameNotReady =>
      'Կտրման շրջանակը պատրաստ չէ: Խնդրում ենք կրկին փորձել:';

  @override
  String get invalidCropArea =>
      'Անվավեր բերքի տարածք: Խնդրում ենք կրկին փորձել:';

  @override
  String get cropFailed => 'Կտրումը ձախողվեց: Խնդրում ենք կրկին փորձել:';

  @override
  String get cropAvatar => 'Կտրել ավատար';

  @override
  String get chooseAgain => 'Ընտրեք Կրկին';

  @override
  String get rotate90 => 'Պտտել 90°';

  @override
  String get dragFrameToMove =>
      'Քաշեք շրջանակը՝ տեղափոխելու համար, քաշեք ներքևից աջ՝ չափափոխելու համար; սեղմել պատկերը մեծացնելու և տեղափոխելու համար:';

  @override
  String get pleaseFillInAllFields => 'Խնդրում ենք լրացնել բոլոր դաշտերը';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN կոդը պետք է լինի առնվազն 4 նիշ';

  @override
  String get pinAtLeast4Digits => 'PIN կոդը պետք է լինի առնվազն 4 նիշ';

  @override
  String get invalidUsernameOrPin => 'Անվավեր օգտանուն կամ PIN';

  @override
  String get invalidUsernameOrPinError => 'Անվավեր օգտանուն կամ PIN';

  @override
  String get usernameAlreadyExists => 'Օգտանուն արդեն գոյություն ունի';

  @override
  String get captureMomentsKeepMemories => 'Գրեք պահեր, պահեք հիշողություններ';

  @override
  String get username => 'Օգտվողի անունը';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Մուտք գործել';

  @override
  String get createAccount => 'Ստեղծել հաշիվ';

  @override
  String get dontHaveAccountCreateOne => 'Չունե՞ք հաշիվ: Ստեղծեք մեկը';

  @override
  String get alreadyHaveAccountLogin => 'Արդեն ունե՞ք հաշիվ: Մուտք գործել';

  @override
  String get pleaseEnterUsername => 'Խնդրում ենք մուտքագրել օգտվողի անուն';

  @override
  String get pinsDoNotMatch => 'PIN-ները չեն համընկնում';

  @override
  String get tapToAddAvatar => 'Հպեք՝ ավատար ավելացնելու համար';

  @override
  String get yourName => 'Ձեր անունը';

  @override
  String get privatePinOptional => 'Անձնական PIN (ըստ ցանկության)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Օգտագործվում է մասնավոր գրառումները գաղտնագրելու համար';

  @override
  String get privatePin => 'Անձնական PIN';

  @override
  String get leaveEmptyForNoEncryption => 'Թողեք դատարկ՝ առանց կոդավորման';

  @override
  String get confirmPin => 'Հաստատեք PIN կոդը';

  @override
  String get getStarted => 'Սկսեք';

  @override
  String get noReminders => 'Հիշեցումներ չկան';

  @override
  String get addReminder => 'Ավելացնել հիշեցում';

  @override
  String get title => 'Վերնագիր';

  @override
  String get descriptionOptional => 'Նկարագրություն (ըստ ցանկության)';

  @override
  String get microphonePermissionRequired =>
      'Պահանջվում է խոսափողի թույլտվություն';

  @override
  String get aiAssistant => 'AI օգնական';

  @override
  String get listening => 'Լսելով...';

  @override
  String get typeAMessage => 'Մուտքագրեք հաղորդագրություն...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Սկսեք զրույց';

  @override
  String get typeYourMessage => 'Մուտքագրեք ձեր հաղորդագրությունը...';

  @override
  String get asrReconnecting => 'ASR-ը նորից միանում է...';

  @override
  String get write => 'Գրել';

  @override
  String get writeEntry => 'Գրել Մուտք';

  @override
  String get noMemoriesYet => 'Դեռ հիշողություններ չկան';

  @override
  String get tapPlusToCapture => 'Հպեք +՝ ձեր մտքերը գրավելու համար';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Հպեք +՝ ձեր մտքերը գրավելու համար';

  @override
  String get deleteMemory => 'Ջնջել հիշողությունը';

  @override
  String get deleteRecord => 'Ջնջել գրառումը';

  @override
  String get thisEntryWillBeRemoved =>
      'Այս գրառումը կհեռացվի ձեր ժամանակացույցից:';

  @override
  String get thisRecordWillBeRemoved =>
      'Այս գրառումը կհեռացվի ձեր ժամանակացույցից:';

  @override
  String get searchYourRecords => 'Որոնեք ձեր գրառումները...';

  @override
  String get exactMatches => 'Ճշգրիտ համընկնումներ';

  @override
  String get noExactMatches => 'Ճշգրիտ համընկնումներ չկան';

  @override
  String get exact => 'Ճշգրիտ';

  @override
  String get exactMatch => 'Ճշգրիտ համընկնում';

  @override
  String get fuzzyMatches => 'Fuzzy Maches';

  @override
  String get noFuzzyMatches => 'Ոչ մի անորոշ համընկնում';

  @override
  String get vectorMatch => 'Վեկտորային համընկնում';

  @override
  String get networkMatches => 'Ցանցային համընկնումներ';

  @override
  String get noNetworkMatches => 'Ցանցի համընկնում չկա';

  @override
  String get networkSearchIsOff =>
      'Ցանցային որոնումն անջատված է: Միացրեք այն Կարգավորումներում:';

  @override
  String get network => 'Ցանց';

  @override
  String get networkMatch => 'Ցանցային համընկնում';

  @override
  String get noSearchHistory => 'Որոնման պատմություն չկա';

  @override
  String get searchHistory => 'Որոնման պատմություն';

  @override
  String get invalidLink => 'Անվավեր հղում';

  @override
  String get unableToOpenWebPage => 'Հնարավոր չէ բացել վեբ էջը';

  @override
  String get imageMemory => '[Պատկերի հիշողություն]';

  @override
  String get tapToOpenWebPage => 'Հպեք՝ վեբ էջը բացելու համար';

  @override
  String get editEntry => 'Խմբագրել մուտքը';

  @override
  String get entryDetails => 'Մուտքի մանրամասները';

  @override
  String get noContent => 'Բովանդակություն չկա';

  @override
  String get diaryNotFound => 'Օրագիր չի գտնվել';

  @override
  String get diaryNotFoundShort => 'Գրառումը չի գտնվել';

  @override
  String get aiSummary => 'AI ամփոփում';

  @override
  String get microphoneInterrupted =>
      'Խոսափողն ընդհատվեց, ձայնագրությունը դադարեց:';

  @override
  String get bold => 'Համարձակ';

  @override
  String get italic => 'Շեղագիր';

  @override
  String get strikethrough => 'Strikethrough';

  @override
  String get image => 'Պատկեր';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR-ն անհասանելի է: Ձայնագրումը դեռ ակտիվ է:';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Գրեք ձեր գրառումը...';

  @override
  String get writeYourContent => 'Գրեք ձեր բովանդակությունը...';

  @override
  String microphoneStartFailed(String error) {
    return 'Չհաջողվեց միացնել խոսափողը. $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Խոսափողն ընդհատվեց, ձայնագրությունը դադարեց:';

  @override
  String asrReconnectingError(String error) {
    return 'ASR-ի վերամիացում՝ $error';
  }

  @override
  String imageInserted(String name) {
    return 'Պատկերը տեղադրված է՝ $name';
  }

  @override
  String voiceError(String error) {
    return 'Ձայնային սխալ՝ $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Ներողություն, AI ծառայությունը ներկայումս անհասանելի է. $error';
  }

  @override
  String shareFailed(String error) {
    return 'Չհաջողվեց կիսվել՝ $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count հարվածներ';
  }

  @override
  String matchCount(int count) {
    return 'Համընկնումը՝ $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Աղբյուր՝ $source';
  }

  @override
  String get createNew => 'Ստեղծել';

  @override
  String micStartFailed(String error) {
    return 'Խոսափողի գործարկումը ձախողվեց՝ $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Հաշիվներ՝ +$created / թարմացված $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Օրագրեր՝ +$created / թարմացված $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Հիշեցումներ՝ +$created / թարմացված $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Բաց թողնված՝ $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Ընդհանուր փոխվել է՝ $count';
  }

  @override
  String get settingsApplied => 'Կիրառվել են պահուստավորման կարգավորումները:';

  @override
  String get settingsNotApplied =>
      'Պահուստավորման կարգավորումները չեն կիրառվել:';

  @override
  String backupExported(String path) {
    return 'Արտահանված կրկնօրինակը՝ $path';
  }

  @override
  String exportFailed(String error) {
    return 'Չհաջողվեց արտահանել՝ $error';
  }

  @override
  String importFailed(String error) {
    return 'Չհաջողվեց ներմուծել՝ $error';
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

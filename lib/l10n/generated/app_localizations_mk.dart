// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Macedonian (`mk`).
class AppLocalizationsMk extends AppLocalizations {
  AppLocalizationsMk([String locale = 'mk']) : super(locale);

  @override
  String get languageName => 'Македонски';

  @override
  String get languageNameEn => 'Macedonian';

  @override
  String get appTitle => 'Шигуанг';

  @override
  String get settings => 'Поставки';

  @override
  String get account => 'Сметка';

  @override
  String get reminders => 'Потсетници';

  @override
  String get language => 'Јазик';

  @override
  String get appLanguage => 'Јазик на апликацијата';

  @override
  String get appearance => 'Изглед';

  @override
  String get themeMode => 'Режим на тема';

  @override
  String get dark => 'Темно';

  @override
  String get light => 'Светлина';

  @override
  String get system => 'Систем';

  @override
  String get aiService => 'Услуга за вештачка интелигенција';

  @override
  String get aiChatProvider =>
      'Провајдер за разговор со вештачка интелигенција';

  @override
  String get chatModel => 'Модел за разговор';

  @override
  String get localModel => 'Локален модел';

  @override
  String get localModelDefault => 'Локален модел (стандардно)';

  @override
  String get ollamaEndpoint => 'Крајна точка на Олама';

  @override
  String get ollamaModel => 'Моделот Олама';

  @override
  String get openAiEndpoint => 'OpenAI крајна точка';

  @override
  String get openAiApiKey => 'OpenAI API клуч';

  @override
  String get openAiModel => 'OpenAI модел';

  @override
  String get geminiEndpoint => 'Крајна точка Близнаци';

  @override
  String get geminiApiKey => 'Gemini API клуч';

  @override
  String get geminiModel => 'Модели на Близнаци';

  @override
  String get anthropicEndpoint => 'Антропска крајна точка';

  @override
  String get anthropicApiKey => 'Anthropic API клуч';

  @override
  String get anthropicModel => 'Антропски модел';

  @override
  String get customProtocol => 'Прилагоден протокол';

  @override
  String get protocol => 'Протокол';

  @override
  String get customEndpoint => 'Прилагодена крајна точка';

  @override
  String get customApiKey => 'Приспособен клуч за API';

  @override
  String get customModel => 'Прилагоден модел';

  @override
  String get optionalForLocalServers =>
      'Изборно за локални/прилагодени сервери';

  @override
  String get speechRecognitionEngine => 'Мотор за препознавање говор';

  @override
  String get local => 'Локално';

  @override
  String get endpoint => 'Крајна точка';

  @override
  String get localSpeechModel => 'Локален говорен модел';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (на уред)';

  @override
  String get systemSpeechRecognition => 'Системско препознавање на говор';

  @override
  String get systemRecognitionAndroidIos =>
      'Системско препознавање (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Препознавање крајна точка (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Користете вграден препознавање на Android / iOS (може да користите облак)';

  @override
  String get voiceAiEndpoint =>
      'Крајна точка со гласовна вештачка интелигенција';

  @override
  String get embeddingModel => 'Модел за вградување';

  @override
  String get crossDeviceSync => 'Синхронизација меѓу уреди';

  @override
  String get sendToOtherDevices => 'Испрати на други уреди (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Извезете резервна копија и испраќајте преку лист за споделување';

  @override
  String get importFromLocalSend => 'Увезете од LocalSend';

  @override
  String get selectBackupJson =>
      'Изберете резервна копија JSON и спојте ги локалните податоци';

  @override
  String get autoGeneration => 'Автоматска генерација';

  @override
  String get autoGenerateSummary => 'Автоматско генерирање резиме';

  @override
  String get generateAiSummaryForNewEntries =>
      'Создадете резиме на вештачка интелигенција за нови записи';

  @override
  String get autoGenerateEmbedding => 'Автоматско генерирање на вградување';

  @override
  String get generateVectorEmbedding =>
      'Генерирајте векторско вградување за пребарување';

  @override
  String get enableNetworkSearch => 'Овозможете мрежно пребарување';

  @override
  String get allowOnlineRetrieval =>
      'Дозволете онлајн преземање за пребарување и разговор со вештачка интелигенција (исклучено стандардно)';

  @override
  String get about => 'За';

  @override
  String version(String version) {
    return 'Верзија $version';
  }

  @override
  String get database => 'База на податоци';

  @override
  String get objectBoxWithHnsw => 'ObjectBox со индекс HNSW';

  @override
  String get logOut => 'Одјавете се';

  @override
  String get custom => 'Прилагодено';

  @override
  String get openAiCompatible => 'Компатибилен со OpenAI';

  @override
  String get notSet => 'Не е поставено';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Поддржува локални/LAN/јавни крајни точки';

  @override
  String get shiguangLocalSendBackup => 'Резервна копија на Shiguang LocalSend';

  @override
  String get localBackupFromShiguang =>
      'Локална резервна копија од Shiguang (примајте преку LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Изберете резервна датотека добиена од LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Не успеа да се реши избраната патека на датотеката';

  @override
  String get importOptions => 'Опции за увоз';

  @override
  String get importSettingsAsWell =>
      'И поставките за увоз?\n(Клучевите API нема да се препишуваат)';

  @override
  String get dataOnly => 'Само податоци';

  @override
  String get dataAndSettings => 'Податоци + Поставки';

  @override
  String get importCompleted => 'Увозот е завршен';

  @override
  String get settingsInBackupWereApplied =>
      'Применети се поставките во резервната копија.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Поставките во резервната копија не беа применети.';

  @override
  String get ok => 'Во ред';

  @override
  String get cancel => 'Откажи';

  @override
  String get save => 'Зачувај';

  @override
  String get delete => 'Избриши';

  @override
  String get clear => 'Јасно';

  @override
  String get add => 'Додадете';

  @override
  String get create => 'Креирај';

  @override
  String get edit => 'Уреди';

  @override
  String get search => 'Пребарување';

  @override
  String get areYouSureYouWantToLogOut =>
      'Дали сте сигурни дека сакате да се одјавите?';

  @override
  String get chooseLanguage => 'Изберете јазик';

  @override
  String get databaseInfo => 'Информации за базата на податоци';

  @override
  String get storage => 'Складирање: ObjectBox';

  @override
  String get vectorIndex => 'Векторски индекс: HNSW';

  @override
  String get dimensions => 'Димензии: 384';

  @override
  String get embeddingModelBge => 'Модел за вградување: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Фотографирајте';

  @override
  String get chooseFromGallery => 'Изберете од Галерија';

  @override
  String get editNickname => 'Уреди прекар';

  @override
  String get enterNickname => 'Внесете прекар';

  @override
  String get pleaseEnterNickname => 'Ве молиме внесете прекар';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Прекарот веќе постои или е неважечки';

  @override
  String get user => 'Корисник';

  @override
  String get manageScheduledReminders =>
      'Управувајте со закажаните потсетници и аларми';

  @override
  String get imageFailedToLoad =>
      'Сликата не успеа да се вчита. Ве молиме изберете повторно.';

  @override
  String get imageIsStillLoading => 'Сликата сè уште се вчитува';

  @override
  String get imageAreaNotReady =>
      'Областа на сликата не е подготвена. Ве молиме обидете се повторно.';

  @override
  String get cropFrameNotReady =>
      'Рамката за сечење не е подготвена. Ве молиме обидете се повторно.';

  @override
  String get invalidCropArea =>
      'Неважечка област за сечење. Ве молиме обидете се повторно.';

  @override
  String get cropFailed => 'Сечење не успеа. Ве молиме обидете се повторно.';

  @override
  String get cropAvatar => 'Исечете го аватарот';

  @override
  String get chooseAgain => 'Изберете Повторно';

  @override
  String get rotate90 => 'Ротирајте 90°';

  @override
  String get dragFrameToMove =>
      'Повлечете ја рамката за да се движите, влечете долу-десно за да ја промените големината; штипнете за да зумирате и преместите слика.';

  @override
  String get pleaseFillInAllFields => 'Ве молиме пополнете ги сите полиња';

  @override
  String get pinMustBeAtLeast4Digits =>
      'ПИН-кодот мора да биде најмалку 4 цифри';

  @override
  String get pinAtLeast4Digits => 'ПИН-кодот мора да биде најмалку 4 цифри';

  @override
  String get invalidUsernameOrPin => 'Неважечко корисничко име или PIN';

  @override
  String get invalidUsernameOrPinError => 'Неважечко корисничко име или PIN';

  @override
  String get usernameAlreadyExists => 'Корисничкото име веќе постои';

  @override
  String get captureMomentsKeepMemories =>
      'Снимајте моменти, зачувајте спомени';

  @override
  String get username => 'Корисничко име';

  @override
  String get pin => 'ПИН';

  @override
  String get login => 'Најавете се';

  @override
  String get createAccount => 'Креирај сметка';

  @override
  String get dontHaveAccountCreateOne => 'Немате сметка? Направете еден';

  @override
  String get alreadyHaveAccountLogin => 'Веќе имате сметка? Најавете се';

  @override
  String get pleaseEnterUsername => 'Ве молиме внесете корисничко име';

  @override
  String get pinsDoNotMatch => 'PIN-кодовите не се совпаѓаат';

  @override
  String get tapToAddAvatar => 'Допрете за да додадете аватар';

  @override
  String get yourName => 'Вашето име';

  @override
  String get privatePinOptional => 'Приватен ПИН (опционално)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Се користи за шифрирање на приватни записи';

  @override
  String get privatePin => 'Приватен ПИН';

  @override
  String get leaveEmptyForNoEncryption =>
      'Оставете празно за да нема шифрирање';

  @override
  String get confirmPin => 'Потврдете PIN';

  @override
  String get getStarted => 'Започнете';

  @override
  String get noReminders => 'Нема потсетници';

  @override
  String get addReminder => 'Додадете потсетник';

  @override
  String get title => 'Наслов';

  @override
  String get descriptionOptional => 'Опис (опционално)';

  @override
  String get microphonePermissionRequired => 'Потребна е дозвола за микрофон';

  @override
  String get aiAssistant => 'Асистент со вештачка интелигенција';

  @override
  String get listening => 'Слушање...';

  @override
  String get typeAMessage => 'Напишете порака...';

  @override
  String get aiChat => 'Разговор со вештачка интелигенција';

  @override
  String get startAConversation => 'Започнете разговор';

  @override
  String get typeYourMessage => 'Напишете ја вашата порака...';

  @override
  String get asrReconnecting => 'ASR повторно се поврзува...';

  @override
  String get write => 'Напиши';

  @override
  String get writeEntry => 'Напиши запис';

  @override
  String get noMemoriesYet => 'Сè уште нема спомени';

  @override
  String get tapPlusToCapture => 'Допрете + за да ги доловите вашите мисли';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Допрете + за да ги доловите вашите мисли';

  @override
  String get deleteMemory => 'Избришете ја меморијата';

  @override
  String get deleteRecord => 'Избриши запис';

  @override
  String get thisEntryWillBeRemoved =>
      'Овој запис ќе биде отстранет од вашата временска линија.';

  @override
  String get thisRecordWillBeRemoved =>
      'Овој запис ќе биде отстранет од вашата временска линија.';

  @override
  String get searchYourRecords => 'Пребарајте ги вашите записи...';

  @override
  String get exactMatches => 'Точни натпревари';

  @override
  String get noExactMatches => 'Нема точни совпаѓања';

  @override
  String get exact => 'Точно';

  @override
  String get exactMatch => 'Точно совпаѓање';

  @override
  String get fuzzyMatches => 'Нејасни натпревари';

  @override
  String get noFuzzyMatches => 'Нема нејасни совпаѓања';

  @override
  String get vectorMatch => 'Векторски натпревар';

  @override
  String get networkMatches => 'Мрежни натпревари';

  @override
  String get noNetworkMatches => 'Нема совпаѓања на мрежата';

  @override
  String get networkSearchIsOff =>
      'Мрежното пребарување е исклучено. Овозможете го во Поставки.';

  @override
  String get network => 'Мрежа';

  @override
  String get networkMatch => 'Мрежен натпревар';

  @override
  String get noSearchHistory => 'Нема историја на пребарување';

  @override
  String get searchHistory => 'Историја на пребарување';

  @override
  String get invalidLink => 'Неважечка врска';

  @override
  String get unableToOpenWebPage => 'Не може да се отвори веб-страница';

  @override
  String get imageMemory => '[Меморија на слика]';

  @override
  String get tapToOpenWebPage => 'Допрете за да ја отворите веб-страницата';

  @override
  String get editEntry => 'Уреди запис';

  @override
  String get entryDetails => 'Детали за влез';

  @override
  String get noContent => 'Нема содржина';

  @override
  String get diaryNotFound => 'Дневникот не е пронајден';

  @override
  String get diaryNotFoundShort => 'Записот не е пронајден';

  @override
  String get aiSummary => 'Резиме на вештачка интелигенција';

  @override
  String get microphoneInterrupted => 'Микрофонот е прекинат, снимањето запре.';

  @override
  String get bold => 'Задебелен';

  @override
  String get italic => 'Закосени';

  @override
  String get strikethrough => 'Премин';

  @override
  String get image => 'Слика';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR недостапен. Снимањето е сè уште активно.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Напишете го вашиот влез...';

  @override
  String get writeYourContent => 'Напишете ја вашата содржина...';

  @override
  String microphoneStartFailed(String error) {
    return 'Микрофонот не успеа да се вклучи: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Микрофонот е прекинат, снимањето запре.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR повторно се поврзува: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Вметната слика: $name';
  }

  @override
  String voiceError(String error) {
    return 'Гласовна грешка: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'За жал, услугата за вештачка интелигенција моментално е недостапна: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Не успеа да се сподели: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count хитови';
  }

  @override
  String matchCount(int count) {
    return 'Натпревар: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Извор: $source';
  }

  @override
  String get createNew => 'Креирај';

  @override
  String micStartFailed(String error) {
    return 'Почетокот на микрофонот не успеа: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Сметки: +$created / ажурирани $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Дневници: +$created / ажурирани $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Потсетници: +$created / ажурирано $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Прескокнат: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Вкупно изменети: $count';
  }

  @override
  String get settingsApplied => 'Применети се поставките во резервната копија.';

  @override
  String get settingsNotApplied =>
      'Поставките во резервната копија не беа применети.';

  @override
  String backupExported(String path) {
    return 'Бекап е извезен: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Извозот не успеа: $error';
  }

  @override
  String importFailed(String error) {
    return 'Увозот не успеа: $error';
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

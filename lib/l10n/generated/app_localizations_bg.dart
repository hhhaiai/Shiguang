// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get languageName => 'Български';

  @override
  String get languageNameEn => 'Bulgarian';

  @override
  String get appTitle => 'Шигуанг';

  @override
  String get settings => 'Настройки';

  @override
  String get account => 'акаунт';

  @override
  String get reminders => 'Напомняния';

  @override
  String get language => 'език';

  @override
  String get appLanguage => 'Език на приложението';

  @override
  String get appearance => 'Външен вид';

  @override
  String get themeMode => 'Тематичен режим';

  @override
  String get dark => 'Тъмно';

  @override
  String get light => 'светлина';

  @override
  String get system => 'система';

  @override
  String get aiService => 'AI услуга';

  @override
  String get aiChatProvider => 'Доставчик на AI чат';

  @override
  String get chatModel => 'Модел на чат';

  @override
  String get localModel => 'Местен модел';

  @override
  String get localModelDefault => 'Локален модел (по подразбиране)';

  @override
  String get ollamaEndpoint => 'Крайна точка Олама';

  @override
  String get ollamaModel => 'Модел Олама';

  @override
  String get openAiEndpoint => 'Крайна точка на OpenAI';

  @override
  String get openAiApiKey => 'OpenAI API ключ';

  @override
  String get openAiModel => 'Модел OpenAI';

  @override
  String get geminiEndpoint => 'Крайна точка Близнаци';

  @override
  String get geminiApiKey => 'Gemini API ключ';

  @override
  String get geminiModel => 'Модели Близнаци';

  @override
  String get anthropicEndpoint => 'Антропна крайна точка';

  @override
  String get anthropicApiKey => 'Anthropic API ключ';

  @override
  String get anthropicModel => 'Антропен модел';

  @override
  String get customProtocol => 'Персонализиран протокол';

  @override
  String get protocol => 'протокол';

  @override
  String get customEndpoint => 'Персонализирана крайна точка';

  @override
  String get customApiKey => 'Персонализиран API ключ';

  @override
  String get customModel => 'Персонализиран модел';

  @override
  String get optionalForLocalServers =>
      'По избор за локални/персонализирани сървъри';

  @override
  String get speechRecognitionEngine => 'Механизъм за разпознаване на реч';

  @override
  String get local => 'Местен';

  @override
  String get endpoint => 'Крайна точка';

  @override
  String get localSpeechModel => 'Модел на местната реч';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (на устройството)';

  @override
  String get systemSpeechRecognition => 'Системно разпознаване на реч';

  @override
  String get systemRecognitionAndroidIos =>
      'Системно разпознаване (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Разпознаване на крайна точка (облак/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Използвайте вградения разпознавач за Android / iOS (може да използва облак)';

  @override
  String get voiceAiEndpoint => 'Гласова крайна точка на AI';

  @override
  String get embeddingModel => 'Модел на вграждане';

  @override
  String get crossDeviceSync => 'Синхронизиране между устройства';

  @override
  String get sendToOtherDevices => 'Изпращане до други устройства (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Експортиране на резервно копие и изпращане чрез лист за споделяне';

  @override
  String get importFromLocalSend => 'Импортиране от LocalSend';

  @override
  String get selectBackupJson =>
      'Изберете архивиране на JSON и обединете локални данни';

  @override
  String get autoGeneration => 'Автоматично генериране';

  @override
  String get autoGenerateSummary => 'Автоматично генериране на резюме';

  @override
  String get generateAiSummaryForNewEntries =>
      'Генериране на AI резюме за нови записи';

  @override
  String get autoGenerateEmbedding => 'Автоматично генериране на вграждане';

  @override
  String get generateVectorEmbedding =>
      'Генериране на векторно вграждане за търсене';

  @override
  String get enableNetworkSearch => 'Активирайте мрежовото търсене';

  @override
  String get allowOnlineRetrieval =>
      'Разрешаване на онлайн извличане за търсене и AI чат (изключено по подразбиране)';

  @override
  String get about => 'За';

  @override
  String version(String version) {
    return 'Версия $version';
  }

  @override
  String get database => 'База данни';

  @override
  String get objectBoxWithHnsw => 'ObjectBox с HNSW индекс';

  @override
  String get logOut => 'Излезте';

  @override
  String get custom => 'По поръчка';

  @override
  String get openAiCompatible => 'Съвместим с OpenAI';

  @override
  String get notSet => 'Не е зададено';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... или http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Поддържа локални/LAN/публични крайни точки';

  @override
  String get shiguangLocalSendBackup => 'Архивиране на Shiguang LocalSend';

  @override
  String get localBackupFromShiguang =>
      'Локално архивиране от Shiguang (получаване чрез LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Изберете архивен файл, получен от LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Неуспешно разрешаване на избрания файлов път';

  @override
  String get importOptions => 'Опции за импортиране';

  @override
  String get importSettingsAsWell =>
      'Импортиране на настройки?\n(API ключовете няма да бъдат презаписани)';

  @override
  String get dataOnly => 'Само данни';

  @override
  String get dataAndSettings => 'Данни + Настройки';

  @override
  String get importCompleted => 'Импортирането е завършено';

  @override
  String get settingsInBackupWereApplied =>
      'Настройките в резервното копие бяха приложени.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Настройките в резервното копие не бяха приложени.';

  @override
  String get ok => 'добре';

  @override
  String get cancel => 'Отказ';

  @override
  String get save => 'Запазване';

  @override
  String get delete => 'Изтриване';

  @override
  String get clear => 'ясно';

  @override
  String get add => 'Добавете';

  @override
  String get create => 'Създавайте';

  @override
  String get edit => 'Редактиране';

  @override
  String get search => 'Търсене';

  @override
  String get areYouSureYouWantToLogOut =>
      'Сигурни ли сте, че искате да излезете?';

  @override
  String get chooseLanguage => 'Изберете език';

  @override
  String get databaseInfo => 'Информация за база данни';

  @override
  String get storage => 'Съхранение: ObjectBox';

  @override
  String get vectorIndex => 'Векторен индекс: HNSW';

  @override
  String get dimensions => 'Размери: 384';

  @override
  String get embeddingModelBge => 'Модел за вграждане: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Направете снимка';

  @override
  String get chooseFromGallery => 'Изберете от Галерия';

  @override
  String get editNickname => 'Редактиране на псевдоним';

  @override
  String get enterNickname => 'Въведете псевдоним';

  @override
  String get pleaseEnterNickname => 'Моля, въведете псевдоним';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Псевдонимът вече съществува или е невалиден';

  @override
  String get user => 'Потребител';

  @override
  String get manageScheduledReminders =>
      'Управлявайте планирани напомняния и аларми';

  @override
  String get imageFailedToLoad =>
      'Изображението не успя да се зареди. Моля, изберете отново.';

  @override
  String get imageIsStillLoading => 'Изображението все още се зарежда';

  @override
  String get imageAreaNotReady =>
      'Областта на изображението не е готова. Моля, опитайте отново.';

  @override
  String get cropFrameNotReady =>
      'Рамката за изрязване не е готова. Моля, опитайте отново.';

  @override
  String get invalidCropArea =>
      'Невалидна площ за отглеждане. Моля, опитайте отново.';

  @override
  String get cropFailed => 'Изрязването е неуспешно. Моля, опитайте отново.';

  @override
  String get cropAvatar => 'Изрязване на аватар';

  @override
  String get chooseAgain => 'Изберете отново';

  @override
  String get rotate90 => 'Завъртане на 90°';

  @override
  String get dragFrameToMove =>
      'Плъзнете рамката, за да я преместите, плъзнете долу-вдясно, за да преоразмерите; щипнете, за да увеличите и преместите изображението.';

  @override
  String get pleaseFillInAllFields => 'Моля, попълнете всички полета';

  @override
  String get pinMustBeAtLeast4Digits => 'ПИН трябва да е поне 4 цифри';

  @override
  String get pinAtLeast4Digits => 'ПИН трябва да е поне 4 цифри';

  @override
  String get invalidUsernameOrPin => 'Невалидно потребителско име или ПИН';

  @override
  String get invalidUsernameOrPinError => 'Невалидно потребителско име или ПИН';

  @override
  String get usernameAlreadyExists => 'Потребителското име вече съществува';

  @override
  String get captureMomentsKeepMemories => 'Уловете моменти, запазете спомени';

  @override
  String get username => 'Потребителско име';

  @override
  String get pin => 'ПИН';

  @override
  String get login => 'Вход';

  @override
  String get createAccount => 'Създаване на акаунт';

  @override
  String get dontHaveAccountCreateOne => 'Нямате акаунт? Създайте такъв';

  @override
  String get alreadyHaveAccountLogin => 'Вече имате акаунт? Вход';

  @override
  String get pleaseEnterUsername => 'Моля, въведете потребителско име';

  @override
  String get pinsDoNotMatch => 'ПИН кодовете не съвпадат';

  @override
  String get tapToAddAvatar => 'Докоснете, за да добавите аватар';

  @override
  String get yourName => 'Вашето име';

  @override
  String get privatePinOptional => 'Личен ПИН (по избор)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Използва се за криптиране на лични записи';

  @override
  String get privatePin => 'Личен ПИН';

  @override
  String get leaveEmptyForNoEncryption =>
      'Оставете празно за липса на криптиране';

  @override
  String get confirmPin => 'Потвърдете PIN';

  @override
  String get getStarted => 'Започнете';

  @override
  String get noReminders => 'Без напомняния';

  @override
  String get addReminder => 'Добавяне на напомняне';

  @override
  String get title => 'Заглавие';

  @override
  String get descriptionOptional => 'Описание (по избор)';

  @override
  String get microphonePermissionRequired =>
      'Изисква се разрешение за микрофон';

  @override
  String get aiAssistant => 'AI асистент';

  @override
  String get listening => 'Слушам...';

  @override
  String get typeAMessage => 'Въведете съобщение...';

  @override
  String get aiChat => 'AI Чат';

  @override
  String get startAConversation => 'Започнете разговор';

  @override
  String get typeYourMessage => 'Въведете вашето съобщение...';

  @override
  String get asrReconnecting => 'ASR се свързва отново...';

  @override
  String get write => 'Пишете';

  @override
  String get writeEntry => 'Напишете вход';

  @override
  String get noMemoriesYet => 'Още няма спомени';

  @override
  String get tapPlusToCapture => 'Докоснете +, за да заснемете мислите си';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Докоснете +, за да заснемете мислите си';

  @override
  String get deleteMemory => 'Изтриване на паметта';

  @override
  String get deleteRecord => 'Изтриване на запис';

  @override
  String get thisEntryWillBeRemoved =>
      'Този запис ще бъде премахнат от вашата хронология.';

  @override
  String get thisRecordWillBeRemoved =>
      'Този запис ще бъде премахнат от вашата хронология.';

  @override
  String get searchYourRecords => 'Търсете вашите записи...';

  @override
  String get exactMatches => 'Точни съвпадения';

  @override
  String get noExactMatches => 'Няма точни съвпадения';

  @override
  String get exact => 'Точно';

  @override
  String get exactMatch => 'Точно съвпадение';

  @override
  String get fuzzyMatches => 'Неясни съвпадения';

  @override
  String get noFuzzyMatches => 'Няма неясни съвпадения';

  @override
  String get vectorMatch => 'Векторно съвпадение';

  @override
  String get networkMatches => 'Мрежови съвпадения';

  @override
  String get noNetworkMatches => 'Няма мрежови съвпадения';

  @override
  String get networkSearchIsOff =>
      'Мрежовото търсене е изключено. Активирайте го в Настройки.';

  @override
  String get network => 'мрежа';

  @override
  String get networkMatch => 'Мрежово съвпадение';

  @override
  String get noSearchHistory => 'Няма история на търсенията';

  @override
  String get searchHistory => 'История на търсенето';

  @override
  String get invalidLink => 'Невалидна връзка';

  @override
  String get unableToOpenWebPage => 'Не може да се отвори уеб страница';

  @override
  String get imageMemory => '[Памет за изображения]';

  @override
  String get tapToOpenWebPage => 'Докоснете, за да отворите уеб страница';

  @override
  String get editEntry => 'Редактиране на запис';

  @override
  String get entryDetails => 'Подробности за влизане';

  @override
  String get noContent => 'Без съдържание';

  @override
  String get diaryNotFound => 'Дневникът не е намерен';

  @override
  String get diaryNotFoundShort => 'Записът не е намерен';

  @override
  String get aiSummary => 'AI Резюме';

  @override
  String get microphoneInterrupted => 'Микрофонът прекъсна, записът спря.';

  @override
  String get bold => 'Удебелен';

  @override
  String get italic => 'Курсив';

  @override
  String get strikethrough => 'Зачертано';

  @override
  String get image => 'Изображение';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR не е наличен. Записът все още е активен.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Напишете своя запис...';

  @override
  String get writeYourContent => 'Напишете вашето съдържание...';

  @override
  String microphoneStartFailed(String error) {
    return 'Неуспешно стартиране на микрофона: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Микрофонът прекъсна, записът спря.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR се свързва повторно: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Вмъкнато изображение: $name';
  }

  @override
  String voiceError(String error) {
    return 'Гласова грешка: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'За съжаление услугата AI в момента не е налична: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Неуспешно споделяне: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count посещения';
  }

  @override
  String matchCount(int count) {
    return 'Съвпадение: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Източник: $source';
  }

  @override
  String get createNew => 'Създавайте';

  @override
  String micStartFailed(String error) {
    return 'Неуспешно стартиране на микрофона: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Акаунти: +$created / актуализиран $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Дневници: +$created / актуализиран $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Напомняния: +$created / актуализирано $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Пропуснати: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Общо променени: $count';
  }

  @override
  String get settingsApplied =>
      'Настройките в резервното копие бяха приложени.';

  @override
  String get settingsNotApplied =>
      'Настройките в резервното копие не бяха приложени.';

  @override
  String backupExported(String path) {
    return 'Експортирано резервно копие: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Неуспешно експортиране: $error';
  }

  @override
  String importFailed(String error) {
    return 'Неуспешно импортиране: $error';
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

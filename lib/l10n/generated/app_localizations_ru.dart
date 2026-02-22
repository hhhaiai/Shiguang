// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get languageName => 'Русский';

  @override
  String get languageNameEn => 'Russian';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Настройки';

  @override
  String get account => 'Аккаунт';

  @override
  String get reminders => 'Напоминания';

  @override
  String get language => 'Язык';

  @override
  String get appLanguage => 'Язык приложения';

  @override
  String get appearance => 'Внешний вид';

  @override
  String get themeMode => 'Режим темы';

  @override
  String get dark => 'Тёмный';

  @override
  String get light => 'Светлый';

  @override
  String get system => 'Системный';

  @override
  String get aiService => 'ИИ-сервис';

  @override
  String get aiChatProvider => 'ИИ-провайдер чата';

  @override
  String get chatModel => 'Модель чата';

  @override
  String get localModel => 'Локальная модель';

  @override
  String get localModelDefault => 'Локальная модель (по умолчанию)';

  @override
  String get ollamaEndpoint => 'Конечная точка Оллама';

  @override
  String get ollamaModel => 'Ollama модель';

  @override
  String get openAiEndpoint => 'Конечная точка OpenAI';

  @override
  String get openAiApiKey => 'OpenAI API ключ';

  @override
  String get openAiModel => 'OpenAI модель';

  @override
  String get geminiEndpoint => 'Конечная точка Близнецов';

  @override
  String get geminiApiKey => 'Gemini API ключ';

  @override
  String get geminiModel => 'Gemini модель';

  @override
  String get anthropicEndpoint => 'Антропная конечная точка';

  @override
  String get anthropicApiKey => 'Anthropic API ключ';

  @override
  String get anthropicModel => 'Anthropic модель';

  @override
  String get customProtocol => 'Свой протокол';

  @override
  String get protocol => 'Протокол';

  @override
  String get customEndpoint => 'Свой endpoint';

  @override
  String get customApiKey => 'Свой API ключ';

  @override
  String get customModel => 'Своя модель';

  @override
  String get optionalForLocalServers =>
      'Опционально для локальных/своих серверов';

  @override
  String get speechRecognitionEngine => 'Движок распознавания речи';

  @override
  String get local => 'Локальный';

  @override
  String get endpoint => 'Конечная точка';

  @override
  String get localSpeechModel => 'Локальная модель речи';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (на устройстве';

  @override
  String get systemSpeechRecognition => 'Системное распознавание речи';

  @override
  String get systemRecognitionAndroidIos =>
      'Системное распознавание (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Endpoint распознавание (Облако/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Использовать встроенный распознаватель Android / iOS (может использовать облако)';

  @override
  String get voiceAiEndpoint => 'Конечная точка голосового ИИ';

  @override
  String get embeddingModel => 'Модель эмбеддинга';

  @override
  String get crossDeviceSync => 'Синхронизация между устройствами';

  @override
  String get sendToOtherDevices => 'Отправить на другие устройства (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Экспортировать резервную копию и отправить через меню';

  @override
  String get importFromLocalSend => 'Импортировать из LocalSend';

  @override
  String get selectBackupJson =>
      'Выбрать JSON резервную копию и объединить локальные данные';

  @override
  String get autoGeneration => 'Автогенерация';

  @override
  String get autoGenerateSummary => 'Автогенерация резюме';

  @override
  String get generateAiSummaryForNewEntries =>
      'Генерировать ИИ-резюме для новых записей';

  @override
  String get autoGenerateEmbedding => 'Автогенерация эмбеддинга';

  @override
  String get generateVectorEmbedding =>
      'Генерировать векторный эмбеддинг для поиска';

  @override
  String get enableNetworkSearch => 'Включить сетевой поиск';

  @override
  String get allowOnlineRetrieval =>
      'Разрешить онлайн-поиск для поиска и ИИ-чата (выключено по умолчанию)';

  @override
  String get about => 'О приложении';

  @override
  String version(String version) {
    return 'Версия $version';
  }

  @override
  String get database => 'База данных';

  @override
  String get objectBoxWithHnsw => 'ObjectBox с HNSW индексом';

  @override
  String get logOut => 'Выйти';

  @override
  String get custom => 'Свой';

  @override
  String get openAiCompatible => 'OpenAI совместимый';

  @override
  String get notSet => 'Не установлено';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... или http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Поддерживает локальные/LAN/публичные endpoints';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend резервная копия';

  @override
  String get localBackupFromShiguang =>
      'Локальная резервная копия из Shiguang (принять через LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Выбрать файл резервной копии, полученный от LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Не удалось определить путь к выбранному файлу';

  @override
  String get importOptions => 'Параметры импорта';

  @override
  String get importSettingsAsWell =>
      'Импортировать также настройки?\n(API ключи не будут перезаписаны)';

  @override
  String get dataOnly => 'Только данные';

  @override
  String get dataAndSettings => 'Данные + Настройки';

  @override
  String get importCompleted => 'Импорт завершён';

  @override
  String get settingsInBackupWereApplied =>
      'Настройки из резервной копии были применены.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Настройки из резервной копии не были применены.';

  @override
  String get ok => 'ОК';

  @override
  String get cancel => 'Отмена';

  @override
  String get save => 'Сохранить';

  @override
  String get delete => 'Удалить';

  @override
  String get clear => 'Очистить';

  @override
  String get add => 'Добавить';

  @override
  String get create => 'Создать';

  @override
  String get edit => 'Редактировать';

  @override
  String get search => 'Поиск';

  @override
  String get areYouSureYouWantToLogOut => 'Вы уверены, что хотите выйти?';

  @override
  String get chooseLanguage => 'Выберите язык';

  @override
  String get databaseInfo => 'Информация о базе данных';

  @override
  String get storage => 'Хранилище: ObjectBox';

  @override
  String get vectorIndex => 'Векторный индекс: HNSW';

  @override
  String get dimensions => 'Измерения: 384';

  @override
  String get embeddingModelBge => 'Модель эмбеддинга: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Сделать фото';

  @override
  String get chooseFromGallery => 'Выбрать из галереи';

  @override
  String get editNickname => 'Редактировать никнейм';

  @override
  String get enterNickname => 'Введите никнейм';

  @override
  String get pleaseEnterNickname => 'Пожалуйста, введите никнейм';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Никнейм уже существует или недействителен';

  @override
  String get user => 'Пользователь';

  @override
  String get manageScheduledReminders =>
      'Управление запланированными напоминаниями и будильниками';

  @override
  String get imageFailedToLoad =>
      'Не удалось загрузить изображение. Пожалуйста, выберите снова.';

  @override
  String get imageIsStillLoading => 'Изображение всё ещё загружается';

  @override
  String get imageAreaNotReady =>
      'Область изображения не готова. Пожалуйста, попробуйте снова.';

  @override
  String get cropFrameNotReady =>
      'Рамка обрезки не готова. Пожалуйста, попробуйте снова.';

  @override
  String get invalidCropArea =>
      'Неверная область обрезки. Пожалуйста, попробуйте снова.';

  @override
  String get cropFailed => 'Обрезка не удалась. Пожалуйста, попробуйте снова.';

  @override
  String get cropAvatar => 'Обрезать аватар';

  @override
  String get chooseAgain => 'Выбрать снова';

  @override
  String get rotate90 => 'Повернуть на 90°';

  @override
  String get dragFrameToMove =>
      'Перетащите рамку для перемещения, перетащите правый нижний угол для изменения размера; щипок для увеличения и перемещения изображения.';

  @override
  String get pleaseFillInAllFields => 'Пожалуйста, заполните все поля';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN должен содержать минимум 4 цифры';

  @override
  String get pinAtLeast4Digits => 'PIN должен содержать минимум 4 цифры';

  @override
  String get invalidUsernameOrPin => 'Неверное имя пользователя или PIN';

  @override
  String get invalidUsernameOrPinError => 'Неверное имя пользователя или PIN';

  @override
  String get usernameAlreadyExists => 'Имя пользователя уже существует';

  @override
  String get captureMomentsKeepMemories =>
      'Ловите моменты, сохраняйте воспоминания';

  @override
  String get username => 'Имя пользователя';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Войти';

  @override
  String get createAccount => 'Создать аккаунт';

  @override
  String get dontHaveAccountCreateOne => 'Нет аккаунта? Создайте один';

  @override
  String get alreadyHaveAccountLogin => 'Уже есть аккаунт? Войдите';

  @override
  String get pleaseEnterUsername => 'Пожалуйста, введите имя пользователя';

  @override
  String get pinsDoNotMatch => 'PIN-коды не совпадают';

  @override
  String get tapToAddAvatar => 'Нажмите, чтобы добавить аватар';

  @override
  String get yourName => 'Ваше имя';

  @override
  String get privatePinOptional => 'Личный PIN (опционально)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Используется для шифрования личных записей';

  @override
  String get privatePin => 'Личный PIN';

  @override
  String get leaveEmptyForNoEncryption =>
      'Оставьте пустым для отсутствия шифрования';

  @override
  String get confirmPin => 'Подтвердите PIN';

  @override
  String get getStarted => 'Начать';

  @override
  String get noReminders => 'Нет напоминаний';

  @override
  String get addReminder => 'Добавить напоминание';

  @override
  String get title => 'Название';

  @override
  String get descriptionOptional => 'Описание (опционально)';

  @override
  String get microphonePermissionRequired =>
      'Требуется разрешение на использование микрофона';

  @override
  String get aiAssistant => 'ИИ-ассистент';

  @override
  String get listening => 'Слушаю...';

  @override
  String get typeAMessage => 'Введите сообщение...';

  @override
  String get aiChat => 'ИИ-чат';

  @override
  String get startAConversation => 'Начните разговор';

  @override
  String get typeYourMessage => 'Введите ваше сообщение...';

  @override
  String get asrReconnecting => 'ASR переподключается...';

  @override
  String get write => 'Писать';

  @override
  String get writeEntry => 'Написать запись';

  @override
  String get noMemoriesYet => 'Пока нет воспоминаний';

  @override
  String get tapPlusToCapture => 'Нажмите +, чтобы записать мысли';

  @override
  String get tapPlusToCaptureYourThoughts => 'Нажмите +, чтобы записать мысли';

  @override
  String get deleteMemory => 'Удалить воспоминание';

  @override
  String get deleteRecord => 'Удалить запись';

  @override
  String get thisEntryWillBeRemoved =>
      'Эта запись будет удалена из вашей ленты.';

  @override
  String get thisRecordWillBeRemoved =>
      'Эта запись будет удалена из вашей ленты.';

  @override
  String get searchYourRecords => 'Искать в записях...';

  @override
  String get exactMatches => 'Точные совпадения';

  @override
  String get noExactMatches => 'Нет точных совпадений';

  @override
  String get exact => 'Точно';

  @override
  String get exactMatch => 'Точное совпадение';

  @override
  String get fuzzyMatches => 'Нечёткие совпадения';

  @override
  String get noFuzzyMatches => 'Нет нечётких совпадений';

  @override
  String get vectorMatch => 'Векторное совпадение';

  @override
  String get networkMatches => 'Сетевые совпадения';

  @override
  String get noNetworkMatches => 'Нет сетевых совпадений';

  @override
  String get networkSearchIsOff =>
      'Сетевой поиск выключен. Включите его в настройках.';

  @override
  String get network => 'Сеть';

  @override
  String get networkMatch => 'Сетевое совпадение';

  @override
  String get noSearchHistory => 'Нет истории поиска';

  @override
  String get searchHistory => 'История поиска';

  @override
  String get invalidLink => 'Неверная ссылка';

  @override
  String get unableToOpenWebPage => 'Не удалось открыть веб-страницу';

  @override
  String get imageMemory => '[Воспоминание с изображением]';

  @override
  String get tapToOpenWebPage => 'Нажмите, чтобы открыть веб-страницу';

  @override
  String get editEntry => 'Редактировать запись';

  @override
  String get entryDetails => 'Детали записи';

  @override
  String get noContent => 'Нет содержимого';

  @override
  String get diaryNotFound => 'Дневник не найден';

  @override
  String get diaryNotFoundShort => 'Запись не найдена';

  @override
  String get aiSummary => 'ИИ-резюме';

  @override
  String get microphoneInterrupted => 'Микрофон прерван, запись остановлена.';

  @override
  String get bold => 'Жирный';

  @override
  String get italic => 'Курсив';

  @override
  String get strikethrough => 'Зачёркнутый';

  @override
  String get image => 'Изображение';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR недоступна. Запись всё ещё активна.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Напишите вашу запись...';

  @override
  String get writeYourContent => 'Напишите ваш контент...';

  @override
  String microphoneStartFailed(String error) {
    return 'Не удалось запустить микрофон: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Микрофон прерван, запись остановлена.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR переподключается: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Изображение вставлено: $name';
  }

  @override
  String voiceError(String error) {
    return 'Ошибка голоса: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'К сожалению, ИИ-сервис сейчас недоступен: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Не удалось поделиться: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count результатов';
  }

  @override
  String matchCount(int count) {
    return 'Совпадений: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Источник: $source';
  }

  @override
  String get createNew => 'Создать';

  @override
  String micStartFailed(String error) {
    return 'Не удалось запустить микрофон: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Аккаунты: +$created / обновлено $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Дневники: +$created / обновлено $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Напоминания: +$created / обновлено $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Пропущено: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Всего изменено: $count';
  }

  @override
  String get settingsApplied => 'Настройки из резервной копии были применены.';

  @override
  String get settingsNotApplied =>
      'Настройки из резервной копии не были применены.';

  @override
  String backupExported(String path) {
    return 'Резервная копия экспортирована: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Экспорт не удался: $error';
  }

  @override
  String importFailed(String error) {
    return 'Импорт не удался: $error';
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

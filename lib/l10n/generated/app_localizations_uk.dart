// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get languageName => 'Українська';

  @override
  String get languageNameEn => 'Ukrainian';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Налаштування';

  @override
  String get account => 'Обліковий запис';

  @override
  String get reminders => 'Нагадування';

  @override
  String get language => 'Мова';

  @override
  String get appLanguage => 'Мова додатку';

  @override
  String get appearance => 'Зовнішній вигляд';

  @override
  String get themeMode => 'Тема';

  @override
  String get dark => 'Темна';

  @override
  String get light => 'Світла';

  @override
  String get system => 'Системна';

  @override
  String get aiService => 'AI сервіс';

  @override
  String get aiChatProvider => 'AI чат провайдер';

  @override
  String get chatModel => 'Чат модель';

  @override
  String get localModel => 'Локальна модель';

  @override
  String get localModelDefault => 'Локальна модель (за замовчуванням)';

  @override
  String get ollamaEndpoint => 'Кінцева точка Оллама';

  @override
  String get ollamaModel => 'Ollama модель';

  @override
  String get openAiEndpoint => 'Кінцева точка OpenAI';

  @override
  String get openAiApiKey => 'OpenAI API ключ';

  @override
  String get openAiModel => 'OpenAI модель';

  @override
  String get geminiEndpoint => 'Кінцева точка Gemini';

  @override
  String get geminiApiKey => 'Gemini API ключ';

  @override
  String get geminiModel => 'Gemini модель';

  @override
  String get anthropicEndpoint => 'Антропна кінцева точка';

  @override
  String get anthropicApiKey => 'Anthropic API ключ';

  @override
  String get anthropicModel => 'Anthropic модель';

  @override
  String get customProtocol => 'Власний протокол';

  @override
  String get protocol => 'Протокол';

  @override
  String get customEndpoint => 'Власний Endpoint';

  @override
  String get customApiKey => 'Власний API ключ';

  @override
  String get customModel => 'Власна модель';

  @override
  String get optionalForLocalServers =>
      'Опціонально для локальних/власних серверів';

  @override
  String get speechRecognitionEngine => 'Рушій розпізнавання мовлення';

  @override
  String get local => 'Локальний';

  @override
  String get endpoint => 'Кінцева точка';

  @override
  String get localSpeechModel => 'Локальна мовленнєва модель';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (на пристрої)';

  @override
  String get systemSpeechRecognition => 'Системне розпізнавання мовлення';

  @override
  String get systemRecognitionAndroidIos =>
      'Системне розпізнавання (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Endpoint розпізнавання (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Використовувати вбудований Android/iOS розпізнавач (може використовувати хмару)';

  @override
  String get voiceAiEndpoint => 'Кінцева точка голосового штучного інтелекту';

  @override
  String get embeddingModel => 'Embedding модель';

  @override
  String get crossDeviceSync => 'Синхронізація між пристроями';

  @override
  String get sendToOtherDevices => 'Надіслати на інші пристрої (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Експортувати резервну копію та надіслати через меню поділу';

  @override
  String get importFromLocalSend => 'Імпорт з LocalSend';

  @override
  String get selectBackupJson =>
      'Вибрати JSON резервної копії та об\'єднати локальні дані';

  @override
  String get autoGeneration => 'Автогенерація';

  @override
  String get autoGenerateSummary => 'Автогенерація підсумку';

  @override
  String get generateAiSummaryForNewEntries =>
      'Генерувати AI підсумок для нових записів';

  @override
  String get autoGenerateEmbedding => 'Автогенерація Embedding';

  @override
  String get generateVectorEmbedding =>
      'Генерувати векторний embedding для пошуку';

  @override
  String get enableNetworkSearch => 'Увімкнути мережевий пошук';

  @override
  String get allowOnlineRetrieval =>
      'Дозволити онлайн пошук для пошуку та AI чату (за замовчуванням вимкнено)';

  @override
  String get about => 'Про додаток';

  @override
  String version(String version) {
    return 'Версія $version';
  }

  @override
  String get database => 'База даних';

  @override
  String get objectBoxWithHnsw => 'ObjectBox з індексом HNSW';

  @override
  String get logOut => 'Вийти';

  @override
  String get custom => 'Власний';

  @override
  String get openAiCompatible => 'OpenAI сумісний';

  @override
  String get notSet => 'Не встановлено';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... або http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Підтримує локальні/LAN/публічні endpoints';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend резервна копія';

  @override
  String get localBackupFromShiguang =>
      'Локальна резервна копія від Shiguang (отримати через LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Вибрати файл резервної копії, отриманий від LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Не вдалося визначити шлях до вибраного файлу';

  @override
  String get importOptions => 'Параметри імпорту';

  @override
  String get importSettingsAsWell =>
      'Імпортувати також налаштування?\n(API ключі не будуть перезаписані)';

  @override
  String get dataOnly => 'Тільки дані';

  @override
  String get dataAndSettings => 'Дані + Налаштування';

  @override
  String get importCompleted => 'Імпорт завершено';

  @override
  String get settingsInBackupWereApplied =>
      'Налаштування з резервної копії застосовано.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Налаштування з резервної копії не застосовано.';

  @override
  String get ok => 'добре';

  @override
  String get cancel => 'Скасувати';

  @override
  String get save => 'Зберегти';

  @override
  String get delete => 'Видалити';

  @override
  String get clear => 'Очистити';

  @override
  String get add => 'Додати';

  @override
  String get create => 'Створити';

  @override
  String get edit => 'Редагувати';

  @override
  String get search => 'Пошук';

  @override
  String get areYouSureYouWantToLogOut => 'Ви впевнені, що хочете вийти?';

  @override
  String get chooseLanguage => 'Вибрати мову';

  @override
  String get databaseInfo => 'Інформація про базу даних';

  @override
  String get storage => 'Сховище: ObjectBox';

  @override
  String get vectorIndex => 'Векторний індекс: HNSW';

  @override
  String get dimensions => 'Виміри: 384';

  @override
  String get embeddingModelBge => 'Embedding модель: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Зробити фото';

  @override
  String get chooseFromGallery => 'Вибрати з галереї';

  @override
  String get editNickname => 'Змінити псевдонім';

  @override
  String get enterNickname => 'Ввести псевдонім';

  @override
  String get pleaseEnterNickname => 'Будь ласка, введіть псевдонім';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Псевдонім вже існує або є недійсним';

  @override
  String get user => 'Користувач';

  @override
  String get manageScheduledReminders =>
      'Керувати запланованими нагадуваннями та будильниками';

  @override
  String get imageFailedToLoad =>
      'Зображення не завантажилося. Будь ласка, виберіть ще раз.';

  @override
  String get imageIsStillLoading => 'Зображення все ще завантажується';

  @override
  String get imageAreaNotReady =>
      'Область зображення не готова. Будь ласка, спробуйте ще раз.';

  @override
  String get cropFrameNotReady =>
      'Рамка обрізання не готова. Будь ласка, спробуйте ще раз.';

  @override
  String get invalidCropArea =>
      'Необхідна область обрізання. Будь ласка, спробуйте ще раз.';

  @override
  String get cropFailed =>
      'Обрізання не вдалося. Будь ласка, спробуйте ще раз.';

  @override
  String get cropAvatar => 'Обрізати аватар';

  @override
  String get chooseAgain => 'Вибрати ще раз';

  @override
  String get rotate90 => 'Повернути на 90°';

  @override
  String get dragFrameToMove =>
      'Перетягніть рамку для переміщення, перетягніть нижній правий кут для зміни розміру; щипніть, щоб масштабувати та перемістити зображення.';

  @override
  String get pleaseFillInAllFields => 'Будь ласка, заповніть усі поля';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN повинен містити принаймні 4 цифри';

  @override
  String get pinAtLeast4Digits => 'PIN повинен містити принаймні 4 цифри';

  @override
  String get invalidUsernameOrPin => 'Невірне ім\'я користувача або PIN';

  @override
  String get invalidUsernameOrPinError => 'Невірне ім\'я користувача або PIN';

  @override
  String get usernameAlreadyExists => 'Ім\'я користувача вже існує';

  @override
  String get captureMomentsKeepMemories =>
      'Зафіксуйте моменти, збережіть спогади';

  @override
  String get username => 'Ім\'я користувача';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Увійти';

  @override
  String get createAccount => 'Створити обліковий запис';

  @override
  String get dontHaveAccountCreateOne =>
      'Немає облікового запису? Створіть один';

  @override
  String get alreadyHaveAccountLogin => 'Вже є обліковий запис? Увійти';

  @override
  String get pleaseEnterUsername => 'Будь ласка, введіть ім\'я користувача';

  @override
  String get pinsDoNotMatch => 'PIN-коди не збігаються';

  @override
  String get tapToAddAvatar => 'Натисніть, щоб додати аватар';

  @override
  String get yourName => 'Ваше ім\'я';

  @override
  String get privatePinOptional => 'Приватний PIN (необов\'язково)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Використовується для шифрування приватних записів';

  @override
  String get privatePin => 'Приватний PIN';

  @override
  String get leaveEmptyForNoEncryption =>
      'Залиште порожнім для відсутності шифрування';

  @override
  String get confirmPin => 'Підтвердити PIN';

  @override
  String get getStarted => 'Почати';

  @override
  String get noReminders => 'Немає нагадувань';

  @override
  String get addReminder => 'Додати нагадування';

  @override
  String get title => 'Заголовок';

  @override
  String get descriptionOptional => 'Опис (необов\'язково)';

  @override
  String get microphonePermissionRequired =>
      'Потрібен дозвіл на використання мікрофону';

  @override
  String get aiAssistant => 'AI асистент';

  @override
  String get listening => 'Слухаю...';

  @override
  String get typeAMessage => 'Введіть повідомлення...';

  @override
  String get aiChat => 'AI чат';

  @override
  String get startAConversation => 'Розпочати розмову';

  @override
  String get typeYourMessage => 'Введіть ваше повідомлення...';

  @override
  String get asrReconnecting => 'ASR перепідключення...';

  @override
  String get write => 'Писати';

  @override
  String get writeEntry => 'Написати запис';

  @override
  String get noMemoriesYet => 'Ще немає спогадів';

  @override
  String get tapPlusToCapture => 'Натисніть +, щоб зафіксувати ваші думки';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Натисніть +, щоб зафіксувати ваші думки';

  @override
  String get deleteMemory => 'Видалити спогад';

  @override
  String get deleteRecord => 'Видалити запис';

  @override
  String get thisEntryWillBeRemoved =>
      'Цей запис буде видалено з вашої стрічки.';

  @override
  String get thisRecordWillBeRemoved =>
      'Цей запис буде видалено з вашої стрічки.';

  @override
  String get searchYourRecords => 'Шукати у ваших записах...';

  @override
  String get exactMatches => 'Точні збіги';

  @override
  String get noExactMatches => 'Немає точних збігів';

  @override
  String get exact => 'Точний';

  @override
  String get exactMatch => 'Точний збіг';

  @override
  String get fuzzyMatches => 'Приблизні збіги';

  @override
  String get noFuzzyMatches => 'Немає приблизних збігів';

  @override
  String get vectorMatch => 'Векторний збіг';

  @override
  String get networkMatches => 'Мережеві збіги';

  @override
  String get noNetworkMatches => 'Немає мережевих збігів';

  @override
  String get networkSearchIsOff =>
      'Мережевий пошук вимкнено. Увімкніть його в Налаштуваннях.';

  @override
  String get network => 'Мережа';

  @override
  String get networkMatch => 'Мережевий збіг';

  @override
  String get noSearchHistory => 'Немає історії пошуку';

  @override
  String get searchHistory => 'Історія пошуку';

  @override
  String get invalidLink => 'Недійсне посилання';

  @override
  String get unableToOpenWebPage => 'Не вдалося відкрити веб-сторінку';

  @override
  String get imageMemory => '[Зображення пам\'яті]';

  @override
  String get tapToOpenWebPage => 'Натисніть, щоб відкрити веб-сторінку';

  @override
  String get editEntry => 'Редагувати запис';

  @override
  String get entryDetails => 'Деталі запису';

  @override
  String get noContent => 'Немає вмісту';

  @override
  String get diaryNotFound => 'Щоденник не знайдено';

  @override
  String get diaryNotFoundShort => 'Запис не знайдено';

  @override
  String get aiSummary => 'AI підсумок';

  @override
  String get microphoneInterrupted => 'Мікрофон перервано, запис зупинено.';

  @override
  String get bold => 'Жирний';

  @override
  String get italic => 'Курсив';

  @override
  String get strikethrough => 'Закреслений';

  @override
  String get image => 'Зображення';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR недоступний. Запис все ще триває.';

  @override
  String get writeYourEntry => 'Напишіть ваш запис...';

  @override
  String get writeYourContent => 'Напишіть ваш вміст...';

  @override
  String microphoneStartFailed(String error) {
    return 'Не вдалося запустити мікрофон: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Мікрофон перервано, запис зупинено.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR перепідключення: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Зображення вставлено: $name';
  }

  @override
  String voiceError(String error) {
    return 'Помилка голосу: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Вибачте, AI сервіс наразі недоступний: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Не вдалося поділитися: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count результатів';
  }

  @override
  String matchCount(int count) {
    return 'Збіг: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Джерело: $source';
  }

  @override
  String get createNew => 'Створити';

  @override
  String micStartFailed(String error) {
    return 'Не вдалося запустити мікрофон: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Облікові записи: +$created / оновлено $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Щоденники: +$created / оновлено $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Нагадування: +$created / оновлено $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Пропущено: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Всього змінено: $count';
  }

  @override
  String get settingsApplied => 'Налаштування з резервної копії застосовано.';

  @override
  String get settingsNotApplied =>
      'Налаштування з резервної копії не застосовано.';

  @override
  String backupExported(String path) {
    return 'Резервна копія експортована: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Експорт не вдався: $error';
  }

  @override
  String importFailed(String error) {
    return 'Імпорт не вдався: $error';
  }
}

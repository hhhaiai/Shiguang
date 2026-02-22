// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Montenegrin (`cnr`).
class AppLocalizationsCnr extends AppLocalizations {
  AppLocalizationsCnr([String locale = 'cnr']) : super(locale);

  @override
  String get languageName => 'Crnogorski';

  @override
  String get languageNameEn => 'Montenegrin';

  @override
  String get appTitle => 'Схигуанг';

  @override
  String get settings => 'Подешавања';

  @override
  String get account => 'Рачун';

  @override
  String get reminders => 'Подсетници';

  @override
  String get language => 'Језик';

  @override
  String get appLanguage => 'Језик апликације';

  @override
  String get appearance => 'Изглед';

  @override
  String get themeMode => 'Тхеме Моде';

  @override
  String get dark => 'Дарк';

  @override
  String get light => 'Светлост';

  @override
  String get system => 'Систем';

  @override
  String get aiService => 'АИ Сервице';

  @override
  String get aiChatProvider => 'АИ добављач ћаскања';

  @override
  String get chatModel => 'Цхат Модел';

  @override
  String get localModel => 'Локални модел';

  @override
  String get localModelDefault => 'Локални модел (подразумевано)';

  @override
  String get ollamaEndpoint => 'Оллама Ендпоинт';

  @override
  String get ollamaModel => 'Оллама Модел';

  @override
  String get openAiEndpoint => 'ОпенАИ крајња тачка';

  @override
  String get openAiApiKey => 'ОпенАИ АПИ кључ';

  @override
  String get openAiModel => 'ОпенАИ модел';

  @override
  String get geminiEndpoint => 'Гемини Ендпоинт';

  @override
  String get geminiApiKey => 'Гемини АПИ кључ';

  @override
  String get geminiModel => 'Гемини Моделс';

  @override
  String get anthropicEndpoint => 'Антропска крајња тачка';

  @override
  String get anthropicApiKey => 'Антропски АПИ кључ';

  @override
  String get anthropicModel => 'Антропски модел';

  @override
  String get customProtocol => 'Цустом Протоцол';

  @override
  String get protocol => 'Протокол';

  @override
  String get customEndpoint => 'Прилагођена крајња тачка';

  @override
  String get customApiKey => 'Прилагођени АПИ кључ';

  @override
  String get customModel => 'Цустом Модел';

  @override
  String get optionalForLocalServers =>
      'Опционо за локалне/прилагођене сервере';

  @override
  String get speechRecognitionEngine => 'Мотор за препознавање говора';

  @override
  String get local => 'Локални';

  @override
  String get endpoint => 'Крајња тачка';

  @override
  String get localSpeechModel => 'Модел локалног говора';

  @override
  String get senseVoiceOnnx => 'СенсеВоице ОННКС (на уређају)';

  @override
  String get systemSpeechRecognition => 'Системско препознавање говора';

  @override
  String get systemRecognitionAndroidIos =>
      'Системско препознавање (Андроид/иОС)';

  @override
  String get endpointRecognitionCloudWs =>
      'Препознавање крајње тачке (клауд/ВС)';

  @override
  String get useBuiltInRecognizer =>
      'Користите уграђени Андроид / иОС препознавач (може користити облак)';

  @override
  String get voiceAiEndpoint => 'Гласовна АИ крајња тачка';

  @override
  String get embeddingModel => 'Ембеддинг Модел';

  @override
  String get crossDeviceSync => 'Синхронизација на различитим уређајима';

  @override
  String get sendToOtherDevices => 'Пошаљи на друге уређаје (ЛоцалСенд)';

  @override
  String get exportBackupAndSend =>
      'Извезите резервну копију и пошаљите путем дељене листе';

  @override
  String get importFromLocalSend => 'Увези из ЛоцалСенд-а';

  @override
  String get selectBackupJson =>
      'Изаберите резервни ЈСОН и спојите локалне податке';

  @override
  String get autoGeneration => 'Ауто Генератион';

  @override
  String get autoGenerateSummary => 'Аутоматско генерисање резимеа';

  @override
  String get generateAiSummaryForNewEntries =>
      'Генеришите АИ резиме за нове уносе';

  @override
  String get autoGenerateEmbedding => 'Ауто Генерате Ембеддинг';

  @override
  String get generateVectorEmbedding =>
      'Генеришите уграђивање вектора за претрагу';

  @override
  String get enableNetworkSearch => 'Омогућите претрагу мреже';

  @override
  String get allowOnlineRetrieval =>
      'Дозволи онлајн преузимање за претрагу и АИ ћаскање (подразумевано искључено)';

  @override
  String get about => 'Абоут';

  @override
  String version(String version) {
    return 'Верзија __ПХ_0__';
  }

  @override
  String get database => 'База података';

  @override
  String get objectBoxWithHnsw => 'ОбјецтБок са ХНСВ индексом';

  @override
  String get logOut => 'Одјавите се';

  @override
  String get custom => 'Цустом';

  @override
  String get openAiCompatible => 'ОпенАИ Цомпатибле';

  @override
  String get notSet => 'Није постављено';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Подржава локалне/ЛАН/јавне крајње тачке';

  @override
  String get shiguangLocalSendBackup => 'Схигуанг ЛоцалСенд Бацкуп';

  @override
  String get localBackupFromShiguang =>
      'Локална резервна копија од Схигуанг-а (прими преко ЛоцалСенд-а)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Изаберите датотеку резервне копије примљену од ЛоцалСенд-а';

  @override
  String get failedToResolveFilePath =>
      'Решавање изабране путање датотеке није успело';

  @override
  String get importOptions => 'Опције увоза';

  @override
  String get importSettingsAsWell =>
      'Да увезете и подешавања?\n(АПИ кључеви неће бити преписани)';

  @override
  String get dataOnly => 'Само подаци';

  @override
  String get dataAndSettings => 'Подаци + подешавања';

  @override
  String get importCompleted => 'Увоз је завршен';

  @override
  String get settingsInBackupWereApplied =>
      'Подешавања у резервној копији су примењена.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Подешавања у резервној копији нису примењена.';

  @override
  String get ok => 'ОК';

  @override
  String get cancel => 'Откажи';

  @override
  String get save => 'Сачувај';

  @override
  String get delete => 'Избриши';

  @override
  String get clear => 'Јасно';

  @override
  String get add => 'Додај';

  @override
  String get create => 'Креирај';

  @override
  String get edit => 'Уреди';

  @override
  String get search => 'Тражи';

  @override
  String get areYouSureYouWantToLogOut =>
      'Да ли сте сигурни да желите да се одјавите?';

  @override
  String get chooseLanguage => 'Изаберите Језик';

  @override
  String get databaseInfo => 'Подаци о бази података';

  @override
  String get storage => 'Складиштење: ОбјецтБок';

  @override
  String get vectorIndex => 'Векторски индекс: ХНСВ';

  @override
  String get dimensions => 'Димензије: 384';

  @override
  String get embeddingModelBge => 'Модел за уграђивање: бге-смалл-зх-в1.5';

  @override
  String get takePhoto => 'Снимите фотографију';

  @override
  String get chooseFromGallery => 'Изаберите из Галерије';

  @override
  String get editNickname => 'Уреди надимак';

  @override
  String get enterNickname => 'Унесите надимак';

  @override
  String get pleaseEnterNickname => 'Унесите надимак';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Надимак већ постоји или је неважећи';

  @override
  String get user => 'Корисник';

  @override
  String get manageScheduledReminders =>
      'Управљајте заказаним подсетницима и алармима';

  @override
  String get imageFailedToLoad =>
      'Учитавање слике није успело. Молимо изаберите поново.';

  @override
  String get imageIsStillLoading => 'Слика се и даље учитава';

  @override
  String get imageAreaNotReady =>
      'Област слике није спремна. Покушајте поново.';

  @override
  String get cropFrameNotReady =>
      'Оквир за обрезивање није спреман. Покушајте поново.';

  @override
  String get invalidCropArea => 'Неважећа област усева. Покушајте поново.';

  @override
  String get cropFailed => 'Обрезивање није успело. Покушајте поново.';

  @override
  String get cropAvatar => 'Цроп Аватар';

  @override
  String get chooseAgain => 'Изаберите поново';

  @override
  String get rotate90 => 'Ротирајте за 90°';

  @override
  String get dragFrameToMove =>
      'Превуците оквир да бисте померили, превуците доле удесно да бисте променили величину; стисните прсте да бисте зумирали и померили слику.';

  @override
  String get pleaseFillInAllFields => 'Молимо попуните сва поља';

  @override
  String get pinMustBeAtLeast4Digits => 'ПИН мора да има најмање 4 цифре';

  @override
  String get pinAtLeast4Digits => 'ПИН мора да има најмање 4 цифре';

  @override
  String get invalidUsernameOrPin => 'Неважеће корисничко име или ПИН';

  @override
  String get invalidUsernameOrPinError => 'Неважеће корисничко име или ПИН';

  @override
  String get usernameAlreadyExists => 'Корисничко име већ постоји';

  @override
  String get captureMomentsKeepMemories =>
      'Ухватите тренутке, сачувајте успомене';

  @override
  String get username => 'Корисничко име';

  @override
  String get pin => 'ПИН';

  @override
  String get login => 'Логин';

  @override
  String get createAccount => 'Креирајте налог';

  @override
  String get dontHaveAccountCreateOne => 'Немате налог? Направите један';

  @override
  String get alreadyHaveAccountLogin => 'Већ имате налог? Логин';

  @override
  String get pleaseEnterUsername => 'Унесите корисничко име';

  @override
  String get pinsDoNotMatch => 'ПИН-ови се не поклапају';

  @override
  String get tapToAddAvatar => 'Додирните да додате аватар';

  @override
  String get yourName => 'Ваше име';

  @override
  String get privatePinOptional => 'Приватни ПИН (опционо)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Користи се за шифровање приватних записа';

  @override
  String get privatePin => 'Приватни ПИН';

  @override
  String get leaveEmptyForNoEncryption => 'Оставите празно да нема шифровања';

  @override
  String get confirmPin => 'Потврдите ПИН';

  @override
  String get getStarted => 'Започните';

  @override
  String get noReminders => 'Нема подсетника';

  @override
  String get addReminder => 'Додај подсетник';

  @override
  String get title => 'Наслов';

  @override
  String get descriptionOptional => 'Опис (опционо)';

  @override
  String get microphonePermissionRequired => 'Потребна је дозвола за микрофон';

  @override
  String get aiAssistant => 'АИ Ассистант';

  @override
  String get listening => 'слушам...';

  @override
  String get typeAMessage => 'Унесите поруку...';

  @override
  String get aiChat => 'АИ Цхат';

  @override
  String get startAConversation => 'Започните разговор';

  @override
  String get typeYourMessage => 'Унесите своју поруку...';

  @override
  String get asrReconnecting => 'АСР се поново повезује...';

  @override
  String get write => 'Пишите';

  @override
  String get writeEntry => 'Врите Ентри';

  @override
  String get noMemoriesYet => 'Још нема успомена';

  @override
  String get tapPlusToCapture => 'Додирните + да бисте ухватили своје мисли';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Додирните + да бисте ухватили своје мисли';

  @override
  String get deleteMemory => 'Избриши меморију';

  @override
  String get deleteRecord => 'Избриши запис';

  @override
  String get thisEntryWillBeRemoved =>
      'Овај унос ће бити уклоњен са ваше временске линије.';

  @override
  String get thisRecordWillBeRemoved =>
      'Овај запис ће бити уклоњен са ваше временске линије.';

  @override
  String get searchYourRecords => 'Претражите своју евиденцију...';

  @override
  String get exactMatches => 'Тачна подударања';

  @override
  String get noExactMatches => 'Нема тачних подударања';

  @override
  String get exact => 'Тачно';

  @override
  String get exactMatch => 'Тачно подударање';

  @override
  String get fuzzyMatches => 'Фуззи Матцхес';

  @override
  String get noFuzzyMatches => 'Нема нејасних подударања';

  @override
  String get vectorMatch => 'Вецтор Матцх';

  @override
  String get networkMatches => 'Мрежни мечеви';

  @override
  String get noNetworkMatches => 'Нема подударања мреже';

  @override
  String get networkSearchIsOff =>
      'Претрага мреже је искључена. Омогућите га у подешавањима.';

  @override
  String get network => 'Мрежа';

  @override
  String get networkMatch => 'Нетворк Матцх';

  @override
  String get noSearchHistory => 'Нема историје претраге';

  @override
  String get searchHistory => 'Историја претраге';

  @override
  String get invalidLink => 'Неважећа веза';

  @override
  String get unableToOpenWebPage => 'Није могуће отворити веб страницу';

  @override
  String get imageMemory => '[Меморија слике]';

  @override
  String get tapToOpenWebPage => 'Додирните да отворите веб страницу';

  @override
  String get editEntry => 'Уреди унос';

  @override
  String get entryDetails => 'Детаљи о уласку';

  @override
  String get noContent => 'Нема садржаја';

  @override
  String get diaryNotFound => 'Дневник није пронађен';

  @override
  String get diaryNotFoundShort => 'Запис није пронађен';

  @override
  String get aiSummary => 'АИ Резиме';

  @override
  String get microphoneInterrupted =>
      'Микрофон је прекинут, снимање је заустављено.';

  @override
  String get bold => 'Болд';

  @override
  String get italic => 'Курзив';

  @override
  String get strikethrough => 'Прецртано';

  @override
  String get image => 'Слика';

  @override
  String get asrUnavailableRecordingActive =>
      'АСР недоступан. Снимање је и даље активно.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Напишите свој унос...';

  @override
  String get writeYourContent => 'Напишите свој садржај...';

  @override
  String microphoneStartFailed(String error) {
    return 'Покретање микрофона није успело: __ПХ_0__';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Микрофон је прекинут, снимање је заустављено.';

  @override
  String asrReconnectingError(String error) {
    return 'АСР се поново повезује: __ПХ_0__';
  }

  @override
  String imageInserted(String name) {
    return 'Слика је уметнута: __ПХ_0__';
  }

  @override
  String voiceError(String error) {
    return 'Гласовна грешка: __ПХ_0__';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Жао нам је, АИ услуга тренутно није доступна: __ПХ_0__';
  }

  @override
  String shareFailed(String error) {
    return 'Дељење није успело: __ПХ_0__';
  }

  @override
  String get shareSaving => 'Saving...';

  @override
  String get shareRenderingImage => 'Rendering share image...';

  @override
  String get shareRenderImageFailed => 'Failed to render share image';

  @override
  String get shareSavingToGallery => 'Saving to system gallery...';

  @override
  String get shareSavedToGallery => 'Saved successfully to gallery (Shiguang)';

  @override
  String get shareSavePermissionRequired =>
      'Save failed: allow Photos & Videos permission and retry';

  @override
  String get htmlVideo => 'Video';

  @override
  String get htmlAudio => 'Audio';

  @override
  String get htmlOpen => 'Open';

  @override
  String get htmlDetails => 'Details';

  @override
  String searchMatchHits(String matchType, int count) {
    return '__ПХ_0__ · __ПХ_1__ погодака';
  }

  @override
  String matchCount(int count) {
    return 'Подударање: __ПХ_0__';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Извор: __ПХ_0__';
  }

  @override
  String get createNew => 'Креирај';

  @override
  String micStartFailed(String error) {
    return 'Покретање микрофона није успело: __ПХ_0__';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Налози: +__ПХ_0__ / ажурирани __ПХ_1__';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Дневници: +__ПХ_0__ / ажурирано __ПХ_1__';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Подсетници: +__ПХ_0__ / ажурирано __ПХ_1__';
  }

  @override
  String importResultSkipped(int count) {
    return 'Прескочено: __ПХ_0__';
  }

  @override
  String importResultTotal(int count) {
    return 'Укупно промењено: __ПХ_0__';
  }

  @override
  String get settingsApplied => 'Подешавања у резервној копији су примењена.';

  @override
  String get settingsNotApplied =>
      'Подешавања у резервној копији нису примењена.';

  @override
  String backupExported(String path) {
    return 'Извезена резервна копија: __ПХ_0__';
  }

  @override
  String exportFailed(String error) {
    return 'Извоз није успео: __ПХ_0__';
  }

  @override
  String importFailed(String error) {
    return 'Увоз није успео: __ПХ_0__';
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

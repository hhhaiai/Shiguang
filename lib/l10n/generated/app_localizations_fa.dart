// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get languageName => 'فارسی';

  @override
  String get languageNameEn => 'Persian';

  @override
  String get appTitle => 'شیگوانگ';

  @override
  String get settings => 'تنظیمات';

  @override
  String get account => 'حساب';

  @override
  String get reminders => 'یادآوری‌ها';

  @override
  String get language => 'زبان';

  @override
  String get appLanguage => 'زبان برنامه';

  @override
  String get appearance => 'ظاهر';

  @override
  String get themeMode => 'حالت تم';

  @override
  String get dark => 'تاریک';

  @override
  String get light => 'روشن';

  @override
  String get system => 'سیستم';

  @override
  String get aiService => 'سرویس هوش مصنوعی';

  @override
  String get aiChatProvider => 'ارائه‌دهنده چت هوش مصنوعی';

  @override
  String get chatModel => 'مدل چت';

  @override
  String get localModel => 'مدل محلی';

  @override
  String get localModelDefault => 'مدل محلی (پیش‌فرض)';

  @override
  String get ollamaEndpoint => 'نقطه پایان Ollama';

  @override
  String get ollamaModel => 'مدل Ollama';

  @override
  String get openAiEndpoint => 'نقطه پایان OpenAI';

  @override
  String get openAiApiKey => 'کلید API OpenAI';

  @override
  String get openAiModel => 'مدل OpenAI';

  @override
  String get geminiEndpoint => 'نقطه پایان Gemini';

  @override
  String get geminiApiKey => 'کلید API Gemini';

  @override
  String get geminiModel => 'مدل Gemini';

  @override
  String get anthropicEndpoint => 'نقطه پایان Anthropic';

  @override
  String get anthropicApiKey => 'کلید API Anthropic';

  @override
  String get anthropicModel => 'مدل Anthropic';

  @override
  String get customProtocol => 'پروتکل سفارشی';

  @override
  String get protocol => 'پروتکل';

  @override
  String get customEndpoint => 'نقطه پایان سفارشی';

  @override
  String get customApiKey => 'کلید API سفارشی';

  @override
  String get customModel => 'مدل سفارشی';

  @override
  String get optionalForLocalServers => 'اختیاری برای سرورهای محلی/سفارشی';

  @override
  String get speechRecognitionEngine => 'موتور تشخیص گفتار';

  @override
  String get local => 'محلی';

  @override
  String get endpoint => 'نقطه پایان';

  @override
  String get localSpeechModel => 'مدل گفتار محلی';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (روی دستگاه)';

  @override
  String get systemSpeechRecognition => 'تشخیص گفتار سیستم';

  @override
  String get systemRecognitionAndroidIos => 'تشخیص سیستم (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'تشخیص نقطه پایان (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'از تشخیص‌دهنده داخلی Android / iOS استفاده کنید (ممکن است از cloud استفاده کند)';

  @override
  String get voiceAiEndpoint => 'نقطه پایان هوش مصنوعی صدا';

  @override
  String get embeddingModel => 'مدل تعبیه';

  @override
  String get crossDeviceSync => 'همگام‌سازی بین دستگاه‌ها';

  @override
  String get sendToOtherDevices => 'ارسال به دستگاه‌های دیگر (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'پشتیبان‌گیری و ارسال از طریق صفحه اشتراک‌گذاری';

  @override
  String get importFromLocalSend => 'Import از LocalSend';

  @override
  String get selectBackupJson => 'انتخاب JSON پشتیبان و ادغام داده‌های محلی';

  @override
  String get autoGeneration => 'تولید خودکار';

  @override
  String get autoGenerateSummary => 'خلاصه خودکار تولید کن';

  @override
  String get generateAiSummaryForNewEntries =>
      'خلاصه هوش مصنوعی برای ورودی‌های جدید تولید کن';

  @override
  String get autoGenerateEmbedding => 'تعبیه خودکار تولید کن';

  @override
  String get generateVectorEmbedding => 'تعبیه برداری برای جستجو تولید کن';

  @override
  String get enableNetworkSearch => 'جستجوی شبکه را فعال کن';

  @override
  String get allowOnlineRetrieval =>
      'بازیابی آنلاین برای جستجو و چت هوش مصنوعی مجاز کن (به طور پیش‌فرض خاموش)';

  @override
  String get about => 'درباره';

  @override
  String version(String version) {
    return 'نسخه $version';
  }

  @override
  String get database => 'پایگاه داده';

  @override
  String get objectBoxWithHnsw => 'ObjectBox با ایندکس HNSW';

  @override
  String get logOut => 'خروج';

  @override
  String get custom => 'سفارشی';

  @override
  String get openAiCompatible => 'سازگار با OpenAI';

  @override
  String get notSet => 'تنظیم نشده';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... یا http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'نقاط پایان محلی/LAN/عمومی را پشتیبانی می‌کند';

  @override
  String get shiguangLocalSendBackup => 'پشتیبان Shiguang LocalSend';

  @override
  String get localBackupFromShiguang =>
      'پشتیبان محلی از Shiguang (دریافت از طریق LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'فایل پشتیبان دریافتی از LocalSend را انتخاب کنید';

  @override
  String get failedToResolveFilePath => 'مسیر فایل انتخابی قابل حل نیست';

  @override
  String get importOptions => 'گزینه‌های Import';

  @override
  String get importSettingsAsWell =>
      'تنظیمات را هم Import کنید؟\n(کلیدهای API بازنویسی نمی‌شوند)';

  @override
  String get dataOnly => 'فقط داده';

  @override
  String get dataAndSettings => 'داده + تنظیمات';

  @override
  String get importCompleted => 'Import تکمیل شد';

  @override
  String get settingsInBackupWereApplied => 'تنظیمات پشتیبان اعمال شدند.';

  @override
  String get settingsInBackupWereNotApplied => 'تنظیمات پشتیبان اعمال نشدند.';

  @override
  String get ok => 'تأیید';

  @override
  String get cancel => 'لغو';

  @override
  String get save => 'ذخیره';

  @override
  String get delete => 'حذف';

  @override
  String get clear => 'پاک کردن';

  @override
  String get add => 'افزودن';

  @override
  String get create => 'ایجاد';

  @override
  String get edit => 'ویرایش';

  @override
  String get search => 'جستجو';

  @override
  String get areYouSureYouWantToLogOut => 'آیا واقعاً می‌خواهید خارج شوید؟';

  @override
  String get chooseLanguage => 'زبان را انتخاب کنید';

  @override
  String get databaseInfo => 'اطلاعات پایگاه داده';

  @override
  String get storage => 'حافظه: ObjectBox';

  @override
  String get vectorIndex => 'ایندکس برداری: HNSW';

  @override
  String get dimensions => 'ابعاد: 384';

  @override
  String get embeddingModelBge => 'مدل تعبیه: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'عکس بگیرید';

  @override
  String get chooseFromGallery => 'از گالری انتخاب کنید';

  @override
  String get editNickname => 'نام مستعار را ویرایش کنید';

  @override
  String get enterNickname => 'نام مستعار را وارد کنید';

  @override
  String get pleaseEnterNickname => 'لطفاً یک نام مستعار وارد کنید';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'نام مستعار از قبل وجود دارد یا نامعتبر است';

  @override
  String get user => 'کاربر';

  @override
  String get manageScheduledReminders =>
      'مدیریت یادآوری‌ها و آلارم‌های زمان‌بندی شده';

  @override
  String get imageFailedToLoad =>
      'تصویر بارگیری نشد. لطفاً دوباره انتخاب کنید.';

  @override
  String get imageIsStillLoading => 'تصویر هنوز در حال بارگیری است';

  @override
  String get imageAreaNotReady =>
      'ناحیه تصویر آماده نیست. لطفاً دوباره تلاش کنید.';

  @override
  String get cropFrameNotReady => 'قاب برش آماده نیست. لطفاً دوباره تلاش کنید.';

  @override
  String get invalidCropArea =>
      'ناحیه برش نامعتبر است. لطفاً دوباره تلاش کنید.';

  @override
  String get cropFailed => 'برش ناموفق بود. لطفاً دوباره تلاش کنید.';

  @override
  String get cropAvatar => 'آواتار را برش دهید';

  @override
  String get chooseAgain => 'دوباره انتخاب کنید';

  @override
  String get rotate90 => 'چرخش 90 درجه';

  @override
  String get dragFrameToMove =>
      'قاب را برای جابجایی بکشید، برای تغییر اندازه پایین-راست را بکشید؛ برای زوم و جابجایی تصویر پیچ کنید.';

  @override
  String get pleaseFillInAllFields => 'لطفاً همه فیلدها را پر کنید';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN باید حداقل 4 رقم باشد';

  @override
  String get pinAtLeast4Digits => 'PIN باید حداقل 4 رقم باشد';

  @override
  String get invalidUsernameOrPin => 'نام کاربری یا PIN نامعتبر';

  @override
  String get invalidUsernameOrPinError => 'نام کاربری یا PIN نامعتبر';

  @override
  String get usernameAlreadyExists => 'نام کاربری از قبل وجود دارد';

  @override
  String get captureMomentsKeepMemories =>
      'لحظات را ثبت کنید، خاطرات را نگه دارید';

  @override
  String get username => 'نام کاربری';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'ورود';

  @override
  String get createAccount => 'ایجاد حساب';

  @override
  String get dontHaveAccountCreateOne => 'حساب ندارید؟ یکی ایجاد کنید';

  @override
  String get alreadyHaveAccountLogin => 'از قبل حساب دارید؟ وارد شوید';

  @override
  String get pleaseEnterUsername => 'لطفاً نام کاربری را وارد کنید';

  @override
  String get pinsDoNotMatch => 'PIN ها مطابقت ندارند';

  @override
  String get tapToAddAvatar => 'برای افزودن آواتار ضربه بزنید';

  @override
  String get yourName => 'نام شما';

  @override
  String get privatePinOptional => 'PIN خصوصی (اختیاری)';

  @override
  String get usedToEncryptPrivateRecords =>
      'برای رمزگذاری سوابق خصوصی استفاده می‌شود';

  @override
  String get privatePin => 'PIN خصوصی';

  @override
  String get leaveEmptyForNoEncryption => 'برای بدون رمزگذاری خالی بگذارید';

  @override
  String get confirmPin => 'PIN را تأیید کنید';

  @override
  String get getStarted => 'شروع کنید';

  @override
  String get noReminders => 'بدون یادآوری';

  @override
  String get addReminder => 'یادآوری اضافه کنید';

  @override
  String get title => 'عنوان';

  @override
  String get descriptionOptional => 'توضیحات (اختیاری)';

  @override
  String get microphonePermissionRequired => 'مجوز میکروفون لازم است';

  @override
  String get aiAssistant => 'دستیار هوش مصنوعی';

  @override
  String get listening => 'در حال گوش دادن...';

  @override
  String get typeAMessage => 'پیام تایپ کنید...';

  @override
  String get aiChat => 'چت هوش مصنوعی';

  @override
  String get startAConversation => 'یک مکالمه شروع کنید';

  @override
  String get typeYourMessage => 'پیام خود را تایپ کنید...';

  @override
  String get asrReconnecting => 'ASR در حال اتصال مجدد...';

  @override
  String get write => 'نوشتن';

  @override
  String get writeEntry => 'ورودی بنویسید';

  @override
  String get noMemoriesYet => 'هنوز خاطره‌ای نیست';

  @override
  String get tapPlusToCapture => 'برای ثبت افکار خود + را بزنید';

  @override
  String get tapPlusToCaptureYourThoughts => 'برای ثبت افکار خود + را بزنید';

  @override
  String get deleteMemory => 'حذف خاطره';

  @override
  String get deleteRecord => 'حذف سابقه';

  @override
  String get thisEntryWillBeRemoved =>
      'این ورودی از جدول زمانی شما حذف می‌شود.';

  @override
  String get thisRecordWillBeRemoved =>
      'این سابقه از جدول زمانی شما حذف می‌شود.';

  @override
  String get searchYourRecords => 'سوابق خود را جستجو کنید...';

  @override
  String get exactMatches => 'تطابقات دقیق';

  @override
  String get noExactMatches => 'بدون تطابق دقیق';

  @override
  String get exact => 'دقیق';

  @override
  String get exactMatch => 'تطابق دقیق';

  @override
  String get fuzzyMatches => 'تطابقات تقریبی';

  @override
  String get noFuzzyMatches => 'بدون تطابق تقریبی';

  @override
  String get vectorMatch => 'تطابق برداری';

  @override
  String get networkMatches => 'تطابقات شبکه';

  @override
  String get noNetworkMatches => 'بدون تطابق شبکه';

  @override
  String get networkSearchIsOff =>
      'جستجوی شبکه خاموش است. در تنظیمات فعال کنید.';

  @override
  String get network => 'شبکه';

  @override
  String get networkMatch => 'تطابق شبکه';

  @override
  String get noSearchHistory => 'بدون تاریخچه جستجو';

  @override
  String get searchHistory => 'تاریخچه جستجو';

  @override
  String get invalidLink => 'لینک نامعتبر';

  @override
  String get unableToOpenWebPage => 'قادر به باز کردن صفحه وب نیست';

  @override
  String get imageMemory => '[خاطره تصویری]';

  @override
  String get tapToOpenWebPage => 'برای باز کردن صفحه وب ضربه بزنید';

  @override
  String get editEntry => 'ویرایش ورودی';

  @override
  String get entryDetails => 'جزئیات ورودی';

  @override
  String get noContent => 'بدون محتوا';

  @override
  String get diaryNotFound => 'دفترچه یافت نشد';

  @override
  String get diaryNotFoundShort => 'سابقه یافت نشد';

  @override
  String get aiSummary => 'خلاصه هوش مصنوعی';

  @override
  String get microphoneInterrupted => 'میکروفون قطع شد، ضبط متوقف شد.';

  @override
  String get bold => 'ضخیم';

  @override
  String get italic => 'کج';

  @override
  String get strikethrough => 'خط‌خورده';

  @override
  String get image => 'تصویر';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR در دسترس نیست. ضبط هنوز فعال است.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'ورودی خود را بنویسید...';

  @override
  String get writeYourContent => 'محتوای خود را بنویسید...';

  @override
  String microphoneStartFailed(String error) {
    return 'شروع میکروفون ناموفق بود: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'میکروفون قطع شد، ضبط متوقف شد.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR در حال اتصال مجدد: $error';
  }

  @override
  String imageInserted(String name) {
    return 'تصویر درج شد: $name';
  }

  @override
  String voiceError(String error) {
    return 'خطای صدا: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'متأسفانه سرویس هوش مصنوعی در حال حاضر در دسترس نیست: $error';
  }

  @override
  String shareFailed(String error) {
    return 'اشتراک‌گذاری ناموفق بود: $error';
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
    return '$matchType · $count نتیجه';
  }

  @override
  String matchCount(int count) {
    return 'تطابق: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'منبع: $source';
  }

  @override
  String get createNew => 'ایجاد';

  @override
  String micStartFailed(String error) {
    return 'شروع میکروفون ناموفق بود: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'حساب‌ها: +$created / به‌روز شده $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'دفترچه‌ها: +$created / به‌روز شده $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'یادآوری‌ها: +$created / به‌روز شده $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'رد شده: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'مجموع تغییرات: $count';
  }

  @override
  String get settingsApplied => 'تنظیمات پشتیبان اعمال شدند.';

  @override
  String get settingsNotApplied => 'تنظیمات پشتیبان اعمال نشدند.';

  @override
  String backupExported(String path) {
    return 'پشتیبان صادر شد: $path';
  }

  @override
  String exportFailed(String error) {
    return 'صادرات ناموفق بود: $error';
  }

  @override
  String importFailed(String error) {
    return 'Import ناموفق بود: $error';
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

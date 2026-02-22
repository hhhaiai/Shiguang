// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get languageName => 'العربية';

  @override
  String get languageNameEn => 'Arabic';

  @override
  String get appTitle => 'شيكوانغ';

  @override
  String get settings => 'الإعدادات';

  @override
  String get account => 'الحساب';

  @override
  String get reminders => 'التذكيرات';

  @override
  String get language => 'اللغة';

  @override
  String get appLanguage => 'لغة التطبيق';

  @override
  String get appearance => 'المظهر';

  @override
  String get themeMode => 'وضع السمة';

  @override
  String get dark => 'داكن';

  @override
  String get light => 'فاتح';

  @override
  String get system => 'النظام';

  @override
  String get aiService => 'خدمة الذكاء الاصطناعي';

  @override
  String get aiChatProvider => 'مزود دردشة الذكاء الاصطناعي';

  @override
  String get chatModel => 'نموذج الدردشة';

  @override
  String get localModel => 'النموذج المحلي';

  @override
  String get localModelDefault => 'النموذج المحلي (افتراضي)';

  @override
  String get ollamaEndpoint => 'نقطة نهاية Ollama';

  @override
  String get ollamaModel => 'نموذج Ollama';

  @override
  String get openAiEndpoint => 'نقطة نهاية OpenAI';

  @override
  String get openAiApiKey => 'مفتاح API الخاص بـ OpenAI';

  @override
  String get openAiModel => 'نموذج OpenAI';

  @override
  String get geminiEndpoint => 'نقطة نهاية Gemini';

  @override
  String get geminiApiKey => 'مفتاح API الخاص بـ Gemini';

  @override
  String get geminiModel => 'نموذج Gemini';

  @override
  String get anthropicEndpoint => 'نقطة نهاية Anthropic';

  @override
  String get anthropicApiKey => 'مفتاح API الخاص بـ Anthropic';

  @override
  String get anthropicModel => 'نموذج Anthropic';

  @override
  String get customProtocol => 'بروتوكول مخصص';

  @override
  String get protocol => 'البروتوكول';

  @override
  String get customEndpoint => 'نقطة نهاية مخصصة';

  @override
  String get customApiKey => 'مفتاح API مخصص';

  @override
  String get customModel => 'نموذج مخصص';

  @override
  String get optionalForLocalServers => 'اختياري للخوادم المحلية/المخصصة';

  @override
  String get speechRecognitionEngine => 'محرك التعرف على الكلام';

  @override
  String get local => 'محلي';

  @override
  String get endpoint => 'نقطة النهاية';

  @override
  String get localSpeechModel => 'نموذج الكلام المحلي';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (على الجهاز)';

  @override
  String get systemSpeechRecognition => 'التعرف على الكلام للنظام';

  @override
  String get systemRecognitionAndroidIos => 'التعرف على النظام (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'التعرف على نقطة النهاية (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'استخدام أداة التعرف المدمجة في Android / iOS (قد تستخدم السحابة)';

  @override
  String get voiceAiEndpoint => 'نقطة نهاية صوت الذكاء الاصطناعي';

  @override
  String get embeddingModel => 'نموذج التضمين';

  @override
  String get crossDeviceSync => 'مزامنة الأجهزة المتعددة';

  @override
  String get sendToOtherDevices => 'إرسال إلى أجهزة أخرى (LocalSend)';

  @override
  String get exportBackupAndSend => 'تصدير النسخة الاحتياطية وإرسالها';

  @override
  String get importFromLocalSend => 'استيراد من LocalSend';

  @override
  String get selectBackupJson => 'حدد ملف JSON الاحتياطي ودمج البيانات المحلية';

  @override
  String get autoGeneration => 'التوليد التلقائي';

  @override
  String get autoGenerateSummary => 'إنشاء ملخص تلقائي';

  @override
  String get generateAiSummaryForNewEntries =>
      'إنشاء ملخص ذكاء اصطناعي للإدخالات الجديدة';

  @override
  String get autoGenerateEmbedding => 'توليد تضمين تلقائي';

  @override
  String get generateVectorEmbedding => 'توليد تضمين متجهي للبحث';

  @override
  String get enableNetworkSearch => 'تفعيل البحث عبر الشبكة';

  @override
  String get allowOnlineRetrieval =>
      'السماح بالاسترداد عبر الإنترنت للبحث ودردشة الذكاء الاصطناعي (معطل افتراضياً)';

  @override
  String get about => 'حول';

  @override
  String version(String version) {
    return 'الإصدار $version';
  }

  @override
  String get database => 'قاعدة البيانات';

  @override
  String get objectBoxWithHnsw => 'ObjectBox مع فهرس HNSW';

  @override
  String get logOut => 'تسجيل الخروج';

  @override
  String get custom => 'مخصص';

  @override
  String get openAiCompatible => 'متوافق مع OpenAI';

  @override
  String get notSet => 'غير محدد';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... أو http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'يدعم نقاط النهاية المحلية/LAN/العامة';

  @override
  String get shiguangLocalSendBackup => 'نسخة Shiguang الاحتياطية من LocalSend';

  @override
  String get localBackupFromShiguang =>
      'نسخة احتياطية محلية من Shiguang (استلام عبر LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'حدد ملف النسخة الاحتياطية المستلم من LocalSend';

  @override
  String get failedToResolveFilePath => 'فشل في حل مسار الملف المحدد';

  @override
  String get importOptions => 'خيارات الاستيراد';

  @override
  String get importSettingsAsWell =>
      'استيراد الإعدادات أيضاً؟\n(لن يتم استبدال مفاتيح API)';

  @override
  String get dataOnly => 'البيانات فقط';

  @override
  String get dataAndSettings => 'البيانات + الإعدادات';

  @override
  String get importCompleted => 'اكتمل الاستيراد';

  @override
  String get settingsInBackupWereApplied =>
      'تم تطبيق الإعدادات في النسخة الاحتياطية.';

  @override
  String get settingsInBackupWereNotApplied =>
      'لم يتم تطبيق الإعدادات في النسخة الاحتياطية.';

  @override
  String get ok => 'موافق';

  @override
  String get cancel => 'إلغاء';

  @override
  String get save => 'حفظ';

  @override
  String get delete => 'حذف';

  @override
  String get clear => 'مسح';

  @override
  String get add => 'إضافة';

  @override
  String get create => 'إنشاء';

  @override
  String get edit => 'تعديل';

  @override
  String get search => 'بحث';

  @override
  String get areYouSureYouWantToLogOut => 'هل أنت متأكد أنك تريد تسجيل الخروج؟';

  @override
  String get chooseLanguage => 'اختر اللغة';

  @override
  String get databaseInfo => 'معلومات قاعدة البيانات';

  @override
  String get storage => 'التخزين: ObjectBox';

  @override
  String get vectorIndex => 'المتجه الفهرسي: HNSW';

  @override
  String get dimensions => 'الأبعاد: 384';

  @override
  String get embeddingModelBge => 'نموذج التضمين: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'التقط صورة';

  @override
  String get chooseFromGallery => 'اختر من المعرض';

  @override
  String get editNickname => 'تعديل اللقب';

  @override
  String get enterNickname => 'أدخل اللقب';

  @override
  String get pleaseEnterNickname => 'الرجاء إدخال لقب';

  @override
  String get nicknameAlreadyExistsOrInvalid => 'اللقب موجود بالفعل أو غير صالح';

  @override
  String get user => 'المستخدم';

  @override
  String get manageScheduledReminders => 'إدارة التذكيرات والتنبيهات المجدولة';

  @override
  String get imageFailedToLoad => 'فشل تحميل الصورة. يرجى الاختيار مرة أخرى.';

  @override
  String get imageIsStillLoading => 'الصورة لا تزال قيد التحميل';

  @override
  String get imageAreaNotReady =>
      'منطقة الصورة غير جاهزة. يرجى المحاولة مرة أخرى.';

  @override
  String get cropFrameNotReady => 'إطار القص غير جاهز. يرجى المحاولة مرة أخرى.';

  @override
  String get invalidCropArea => 'منطقة القص غير صالحة. يرجى المحاولة مرة أخرى.';

  @override
  String get cropFailed => 'فشل القص. يرجى المحاولة مرة أخرى.';

  @override
  String get cropAvatar => 'قص الصورة الرمزية';

  @override
  String get chooseAgain => 'اختر مرة أخرى';

  @override
  String get rotate90 => 'تدوير 90 درجة';

  @override
  String get dragFrameToMove =>
      'اسحب الإطار للتنقل، اسحب الزاوية السفلية اليمنى لتغيير الحجم; قرص للتكبير وتحريك الصورة.';

  @override
  String get pleaseFillInAllFields => 'يرجى ملء جميع الحقول';

  @override
  String get pinMustBeAtLeast4Digits => 'يجب أن يكون PIN على الأقل 4 أرقام';

  @override
  String get pinAtLeast4Digits => 'PIN يجب أن يكون 4 أرقام على الأقل';

  @override
  String get invalidUsernameOrPin => 'اسم مستخدم أو PIN غير صالح';

  @override
  String get invalidUsernameOrPinError => 'اسم مستخدم أو PIN غير صالح';

  @override
  String get usernameAlreadyExists => 'اسم المستخدم موجود بالفعل';

  @override
  String get captureMomentsKeepMemories => 'التقط اللحظات، واحتفظ بالذكريات';

  @override
  String get username => 'اسم المستخدم';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get dontHaveAccountCreateOne => 'ليس لديك حساب؟ أنشئ واحداً';

  @override
  String get alreadyHaveAccountLogin => 'لديك حساب بالفعل؟ تسجيل الدخول';

  @override
  String get pleaseEnterUsername => 'الرجاء إدخال اسم المستخدم';

  @override
  String get pinsDoNotMatch => 'PINs غير متطابقة';

  @override
  String get tapToAddAvatar => 'انقر لإضافة صورة رمزية';

  @override
  String get yourName => 'اسمك';

  @override
  String get privatePinOptional => 'PIN خاص (اختياري)';

  @override
  String get usedToEncryptPrivateRecords => 'يُستخدم لتشفير السجلات الخاصة';

  @override
  String get privatePin => 'PIN الخاص';

  @override
  String get leaveEmptyForNoEncryption => 'اتركه فارغاً بدون تشفير';

  @override
  String get confirmPin => 'تأكيد PIN';

  @override
  String get getStarted => 'ابدأ';

  @override
  String get noReminders => 'لا توجد تذكيرات';

  @override
  String get addReminder => 'إضافة تذكير';

  @override
  String get title => 'العنوان';

  @override
  String get descriptionOptional => 'الوصف (اختياري)';

  @override
  String get microphonePermissionRequired => 'مطلوب إذن الميكروفون';

  @override
  String get aiAssistant => 'مساعد الذكاء الاصطناعي';

  @override
  String get listening => 'جاري الاستماع...';

  @override
  String get typeAMessage => 'اكتب رسالة...';

  @override
  String get aiChat => 'دردشة الذكاء الاصطناعي';

  @override
  String get startAConversation => 'ابدأ محادثة';

  @override
  String get typeYourMessage => 'اكتب رسالتك...';

  @override
  String get asrReconnecting => 'إعادة اتصال ASR...';

  @override
  String get write => 'كتابة';

  @override
  String get writeEntry => 'كتابة إدخال';

  @override
  String get noMemoriesYet => 'لا توجد ذكريات بعد';

  @override
  String get tapPlusToCapture => 'انقر على + لت.capture أفكارك';

  @override
  String get tapPlusToCaptureYourThoughts => 'انقر على + لتسجيل أفكارك';

  @override
  String get deleteMemory => 'حذف ذكرى';

  @override
  String get deleteRecord => 'حذف سجل';

  @override
  String get thisEntryWillBeRemoved =>
      'سيتم إزالة هذا الإدخال من الجدول الزمني الخاص بك.';

  @override
  String get thisRecordWillBeRemoved =>
      'سيتم إزالة هذا السجل من الجدول الزمني الخاص بك.';

  @override
  String get searchYourRecords => 'ابحث في سجلاتك...';

  @override
  String get exactMatches => 'تطابقات تامة';

  @override
  String get noExactMatches => 'لا توجد تطابقات تامة';

  @override
  String get exact => 'تام';

  @override
  String get exactMatch => 'تطابق تام';

  @override
  String get fuzzyMatches => 'تطابقات تقريبية';

  @override
  String get noFuzzyMatches => 'لا توجد تطابقات تقريبية';

  @override
  String get vectorMatch => 'تطابق متجهي';

  @override
  String get networkMatches => 'تطابقات الشبكة';

  @override
  String get noNetworkMatches => 'لا توجد تطابقات الشبكة';

  @override
  String get networkSearchIsOff => 'بحث الشبكة معطل. فعّله في الإعدادات.';

  @override
  String get network => 'الشبكة';

  @override
  String get networkMatch => 'تطابق الشبكة';

  @override
  String get noSearchHistory => 'لا يوجد سجل بحث';

  @override
  String get searchHistory => 'سجل البحث';

  @override
  String get invalidLink => 'رابط غير صالح';

  @override
  String get unableToOpenWebPage => 'تعذر فتح صفحة الويب';

  @override
  String get imageMemory => '[ذكرى صورة]';

  @override
  String get tapToOpenWebPage => 'انقر لفتح صفحة الويب';

  @override
  String get editEntry => 'تعديل الإدخال';

  @override
  String get entryDetails => 'تفاصيل الإدخال';

  @override
  String get noContent => 'لا يوجد محتوى';

  @override
  String get diaryNotFound => 'لم يتم العثور على اليوميات';

  @override
  String get diaryNotFoundShort => 'لم يتم العثور على السجل';

  @override
  String get aiSummary => 'ملخص الذكاء الاصطناعي';

  @override
  String get microphoneInterrupted => 'انقطع الميكروفون، توقف التسجيل.';

  @override
  String get bold => 'عريض';

  @override
  String get italic => 'مائل';

  @override
  String get strikethrough => 'يتوسطه خط';

  @override
  String get image => 'صورة';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR غير متوفر. التسجيل لا يزال نشطاً.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'اكتب إدخالك...';

  @override
  String get writeYourContent => 'اكتب محتواك...';

  @override
  String microphoneStartFailed(String error) {
    return 'فشل في بدء الميكروفون: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'انقطع الميكروفون، توقف التسجيل.';

  @override
  String asrReconnectingError(String error) {
    return 'إعادة اتصال ASR: $error';
  }

  @override
  String imageInserted(String name) {
    return 'تم إدراج الصورة: $name';
  }

  @override
  String voiceError(String error) {
    return 'خطأ صوتي: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'عذراً، خدمة الذكاء الاصطناعي غير متوفرة حالياً: $error';
  }

  @override
  String shareFailed(String error) {
    return 'فشل المشاركة: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count نتيجة';
  }

  @override
  String matchCount(int count) {
    return 'التطابق: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'المصدر: $source';
  }

  @override
  String get createNew => 'إنشاء';

  @override
  String micStartFailed(String error) {
    return 'فشل في بدء الميكروفون: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'الحسابات: +$created / تم التحديث $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'اليومية: +$created / تم التحديث $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'التذكيرات: +$created / تم التحديث $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'تم التخطي: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'إجمالي التغييرات: $count';
  }

  @override
  String get settingsApplied => 'تم تطبيق الإعدادات في النسخة الاحتياطية.';

  @override
  String get settingsNotApplied =>
      'لم يتم تطبيق الإعدادات في النسخة الاحتياطية.';

  @override
  String backupExported(String path) {
    return 'تم تصدير النسخة الاحتياطية: $path';
  }

  @override
  String exportFailed(String error) {
    return 'فشل التصدير: $error';
  }

  @override
  String importFailed(String error) {
    return 'فشل الاستيراد: $error';
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

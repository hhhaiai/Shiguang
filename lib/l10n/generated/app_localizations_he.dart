// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get languageName => 'עברית';

  @override
  String get languageNameEn => 'Hebrew';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'הגדרות';

  @override
  String get account => 'חשבון';

  @override
  String get reminders => 'תזכורות';

  @override
  String get language => 'שפה';

  @override
  String get appLanguage => 'שפת האפליקציה';

  @override
  String get appearance => 'מראה';

  @override
  String get themeMode => 'מצב ערכת נושא';

  @override
  String get dark => 'כהה';

  @override
  String get light => 'בהיר';

  @override
  String get system => 'מערכת';

  @override
  String get aiService => 'שירות AI';

  @override
  String get aiChatProvider => 'ספק צ\'אט AI';

  @override
  String get chatModel => 'מודל צ\'אט';

  @override
  String get localModel => 'מודל מקומי';

  @override
  String get localModelDefault => 'מודל מקומי (ברירת מחדל)';

  @override
  String get ollamaEndpoint => 'נקודת קצה Ollama';

  @override
  String get ollamaModel => 'מודל Ollama';

  @override
  String get openAiEndpoint => 'נקודת קצה OpenAI';

  @override
  String get openAiApiKey => 'מפתח API OpenAI';

  @override
  String get openAiModel => 'מודל OpenAI';

  @override
  String get geminiEndpoint => 'נקודת קצה Gemini';

  @override
  String get geminiApiKey => 'מפתח API Gemini';

  @override
  String get geminiModel => 'מודל Gemini';

  @override
  String get anthropicEndpoint => 'נקודת קצה Anthropic';

  @override
  String get anthropicApiKey => 'מפתח API Anthropic';

  @override
  String get anthropicModel => 'מודל Anthropic';

  @override
  String get customProtocol => 'פרוטוקול מותאם';

  @override
  String get protocol => 'פרוטוקול';

  @override
  String get customEndpoint => 'נקודת קצה מותאמת';

  @override
  String get customApiKey => 'מפתח API מותאם';

  @override
  String get customModel => 'מודל מותאם';

  @override
  String get optionalForLocalServers => 'אופציונלי עבור שרתים מקומיים/מותאמים';

  @override
  String get speechRecognitionEngine => 'מנוע זיהוי דיבור';

  @override
  String get local => 'מקומי';

  @override
  String get endpoint => 'נקודת קצה';

  @override
  String get localSpeechModel => 'מודל דיבור מקומי';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (במכשיר)';

  @override
  String get systemSpeechRecognition => 'זיהוי דיבור של המערכת';

  @override
  String get systemRecognitionAndroidIos => 'זיהוי מערכת (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'זיהוי נקודת קצה (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'השתמש בזיהוי המובנה של Android/iOS (עשוי להשתמש בענן)';

  @override
  String get voiceAiEndpoint => 'נקודת קצה Voice AI';

  @override
  String get embeddingModel => 'מודל Embedding';

  @override
  String get crossDeviceSync => 'סנכרון בין מכשירים';

  @override
  String get sendToOtherDevices => 'שלח למכשירים אחרים (LocalSend)';

  @override
  String get exportBackupAndSend => 'ייצא גיבוי ושלח דרך שיתוף';

  @override
  String get importFromLocalSend => 'ייבא מ-LocalSend';

  @override
  String get selectBackupJson => 'בחר גיבוי JSON ומזג נתונים מקומיים';

  @override
  String get autoGeneration => 'יצירה אוטומטית';

  @override
  String get autoGenerateSummary => 'צור סיכום אוטומטי';

  @override
  String get generateAiSummaryForNewEntries => 'צור סיכום AI עבור ערכים חדשים';

  @override
  String get autoGenerateEmbedding => 'צור Embedding אוטומטי';

  @override
  String get generateVectorEmbedding => 'צור הטמעה וקטורית לחיפוש';

  @override
  String get enableNetworkSearch => 'אפשר חיפוש ברשת';

  @override
  String get allowOnlineRetrieval =>
      'אפשר שליפה מקוונת לחיפוש וצ\'אט AI (כבוי כברירת מחדל)';

  @override
  String get about => 'אודות';

  @override
  String version(String version) {
    return 'גרסה $version';
  }

  @override
  String get database => 'מסד נתונים';

  @override
  String get objectBoxWithHnsw => 'ObjectBox עם אינדקס HNSW';

  @override
  String get logOut => 'התנתק';

  @override
  String get custom => 'מותאם';

  @override
  String get openAiCompatible => 'תואם OpenAI';

  @override
  String get notSet => 'לא הוגדר';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... או http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'תומך בנקודות קצה מקומיות/LAN/ציבוריות';

  @override
  String get shiguangLocalSendBackup => 'גיבוי LocalSend של Shiguang';

  @override
  String get localBackupFromShiguang =>
      'גיבוי מקומי מ-Shiguang (קבל דרך LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'בחר קובץ גיבוי שהתקבל מ-LocalSend';

  @override
  String get failedToResolveFilePath => 'נכשל בפתרון נתיב הקובץ שנבחר';

  @override
  String get importOptions => 'אפשרויות ייבוא';

  @override
  String get importSettingsAsWell => 'לייבא גם הגדרות?\n(מפתחות API לא יידרסו)';

  @override
  String get dataOnly => 'נתונים בלבד';

  @override
  String get dataAndSettings => 'נתונים + הגדרות';

  @override
  String get importCompleted => 'הייבוא הושלם';

  @override
  String get settingsInBackupWereApplied => 'ההגדרות מהגיבוי הוחלו.';

  @override
  String get settingsInBackupWereNotApplied => 'ההגדרות מהגיבוי לא הוחלו.';

  @override
  String get ok => 'אישור';

  @override
  String get cancel => 'ביטול';

  @override
  String get save => 'שמור';

  @override
  String get delete => 'מחק';

  @override
  String get clear => 'נקה';

  @override
  String get add => 'הוסף';

  @override
  String get create => 'צור';

  @override
  String get edit => 'ערוך';

  @override
  String get search => 'חפש';

  @override
  String get areYouSureYouWantToLogOut => 'האם אתה בטוח שאתה רוצה להתנתק?';

  @override
  String get chooseLanguage => 'בחר שפה';

  @override
  String get databaseInfo => 'מידע על מסד הנתונים';

  @override
  String get storage => 'אחסון: ObjectBox';

  @override
  String get vectorIndex => 'אינדקס וקטורי: HNSW';

  @override
  String get dimensions => 'ממדים: 384';

  @override
  String get embeddingModelBge => 'מודל Embedding: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'צלם תמונה';

  @override
  String get chooseFromGallery => 'בחר מהגלריה';

  @override
  String get editNickname => 'ערוך כינוי';

  @override
  String get enterNickname => 'הזן כינוי';

  @override
  String get pleaseEnterNickname => 'אנא הזן כינוי';

  @override
  String get nicknameAlreadyExistsOrInvalid => 'הכינוי כבר קיים או לא תקין';

  @override
  String get user => 'משתמש';

  @override
  String get manageScheduledReminders => 'נהל תזכורות ושעונים מתוכננים';

  @override
  String get imageFailedToLoad => 'התמונה נכשלה בטעינה. אנא בחר שוב.';

  @override
  String get imageIsStillLoading => 'התמונה עדיין נטענת';

  @override
  String get imageAreaNotReady => 'אזור התמונה לא מוכן. אנא נסה שוב.';

  @override
  String get cropFrameNotReady => 'מסגרת החיתוך לא מוכנה. אנא נסה שוב.';

  @override
  String get invalidCropArea => 'אזור חיתוך לא תקין. אנא נסה שוב.';

  @override
  String get cropFailed => 'החיתוך נכשל. אנא נסה שוב.';

  @override
  String get cropAvatar => 'חתוך תמונת פרופיל';

  @override
  String get chooseAgain => 'בחר שוב';

  @override
  String get rotate90 => 'סובב 90 מעלות';

  @override
  String get dragFrameToMove =>
      'גרור את המסגרת להזזה, גרור את הפינה הימנית התחתונה לשינוי גודל; צביטה להתמקדות והזזת התמונה.';

  @override
  String get pleaseFillInAllFields => 'אנא מלא את כל השדות';

  @override
  String get pinMustBeAtLeast4Digits => 'ה-PIN חייב להכיל לפחות 4 ספרות';

  @override
  String get pinAtLeast4Digits => 'ה-PIN חייב להכיל לפחות 4 ספרות';

  @override
  String get invalidUsernameOrPin => 'שם משתמש או PIN לא תקין';

  @override
  String get invalidUsernameOrPinError => 'שם משתמש או PIN לא תקין';

  @override
  String get usernameAlreadyExists => 'שם המשתמש כבר קיים';

  @override
  String get captureMomentsKeepMemories => 'לכדו רגעים, שמרו זיכרונות';

  @override
  String get username => 'שם משתמש';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'התחברות';

  @override
  String get createAccount => 'צור חשבון';

  @override
  String get dontHaveAccountCreateOne => 'אין לך חשבון? צור אחד';

  @override
  String get alreadyHaveAccountLogin => 'יש לך כבר חשבון? התחבר';

  @override
  String get pleaseEnterUsername => 'אנא הזן שם משתמש';

  @override
  String get pinsDoNotMatch => 'ה-PINים לא תואמים';

  @override
  String get tapToAddAvatar => 'הקש כדי להוסיף תמונת פרופיל';

  @override
  String get yourName => 'השם שלך';

  @override
  String get privatePinOptional => 'PIN פרטי (אופציונלי)';

  @override
  String get usedToEncryptPrivateRecords => 'משמש להצפנת רשומות פרטיות';

  @override
  String get privatePin => 'PIN פרטי';

  @override
  String get leaveEmptyForNoEncryption => 'השאר ריק עבור ללא הצפנה';

  @override
  String get confirmPin => 'אשר PIN';

  @override
  String get getStarted => 'התחל';

  @override
  String get noReminders => 'אין תזכורות';

  @override
  String get addReminder => 'הוסף תזכורת';

  @override
  String get title => 'כותרת';

  @override
  String get descriptionOptional => 'תיאור (אופציונלי)';

  @override
  String get microphonePermissionRequired => 'נדרשת הרשאת מיקרופון';

  @override
  String get aiAssistant => 'עוזר AI';

  @override
  String get listening => 'מקשיב...';

  @override
  String get typeAMessage => 'הקלד הודעה...';

  @override
  String get aiChat => 'צ\'אט AI';

  @override
  String get startAConversation => 'התחל שיחה';

  @override
  String get typeYourMessage => 'הקלד את ההודעה שלך...';

  @override
  String get asrReconnecting => 'ASR מתחבר מחדש...';

  @override
  String get write => 'כתוב';

  @override
  String get writeEntry => 'כתוב ערך';

  @override
  String get noMemoriesYet => 'אין עדיין זיכרונות';

  @override
  String get tapPlusToCapture => 'הקש על + כדי ללכוד את המחשבות שלך';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'הקש על + כדי ללכוד את המחשבות שלך';

  @override
  String get deleteMemory => 'מחק זיכרון';

  @override
  String get deleteRecord => 'מחק רשומה';

  @override
  String get thisEntryWillBeRemoved => 'ערך זה יוסר מציר הזמן שלך.';

  @override
  String get thisRecordWillBeRemoved => 'רשומה זו תוסר מציר הזמן שלך.';

  @override
  String get searchYourRecords => 'חפש ברשומות שלך...';

  @override
  String get exactMatches => 'התאמות מדויקות';

  @override
  String get noExactMatches => 'אין התאמות מדויקות';

  @override
  String get exact => 'מדויק';

  @override
  String get exactMatch => 'התאמה מדויקת';

  @override
  String get fuzzyMatches => 'התאמות מקורבות';

  @override
  String get noFuzzyMatches => 'אין התאמות מקורבות';

  @override
  String get vectorMatch => 'התאמה וקטורית';

  @override
  String get networkMatches => 'התאמות רשת';

  @override
  String get noNetworkMatches => 'אין התאמות רשת';

  @override
  String get networkSearchIsOff => 'חיפוש ברשת כבוי. הפעל אותו בהגדרות.';

  @override
  String get network => 'רשת';

  @override
  String get networkMatch => 'התאמת רשת';

  @override
  String get noSearchHistory => 'אין היסטוריית חיפוש';

  @override
  String get searchHistory => 'היסטוריית חיפוש';

  @override
  String get invalidLink => 'קישור לא תקין';

  @override
  String get unableToOpenWebPage => 'לא ניתן לפתוח דף אינטרנט';

  @override
  String get imageMemory => '[זיכרון תמונה]';

  @override
  String get tapToOpenWebPage => 'הקש כדי לפתוח דף אינטרנט';

  @override
  String get editEntry => 'ערוך ערך';

  @override
  String get entryDetails => 'פרטי ערך';

  @override
  String get noContent => 'אין תוכן';

  @override
  String get diaryNotFound => 'יומן לא נמצא';

  @override
  String get diaryNotFoundShort => 'רשומה לא נמצאה';

  @override
  String get aiSummary => 'סיכום AI';

  @override
  String get microphoneInterrupted => 'המיקרופון נקטע, ההקלטה נעצרה.';

  @override
  String get bold => 'מודגש';

  @override
  String get italic => 'נטוי';

  @override
  String get strikethrough => 'קו חוצה';

  @override
  String get image => 'תמונה';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR לא זמין. ההקלטה עדיין פעילה.';

  @override
  String get writeYourEntry => 'כתוב את הערך שלך...';

  @override
  String get writeYourContent => 'כתוב את התוכן שלך...';

  @override
  String microphoneStartFailed(String error) {
    return 'נכשל בהפעלת המיקרופון: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'המיקרופון נקטע, ההקלטה נעצרה.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR מתחבר מחדש: $error';
  }

  @override
  String imageInserted(String name) {
    return 'תמונה הוכנסה: $name';
  }

  @override
  String voiceError(String error) {
    return 'שגיאת קול: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'מצטערים, שירות AI אינו זמין כרגע: $error';
  }

  @override
  String shareFailed(String error) {
    return 'נכשל בשיתוף: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType - $count תוצאות';
  }

  @override
  String matchCount(int count) {
    return 'התאמה: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'מקור: $source';
  }

  @override
  String get createNew => 'צור';

  @override
  String micStartFailed(String error) {
    return 'נכשל בהפעלת המיקרופון: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'חשבונות: +$created / עודכנו $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'יומנים: +$created / עודכנו $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'תזכורות: +$created / עודכנו $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'דולגו: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'סה\"כ שונה: $count';
  }

  @override
  String get settingsApplied => 'ההגדרות מהגיבוי הוחלו.';

  @override
  String get settingsNotApplied => 'ההגדרות מהגיבוי לא הוחלו.';

  @override
  String backupExported(String path) {
    return 'הגיבוי יוצא: $path';
  }

  @override
  String exportFailed(String error) {
    return 'הייצוא נכשל: $error';
  }

  @override
  String importFailed(String error) {
    return 'הייבוא נכשל: $error';
  }
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Georgian (`ka`).
class AppLocalizationsKa extends AppLocalizations {
  AppLocalizationsKa([String locale = 'ka']) : super(locale);

  @override
  String get languageName => 'ქართული';

  @override
  String get languageNameEn => 'Georgian';

  @override
  String get appTitle => 'შიგუანგი';

  @override
  String get settings => 'პარამეტრები';

  @override
  String get account => 'ანგარიში';

  @override
  String get reminders => 'შეხსენებები';

  @override
  String get language => 'ენა';

  @override
  String get appLanguage => 'აპლიკაციის ენა';

  @override
  String get appearance => 'გარეგნობა';

  @override
  String get themeMode => 'თემის რეჟიმი';

  @override
  String get dark => 'ბნელი';

  @override
  String get light => 'სინათლე';

  @override
  String get system => 'სისტემა';

  @override
  String get aiService => 'AI სერვისი';

  @override
  String get aiChatProvider => 'AI ჩატის პროვაიდერი';

  @override
  String get chatModel => 'ჩატის მოდელი';

  @override
  String get localModel => 'ლოკალური მოდელი';

  @override
  String get localModelDefault => 'ადგილობრივი მოდელი (ნაგულისხმევი)';

  @override
  String get ollamaEndpoint => 'ოლამა ბოლო წერტილი';

  @override
  String get ollamaModel => 'ოლამა მოდელი';

  @override
  String get openAiEndpoint => 'OpenAI საბოლოო წერტილი';

  @override
  String get openAiApiKey => 'OpenAI API გასაღები';

  @override
  String get openAiModel => 'OpenAI მოდელი';

  @override
  String get geminiEndpoint => 'ტყუპების ბოლო წერტილი';

  @override
  String get geminiApiKey => 'Gemini API გასაღები';

  @override
  String get geminiModel => 'ტყუპების მოდელები';

  @override
  String get anthropicEndpoint => 'ანთროპიული საბოლოო წერტილი';

  @override
  String get anthropicApiKey => 'Anthropic API გასაღები';

  @override
  String get anthropicModel => 'ანთროპიული მოდელი';

  @override
  String get customProtocol => 'მორგებული პროტოკოლი';

  @override
  String get protocol => 'პროტოკოლი';

  @override
  String get customEndpoint => 'მორგებული საბოლოო წერტილი';

  @override
  String get customApiKey => 'მორგებული API გასაღები';

  @override
  String get customModel => 'მორგებული მოდელი';

  @override
  String get optionalForLocalServers =>
      'არჩევითი ლოკალური/საბაჟო სერვერებისთვის';

  @override
  String get speechRecognitionEngine => 'მეტყველების ამოცნობის ძრავა';

  @override
  String get local => 'ადგილობრივი';

  @override
  String get endpoint => 'ბოლო წერტილი';

  @override
  String get localSpeechModel => 'ლოკალური მეტყველების მოდელი';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (მოწყობილობაზე)';

  @override
  String get systemSpeechRecognition => 'სისტემური მეტყველების ამოცნობა';

  @override
  String get systemRecognitionAndroidIos => 'სისტემის ამოცნობა (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'ბოლო წერტილის ამოცნობა (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'გამოიყენეთ ჩაშენებული Android / iOS ამომცნობი (შეიძლება გამოიყენოთ ღრუბელი)';

  @override
  String get voiceAiEndpoint => 'ხმის AI ბოლო წერტილი';

  @override
  String get embeddingModel => 'ჩანერგვის მოდელი';

  @override
  String get crossDeviceSync => 'მოწყობილობებს შორის სინქრონიზაცია';

  @override
  String get sendToOtherDevices => 'სხვა მოწყობილობებზე გაგზავნა (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'სარეზერვო ასლის ექსპორტი და გაგზავნა გაზიარების ფურცლის მეშვეობით';

  @override
  String get importFromLocalSend => 'იმპორტი LocalSend-დან';

  @override
  String get selectBackupJson =>
      'აირჩიეთ სარეზერვო JSON და შეაერთეთ ადგილობრივი მონაცემები';

  @override
  String get autoGeneration => 'ავტო თაობა';

  @override
  String get autoGenerateSummary => 'ავტო გენერირება შეჯამება';

  @override
  String get generateAiSummaryForNewEntries =>
      'შექმენით AI რეზიუმე ახალი ჩანაწერებისთვის';

  @override
  String get autoGenerateEmbedding => 'ჩაშენების ავტომატური გენერირება';

  @override
  String get generateVectorEmbedding => 'შექმენით ვექტორული ჩაშენება საძიებლად';

  @override
  String get enableNetworkSearch => 'ჩართეთ ქსელის ძებნა';

  @override
  String get allowOnlineRetrieval =>
      'ძიების და AI ჩეთისთვის ონლაინ მოძიების დაშვება (ნაგულისხმევად გამორთულია)';

  @override
  String get about => 'შესახებ';

  @override
  String version(String version) {
    return 'ვერსია $version';
  }

  @override
  String get database => 'მონაცემთა ბაზა';

  @override
  String get objectBoxWithHnsw => 'ObjectBox HNSW ინდექსით';

  @override
  String get logOut => 'გასვლა';

  @override
  String get custom => 'საბაჟო';

  @override
  String get openAiCompatible => 'OpenAI თავსებადი';

  @override
  String get notSet => 'არ არის დაყენებული';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'მხარს უჭერს ლოკალურ/LAN/საჯარო ბოლო წერტილებს';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend სარეზერვო';

  @override
  String get localBackupFromShiguang =>
      'ადგილობრივი სარეზერვო ასლი Shiguang-ისგან (მიიღეთ LocalSend-ის საშუალებით)';

  @override
  String get selectBackupFileFromLocalSend =>
      'აირჩიეთ LocalSend-დან მიღებული სარეზერვო ფაილი';

  @override
  String get failedToResolveFilePath =>
      'ფაილის არჩეული გზის გადაჭრა ვერ მოხერხდა';

  @override
  String get importOptions => 'იმპორტის პარამეტრები';

  @override
  String get importSettingsAsWell =>
      'პარამეტრების იმპორტიც?\n(API კლავიშები არ გადაიწერება)';

  @override
  String get dataOnly => 'მხოლოდ მონაცემები';

  @override
  String get dataAndSettings => 'მონაცემები + პარამეტრები';

  @override
  String get importCompleted => 'იმპორტი დასრულდა';

  @override
  String get settingsInBackupWereApplied =>
      'გამოყენებული იქნა სარეზერვო ასლის პარამეტრები.';

  @override
  String get settingsInBackupWereNotApplied =>
      'სარეზერვო ასლის პარამეტრები არ იყო გამოყენებული.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'გაუქმება';

  @override
  String get save => 'შენახვა';

  @override
  String get delete => 'წაშლა';

  @override
  String get clear => 'წმინდა';

  @override
  String get add => 'დამატება';

  @override
  String get create => 'შექმნა';

  @override
  String get edit => 'რედაქტირება';

  @override
  String get search => 'ძიება';

  @override
  String get areYouSureYouWantToLogOut =>
      'დარწმუნებული ხართ, რომ გსურთ გამოსვლა?';

  @override
  String get chooseLanguage => 'აირჩიეთ ენა';

  @override
  String get databaseInfo => 'მონაცემთა ბაზის ინფორმაცია';

  @override
  String get storage => 'შენახვა: ObjectBox';

  @override
  String get vectorIndex => 'ვექტორული ინდექსი: HNSW';

  @override
  String get dimensions => 'ზომები: 384';

  @override
  String get embeddingModelBge => 'ჩაშენების მოდელი: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'ფოტოს გადაღება';

  @override
  String get chooseFromGallery => 'აირჩიეთ გალერეიდან';

  @override
  String get editNickname => 'მეტსახელის რედაქტირება';

  @override
  String get enterNickname => 'შეიყვანეთ მეტსახელი';

  @override
  String get pleaseEnterNickname => 'გთხოვთ, შეიყვანოთ მეტსახელი';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'მეტსახელი უკვე არსებობს ან არასწორია';

  @override
  String get user => 'მომხმარებელი';

  @override
  String get manageScheduledReminders =>
      'მართეთ დაგეგმილი შეხსენებები და სიგნალიზაცია';

  @override
  String get imageFailedToLoad =>
      'სურათი ვერ ჩაიტვირთა. გთხოვთ ხელახლა აირჩიოთ.';

  @override
  String get imageIsStillLoading => 'სურათი კვლავ იტვირთება';

  @override
  String get imageAreaNotReady =>
      'სურათის არე არ არის მზად. გთხოვთ, სცადოთ ხელახლა.';

  @override
  String get cropFrameNotReady =>
      'ჩამოჭრის ჩარჩო მზად არ არის. გთხოვთ, სცადოთ ხელახლა.';

  @override
  String get invalidCropArea =>
      'მოსავლის არეალი არასწორია. გთხოვთ, სცადოთ ხელახლა.';

  @override
  String get cropFailed => 'ჩამოჭრა ვერ მოხერხდა. გთხოვთ, სცადოთ ხელახლა.';

  @override
  String get cropAvatar => 'ამოჭრა ავატარი';

  @override
  String get chooseAgain => 'აირჩიეთ ისევ';

  @override
  String get rotate90 => 'შეტრიალეთ 90°';

  @override
  String get dragFrameToMove =>
      'გადაიტანეთ ჩარჩო გადასაადგილებლად, გადაათრიეთ ქვედა მარჯვნივ ზომის შესაცვლელად; დააჭირეთ სურათის გასადიდებლად და გადასატანად.';

  @override
  String get pleaseFillInAllFields => 'გთხოვთ შეავსოთ ყველა ველი';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN უნდა იყოს მინიმუმ 4 ციფრი';

  @override
  String get pinAtLeast4Digits => 'PIN უნდა იყოს მინიმუმ 4 ციფრი';

  @override
  String get invalidUsernameOrPin => 'არასწორი მომხმარებლის სახელი ან PIN';

  @override
  String get invalidUsernameOrPinError =>
      'მომხმარებლის სახელი ან PIN არასწორია';

  @override
  String get usernameAlreadyExists => 'მომხმარებლის სახელი უკვე არსებობს';

  @override
  String get captureMomentsKeepMemories =>
      'აღბეჭდეთ მომენტები, შეინახეთ მოგონებები';

  @override
  String get username => 'მომხმარებლის სახელი';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'შესვლა';

  @override
  String get createAccount => 'ანგარიშის შექმნა';

  @override
  String get dontHaveAccountCreateOne => 'არ გაქვთ ანგარიში? შექმენით ერთი';

  @override
  String get alreadyHaveAccountLogin => 'უკვე გაქვთ ანგარიში? შესვლა';

  @override
  String get pleaseEnterUsername => 'გთხოვთ შეიყვანოთ მომხმარებლის სახელი';

  @override
  String get pinsDoNotMatch => 'PIN-ები არ ემთხვევა';

  @override
  String get tapToAddAvatar => 'შეეხეთ ავატარის დასამატებლად';

  @override
  String get yourName => 'შენი სახელი';

  @override
  String get privatePinOptional => 'პირადი PIN (არასავალდებულო)';

  @override
  String get usedToEncryptPrivateRecords =>
      'გამოიყენება პირადი ჩანაწერების დაშიფვრისთვის';

  @override
  String get privatePin => 'პირადი PIN';

  @override
  String get leaveEmptyForNoEncryption => 'დატოვეთ ცარიელი დაშიფვრის გარეშე';

  @override
  String get confirmPin => 'დაადასტურეთ PIN';

  @override
  String get getStarted => 'დაიწყეთ';

  @override
  String get noReminders => 'არანაირი შეხსენება';

  @override
  String get addReminder => 'შეხსენების დამატება';

  @override
  String get title => 'სათაური';

  @override
  String get descriptionOptional => 'აღწერა (სურვილისამებრ)';

  @override
  String get microphonePermissionRequired => 'საჭიროა მიკროფონის ნებართვა';

  @override
  String get aiAssistant => 'AI ასისტენტი';

  @override
  String get listening => 'მოსმენა...';

  @override
  String get typeAMessage => 'ჩაწერეთ შეტყობინება...';

  @override
  String get aiChat => 'AI ჩატი';

  @override
  String get startAConversation => 'დაიწყეთ საუბარი';

  @override
  String get typeYourMessage => 'ჩაწერეთ თქვენი შეტყობინება...';

  @override
  String get asrReconnecting => 'ASR ხელახლა დაკავშირება...';

  @override
  String get write => 'დაწერე';

  @override
  String get writeEntry => 'ჩაწერეთ ჩანაწერი';

  @override
  String get noMemoriesYet => 'ჯერ არ არის მოგონებები';

  @override
  String get tapPlusToCapture => 'შეეხეთ + თქვენი აზრების დასაფიქსირებლად';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'შეეხეთ + თქვენი აზრების დასაფიქსირებლად';

  @override
  String get deleteMemory => 'მეხსიერების წაშლა';

  @override
  String get deleteRecord => 'ჩანაწერის წაშლა';

  @override
  String get thisEntryWillBeRemoved =>
      'ეს ჩანაწერი წაიშლება თქვენი დროის ხაზიდან.';

  @override
  String get thisRecordWillBeRemoved =>
      'ეს ჩანაწერი წაიშლება თქვენი დროის ხაზიდან.';

  @override
  String get searchYourRecords => 'მოძებნეთ თქვენი ჩანაწერები...';

  @override
  String get exactMatches => 'ზუსტი მატჩები';

  @override
  String get noExactMatches => 'ზუსტი შესატყვისები არ არის';

  @override
  String get exact => 'ზუსტი';

  @override
  String get exactMatch => 'ზუსტი მატჩი';

  @override
  String get fuzzyMatches => 'ბუნდოვანი მატჩები';

  @override
  String get noFuzzyMatches => 'არ არის ბუნდოვანი მატჩები';

  @override
  String get vectorMatch => 'ვექტორული მატჩი';

  @override
  String get networkMatches => 'ქსელის მატჩები';

  @override
  String get noNetworkMatches => 'ქსელის შესატყვისი არ არის';

  @override
  String get networkSearchIsOff =>
      'ქსელის ძებნა გამორთულია. ჩართეთ ის პარამეტრებში.';

  @override
  String get network => 'ქსელი';

  @override
  String get networkMatch => 'ქსელის მატჩი';

  @override
  String get noSearchHistory => 'ძიების ისტორია არ არის';

  @override
  String get searchHistory => 'ძიების ისტორია';

  @override
  String get invalidLink => 'არასწორი ბმული';

  @override
  String get unableToOpenWebPage => 'ვებგვერდის გახსნა ვერ ხერხდება';

  @override
  String get imageMemory => '[გამოსახულების მეხსიერება]';

  @override
  String get tapToOpenWebPage => 'შეეხეთ ვებ გვერდის გასახსნელად';

  @override
  String get editEntry => 'ჩანაწერის რედაქტირება';

  @override
  String get entryDetails => 'შესვლის დეტალები';

  @override
  String get noContent => 'არანაირი შინაარსი';

  @override
  String get diaryNotFound => 'დღიური ვერ მოიძებნა';

  @override
  String get diaryNotFoundShort => 'ჩანაწერი ვერ მოიძებნა';

  @override
  String get aiSummary => 'AI რეზიუმე';

  @override
  String get microphoneInterrupted => 'მიკროფონი გაითიშა, ჩაწერა შეწყდა.';

  @override
  String get bold => 'თამამი';

  @override
  String get italic => 'დახრილი';

  @override
  String get strikethrough => 'დარტყმა';

  @override
  String get image => 'გამოსახულება';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR მიუწვდომელია. ჩაწერა ჯერ კიდევ აქტიურია.';

  @override
  String get writeYourEntry => 'დაწერეთ თქვენი ჩანაწერი...';

  @override
  String get writeYourContent => 'დაწერეთ თქვენი შინაარსი...';

  @override
  String microphoneStartFailed(String error) {
    return 'მიკროფონის გაშვება ვერ მოხერხდა: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'მიკროფონი გაითიშა, ჩაწერა შეწყდა.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR ხელახლა დაკავშირება: $error';
  }

  @override
  String imageInserted(String name) {
    return 'ჩასმულია სურათი: $name';
  }

  @override
  String voiceError(String error) {
    return 'ხმის შეცდომა: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'უკაცრავად, AI სერვისი ამჟამად მიუწვდომელია: $error';
  }

  @override
  String shareFailed(String error) {
    return 'გაზიარება ვერ მოხერხდა: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count ჰიტები';
  }

  @override
  String matchCount(int count) {
    return 'მატჩი: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'წყარო: $source';
  }

  @override
  String get createNew => 'შექმნა';

  @override
  String micStartFailed(String error) {
    return 'მიკროფონის დაწყება ვერ მოხერხდა: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'ანგარიშები: +$created / განახლებულია $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'დღიურები: +$created / განახლებულია $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'შეხსენებები: +$created / განახლებულია $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'გამოტოვებული: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'სულ შეიცვალა: $count';
  }

  @override
  String get settingsApplied =>
      'გამოყენებული იქნა სარეზერვო ასლის პარამეტრები.';

  @override
  String get settingsNotApplied =>
      'სარეზერვო ასლის პარამეტრები არ იყო გამოყენებული.';

  @override
  String backupExported(String path) {
    return 'სარეზერვო ასლი ექსპორტირებულია: $path';
  }

  @override
  String exportFailed(String error) {
    return 'ექსპორტი ვერ მოხერხდა: $error';
  }

  @override
  String importFailed(String error) {
    return 'იმპორტი ვერ მოხერხდა: $error';
  }
}

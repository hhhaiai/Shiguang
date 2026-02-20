// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get languageName => 'বাংলা';

  @override
  String get languageNameEn => 'Bengali';

  @override
  String get appTitle => 'শিগুয়াং';

  @override
  String get settings => 'সেটিংস';

  @override
  String get account => 'অ্যাকাউন্ট';

  @override
  String get reminders => 'মনে করিয়ে দেওয়া';

  @override
  String get language => 'ভাষা';

  @override
  String get appLanguage => 'অ্যাপ ভাষা';

  @override
  String get appearance => 'প্রকাশ';

  @override
  String get themeMode => 'থিম মোড';

  @override
  String get dark => 'অন্ধকার';

  @override
  String get light => 'আলো';

  @override
  String get system => 'সিস্টেম';

  @override
  String get aiService => 'AI সার্ভিস';

  @override
  String get aiChatProvider => 'AI চ্যাট প্রোভাইডার';

  @override
  String get chatModel => 'চ্যাট মডেল';

  @override
  String get localModel => 'লোকাল মডেল';

  @override
  String get localModelDefault => 'লোকাল মডেল (ডিফল্ট)';

  @override
  String get ollamaEndpoint => 'Ollama এন্ডপয়েন্ট';

  @override
  String get ollamaModel => 'Ollama মডেল';

  @override
  String get openAiEndpoint => 'OpenAI এন্ডপয়েন্ট';

  @override
  String get openAiApiKey => 'OpenAI API কী';

  @override
  String get openAiModel => 'OpenAI মডেল';

  @override
  String get geminiEndpoint => 'Gemini এন্ডপয়েন্ট';

  @override
  String get geminiApiKey => 'Gemini API কী';

  @override
  String get geminiModel => 'Gemini মডেল';

  @override
  String get anthropicEndpoint => 'Anthropic এন্ডপয়েন্ট';

  @override
  String get anthropicApiKey => 'Anthropic API কী';

  @override
  String get anthropicModel => 'Anthropic মডেল';

  @override
  String get customProtocol => 'কাস্টম প্রোটোকল';

  @override
  String get protocol => 'প্রোটোকল';

  @override
  String get customEndpoint => 'কাস্টম এন্ডপয়েন্ট';

  @override
  String get customApiKey => 'কাস্টম API কী';

  @override
  String get customModel => 'কাস্টম মডেল';

  @override
  String get optionalForLocalServers => 'লোকাল/কাস্টম সার্ভারের জন্য ঐচ্ছিক';

  @override
  String get speechRecognitionEngine => 'স্পিচ রিকগনিশন ইঞ্জিন';

  @override
  String get local => 'লোকাল';

  @override
  String get endpoint => 'এন্ডপয়েন্ট';

  @override
  String get localSpeechModel => 'লোকাল স্পিচ মডেল';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (ডিভাইসে)';

  @override
  String get systemSpeechRecognition => 'সিস্টেম স্পিচ রিকগনিশন';

  @override
  String get systemRecognitionAndroidIos => 'সিস্টেম রিকগনিশন (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'এন্ডপয়েন্ট রিকগনিশন (ক্লাউড/WS)';

  @override
  String get useBuiltInRecognizer =>
      'বিল্ট-ইন Android / iOS রিকগনাইজার ব্যবহার করুন (ক্লাউড ব্যবহার করতে পারে)';

  @override
  String get voiceAiEndpoint => 'ভয়েস AI এন্ডপয়েন্ট';

  @override
  String get embeddingModel => 'এমবেডিং মডেল';

  @override
  String get crossDeviceSync => 'ক্রস-ডিভাইস সিঙ্ক';

  @override
  String get sendToOtherDevices => 'অন্যান্য ডিভাইসে পাঠান (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'ব্যাকআপ এক্সপোর্ট করুন এবং শেয়ার শীটের মাধ্যমে পাঠান';

  @override
  String get importFromLocalSend => 'LocalSend থেকে ইম্পোর্ট করুন';

  @override
  String get selectBackupJson =>
      'ব্যাকআপ JSON নির্বাচন করুন এবং লোকাল ডেটা মার্জ করুন';

  @override
  String get autoGeneration => 'অটো জেনারেশন';

  @override
  String get autoGenerateSummary => 'অটো সারাংশ জেনারেট';

  @override
  String get generateAiSummaryForNewEntries =>
      'নতুন এন্ট্রির জন্য AI সারাংশ জেনারেট করুন';

  @override
  String get autoGenerateEmbedding => 'অটো এমবেডিং জেনারেট';

  @override
  String get generateVectorEmbedding =>
      'সার্চের জন্য ভেক্টর এমবেডিং জেনারেট করুন';

  @override
  String get enableNetworkSearch => 'নেটওয়ার্ক সার্চ চালু করুন';

  @override
  String get allowOnlineRetrieval =>
      'সার্চ এবং AI চ্যাটের জন্য অনলাইন রিট্রিভাল অনুমতি দিন (ডিফল্টে বন্ধ)';

  @override
  String get about => 'সম্পর্কে';

  @override
  String version(String version) {
    return 'সংস্করণ $version';
  }

  @override
  String get database => 'ডেটাবেস';

  @override
  String get objectBoxWithHnsw => 'HNSW ইনডেক্স সহ ObjectBox';

  @override
  String get logOut => 'লগ আউট';

  @override
  String get custom => 'কাস্টম';

  @override
  String get openAiCompatible => 'OpenAI সামঞ্জস্যপূর্ণ';

  @override
  String get notSet => 'সেট করা হয়নি';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... অথবা http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'লোকাল/LAN/পাবলিক এন্ডপয়েন্ট সমর্থন করে';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend ব্যাকআপ';

  @override
  String get localBackupFromShiguang =>
      'Shiguang থেকে লোকাল ব্যাকআপ (LocalSend এর মাধ্যমে গ্রহণ করুন)';

  @override
  String get selectBackupFileFromLocalSend =>
      'LocalSend থেকে প্রাপ্ত ব্যাকআপ ফাইল নির্বাচন করুন';

  @override
  String get failedToResolveFilePath => 'নির্বাচিত ফাইল পাথ সমাধান করতে ব্যর্থ';

  @override
  String get importOptions => 'ইম্পোর্ট অপশন';

  @override
  String get importSettingsAsWell =>
      'সেটিংসও ইম্পোর্ট করবেন?\n(API কীগুলি ওভাররাইট করা হবে না)';

  @override
  String get dataOnly => 'শুধু ডেটা';

  @override
  String get dataAndSettings => 'ডেটা + সেটিংস';

  @override
  String get importCompleted => 'ইম্পোর্ট সম্পন্ন';

  @override
  String get settingsInBackupWereApplied =>
      'ব্যাকআপের সেটিংস প্রয়োগ করা হয়েছে।';

  @override
  String get settingsInBackupWereNotApplied =>
      'ব্যাকআপের সেটিংস প্রয়োগ করা হয়নি।';

  @override
  String get ok => 'ঠিক আছে';

  @override
  String get cancel => 'বাতিল';

  @override
  String get save => 'সংরক্ষণ';

  @override
  String get delete => 'মুছুন';

  @override
  String get clear => 'সাফ করুন';

  @override
  String get add => 'যোগ করুন';

  @override
  String get create => 'তৈরি করুন';

  @override
  String get edit => 'সম্পাদনা করুন';

  @override
  String get search => 'খুঁজুন';

  @override
  String get areYouSureYouWantToLogOut => 'আপনি কি সত্যিই লগ আউট করতে চান?';

  @override
  String get chooseLanguage => 'ভাষা নির্বাচন করুন';

  @override
  String get databaseInfo => 'ডেটাবেস তথ্য';

  @override
  String get storage => 'স্টোরেজ: ObjectBox';

  @override
  String get vectorIndex => 'ভেক্টর ইনডেক্স: HNSW';

  @override
  String get dimensions => 'মাত্রা: 384';

  @override
  String get embeddingModelBge => 'এমবেডিং মডেল: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'ফটো তুলুন';

  @override
  String get chooseFromGallery => 'গ্যালারি থেকে নির্বাচন করুন';

  @override
  String get editNickname => 'উপনাম সম্পাদনা করুন';

  @override
  String get enterNickname => 'উপনাম লিখুন';

  @override
  String get pleaseEnterNickname => 'দয়া করে একটি উপনাম লিখুন';

  @override
  String get nicknameAlreadyExistsOrInvalid => 'উপনাম ইতিমধ্যে আছে বা অবৈধ';

  @override
  String get user => 'ব্যবহারকারী';

  @override
  String get manageScheduledReminders =>
      'নির্ধারিত রিমাইন্ডার এবং অ্যালার্ম পরিচালনা করুন';

  @override
  String get imageFailedToLoad =>
      'ছবি লোড হতে ব্যর্থ। দয়া করে আবার নির্বাচন করুন।';

  @override
  String get imageIsStillLoading => 'ছবি এখনও লোড হচ্ছে';

  @override
  String get imageAreaNotReady =>
      'ছবি এলিয়া প্রস্তুত নয়। দয়া করে আবার চেষ্টা করুন।';

  @override
  String get cropFrameNotReady =>
      'ক্রপ ফ্রেম প্রস্তুত নয়। দয়া করে আবার চেষ্টা করুন।';

  @override
  String get invalidCropArea => 'অবৈধ ক্রপ এলিয়া। দয়া করে আবার চেষ্টা করুন।';

  @override
  String get cropFailed => 'ক্রপ ব্যর্থ। দয়া করে আবার চেষ্টা করুন।';

  @override
  String get cropAvatar => 'অ্যাভাটার ক্রপ করুন';

  @override
  String get chooseAgain => 'আবার নির্বাচন করুন';

  @override
  String get rotate90 => '90° ঘোরান';

  @override
  String get dragFrameToMove =>
      'ফ্রেম সরাতে টানুন, আকার পরিবর্তন করতে নিচে-ডানে টানুন; জুম করতে এবং ছবি সরাতে পিন্চ করুন।';

  @override
  String get pleaseFillInAllFields => 'দয়া করে সমস্ত ফিল্ড পূরণ করুন';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN কমপক্ষে 4টি সংখ্যা হতে হবে';

  @override
  String get pinAtLeast4Digits => 'PIN কমপক্ষে 4টি সংখ্যা হতে হবে';

  @override
  String get invalidUsernameOrPin => 'অবৈধ ব্যবহারকারী নাম বা PIN';

  @override
  String get invalidUsernameOrPinError => 'অবৈধ ব্যবহারকারী নাম বা PIN';

  @override
  String get usernameAlreadyExists => 'ব্যবহারকারী নাম ইতিমধ্যে আছে';

  @override
  String get captureMomentsKeepMemories =>
      'মুহূর্তগুলি ক্যাপচার করুন, স্মৃতি রাখুন';

  @override
  String get username => 'ব্যবহারকারী নাম';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'লগিন';

  @override
  String get createAccount => 'অ্যাকাউন্ট তৈরি করুন';

  @override
  String get dontHaveAccountCreateOne => 'অ্যাকাউন্ট নেই? একটি তৈরি করুন';

  @override
  String get alreadyHaveAccountLogin => 'ইতিমধ্যে অ্যাকাউন্ট আছে? লগিন করুন';

  @override
  String get pleaseEnterUsername => 'দয়া করে একটি ব্যবহারকারী নাম লিখুন';

  @override
  String get pinsDoNotMatch => 'PIN মিলছে না';

  @override
  String get tapToAddAvatar => 'অ্যাভাটার যোগ করতে ট্যাপ করুন';

  @override
  String get yourName => 'আপনার নাম';

  @override
  String get privatePinOptional => 'ব্যক্তিগত PIN (ঐচ্ছিক)';

  @override
  String get usedToEncryptPrivateRecords =>
      'ব্যক্তিগত রেকর্ড এনক্রিপ্ট করতে ব্যবহৃত হয়';

  @override
  String get privatePin => 'ব্যক্তিগত PIN';

  @override
  String get leaveEmptyForNoEncryption => 'এনক্রিপশন না করতে খালি রাখুন';

  @override
  String get confirmPin => 'PIN নিশ্চিত করুন';

  @override
  String get getStarted => 'শুরু করুন';

  @override
  String get noReminders => 'কোনো রিমাইন্ডার নেই';

  @override
  String get addReminder => 'রিমাইন্ডার যোগ করুন';

  @override
  String get title => 'শিরোনাম';

  @override
  String get descriptionOptional => 'বর্ণনা (ঐচ্ছিক)';

  @override
  String get microphonePermissionRequired => 'মাইক্রোফোন অনুমতি প্রয়োজন';

  @override
  String get aiAssistant => 'AI সহকারী';

  @override
  String get listening => 'শুনছি...';

  @override
  String get typeAMessage => 'একটি বার্তা লিখুন...';

  @override
  String get aiChat => 'AI চ্যাট';

  @override
  String get startAConversation => 'একটি কথোপকথন শুরু করুন';

  @override
  String get typeYourMessage => 'আপনার বার্তা লিখুন...';

  @override
  String get asrReconnecting => 'ASR পুনরায় সংযোগ করছে...';

  @override
  String get write => 'লিখুন';

  @override
  String get writeEntry => 'এন্ট্রি লিখুন';

  @override
  String get noMemoriesYet => 'এখনও কোনো স্মৃতি নেই';

  @override
  String get tapPlusToCapture => 'আপনার চিন্তা ক্যাপচার করতে + ট্যাপ করুন';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'আপনার চিন্তা ক্যাপচার করতে + ট্যাপ করুন';

  @override
  String get deleteMemory => 'স্মৃতি মুছুন';

  @override
  String get deleteRecord => 'রেকর্ড মুছুন';

  @override
  String get thisEntryWillBeRemoved =>
      'এই এন্ট্রি আপনার টাইমলাইন থেকে সরিয়ে ফেলা হবে।';

  @override
  String get thisRecordWillBeRemoved =>
      'এই রেকর্ড আপনার টাইমলাইন থেকে সরিয়ে ফেলা হবে।';

  @override
  String get searchYourRecords => 'আপনার রেকর্ড খুঁজুন...';

  @override
  String get exactMatches => 'সঠিক মিল';

  @override
  String get noExactMatches => 'কোনো সঠিক মিল নেই';

  @override
  String get exact => 'সঠিক';

  @override
  String get exactMatch => 'সঠিক মিল';

  @override
  String get fuzzyMatches => 'ফাজি মিল';

  @override
  String get noFuzzyMatches => 'কোনো ফাজি মিল নেই';

  @override
  String get vectorMatch => 'ভেক্টর মিল';

  @override
  String get networkMatches => 'নেটওয়ার্ক মিল';

  @override
  String get noNetworkMatches => 'কোনো নেটওয়ার্ক মিল নেই';

  @override
  String get networkSearchIsOff =>
      'নেটওয়ার্ক সার্চ বন্ধ আছে। সেটিংসে এটি চালু করুন।';

  @override
  String get network => 'নেটওয়ার্ক';

  @override
  String get networkMatch => 'নেটওয়ার্ক মিল';

  @override
  String get noSearchHistory => 'কোনো সার্চ ইতিহাস নেই';

  @override
  String get searchHistory => 'সার্চ ইতিহাস';

  @override
  String get invalidLink => 'অবৈধ লিংক';

  @override
  String get unableToOpenWebPage => 'ওয়েব পেজ খুলতে অক্ষম';

  @override
  String get imageMemory => '[ছবি স্মৃতি]';

  @override
  String get tapToOpenWebPage => 'ওয়েব পেজ খুলতে ট্যাপ করুন';

  @override
  String get editEntry => 'এন্ট্রি সম্পাদনা করুন';

  @override
  String get entryDetails => 'এন্ট্রি বিবরণ';

  @override
  String get noContent => 'কোনো কন্টেন্ট নেই';

  @override
  String get diaryNotFound => 'ডায়ারি পাওয়া যায়নি';

  @override
  String get diaryNotFoundShort => 'রেকর্ড পাওয়া যায়নি';

  @override
  String get aiSummary => 'AI সারাংশ';

  @override
  String get microphoneInterrupted =>
      'মাইক্রোফোন বাধাগ্রস্ত, রেকর্ডিং বন্ধ হয়ে গেছে।';

  @override
  String get bold => 'বোল্ড';

  @override
  String get italic => 'ইটালিক';

  @override
  String get strikethrough => 'স্ট্রাইকথ্রু';

  @override
  String get image => 'ছবি';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR পাওয়া যাচ্ছে না। রেকর্ডিং এখনও সক্রিয়।';

  @override
  String get writeYourEntry => 'আপনার এন্ট্রি লিখুন...';

  @override
  String get writeYourContent => 'আপনার কন্টেন্ট লিখুন...';

  @override
  String microphoneStartFailed(String error) {
    return 'মাইক্রোফোন শুরু করতে ব্যর্থ: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'মাইক্রোফোন বাধাগ্রস্ত, রেকর্ডিং বন্ধ হয়ে গেছে।';

  @override
  String asrReconnectingError(String error) {
    return 'ASR পুনরায় সংযোগ করছে: $error';
  }

  @override
  String imageInserted(String name) {
    return 'ছবি সন্নিবেশিত: $name';
  }

  @override
  String voiceError(String error) {
    return 'ভয়েস ত্রুটি: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'দুঃখিত, AI সার্ভিস এখন উপলব্ধ নেই: $error';
  }

  @override
  String shareFailed(String error) {
    return 'শেয়ার করতে ব্যর্থ: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $countটি হিট';
  }

  @override
  String matchCount(int count) {
    return 'মিল: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'উৎস: $source';
  }

  @override
  String get createNew => 'তৈরি করুন';

  @override
  String micStartFailed(String error) {
    return 'মাইক শুরু করতে ব্যর্থ: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'অ্যাকাউন্ট: +$created / আপডেট $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'ডায়ারি: +$created / আপডেট $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'রিমাইন্ডার: +$created / আপডেট $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'এড়িয়ে যাওয়া: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'মোট পরিবর্তন: $count';
  }

  @override
  String get settingsApplied => 'ব্যাকআপের সেটিংস প্রয়োগ করা হয়েছে।';

  @override
  String get settingsNotApplied => 'ব্যাকআপের সেটিংস প্রয়োগ করা হয়নি।';

  @override
  String backupExported(String path) {
    return 'ব্যাকআপ এক্সপোর্ট করা হয়েছে: $path';
  }

  @override
  String exportFailed(String error) {
    return 'এক্সপোর্ট ব্যর্থ: $error';
  }

  @override
  String importFailed(String error) {
    return 'ইম্পোর্ট ব্যর্থ: $error';
  }
}

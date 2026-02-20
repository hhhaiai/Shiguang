// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get languageName => 'ไทย';

  @override
  String get languageNameEn => 'Thai';

  @override
  String get appTitle => 'ชิกวาง';

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get account => 'บัญชี';

  @override
  String get reminders => 'การแจ้งเตือน';

  @override
  String get language => 'ภาษา';

  @override
  String get appLanguage => 'ภาษาแอป';

  @override
  String get appearance => 'รูปลักษณ์';

  @override
  String get themeMode => 'โหมดธีม';

  @override
  String get dark => 'มืด';

  @override
  String get light => 'สว่าง';

  @override
  String get system => 'ระบบ';

  @override
  String get aiService => 'บริการ AI';

  @override
  String get aiChatProvider => 'ผู้ให้บริการ AI แชท';

  @override
  String get chatModel => 'โมเดลแชท';

  @override
  String get localModel => 'โมเดลในเครื่อง';

  @override
  String get localModelDefault => 'โมเดลในเครื่อง (ค่าเริ่มต้น)';

  @override
  String get ollamaEndpoint => 'ปลายทาง Ollama';

  @override
  String get ollamaModel => 'โมเดล Ollama';

  @override
  String get openAiEndpoint => 'ปลายทาง OpenAI';

  @override
  String get openAiApiKey => 'รหัส API OpenAI';

  @override
  String get openAiModel => 'โมเดล OpenAI';

  @override
  String get geminiEndpoint => 'ปลายทาง Gemini';

  @override
  String get geminiApiKey => 'รหัส API Gemini';

  @override
  String get geminiModel => 'โมเดล Gemini';

  @override
  String get anthropicEndpoint => 'ปลายทาง Anthropic';

  @override
  String get anthropicApiKey => 'รหัส API Anthropic';

  @override
  String get anthropicModel => 'โมเดล Anthropic';

  @override
  String get customProtocol => 'โปรโตคอลที่กำหนดเอง';

  @override
  String get protocol => 'โปรโตคอล';

  @override
  String get customEndpoint => 'ปลายทางที่กำหนดเอง';

  @override
  String get customApiKey => 'รหัส API ที่กำหนดเอง';

  @override
  String get customModel => 'โมเดลที่กำหนดเอง';

  @override
  String get optionalForLocalServers =>
      'ไม่บังคับสำหรับเซิร์ฟเวอร์ในเครื่อง/ที่กำหนดเอง';

  @override
  String get speechRecognitionEngine => 'เครื่องมือจดจำเสียงพูด';

  @override
  String get local => 'ในเครื่อง';

  @override
  String get endpoint => 'ปลายทาง';

  @override
  String get localSpeechModel => 'โมเดลเสียงในเครื่อง';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (บนอุปกรณ์)';

  @override
  String get systemSpeechRecognition => 'การจดจำเสียงพูดของระบบ';

  @override
  String get systemRecognitionAndroidIos => 'การจดจำของระบบ';

  @override
  String get endpointRecognitionCloudWs => 'การจดจำปลายทาง (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'ใช้เครื่องมือจดจำในตัว Android/iOS (อาจใช้ cloud)';

  @override
  String get voiceAiEndpoint => 'ปลายทาง Voice AI';

  @override
  String get embeddingModel => 'โมเดล Embedding';

  @override
  String get crossDeviceSync => 'ซิงค์ข้ามอุปกรณ์';

  @override
  String get sendToOtherDevices => 'ส่งไปยังอุปกรณ์อื่น';

  @override
  String get exportBackupAndSend => 'ส่งออกข้อมูลสำรองและส่งผ่านการแชร์';

  @override
  String get importFromLocalSend => 'นำเข้าจาก LocalSend';

  @override
  String get selectBackupJson => 'เลือก JSON สำรองและรวมข้อมูลในเครื่อง';

  @override
  String get autoGeneration => 'สร้างอัตโนมัติ';

  @override
  String get autoGenerateSummary => 'สร้างสรุปอัตโนมัติ';

  @override
  String get generateAiSummaryForNewEntries => 'สร้างสรุป AI สำหรับรายการใหม่';

  @override
  String get autoGenerateEmbedding => 'สร้าง Embedding อัตโนมัติ';

  @override
  String get generateVectorEmbedding => 'สร้าง vector embedding สำหรับการค้นหา';

  @override
  String get enableNetworkSearch => 'เปิดใช้งานการค้นหาออนไลน์';

  @override
  String get allowOnlineRetrieval =>
      'อนุญาตการค้นหาออนไลน์สำหรับการค้นหาและแชท AI (ปิดตามค่าเริ่มต้น)';

  @override
  String get about => 'เกี่ยวกับ';

  @override
  String version(String version) {
    return 'เวอร์ชัน $version';
  }

  @override
  String get database => 'ฐานข้อมูล';

  @override
  String get objectBoxWithHnsw => 'ObjectBox พร้อมดัชนี HNSW';

  @override
  String get logOut => 'ออกจากระบบ';

  @override
  String get custom => 'กำหนดเอง';

  @override
  String get openAiCompatible => 'เข้ากันได้กับ OpenAI';

  @override
  String get notSet => 'ยังไม่ตั้งค่า';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... หรือ http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'รองรับปลายทางในเครื่อง/LAN/สาธารณะ';

  @override
  String get shiguangLocalSendBackup => 'ข้อมูลสำรอง LocalSend ของ Shiguang';

  @override
  String get localBackupFromShiguang =>
      'ข้อมูลสำรองในเครื่องจาก Shiguang (รับผ่าน LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'เลือกไฟล์สำรองที่รับจาก LocalSend';

  @override
  String get failedToResolveFilePath => 'ไม่สามารถแก้ไขเส้นทางไฟล์ที่เลือกได้';

  @override
  String get importOptions => 'ตัวเลือกการนำเข้า';

  @override
  String get importSettingsAsWell =>
      'นำเข้าการตั้งค่าด้วยหรือไม่?\n(รหัส API จะไม่ถูกเขียนทับ)';

  @override
  String get dataOnly => 'ข้อมูลเท่านั้น';

  @override
  String get dataAndSettings => 'ข้อมูล + การตั้งค่า';

  @override
  String get importCompleted => 'การนำเข้าเสร็จสมบูรณ์';

  @override
  String get settingsInBackupWereApplied =>
      'การตั้งค่าในข้อมูลสำรองถูกนำไปใช้แล้ว';

  @override
  String get settingsInBackupWereNotApplied =>
      'การตั้งค่าในข้อมูลสำรองยังไม่ถูกนำไปใช้';

  @override
  String get ok => 'ตกลง';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get save => 'บันทึก';

  @override
  String get delete => 'ลบ';

  @override
  String get clear => 'ล้าง';

  @override
  String get add => 'เพิ่ม';

  @override
  String get create => 'สร้าง';

  @override
  String get edit => 'แก้ไข';

  @override
  String get search => 'ค้นหา';

  @override
  String get areYouSureYouWantToLogOut =>
      'คุณแน่ใจหรือไม่ว่าต้องการออกจากระบบ?';

  @override
  String get chooseLanguage => 'เลือกภาษา';

  @override
  String get databaseInfo => 'ข้อมูลฐานข้อมูล';

  @override
  String get storage => 'ที่เก็บข้อมูล: ObjectBox';

  @override
  String get vectorIndex => 'ดัชนีเวกเตอร์: HNSW';

  @override
  String get dimensions => 'มิติ: 384';

  @override
  String get embeddingModelBge => 'โมเดล Embedding: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'ถ่ายรูป';

  @override
  String get chooseFromGallery => 'เลือกจากแกลลอรี่';

  @override
  String get editNickname => 'แก้ไขชื่อเล่น';

  @override
  String get enterNickname => 'ใส่ชื่อเล่น';

  @override
  String get pleaseEnterNickname => 'กรุณาใส่ชื่อเล่น';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'ชื่อเล่นมีอยู่แล้วหรือไม่ถูกต้อง';

  @override
  String get user => 'ผู้ใช้';

  @override
  String get manageScheduledReminders =>
      'จัดการการแจ้งเตือนและนาฬิกาปลุกที่กำหนดเวลาไว้';

  @override
  String get imageFailedToLoad => 'โหลดรูปภาพไม่สำเร็จ กรุณาเลือกใหม่';

  @override
  String get imageIsStillLoading => 'รูปภาพกำลังโหลดอยู่';

  @override
  String get imageAreaNotReady => 'พื้นที่รูปภาพยังไม่พร้อม กรุณาลองอีกครั้ง';

  @override
  String get cropFrameNotReady => 'กรอบตัดยังไม่พร้อม กรุณาลองอีกครั้ง';

  @override
  String get invalidCropArea => 'พื้นที่ตัดไม่ถูกต้อง กรุณาลองอีกครั้ง';

  @override
  String get cropFailed => 'ตัดไม่สำเร็จ กรุณาลองอีกครั้ง';

  @override
  String get cropAvatar => 'ตัดรูปโปรไฟล์';

  @override
  String get chooseAgain => 'เลือกใหม่';

  @override
  String get rotate90 => 'หมุน 90°';

  @override
  String get dragFrameToMove =>
      'ลากกรอบเพื่อย้าย ลากมุมขวาล่างเพื่อปรับขนาด; บีบนิ้วเพื่อซูมและย้ายรูป';

  @override
  String get pleaseFillInAllFields => 'กรุณากรอกทุกช่อง';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN ต้องมีอย่างน้อย 4 หลัก';

  @override
  String get pinAtLeast4Digits => 'PIN อย่างน้อย 4 หลัก';

  @override
  String get invalidUsernameOrPin => 'ชื่อผู้ใช้หรือ PIN ไม่ถูกต้อง';

  @override
  String get invalidUsernameOrPinError => 'ชื่อผู้ใช้หรือ PIN ไม่ถูกต้อง';

  @override
  String get usernameAlreadyExists => 'ชื่อผู้ใช้มีอยู่แล้ว';

  @override
  String get captureMomentsKeepMemories => 'จับภาพความทรงจำ เก็บรักษาความทรงจำ';

  @override
  String get username => 'ชื่อผู้ใช้';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'เข้าสู่ระบบ';

  @override
  String get createAccount => 'สร้างบัญชี';

  @override
  String get dontHaveAccountCreateOne => 'ยังไม่มีบัญชี? สร้างบัญชี';

  @override
  String get alreadyHaveAccountLogin => 'มีบัญชีอยู่แล้ว? เข้าสู่ระบบ';

  @override
  String get pleaseEnterUsername => 'กรุณาใส่ชื่อผู้ใช้';

  @override
  String get pinsDoNotMatch => 'PIN ไม่ตรงกัน';

  @override
  String get tapToAddAvatar => 'แตะเพื่อเพิ่มรูปโปรไฟล์';

  @override
  String get yourName => 'ชื่อของคุณ';

  @override
  String get privatePinOptional => 'PIN ส่วนตัว (ไม่บังคับ)';

  @override
  String get usedToEncryptPrivateRecords => 'ใช้เข้ารหัสบันทึกส่วนตัว';

  @override
  String get privatePin => 'PIN ส่วนตัว';

  @override
  String get leaveEmptyForNoEncryption => 'เว้นว่างหากไม่ต้องการเข้ารหัส';

  @override
  String get confirmPin => 'ยืนยัน PIN';

  @override
  String get getStarted => 'เริ่มต้น';

  @override
  String get noReminders => 'ไม่มีการแจ้งเตือน';

  @override
  String get addReminder => 'เพิ่มการแจ้งเตือน';

  @override
  String get title => 'หัวข้อ';

  @override
  String get descriptionOptional => 'คำอธิบาย (ไม่บังคับ)';

  @override
  String get microphonePermissionRequired => 'ต้องการสิทธิ์ไมโครโฟน';

  @override
  String get aiAssistant => 'ผู้ช่วย AI';

  @override
  String get listening => 'กำลังฟัง...';

  @override
  String get typeAMessage => 'พิมพ์ข้อความ...';

  @override
  String get aiChat => 'แชท AI';

  @override
  String get startAConversation => 'เริ่มสนทนา';

  @override
  String get typeYourMessage => 'พิมพ์ข้อความของคุณ...';

  @override
  String get asrReconnecting => 'ASR กำลังเชื่อมต่อใหม่...';

  @override
  String get write => 'เขียน';

  @override
  String get writeEntry => 'เขียนบทความ';

  @override
  String get noMemoriesYet => 'ยังไม่มีความทรงจำ';

  @override
  String get tapPlusToCapture => 'แตะ + เพื่อบันทึกความคิดของคุณ';

  @override
  String get tapPlusToCaptureYourThoughts => 'แตะ + เพื่อบันทึกความคิดของคุณ';

  @override
  String get deleteMemory => 'ลบความทรงจำ';

  @override
  String get deleteRecord => 'ลบบันทึก';

  @override
  String get thisEntryWillBeRemoved => 'รายการนี้จะถูกลบออกจากไทม์ไลน์';

  @override
  String get thisRecordWillBeRemoved => 'บันทึกนี้จะถูกลบออกจากไทม์ไลน์';

  @override
  String get searchYourRecords => 'ค้นหาบันทึกของคุณ...';

  @override
  String get exactMatches => 'การจับคู่ที่แม่นยำ';

  @override
  String get noExactMatches => 'ไม่มีการจับคู่ที่แม่นยำ';

  @override
  String get exact => 'แม่นยำ';

  @override
  String get exactMatch => 'การจับคู่ทั้งหมด';

  @override
  String get fuzzyMatches => 'การจับคู่คล้ายคลึง';

  @override
  String get noFuzzyMatches => 'ไม่มีการจับคู่คล้ายคลึง';

  @override
  String get vectorMatch => 'การจับคู่เวกเตอร์';

  @override
  String get networkMatches => 'การจับคู่เครือข่าย';

  @override
  String get noNetworkMatches => 'ไม่มีการจับคู่เครือข่าย';

  @override
  String get networkSearchIsOff =>
      'การค้นหาเครือข่ายปิดอยู่ กรุณาเปิดในการตั้งค่า';

  @override
  String get network => 'เครือข่าย';

  @override
  String get networkMatch => 'การจับคู่เครือข่าย';

  @override
  String get noSearchHistory => 'ไม่มีประวัติการค้นหา';

  @override
  String get searchHistory => 'ประวัติการค้นหา';

  @override
  String get invalidLink => 'ลิงก์ไม่ถูกต้อง';

  @override
  String get unableToOpenWebPage => 'ไม่สามารถเปิดหน้าเว็บได้';

  @override
  String get imageMemory => '[ความทรงจำภาพ]';

  @override
  String get tapToOpenWebPage => 'แตะเพื่อเปิดหน้าเว็บ';

  @override
  String get editEntry => 'แก้ไขบทความ';

  @override
  String get entryDetails => 'รายละเอียดบทความ';

  @override
  String get noContent => 'ไม่มีเนื้อหา';

  @override
  String get diaryNotFound => 'ไม่พบไดอารี่';

  @override
  String get diaryNotFoundShort => 'ไม่พบบันทึก';

  @override
  String get aiSummary => 'สรุป AI';

  @override
  String get microphoneInterrupted => 'ไมโครโฟนถูกขัดจังหวะ การบันทึกหยุดลง';

  @override
  String get bold => 'ตัวหนา';

  @override
  String get italic => 'ตัวเอียง';

  @override
  String get strikethrough => 'ขีดฆ่า';

  @override
  String get image => 'รูปภาพ';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR ไม่พร้อมใช้งาน การบันทึกยังคงดำเนินอยู่';

  @override
  String get writeYourEntry => 'เขียนบทความของคุณ...';

  @override
  String get writeYourContent => 'เขียนเนื้อหาของคุณ...';

  @override
  String microphoneStartFailed(String error) {
    return 'เริ่มไมโครโฟนไม่สำเร็จ: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'ไมโครโฟนถูกขัดจังหวะ การบันทึกหยุดลง';

  @override
  String asrReconnectingError(String error) {
    return 'การจดจำเสียงพูดกำลังเชื่อมต่อใหม่: $error';
  }

  @override
  String imageInserted(String name) {
    return 'แทรกรูปภาพแล้ว: $name';
  }

  @override
  String voiceError(String error) {
    return 'ข้อผิดพลาดเสียง: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'ขออภัย บริการ AI ขณะนี้ไม่พร้อมใช้งาน: $error';
  }

  @override
  String shareFailed(String error) {
    return 'แชร์ไม่สำเร็จ: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count รายการ';
  }

  @override
  String matchCount(int count) {
    return 'ตรง: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'แหล่งที่มา: $source';
  }

  @override
  String get createNew => 'สร้างใหม่';

  @override
  String micStartFailed(String error) {
    return 'เริ่มไมค์ไม่สำเร็จ: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'บัญชี: +$created / อัปเดต $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'ไดอารี่: +$created / อัปเดต $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'การแจ้งเตือน: +$created / อัปเดต $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'ข้าม: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'รวมการเปลี่ยนแปลง: $count';
  }

  @override
  String get settingsApplied => 'การตั้งค่าในข้อมูลสำรองถูกนำไปใช้แล้ว';

  @override
  String get settingsNotApplied => 'การตั้งค่าในข้อมูลสำรองยังไม่ถูกนำไปใช้';

  @override
  String backupExported(String path) {
    return 'ส่งออกข้อมูลสำรองแล้ว: $path';
  }

  @override
  String exportFailed(String error) {
    return 'ส่งออกไม่สำเร็จ: $error';
  }

  @override
  String importFailed(String error) {
    return 'นำเข้าไม่สำเร็จ: $error';
  }
}

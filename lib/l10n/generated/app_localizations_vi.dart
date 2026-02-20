// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get languageName => 'Tiếng Việt';

  @override
  String get languageNameEn => 'Vietnamese';

  @override
  String get appTitle => 'Thời Gian';

  @override
  String get settings => 'Cài đặt';

  @override
  String get account => 'Tài khoản';

  @override
  String get reminders => 'Nhắc nhở';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get appLanguage => 'Ngôn ngữ ứng dụng';

  @override
  String get appearance => 'Giao diện';

  @override
  String get themeMode => 'Chế độ giao diện';

  @override
  String get dark => 'Tối';

  @override
  String get light => 'Sáng';

  @override
  String get system => 'Hệ thống';

  @override
  String get aiService => 'Dịch vụ AI';

  @override
  String get aiChatProvider => 'Nhà cung cấp AI Chat';

  @override
  String get chatModel => 'Mô hình chat';

  @override
  String get localModel => 'Mô hình cục bộ';

  @override
  String get localModelDefault => 'Mô hình cục bộ (Mặc định)';

  @override
  String get ollamaEndpoint => 'Điểm cuối Ollama';

  @override
  String get ollamaModel => 'Mô hình Ollama';

  @override
  String get openAiEndpoint => 'Điểm cuối OpenAI';

  @override
  String get openAiApiKey => 'Khóa API OpenAI';

  @override
  String get openAiModel => 'Mô hình OpenAI';

  @override
  String get geminiEndpoint => 'Điểm cuối Gemini';

  @override
  String get geminiApiKey => 'Khóa API Gemini';

  @override
  String get geminiModel => 'Mô hình Gemini';

  @override
  String get anthropicEndpoint => 'Điểm cuối Anthropic';

  @override
  String get anthropicApiKey => 'Khóa API Anthropic';

  @override
  String get anthropicModel => 'Mô hình Anthropic';

  @override
  String get customProtocol => 'Giao thức tùy chỉnh';

  @override
  String get protocol => 'Giao thức';

  @override
  String get customEndpoint => 'Điểm cuối tùy chỉnh';

  @override
  String get customApiKey => 'Khóa API tùy chỉnh';

  @override
  String get customModel => 'Mô hình tùy chỉnh';

  @override
  String get optionalForLocalServers => 'Tùy chọn cho máy chủ cục bộ/tùy chỉnh';

  @override
  String get speechRecognitionEngine => 'Công cụ nhận dạng giọng nói';

  @override
  String get local => 'Cục bộ';

  @override
  String get endpoint => 'Điểm cuối';

  @override
  String get localSpeechModel => 'Mô hình giọng nói cục bộ';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (trên thiết bị)';

  @override
  String get systemSpeechRecognition => 'Nhận dạng giọng nói hệ thống';

  @override
  String get systemRecognitionAndroidIos => 'Nhận dạng hệ thống';

  @override
  String get endpointRecognitionCloudWs => 'Nhận dạng điểm cuối (Đám mây/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Sử dụng trình nhận dạng tích hợp Android/iOS (có thể sử dụng đám mây)';

  @override
  String get voiceAiEndpoint => 'Điểm cuối Voice AI';

  @override
  String get embeddingModel => 'Mô hình Embedding';

  @override
  String get crossDeviceSync => 'Đồng bộ thiết bị';

  @override
  String get sendToOtherDevices => 'Gửi đến thiết bị khác';

  @override
  String get exportBackupAndSend => 'Xuất sao lưu và gửi qua chia sẻ';

  @override
  String get importFromLocalSend => 'Nhập từ LocalSend';

  @override
  String get selectBackupJson => 'Chọn JSON sao lưu và hợp nhất dữ liệu cục bộ';

  @override
  String get autoGeneration => 'Tự động tạo';

  @override
  String get autoGenerateSummary => 'Tự động tạo tóm tắt';

  @override
  String get generateAiSummaryForNewEntries => 'Tạo tóm tắt AI cho mục mới';

  @override
  String get autoGenerateEmbedding => 'Tự động tạo Embedding';

  @override
  String get generateVectorEmbedding => 'Tạo vector embedding để tìm kiếm';

  @override
  String get enableNetworkSearch => 'Bật tìm kiếm mạng';

  @override
  String get allowOnlineRetrieval =>
      'Cho phép truy xuất trực tuyến để tìm kiếm và chat AI (mặc định tắt)';

  @override
  String get about => 'Giới thiệu';

  @override
  String version(String version) {
    return 'Phiên bản $version';
  }

  @override
  String get database => 'Cơ sở dữ liệu';

  @override
  String get objectBoxWithHnsw => 'ObjectBox với chỉ mục HNSW';

  @override
  String get logOut => 'Đăng xuất';

  @override
  String get custom => 'Tùy chỉnh';

  @override
  String get openAiCompatible => 'Tương thích OpenAI';

  @override
  String get notSet => 'Chưa đặt';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... hoặc http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'Hỗ trợ điểm cuối cục bộ/LAN/công cộng';

  @override
  String get shiguangLocalSendBackup => 'Sao lưu LocalSend Thời Gian';

  @override
  String get localBackupFromShiguang =>
      'Sao lưu cục bộ từ Thời Gian (nhận qua LocalSend)';

  @override
  String get selectBackupFileFromLocalSend => 'Chọn tệp sao lưu từ LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Không thể phân giải đường dẫn tệp đã chọn';

  @override
  String get importOptions => 'Tùy chọn nhập';

  @override
  String get importSettingsAsWell =>
      'Cũng nhập cài đặt?\n(Khóa API sẽ không bị ghi đè)';

  @override
  String get dataOnly => 'Chỉ dữ liệu';

  @override
  String get dataAndSettings => 'Dữ liệu + Cài đặt';

  @override
  String get importCompleted => 'Hoàn tất nhập';

  @override
  String get settingsInBackupWereApplied =>
      'Cài đặt trong sao lưu đã được áp dụng.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Cài đặt trong sao lưu chưa được áp dụng.';

  @override
  String get ok => 'ĐƯỢC RỒI';

  @override
  String get cancel => 'Hủy';

  @override
  String get save => 'Lưu';

  @override
  String get delete => 'Xóa';

  @override
  String get clear => 'Xóa';

  @override
  String get add => 'Thêm';

  @override
  String get create => 'Tạo';

  @override
  String get edit => 'Sửa';

  @override
  String get search => 'Tìm kiếm';

  @override
  String get areYouSureYouWantToLogOut =>
      'Bạn có chắc chắn muốn đăng xuất không?';

  @override
  String get chooseLanguage => 'Chọn ngôn ngữ';

  @override
  String get databaseInfo => 'Thông tin cơ sở dữ liệu';

  @override
  String get storage => 'Lưu trữ: ObjectBox';

  @override
  String get vectorIndex => 'Chỉ mục vector: HNSW';

  @override
  String get dimensions => 'Kích thước: 384';

  @override
  String get embeddingModelBge => 'Mô hình Embedding: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Chụp ảnh';

  @override
  String get chooseFromGallery => 'Chọn từ thư viện';

  @override
  String get editNickname => 'Sửa biệt danh';

  @override
  String get enterNickname => 'Nhập biệt danh';

  @override
  String get pleaseEnterNickname => 'Vui lòng nhập biệt danh';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Biệt danh đã tồn tại hoặc không hợp lệ';

  @override
  String get user => 'Người dùng';

  @override
  String get manageScheduledReminders =>
      'Quản lý nhắc nhở và báo thức đã lên lịch';

  @override
  String get imageFailedToLoad => 'Tải ảnh thất bại. Vui lòng chọn lại.';

  @override
  String get imageIsStillLoading => 'Ảnh đang tải';

  @override
  String get imageAreaNotReady =>
      'Khu vực ảnh chưa sẵn sàng. Vui lòng thử lại.';

  @override
  String get cropFrameNotReady => 'Khung cắt chưa sẵn sàng. Vui lòng thử lại.';

  @override
  String get invalidCropArea => 'Vùng cắt không hợp lệ. Vui lòng thử lại.';

  @override
  String get cropFailed => 'Cắt thất bại. Vui lòng thử lại.';

  @override
  String get cropAvatar => 'Cắt ảnh đại diện';

  @override
  String get chooseAgain => 'Chọn lại';

  @override
  String get rotate90 => 'Xoay 90°';

  @override
  String get dragFrameToMove =>
      'Kéo khung để di chuyển, kéo góc dưới phải để thay đổi kích thước; chụm để phóng to và di chuyển ảnh.';

  @override
  String get pleaseFillInAllFields => 'Vui lòng điền tất cả các trường';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN phải có ít nhất 4 chữ số';

  @override
  String get pinAtLeast4Digits => 'PIN ít nhất 4 chữ số';

  @override
  String get invalidUsernameOrPin => 'Tên người dùng hoặc PIN không hợp lệ';

  @override
  String get invalidUsernameOrPinError =>
      'Tên người dùng hoặc PIN không hợp lệ';

  @override
  String get usernameAlreadyExists => 'Tên người dùng đã tồn tại';

  @override
  String get captureMomentsKeepMemories => 'Ghi lại khoảnh khắc, lưu giữ ký ức';

  @override
  String get username => 'Tên người dùng';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Đăng nhập';

  @override
  String get createAccount => 'Tạo tài khoản';

  @override
  String get dontHaveAccountCreateOne => 'Chưa có tài khoản? Tạo một tài khoản';

  @override
  String get alreadyHaveAccountLogin => 'Đã có tài khoản? Đăng nhập';

  @override
  String get pleaseEnterUsername => 'Vui lòng nhập tên người dùng';

  @override
  String get pinsDoNotMatch => 'PIN không khớp';

  @override
  String get tapToAddAvatar => 'Nhấn để thêm ảnh đại diện';

  @override
  String get yourName => 'Tên của bạn';

  @override
  String get privatePinOptional => 'PIN riêng tư (tùy chọn)';

  @override
  String get usedToEncryptPrivateRecords => 'Dùng để mã hóa bản ghi riêng tư';

  @override
  String get privatePin => 'PIN riêng tư';

  @override
  String get leaveEmptyForNoEncryption => 'Để trống nếu không mã hóa';

  @override
  String get confirmPin => 'Xác nhận PIN';

  @override
  String get getStarted => 'Bắt đầu';

  @override
  String get noReminders => 'Không có nhắc nhở';

  @override
  String get addReminder => 'Thêm nhắc nhở';

  @override
  String get title => 'Tiêu đề';

  @override
  String get descriptionOptional => 'Mô tả (tùy chọn)';

  @override
  String get microphonePermissionRequired => 'Cần quyền microphone';

  @override
  String get aiAssistant => 'Trợ lý AI';

  @override
  String get listening => 'Đang lắng nghe...';

  @override
  String get typeAMessage => 'Nhập tin nhắn...';

  @override
  String get aiChat => 'Chat AI';

  @override
  String get startAConversation => 'Bắt đầu cuộc trò chuyện';

  @override
  String get typeYourMessage => 'Nhập tin nhắn của bạn...';

  @override
  String get asrReconnecting => 'ASR đang kết nối lại...';

  @override
  String get write => 'Viết';

  @override
  String get writeEntry => 'Viết bài';

  @override
  String get noMemoriesYet => 'Chưa có ký ức';

  @override
  String get tapPlusToCapture => 'Nhấn + để ghi lại suy nghĩ của bạn';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Nhấn + để ghi lại suy nghĩ của bạn';

  @override
  String get deleteMemory => 'Xóa ký ức';

  @override
  String get deleteRecord => 'Xóa bản ghi';

  @override
  String get thisEntryWillBeRemoved => 'Mục này sẽ bị xóa khỏi dòng thời gian.';

  @override
  String get thisRecordWillBeRemoved =>
      'Bản ghi này sẽ bị xóa khỏi dòng thời gian.';

  @override
  String get searchYourRecords => 'Tìm kiếm bản ghi của bạn...';

  @override
  String get exactMatches => 'Kết quả chính xác';

  @override
  String get noExactMatches => 'Không có kết quả chính xác';

  @override
  String get exact => 'Chính xác';

  @override
  String get exactMatch => 'Kết quả hoàn chỉnh';

  @override
  String get fuzzyMatches => 'Kết quả mờ';

  @override
  String get noFuzzyMatches => 'Không có kết quả mờ';

  @override
  String get vectorMatch => 'Kết quả vector';

  @override
  String get networkMatches => 'Kết quả mạng';

  @override
  String get noNetworkMatches => 'Không có kết quả mạng';

  @override
  String get networkSearchIsOff =>
      'Tìm kiếm mạng đã tắt. Vui lòng bật trong cài đặt.';

  @override
  String get network => 'Mạng';

  @override
  String get networkMatch => 'Kết quả mạng';

  @override
  String get noSearchHistory => 'Không có lịch sử tìm kiếm';

  @override
  String get searchHistory => 'Lịch sử tìm kiếm';

  @override
  String get invalidLink => 'Liên kết không hợp lệ';

  @override
  String get unableToOpenWebPage => 'Không thể mở trang web';

  @override
  String get imageMemory => '[Ký ức hình ảnh]';

  @override
  String get tapToOpenWebPage => 'Nhấn để mở trang web';

  @override
  String get editEntry => 'Sửa bài viết';

  @override
  String get entryDetails => 'Chi tiết bài viết';

  @override
  String get noContent => 'Không có nội dung';

  @override
  String get diaryNotFound => 'Không tìm thấy nhật ký';

  @override
  String get diaryNotFoundShort => 'Không tìm thấy bản ghi';

  @override
  String get aiSummary => 'Tóm tắt AI';

  @override
  String get microphoneInterrupted => 'Microphone bị gián đoạn, ghi âm dừng.';

  @override
  String get bold => 'Đậm';

  @override
  String get italic => 'Nghiêng';

  @override
  String get strikethrough => 'Gạch ngang';

  @override
  String get image => 'Hình ảnh';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR không khả dụng. Ghi âm vẫn đang hoạt động.';

  @override
  String get writeYourEntry => 'Viết bài của bạn...';

  @override
  String get writeYourContent => 'Viết nội dung của bạn...';

  @override
  String microphoneStartFailed(String error) {
    return 'Khởi động microphone thất bại: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Microphone bị gián đoạn, ghi âm đã dừng';

  @override
  String asrReconnectingError(String error) {
    return 'Đang kết nối lại nhận dạng giọng nói: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Đã chèn hình ảnh: $name';
  }

  @override
  String voiceError(String error) {
    return 'Lỗi giọng nói: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Xin lỗi, dịch vụ AI tạm thời không khả dụng: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Chia sẻ thất bại: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count kết quả';
  }

  @override
  String matchCount(int count) {
    return 'Khớp: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Nguồn: $source';
  }

  @override
  String get createNew => 'Tạo mới';

  @override
  String micStartFailed(String error) {
    return 'Khởi động mic thất bại: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Tài khoản: +$created / cập nhật $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Nhật ký: +$created / cập nhật $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Nhắc nhở: +$created / cập nhật $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Bỏ qua: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Tổng thay đổi: $count';
  }

  @override
  String get settingsApplied => 'Cài đặt trong sao lưu đã được áp dụng.';

  @override
  String get settingsNotApplied => 'Cài đặt trong sao lưu chưa được áp dụng.';

  @override
  String backupExported(String path) {
    return 'Sao lưu đã xuất: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Xuất thất bại: $error';
  }

  @override
  String importFailed(String error) {
    return 'Nhập thất bại: $error';
  }
}

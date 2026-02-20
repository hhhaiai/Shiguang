// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get languageName => '简体中文';

  @override
  String get languageNameEn => 'Chinese (Simplified)';

  @override
  String get appTitle => '拾光';

  @override
  String get settings => '设置';

  @override
  String get account => '账户';

  @override
  String get reminders => '提醒';

  @override
  String get language => '语言';

  @override
  String get appLanguage => '应用语言';

  @override
  String get appearance => '外观';

  @override
  String get themeMode => '主题模式';

  @override
  String get dark => '深色';

  @override
  String get light => '浅色';

  @override
  String get system => '跟随系统';

  @override
  String get aiService => 'AI 服务';

  @override
  String get aiChatProvider => 'AI 对话提供商';

  @override
  String get chatModel => '对话模型';

  @override
  String get localModel => '本地模型';

  @override
  String get localModelDefault => '本地模型（默认）';

  @override
  String get ollamaEndpoint => 'Ollama 端点';

  @override
  String get ollamaModel => 'Ollama 模型';

  @override
  String get openAiEndpoint => 'OpenAI 端点';

  @override
  String get openAiApiKey => 'OpenAI API 密钥';

  @override
  String get openAiModel => 'OpenAI 模型';

  @override
  String get geminiEndpoint => 'Gemini 端点';

  @override
  String get geminiApiKey => 'Gemini API 密钥';

  @override
  String get geminiModel => 'Gemini 模型';

  @override
  String get anthropicEndpoint => 'Anthropic 端点';

  @override
  String get anthropicApiKey => 'Anthropic API 密钥';

  @override
  String get anthropicModel => 'Anthropic 模型';

  @override
  String get customProtocol => '自定义协议';

  @override
  String get protocol => '协议';

  @override
  String get customEndpoint => '自定义端点';

  @override
  String get customApiKey => '自定义 API 密钥';

  @override
  String get customModel => '自定义模型';

  @override
  String get optionalForLocalServers => '本地/自定义服务器可选';

  @override
  String get speechRecognitionEngine => '语音识别引擎';

  @override
  String get local => '本地';

  @override
  String get endpoint => '端点';

  @override
  String get localSpeechModel => '本地语音模型';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX（设备端）';

  @override
  String get systemSpeechRecognition => '系统语音识别';

  @override
  String get systemRecognitionAndroidIos => '系统识别（Android/iOS）';

  @override
  String get endpointRecognitionCloudWs => '端点识别（云/WS）';

  @override
  String get useBuiltInRecognizer => '使用 Android/iOS 内置识别器（可能使用云）';

  @override
  String get voiceAiEndpoint => '语音 AI 端点';

  @override
  String get embeddingModel => 'Embedding 模型';

  @override
  String get crossDeviceSync => '跨设备同步';

  @override
  String get sendToOtherDevices => '发送到其他设备（LocalSend）';

  @override
  String get exportBackupAndSend => '导出备份并通过分享发送';

  @override
  String get importFromLocalSend => '从 LocalSend 导入';

  @override
  String get selectBackupJson => '选择备份 JSON 并合并本地数据';

  @override
  String get autoGeneration => '自动生成';

  @override
  String get autoGenerateSummary => '自动生成摘要';

  @override
  String get generateAiSummaryForNewEntries => '为新条目生成 AI 摘要';

  @override
  String get autoGenerateEmbedding => '自动生成 Embedding';

  @override
  String get generateVectorEmbedding => '生成向量 Embedding 用于搜索';

  @override
  String get enableNetworkSearch => '启用网络搜索';

  @override
  String get allowOnlineRetrieval => '允许在线检索用于搜索和 AI 对话（默认关闭）';

  @override
  String get about => '关于';

  @override
  String version(String version) {
    return '版本 $version';
  }

  @override
  String get database => '数据库';

  @override
  String get objectBoxWithHnsw => 'ObjectBox with HNSW 索引';

  @override
  String get logOut => '退出登录';

  @override
  String get custom => '自定义';

  @override
  String get openAiCompatible => 'OpenAI 兼容';

  @override
  String get notSet => '未设置';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... 或 http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => '支持本地/LAN/公网端点';

  @override
  String get shiguangLocalSendBackup => '拾光 LocalSend 备份';

  @override
  String get localBackupFromShiguang => '拾光本地备份（通过 LocalSend 接收）';

  @override
  String get selectBackupFileFromLocalSend => '选择从 LocalSend 接收的备份文件';

  @override
  String get failedToResolveFilePath => '无法解析所选文件路径';

  @override
  String get importOptions => '导入选项';

  @override
  String get importSettingsAsWell => '是否同时导入设置？\n（API 密钥不会被覆盖）';

  @override
  String get dataOnly => '仅导入数据';

  @override
  String get dataAndSettings => '数据 + 设置';

  @override
  String get importCompleted => '导入完成';

  @override
  String get settingsInBackupWereApplied => '备份中的设置已应用。';

  @override
  String get settingsInBackupWereNotApplied => '备份中的设置未应用。';

  @override
  String get ok => '确定';

  @override
  String get cancel => '取消';

  @override
  String get save => '保存';

  @override
  String get delete => '删除';

  @override
  String get clear => '清除';

  @override
  String get add => '添加';

  @override
  String get create => '新建';

  @override
  String get edit => '编辑';

  @override
  String get search => '搜索';

  @override
  String get areYouSureYouWantToLogOut => '确定要退出登录吗？';

  @override
  String get chooseLanguage => '选择语言';

  @override
  String get databaseInfo => '数据库信息';

  @override
  String get storage => '存储：ObjectBox';

  @override
  String get vectorIndex => '向量索引：HNSW';

  @override
  String get dimensions => '维度：384';

  @override
  String get embeddingModelBge => 'Embedding 模型：bge-small-zh-v1.5';

  @override
  String get takePhoto => '拍摄';

  @override
  String get chooseFromGallery => '从相册选择';

  @override
  String get editNickname => '修改昵称';

  @override
  String get enterNickname => '输入昵称';

  @override
  String get pleaseEnterNickname => '请输入昵称';

  @override
  String get nicknameAlreadyExistsOrInvalid => '昵称已存在或无效';

  @override
  String get user => '用户';

  @override
  String get manageScheduledReminders => '管理计划的提醒和闹钟';

  @override
  String get imageFailedToLoad => '图片加载失败，请重新选择。';

  @override
  String get imageIsStillLoading => '图片仍在加载中';

  @override
  String get imageAreaNotReady => '图片区域未就绪，请重试。';

  @override
  String get cropFrameNotReady => '裁剪框未就绪，请重试。';

  @override
  String get invalidCropArea => '裁剪区域无效，请重试。';

  @override
  String get cropFailed => '裁剪失败，请重试。';

  @override
  String get cropAvatar => '裁剪头像';

  @override
  String get chooseAgain => '重新选择';

  @override
  String get rotate90 => '旋转 90°';

  @override
  String get dragFrameToMove => '拖动框架移动，拖动右下角调整大小；双指缩放和移动图片。';

  @override
  String get pleaseFillInAllFields => '请填写所有字段';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN 至少需要 4 位数字';

  @override
  String get pinAtLeast4Digits => 'PIN 至少 4 位';

  @override
  String get invalidUsernameOrPin => '用户名或 PIN 无效';

  @override
  String get invalidUsernameOrPinError => '用户名或 PIN 错误';

  @override
  String get usernameAlreadyExists => '用户名已存在';

  @override
  String get captureMomentsKeepMemories => '捕捉瞬间，保存回忆';

  @override
  String get username => '用户名';

  @override
  String get pin => 'PIN';

  @override
  String get login => '登录';

  @override
  String get createAccount => '创建账户';

  @override
  String get dontHaveAccountCreateOne => '没有账户？创建一个';

  @override
  String get alreadyHaveAccountLogin => '已有账户？登录';

  @override
  String get pleaseEnterUsername => '请输入用户名';

  @override
  String get pinsDoNotMatch => 'PIN 不匹配';

  @override
  String get tapToAddAvatar => '点击添加头像';

  @override
  String get yourName => '你的名字';

  @override
  String get privatePinOptional => '私密 PIN（可选）';

  @override
  String get usedToEncryptPrivateRecords => '用于加密私密记录';

  @override
  String get privatePin => '私密 PIN';

  @override
  String get leaveEmptyForNoEncryption => '留空则不加密';

  @override
  String get confirmPin => '确认 PIN';

  @override
  String get getStarted => '开始';

  @override
  String get noReminders => '暂无提醒';

  @override
  String get addReminder => '添加提醒';

  @override
  String get title => '标题';

  @override
  String get descriptionOptional => '描述（可选）';

  @override
  String get microphonePermissionRequired => '需要麦克风权限';

  @override
  String get aiAssistant => 'AI 助手';

  @override
  String get listening => '正在倾听...';

  @override
  String get typeAMessage => '输入消息...';

  @override
  String get aiChat => 'AI 对话';

  @override
  String get startAConversation => '开始对话';

  @override
  String get typeYourMessage => '输入你的消息...';

  @override
  String get asrReconnecting => 'ASR 重新连接中...';

  @override
  String get write => '写作';

  @override
  String get writeEntry => '写文章';

  @override
  String get noMemoriesYet => '暂无记忆';

  @override
  String get tapPlusToCapture => '点击 + 捕捉你的想法';

  @override
  String get tapPlusToCaptureYourThoughts => '点击 + 记录你的想法';

  @override
  String get deleteMemory => '删除记忆';

  @override
  String get deleteRecord => '删除记录';

  @override
  String get thisEntryWillBeRemoved => '此条目将从时间线中移除。';

  @override
  String get thisRecordWillBeRemoved => '这条记录将从时间线移除。';

  @override
  String get searchYourRecords => '搜索你的记录...';

  @override
  String get exactMatches => '精确匹配';

  @override
  String get noExactMatches => '无精确匹配';

  @override
  String get exact => '精确';

  @override
  String get exactMatch => '完整匹配';

  @override
  String get fuzzyMatches => '模糊匹配';

  @override
  String get noFuzzyMatches => '无模糊匹配';

  @override
  String get vectorMatch => '向量匹配';

  @override
  String get networkMatches => '网络匹配';

  @override
  String get noNetworkMatches => '无网络匹配';

  @override
  String get networkSearchIsOff => '网络搜索已关闭，请在设置中启用。';

  @override
  String get network => '网络';

  @override
  String get networkMatch => '网络匹配';

  @override
  String get noSearchHistory => '无搜索历史';

  @override
  String get searchHistory => '搜索历史';

  @override
  String get invalidLink => '链接无效';

  @override
  String get unableToOpenWebPage => '无法打开网页';

  @override
  String get imageMemory => '[图片记忆]';

  @override
  String get tapToOpenWebPage => '点击打开网页';

  @override
  String get editEntry => '编辑文章';

  @override
  String get entryDetails => '文章详情';

  @override
  String get noContent => '暂无内容';

  @override
  String get diaryNotFound => '日记未找到';

  @override
  String get diaryNotFoundShort => '未找到该记录';

  @override
  String get aiSummary => 'AI 摘要';

  @override
  String get microphoneInterrupted => '麦克风中断，录音停止。';

  @override
  String get bold => '粗体';

  @override
  String get italic => '斜体';

  @override
  String get strikethrough => '删除线';

  @override
  String get image => '图片';

  @override
  String get asrUnavailableRecordingActive => 'ASR 不可用，录音仍在进行中。';

  @override
  String get writeYourEntry => '写下你的文章...';

  @override
  String get writeYourContent => '写下正文...';

  @override
  String microphoneStartFailed(String error) {
    return '麦克风启动失败: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped => '麦克风中断，录音已停止';

  @override
  String asrReconnectingError(String error) {
    return '语音识别重连中: $error';
  }

  @override
  String imageInserted(String name) {
    return '已插入图片: $name';
  }

  @override
  String voiceError(String error) {
    return '语音错误: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return '抱歉，AI 服务暂时不可用: $error';
  }

  @override
  String shareFailed(String error) {
    return '分享失败: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count处';
  }

  @override
  String matchCount(int count) {
    return '匹配:$count';
  }

  @override
  String sourceFromNetwork(String source) {
    return '来源: $source';
  }

  @override
  String get createNew => '新建';

  @override
  String micStartFailed(String error) {
    return '麦克风启动失败: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return '账号: +$created / 更新 $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return '日记: +$created / 更新 $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return '提醒: +$created / 更新 $updated';
  }

  @override
  String importResultSkipped(int count) {
    return '跳过: $count';
  }

  @override
  String importResultTotal(int count) {
    return '总变更: $count';
  }

  @override
  String get settingsApplied => '已应用备份中的设置项。';

  @override
  String get settingsNotApplied => '未应用备份中的设置项。';

  @override
  String backupExported(String path) {
    return '备份已导出: $path';
  }

  @override
  String exportFailed(String error) {
    return '导出失败: $error';
  }

  @override
  String importFailed(String error) {
    return '导入失败: $error';
  }
}

/// The translations for Chinese, as used in Hong Kong (`zh_HK`).
class AppLocalizationsZhHk extends AppLocalizationsZh {
  AppLocalizationsZhHk() : super('zh_HK');

  @override
  String get languageName => '繁體中文(香港)';

  @override
  String get languageNameEn => 'Chinese (Traditional, Hong Kong)';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => '設定';

  @override
  String get account => '帳戶';

  @override
  String get reminders => '提醒';

  @override
  String get language => '語言';

  @override
  String get appLanguage => '應用語言';

  @override
  String get appearance => '外觀';

  @override
  String get themeMode => '主題模式';

  @override
  String get dark => '深色';

  @override
  String get light => '淺色';

  @override
  String get system => '跟隨系統';

  @override
  String get aiService => 'AI 服務';

  @override
  String get aiChatProvider => 'AI 對話供應商';

  @override
  String get chatModel => '對話模型';

  @override
  String get localModel => '本地模型';

  @override
  String get localModelDefault => '本地模型（預設）';

  @override
  String get ollamaEndpoint => 'Ollama 端點';

  @override
  String get ollamaModel => 'Ollama 模型';

  @override
  String get openAiEndpoint => 'OpenAI 端點';

  @override
  String get openAiApiKey => 'OpenAI API 金鑰';

  @override
  String get openAiModel => 'OpenAI 模型';

  @override
  String get geminiEndpoint => 'Gemini 端點';

  @override
  String get geminiApiKey => 'Gemini API 金鑰';

  @override
  String get geminiModel => 'Gemini 模型';

  @override
  String get anthropicEndpoint => 'Anthropic 端點';

  @override
  String get anthropicApiKey => 'Anthropic API 金鑰';

  @override
  String get anthropicModel => 'Anthropic 模型';

  @override
  String get customProtocol => '自訂協議';

  @override
  String get protocol => '協議';

  @override
  String get customEndpoint => '自訂端點';

  @override
  String get customApiKey => '自訂 API 金鑰';

  @override
  String get customModel => '自訂模型';

  @override
  String get optionalForLocalServers => '本地/自訂伺服器可選';

  @override
  String get speechRecognitionEngine => '語音識別引擎';

  @override
  String get local => '本地';

  @override
  String get endpoint => '端點';

  @override
  String get localSpeechModel => '本地語音模型';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX（裝置端）';

  @override
  String get systemSpeechRecognition => '系統語音識別';

  @override
  String get systemRecognitionAndroidIos => '系統識別';

  @override
  String get endpointRecognitionCloudWs => '端點識別（雲/WS）';

  @override
  String get useBuiltInRecognizer => '使用 Android/iOS 內建識別器（可能使用雲）';

  @override
  String get voiceAiEndpoint => '語音 AI 端點';

  @override
  String get embeddingModel => 'Embedding 模型';

  @override
  String get crossDeviceSync => '跨裝置同步';

  @override
  String get sendToOtherDevices => '傳送到其他裝置';

  @override
  String get exportBackupAndSend => '匯出備份並透過分享傳送';

  @override
  String get importFromLocalSend => '從 LocalSend 匯入';

  @override
  String get selectBackupJson => '選擇備份 JSON 並合併本地資料';

  @override
  String get autoGeneration => '自動產生';

  @override
  String get autoGenerateSummary => '自動產生摘要';

  @override
  String get generateAiSummaryForNewEntries => '為新項目產生 AI 摘要';

  @override
  String get autoGenerateEmbedding => '自動產生 Embedding';

  @override
  String get generateVectorEmbedding => '產生向量 Embedding 用於搜尋';

  @override
  String get enableNetworkSearch => '啟用網路搜尋';

  @override
  String get allowOnlineRetrieval => '允許線上檢索用於搜尋和 AI 對話（預設關閉）';

  @override
  String get about => '關於';

  @override
  String version(String version) {
    return '版本 $version';
  }

  @override
  String get database => '資料庫';

  @override
  String get objectBoxWithHnsw => 'ObjectBox with HNSW 索引';

  @override
  String get logOut => '登出';

  @override
  String get custom => '自訂';

  @override
  String get openAiCompatible => 'OpenAI 相容';

  @override
  String get notSet => '未設定';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... 或 http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => '支援本地/LAN/公網端點';

  @override
  String get shiguangLocalSendBackup => '拾光 LocalSend 備份';

  @override
  String get localBackupFromShiguang => '拾光本地備份（透過 LocalSend 接收）';

  @override
  String get selectBackupFileFromLocalSend => '選擇從 LocalSend 接收的備份檔案';

  @override
  String get failedToResolveFilePath => '無法解析所選檔案路徑';

  @override
  String get importOptions => '匯入選項';

  @override
  String get importSettingsAsWell => '是否同時匯入設定？\n（API 金鑰不會被覆寫）';

  @override
  String get dataOnly => '僅匯入資料';

  @override
  String get dataAndSettings => '資料 + 設定';

  @override
  String get importCompleted => '匯入完成';

  @override
  String get settingsInBackupWereApplied => '備份中的設定已套用。';

  @override
  String get settingsInBackupWereNotApplied => '備份中的設定未套用。';

  @override
  String get ok => '確定';

  @override
  String get cancel => '取消';

  @override
  String get save => '儲存';

  @override
  String get delete => '刪除';

  @override
  String get clear => '清除';

  @override
  String get add => '新增';

  @override
  String get create => '建立';

  @override
  String get edit => '編輯';

  @override
  String get search => '搜尋';

  @override
  String get areYouSureYouWantToLogOut => '確定要登出嗎？';

  @override
  String get chooseLanguage => '選擇語言';

  @override
  String get databaseInfo => '資料庫資訊';

  @override
  String get storage => '儲存：ObjectBox';

  @override
  String get vectorIndex => '向量索引：HNSW';

  @override
  String get dimensions => '維度：384';

  @override
  String get embeddingModelBge => 'Embedding 模型：bge-small-zh-v1.5';

  @override
  String get takePhoto => '拍攝';

  @override
  String get chooseFromGallery => '從相簿選擇';

  @override
  String get editNickname => '修改暱稱';

  @override
  String get enterNickname => '輸入暱稱';

  @override
  String get pleaseEnterNickname => '請輸入暱稱';

  @override
  String get nicknameAlreadyExistsOrInvalid => '暱稱已存在或無效';

  @override
  String get user => '使用者';

  @override
  String get manageScheduledReminders => '管理計畫的提醒和鬧鐘';

  @override
  String get imageFailedToLoad => '圖片載入失敗，請重新選擇。';

  @override
  String get imageIsStillLoading => '圖片仍在載入中';

  @override
  String get imageAreaNotReady => '圖片區域未就緒，請重試。';

  @override
  String get cropFrameNotReady => '裁剪框未就緒，請重試。';

  @override
  String get invalidCropArea => '裁剪區域無效，請重試。';

  @override
  String get cropFailed => '裁剪失敗，請重試。';

  @override
  String get cropAvatar => '裁剪頭像';

  @override
  String get chooseAgain => '重新選擇';

  @override
  String get rotate90 => '旋轉 90°';

  @override
  String get dragFrameToMove => '拖動框架移動，拖動右下角調整大小；雙指縮放和移動圖片。';

  @override
  String get pleaseFillInAllFields => '請填寫所有欄位';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN 至少需要 4 位數字';

  @override
  String get pinAtLeast4Digits => 'PIN 至少 4 位';

  @override
  String get invalidUsernameOrPin => '使用者名稱或 PIN 無效';

  @override
  String get invalidUsernameOrPinError => '使用者名稱或 PIN 錯誤';

  @override
  String get usernameAlreadyExists => '使用者名稱已存在';

  @override
  String get captureMomentsKeepMemories => '捕捉瞬間，儲存回憶';

  @override
  String get username => '使用者名稱';

  @override
  String get pin => 'PIN';

  @override
  String get login => '登入';

  @override
  String get createAccount => '建立帳戶';

  @override
  String get dontHaveAccountCreateOne => '沒有帳戶？建立一個';

  @override
  String get alreadyHaveAccountLogin => '已有帳戶？登入';

  @override
  String get pleaseEnterUsername => '請輸入使用者名稱';

  @override
  String get pinsDoNotMatch => 'PIN 不符合';

  @override
  String get tapToAddAvatar => '點擊新增頭像';

  @override
  String get yourName => '你的名字';

  @override
  String get privatePinOptional => '私密 PIN（可選）';

  @override
  String get usedToEncryptPrivateRecords => '用於加密私密記錄';

  @override
  String get privatePin => '私密 PIN';

  @override
  String get leaveEmptyForNoEncryption => '留空則不加密';

  @override
  String get confirmPin => '確認 PIN';

  @override
  String get getStarted => '開始';

  @override
  String get noReminders => '暫無提醒';

  @override
  String get addReminder => '新增提醒';

  @override
  String get title => '標題';

  @override
  String get descriptionOptional => '描述（可選）';

  @override
  String get microphonePermissionRequired => '需要麥克風權限';

  @override
  String get aiAssistant => 'AI 助手';

  @override
  String get listening => '正在傾聽...';

  @override
  String get typeAMessage => '輸入訊息...';

  @override
  String get aiChat => 'AI 對話';

  @override
  String get startAConversation => '開始對話';

  @override
  String get typeYourMessage => '輸入你的訊息...';

  @override
  String get asrReconnecting => 'ASR 重新連線中...';

  @override
  String get write => '寫作';

  @override
  String get writeEntry => '寫文章';

  @override
  String get noMemoriesYet => '暫無回憶';

  @override
  String get tapPlusToCapture => '點擊 + 捕捉你的想法';

  @override
  String get tapPlusToCaptureYourThoughts => '點擊 + 記錄你的想法';

  @override
  String get deleteMemory => '刪除回憶';

  @override
  String get deleteRecord => '刪除記錄';

  @override
  String get thisEntryWillBeRemoved => '此項目將從時間線中移除。';

  @override
  String get thisRecordWillBeRemoved => '這筆記錄將從時間線移除。';

  @override
  String get searchYourRecords => '搜尋你的記錄...';

  @override
  String get exactMatches => '精確匹配';

  @override
  String get noExactMatches => '無精確匹配';

  @override
  String get exact => '精確';

  @override
  String get exactMatch => '完整匹配';

  @override
  String get fuzzyMatches => '模糊匹配';

  @override
  String get noFuzzyMatches => '無模糊匹配';

  @override
  String get vectorMatch => '向量匹配';

  @override
  String get networkMatches => '網路匹配';

  @override
  String get noNetworkMatches => '無網路匹配';

  @override
  String get networkSearchIsOff => '網路搜尋已關閉，請在設定中啟用。';

  @override
  String get network => '網路';

  @override
  String get networkMatch => '網路匹配';

  @override
  String get noSearchHistory => '無搜尋歷史';

  @override
  String get searchHistory => '搜尋歷史';

  @override
  String get invalidLink => '連結無效';

  @override
  String get unableToOpenWebPage => '無法開啟網頁';

  @override
  String get imageMemory => '[圖片回憶]';

  @override
  String get tapToOpenWebPage => '點擊開啟網頁';

  @override
  String get editEntry => '編輯文章';

  @override
  String get entryDetails => '文章詳情';

  @override
  String get noContent => '暫無內容';

  @override
  String get diaryNotFound => '日記未找到';

  @override
  String get diaryNotFoundShort => '未找到該記錄';

  @override
  String get aiSummary => 'AI 摘要';

  @override
  String get microphoneInterrupted => '麥克風中斷，錄音停止。';

  @override
  String get bold => '粗體';

  @override
  String get italic => '斜體';

  @override
  String get strikethrough => '刪除線';

  @override
  String get image => '圖片';

  @override
  String get asrUnavailableRecordingActive => 'ASR 不可用，錄音仍在進行中。';

  @override
  String get writeYourEntry => '寫下你的文章...';

  @override
  String get writeYourContent => '寫下正文...';

  @override
  String microphoneStartFailed(String error) {
    return '麥克風啟動失敗: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped => '麥克風中斷，錄音已停止。';

  @override
  String asrReconnectingError(String error) {
    return '語音識別重連中: $error';
  }

  @override
  String imageInserted(String name) {
    return '已插入圖片: $name';
  }

  @override
  String voiceError(String error) {
    return '語音錯誤: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return '抱歉，AI 服務暫時不可用: $error';
  }

  @override
  String shareFailed(String error) {
    return '分享失敗: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count處';
  }

  @override
  String matchCount(int count) {
    return '匹配: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return '來源: $source';
  }

  @override
  String get createNew => '新建';

  @override
  String micStartFailed(String error) {
    return '麥克風啟動失敗: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return '帳戶: +$created / 更新 $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return '日記: +$created / 更新 $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return '提醒: +$created / 更新 $updated';
  }

  @override
  String importResultSkipped(int count) {
    return '跳過: $count';
  }

  @override
  String importResultTotal(int count) {
    return '總計變更: $count';
  }

  @override
  String get settingsApplied => '備份中的設定已套用。';

  @override
  String get settingsNotApplied => '備份中的設定未套用。';

  @override
  String backupExported(String path) {
    return '備份已匯出: $path';
  }

  @override
  String exportFailed(String error) {
    return '匯出失敗: $error';
  }

  @override
  String importFailed(String error) {
    return '匯入失敗: $error';
  }
}

/// The translations for Chinese, using the Han script (`zh_Hans`).
class AppLocalizationsZhHans extends AppLocalizationsZh {
  AppLocalizationsZhHans() : super('zh_Hans');

  @override
  String get languageName => '简体中文';

  @override
  String get languageNameEn => 'Chinese (Simplified)';

  @override
  String get appTitle => '拾光';

  @override
  String get settings => '设置';

  @override
  String get account => '账户';

  @override
  String get reminders => '提醒';

  @override
  String get language => '语言';

  @override
  String get appLanguage => '应用语言';

  @override
  String get appearance => '外观';

  @override
  String get themeMode => '主题模式';

  @override
  String get dark => '深色';

  @override
  String get light => '浅色';

  @override
  String get system => '跟随系统';

  @override
  String get aiService => 'AI 服务';

  @override
  String get aiChatProvider => 'AI 对话提供商';

  @override
  String get chatModel => '对话模型';

  @override
  String get localModel => '本地模型';

  @override
  String get localModelDefault => '本地模型（默认）';

  @override
  String get ollamaEndpoint => 'Ollama 端点';

  @override
  String get ollamaModel => 'Ollama 模型';

  @override
  String get openAiEndpoint => 'OpenAI 端点';

  @override
  String get openAiApiKey => 'OpenAI API 密钥';

  @override
  String get openAiModel => 'OpenAI 模型';

  @override
  String get geminiEndpoint => 'Gemini 端点';

  @override
  String get geminiApiKey => 'Gemini API 密钥';

  @override
  String get geminiModel => 'Gemini 模型';

  @override
  String get anthropicEndpoint => 'Anthropic 端点';

  @override
  String get anthropicApiKey => 'Anthropic API 密钥';

  @override
  String get anthropicModel => 'Anthropic 模型';

  @override
  String get customProtocol => '自定义协议';

  @override
  String get protocol => '协议';

  @override
  String get customEndpoint => '自定义端点';

  @override
  String get customApiKey => '自定义 API 密钥';

  @override
  String get customModel => '自定义模型';

  @override
  String get optionalForLocalServers => '本地/自定义服务器可选';

  @override
  String get speechRecognitionEngine => '语音识别引擎';

  @override
  String get local => '本地';

  @override
  String get endpoint => '端点';

  @override
  String get localSpeechModel => '本地语音模型';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX（设备端）';

  @override
  String get systemSpeechRecognition => '系统语音识别';

  @override
  String get systemRecognitionAndroidIos => '系统识别（Android/iOS）';

  @override
  String get endpointRecognitionCloudWs => '端点识别（云/WS）';

  @override
  String get useBuiltInRecognizer => '使用 Android/iOS 内置识别器（可能使用云）';

  @override
  String get voiceAiEndpoint => '语音 AI 端点';

  @override
  String get embeddingModel => 'Embedding 模型';

  @override
  String get crossDeviceSync => '跨设备同步';

  @override
  String get sendToOtherDevices => '发送到其他设备（LocalSend）';

  @override
  String get exportBackupAndSend => '导出备份并通过分享发送';

  @override
  String get importFromLocalSend => '从 LocalSend 导入';

  @override
  String get selectBackupJson => '选择备份 JSON 并合并本地数据';

  @override
  String get autoGeneration => '自动生成';

  @override
  String get autoGenerateSummary => '自动生成摘要';

  @override
  String get generateAiSummaryForNewEntries => '为新条目生成 AI 摘要';

  @override
  String get autoGenerateEmbedding => '自动生成 Embedding';

  @override
  String get generateVectorEmbedding => '生成向量 Embedding 用于搜索';

  @override
  String get enableNetworkSearch => '启用网络搜索';

  @override
  String get allowOnlineRetrieval => '允许在线检索用于搜索和 AI 对话（默认关闭）';

  @override
  String get about => '关于';

  @override
  String version(String version) {
    return '版本 $version';
  }

  @override
  String get database => '数据库';

  @override
  String get objectBoxWithHnsw => 'ObjectBox with HNSW 索引';

  @override
  String get logOut => '退出登录';

  @override
  String get custom => '自定义';

  @override
  String get openAiCompatible => 'OpenAI 兼容';

  @override
  String get notSet => '未设置';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... 或 http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => '支持本地/LAN/公网端点';

  @override
  String get shiguangLocalSendBackup => '拾光 LocalSend 备份';

  @override
  String get localBackupFromShiguang => '拾光本地备份（通过 LocalSend 接收）';

  @override
  String get selectBackupFileFromLocalSend => '选择从 LocalSend 接收的备份文件';

  @override
  String get failedToResolveFilePath => '无法解析所选文件路径';

  @override
  String get importOptions => '导入选项';

  @override
  String get importSettingsAsWell => '是否同时导入设置？\n（API 密钥不会被覆盖）';

  @override
  String get dataOnly => '仅导入数据';

  @override
  String get dataAndSettings => '数据 + 设置';

  @override
  String get importCompleted => '导入完成';

  @override
  String get settingsInBackupWereApplied => '备份中的设置已应用。';

  @override
  String get settingsInBackupWereNotApplied => '备份中的设置未应用。';

  @override
  String get ok => '确定';

  @override
  String get cancel => '取消';

  @override
  String get save => '保存';

  @override
  String get delete => '删除';

  @override
  String get clear => '清除';

  @override
  String get add => '添加';

  @override
  String get create => '新建';

  @override
  String get edit => '编辑';

  @override
  String get search => '搜索';

  @override
  String get areYouSureYouWantToLogOut => '确定要退出登录吗？';

  @override
  String get chooseLanguage => '选择语言';

  @override
  String get databaseInfo => '数据库信息';

  @override
  String get storage => '存储：ObjectBox';

  @override
  String get vectorIndex => '向量索引：HNSW';

  @override
  String get dimensions => '维度：384';

  @override
  String get embeddingModelBge => 'Embedding 模型：bge-small-zh-v1.5';

  @override
  String get takePhoto => '拍摄';

  @override
  String get chooseFromGallery => '从相册选择';

  @override
  String get editNickname => '修改昵称';

  @override
  String get enterNickname => '输入昵称';

  @override
  String get pleaseEnterNickname => '请输入昵称';

  @override
  String get nicknameAlreadyExistsOrInvalid => '昵称已存在或无效';

  @override
  String get user => '用户';

  @override
  String get manageScheduledReminders => '管理计划的提醒和闹钟';

  @override
  String get imageFailedToLoad => '图片加载失败，请重新选择。';

  @override
  String get imageIsStillLoading => '图片仍在加载中';

  @override
  String get imageAreaNotReady => '图片区域未就绪，请重试。';

  @override
  String get cropFrameNotReady => '裁剪框未就绪，请重试。';

  @override
  String get invalidCropArea => '裁剪区域无效，请重试。';

  @override
  String get cropFailed => '裁剪失败，请重试。';

  @override
  String get cropAvatar => '裁剪头像';

  @override
  String get chooseAgain => '重新选择';

  @override
  String get rotate90 => '旋转 90°';

  @override
  String get dragFrameToMove => '拖动框架移动，拖动右下角调整大小；双指缩放和移动图片。';

  @override
  String get pleaseFillInAllFields => '请填写所有字段';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN 至少需要 4 位数字';

  @override
  String get pinAtLeast4Digits => 'PIN 至少 4 位';

  @override
  String get invalidUsernameOrPin => '用户名或 PIN 无效';

  @override
  String get invalidUsernameOrPinError => '用户名或 PIN 错误';

  @override
  String get usernameAlreadyExists => '用户名已存在';

  @override
  String get captureMomentsKeepMemories => '捕捉瞬间，保存回忆';

  @override
  String get username => '用户名';

  @override
  String get pin => 'PIN';

  @override
  String get login => '登录';

  @override
  String get createAccount => '创建账户';

  @override
  String get dontHaveAccountCreateOne => '没有账户？创建一个';

  @override
  String get alreadyHaveAccountLogin => '已有账户？登录';

  @override
  String get pleaseEnterUsername => '请输入用户名';

  @override
  String get pinsDoNotMatch => 'PIN 不匹配';

  @override
  String get tapToAddAvatar => '点击添加头像';

  @override
  String get yourName => '你的名字';

  @override
  String get privatePinOptional => '私密 PIN（可选）';

  @override
  String get usedToEncryptPrivateRecords => '用于加密私密记录';

  @override
  String get privatePin => '私密 PIN';

  @override
  String get leaveEmptyForNoEncryption => '留空则不加密';

  @override
  String get confirmPin => '确认 PIN';

  @override
  String get getStarted => '开始';

  @override
  String get noReminders => '暂无提醒';

  @override
  String get addReminder => '添加提醒';

  @override
  String get title => '标题';

  @override
  String get descriptionOptional => '描述（可选）';

  @override
  String get microphonePermissionRequired => '需要麦克风权限';

  @override
  String get aiAssistant => 'AI 助手';

  @override
  String get listening => '正在倾听...';

  @override
  String get typeAMessage => '输入消息...';

  @override
  String get aiChat => 'AI 对话';

  @override
  String get startAConversation => '开始对话';

  @override
  String get typeYourMessage => '输入你的消息...';

  @override
  String get asrReconnecting => 'ASR 重新连接中...';

  @override
  String get write => '写作';

  @override
  String get writeEntry => '写文章';

  @override
  String get noMemoriesYet => '暂无记忆';

  @override
  String get tapPlusToCapture => '点击 + 捕捉你的想法';

  @override
  String get tapPlusToCaptureYourThoughts => '点击 + 记录你的想法';

  @override
  String get deleteMemory => '删除记忆';

  @override
  String get deleteRecord => '删除记录';

  @override
  String get thisEntryWillBeRemoved => '此条目将从时间线中移除。';

  @override
  String get thisRecordWillBeRemoved => '这条记录将从时间线移除。';

  @override
  String get searchYourRecords => '搜索你的记录...';

  @override
  String get exactMatches => '精确匹配';

  @override
  String get noExactMatches => '无精确匹配';

  @override
  String get exact => '精确';

  @override
  String get exactMatch => '完整匹配';

  @override
  String get fuzzyMatches => '模糊匹配';

  @override
  String get noFuzzyMatches => '无模糊匹配';

  @override
  String get vectorMatch => '向量匹配';

  @override
  String get networkMatches => '网络匹配';

  @override
  String get noNetworkMatches => '无网络匹配';

  @override
  String get networkSearchIsOff => '网络搜索已关闭，请在设置中启用。';

  @override
  String get network => '网络';

  @override
  String get networkMatch => '网络匹配';

  @override
  String get noSearchHistory => '无搜索历史';

  @override
  String get searchHistory => '搜索历史';

  @override
  String get invalidLink => '链接无效';

  @override
  String get unableToOpenWebPage => '无法打开网页';

  @override
  String get imageMemory => '[图片记忆]';

  @override
  String get tapToOpenWebPage => '点击打开网页';

  @override
  String get editEntry => '编辑文章';

  @override
  String get entryDetails => '文章详情';

  @override
  String get noContent => '暂无内容';

  @override
  String get diaryNotFound => '日记未找到';

  @override
  String get diaryNotFoundShort => '未找到该记录';

  @override
  String get aiSummary => 'AI 摘要';

  @override
  String get microphoneInterrupted => '麦克风中断，录音停止。';

  @override
  String get bold => '粗体';

  @override
  String get italic => '斜体';

  @override
  String get strikethrough => '删除线';

  @override
  String get image => '图片';

  @override
  String get asrUnavailableRecordingActive => 'ASR 不可用，录音仍在进行中。';

  @override
  String get writeYourEntry => '写下你的文章...';

  @override
  String get writeYourContent => '写下正文...';

  @override
  String microphoneStartFailed(String error) {
    return '麦克风启动失败: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped => '麦克风中断，录音已停止';

  @override
  String asrReconnectingError(String error) {
    return '语音识别重连中: $error';
  }

  @override
  String imageInserted(String name) {
    return '已插入图片: $name';
  }

  @override
  String voiceError(String error) {
    return '语音错误: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return '抱歉，AI 服务暂时不可用: $error';
  }

  @override
  String shareFailed(String error) {
    return '分享失败: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count处';
  }

  @override
  String matchCount(int count) {
    return '匹配:$count';
  }

  @override
  String sourceFromNetwork(String source) {
    return '来源: $source';
  }

  @override
  String get createNew => '新建';

  @override
  String micStartFailed(String error) {
    return '麦克风启动失败: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return '账号: +$created / 更新 $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return '日记: +$created / 更新 $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return '提醒: +$created / 更新 $updated';
  }

  @override
  String importResultSkipped(int count) {
    return '跳过: $count';
  }

  @override
  String importResultTotal(int count) {
    return '总变更: $count';
  }

  @override
  String get settingsApplied => '已应用备份中的设置项。';

  @override
  String get settingsNotApplied => '未应用备份中的设置项。';

  @override
  String backupExported(String path) {
    return '备份已导出: $path';
  }

  @override
  String exportFailed(String error) {
    return '导出失败: $error';
  }

  @override
  String importFailed(String error) {
    return '导入失败: $error';
  }
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get languageName => '繁體中文(臺灣)';

  @override
  String get languageNameEn => 'Chinese (Traditional, Taiwan)';

  @override
  String get appTitle => '拾光';

  @override
  String get settings => '設定';

  @override
  String get account => '帳戶';

  @override
  String get reminders => '提醒';

  @override
  String get language => '語言';

  @override
  String get appLanguage => '應用語言';

  @override
  String get appearance => '外觀';

  @override
  String get themeMode => '主題模式';

  @override
  String get dark => '深色';

  @override
  String get light => '淺色';

  @override
  String get system => '跟隨系統';

  @override
  String get aiService => 'AI 服務';

  @override
  String get aiChatProvider => 'AI 對話供應商';

  @override
  String get chatModel => '對話模型';

  @override
  String get localModel => '本地模型';

  @override
  String get localModelDefault => '本地模型（預設）';

  @override
  String get ollamaEndpoint => 'Ollama 端點';

  @override
  String get ollamaModel => 'Ollama 模型';

  @override
  String get openAiEndpoint => 'OpenAI 端點';

  @override
  String get openAiApiKey => 'OpenAI API 金鑰';

  @override
  String get openAiModel => 'OpenAI 模型';

  @override
  String get geminiEndpoint => 'Gemini 端點';

  @override
  String get geminiApiKey => 'Gemini API 金鑰';

  @override
  String get geminiModel => 'Gemini 模型';

  @override
  String get anthropicEndpoint => 'Anthropic 端點';

  @override
  String get anthropicApiKey => 'Anthropic API 金鑰';

  @override
  String get anthropicModel => 'Anthropic 模型';

  @override
  String get customProtocol => '自訂協議';

  @override
  String get protocol => '協議';

  @override
  String get customEndpoint => '自訂端點';

  @override
  String get customApiKey => '自訂 API 金鑰';

  @override
  String get customModel => '自訂模型';

  @override
  String get optionalForLocalServers => '本地/自訂伺服器可選';

  @override
  String get speechRecognitionEngine => '語音識別引擎';

  @override
  String get local => '本地';

  @override
  String get endpoint => '端點';

  @override
  String get localSpeechModel => '本地語音模型';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX（裝置端）';

  @override
  String get systemSpeechRecognition => '系統語音識別';

  @override
  String get systemRecognitionAndroidIos => '系統識別';

  @override
  String get endpointRecognitionCloudWs => '端點識別（雲/WS）';

  @override
  String get useBuiltInRecognizer => '使用 Android/iOS 內建識別器（可能使用雲）';

  @override
  String get voiceAiEndpoint => '語音 AI 端點';

  @override
  String get embeddingModel => 'Embedding 模型';

  @override
  String get crossDeviceSync => '跨裝置同步';

  @override
  String get sendToOtherDevices => '傳送到其他裝置';

  @override
  String get exportBackupAndSend => '匯出備份並透過分享傳送';

  @override
  String get importFromLocalSend => '從 LocalSend 匯入';

  @override
  String get selectBackupJson => '選擇備份 JSON 並合併本地資料';

  @override
  String get autoGeneration => '自動產生';

  @override
  String get autoGenerateSummary => '自動產生摘要';

  @override
  String get generateAiSummaryForNewEntries => '為新項目產生 AI 摘要';

  @override
  String get autoGenerateEmbedding => '自動產生 Embedding';

  @override
  String get generateVectorEmbedding => '產生向量 Embedding 用於搜尋';

  @override
  String get enableNetworkSearch => '啟用網路搜尋';

  @override
  String get allowOnlineRetrieval => '允許線上檢索用於搜尋和 AI 對話（預設關閉）';

  @override
  String get about => '關於';

  @override
  String version(String version) {
    return '版本 $version';
  }

  @override
  String get database => '資料庫';

  @override
  String get objectBoxWithHnsw => 'ObjectBox with HNSW 索引';

  @override
  String get logOut => '登出';

  @override
  String get custom => '自訂';

  @override
  String get openAiCompatible => 'OpenAI 相容';

  @override
  String get notSet => '未設定';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... 或 http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => '支援本地/LAN/公網端點';

  @override
  String get shiguangLocalSendBackup => '拾光 LocalSend 備份';

  @override
  String get localBackupFromShiguang => '拾光本地備份（透過 LocalSend 接收）';

  @override
  String get selectBackupFileFromLocalSend => '選擇從 LocalSend 接收的備份檔案';

  @override
  String get failedToResolveFilePath => '無法解析所選檔案路徑';

  @override
  String get importOptions => '匯入選項';

  @override
  String get importSettingsAsWell => '是否同時匯入設定？\n（API 金鑰不會被覆寫）';

  @override
  String get dataOnly => '僅匯入資料';

  @override
  String get dataAndSettings => '資料 + 設定';

  @override
  String get importCompleted => '匯入完成';

  @override
  String get settingsInBackupWereApplied => '備份中的設定已套用。';

  @override
  String get settingsInBackupWereNotApplied => '備份中的設定未套用。';

  @override
  String get ok => '確定';

  @override
  String get cancel => '取消';

  @override
  String get save => '儲存';

  @override
  String get delete => '刪除';

  @override
  String get clear => '清除';

  @override
  String get add => '新增';

  @override
  String get create => '建立';

  @override
  String get edit => '編輯';

  @override
  String get search => '搜尋';

  @override
  String get areYouSureYouWantToLogOut => '確定要登出嗎？';

  @override
  String get chooseLanguage => '選擇語言';

  @override
  String get databaseInfo => '資料庫資訊';

  @override
  String get storage => '儲存：ObjectBox';

  @override
  String get vectorIndex => '向量索引：HNSW';

  @override
  String get dimensions => '維度：384';

  @override
  String get embeddingModelBge => 'Embedding 模型：bge-small-zh-v1.5';

  @override
  String get takePhoto => '拍攝';

  @override
  String get chooseFromGallery => '從相簿選擇';

  @override
  String get editNickname => '修改暱稱';

  @override
  String get enterNickname => '輸入暱稱';

  @override
  String get pleaseEnterNickname => '請輸入暱稱';

  @override
  String get nicknameAlreadyExistsOrInvalid => '暱稱已存在或無效';

  @override
  String get user => '使用者';

  @override
  String get manageScheduledReminders => '管理計畫的提醒和鬧鐘';

  @override
  String get imageFailedToLoad => '圖片載入失敗，請重新選擇。';

  @override
  String get imageIsStillLoading => '圖片仍在載入中';

  @override
  String get imageAreaNotReady => '圖片區域未就緒，請重試。';

  @override
  String get cropFrameNotReady => '裁剪框未就緒，請重試。';

  @override
  String get invalidCropArea => '裁剪區域無效，請重試。';

  @override
  String get cropFailed => '裁剪失敗，請重試。';

  @override
  String get cropAvatar => '裁剪頭像';

  @override
  String get chooseAgain => '重新選擇';

  @override
  String get rotate90 => '旋轉 90°';

  @override
  String get dragFrameToMove => '拖動框架移動，拖動右下角調整大小；雙指縮放和移動圖片。';

  @override
  String get pleaseFillInAllFields => '請填寫所有欄位';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN 至少需要 4 位數字';

  @override
  String get pinAtLeast4Digits => 'PIN 至少 4 位';

  @override
  String get invalidUsernameOrPin => '使用者名稱或 PIN 無效';

  @override
  String get invalidUsernameOrPinError => '使用者名稱或 PIN 錯誤';

  @override
  String get usernameAlreadyExists => '使用者名稱已存在';

  @override
  String get captureMomentsKeepMemories => '捕捉瞬間，儲存回憶';

  @override
  String get username => '使用者名稱';

  @override
  String get pin => 'PIN';

  @override
  String get login => '登入';

  @override
  String get createAccount => '建立帳戶';

  @override
  String get dontHaveAccountCreateOne => '沒有帳戶？建立一個';

  @override
  String get alreadyHaveAccountLogin => '已有帳戶？登入';

  @override
  String get pleaseEnterUsername => '請輸入使用者名稱';

  @override
  String get pinsDoNotMatch => 'PIN 不符合';

  @override
  String get tapToAddAvatar => '點擊新增頭像';

  @override
  String get yourName => '你的名字';

  @override
  String get privatePinOptional => '私密 PIN（可選）';

  @override
  String get usedToEncryptPrivateRecords => '用於加密私密記錄';

  @override
  String get privatePin => '私密 PIN';

  @override
  String get leaveEmptyForNoEncryption => '留空則不加密';

  @override
  String get confirmPin => '確認 PIN';

  @override
  String get getStarted => '開始';

  @override
  String get noReminders => '暫無提醒';

  @override
  String get addReminder => '新增提醒';

  @override
  String get title => '標題';

  @override
  String get descriptionOptional => '描述（可選）';

  @override
  String get microphonePermissionRequired => '需要麥克風權限';

  @override
  String get aiAssistant => 'AI 助手';

  @override
  String get listening => '正在傾聽...';

  @override
  String get typeAMessage => '輸入訊息...';

  @override
  String get aiChat => 'AI 對話';

  @override
  String get startAConversation => '開始對話';

  @override
  String get typeYourMessage => '輸入你的訊息...';

  @override
  String get asrReconnecting => 'ASR 重新連線中...';

  @override
  String get write => '寫作';

  @override
  String get writeEntry => '寫文章';

  @override
  String get noMemoriesYet => '暫無回憶';

  @override
  String get tapPlusToCapture => '點擊 + 捕捉你的想法';

  @override
  String get tapPlusToCaptureYourThoughts => '點擊 + 記錄你的想法';

  @override
  String get deleteMemory => '刪除回憶';

  @override
  String get deleteRecord => '刪除記錄';

  @override
  String get thisEntryWillBeRemoved => '此項目將從時間線中移除。';

  @override
  String get thisRecordWillBeRemoved => '這筆記錄將從時間線移除。';

  @override
  String get searchYourRecords => '搜尋你的記錄...';

  @override
  String get exactMatches => '精確匹配';

  @override
  String get noExactMatches => '無精確匹配';

  @override
  String get exact => '精確';

  @override
  String get exactMatch => '完整匹配';

  @override
  String get fuzzyMatches => '模糊匹配';

  @override
  String get noFuzzyMatches => '無模糊匹配';

  @override
  String get vectorMatch => '向量匹配';

  @override
  String get networkMatches => '網路匹配';

  @override
  String get noNetworkMatches => '無網路匹配';

  @override
  String get networkSearchIsOff => '網路搜尋已關閉，請在設定中啟用。';

  @override
  String get network => '網路';

  @override
  String get networkMatch => '網路匹配';

  @override
  String get noSearchHistory => '無搜尋歷史';

  @override
  String get searchHistory => '搜尋歷史';

  @override
  String get invalidLink => '連結無效';

  @override
  String get unableToOpenWebPage => '無法開啟網頁';

  @override
  String get imageMemory => '[圖片回憶]';

  @override
  String get tapToOpenWebPage => '點擊開啟網頁';

  @override
  String get editEntry => '編輯文章';

  @override
  String get entryDetails => '文章詳情';

  @override
  String get noContent => '暫無內容';

  @override
  String get diaryNotFound => '日記未找到';

  @override
  String get diaryNotFoundShort => '未找到該記錄';

  @override
  String get aiSummary => 'AI 摘要';

  @override
  String get microphoneInterrupted => '麥克風中斷，錄音停止。';

  @override
  String get bold => '粗體';

  @override
  String get italic => '斜體';

  @override
  String get strikethrough => '刪除線';

  @override
  String get image => '圖片';

  @override
  String get asrUnavailableRecordingActive => 'ASR 不可用，錄音仍在進行中。';

  @override
  String get writeYourEntry => '寫下你的文章...';

  @override
  String get writeYourContent => '寫下正文...';

  @override
  String microphoneStartFailed(String error) {
    return '麥克風啟動失敗: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped => '麥克風中斷，錄音已停止。';

  @override
  String asrReconnectingError(String error) {
    return '語音識別重連中: $error';
  }

  @override
  String imageInserted(String name) {
    return '已插入圖片: $name';
  }

  @override
  String voiceError(String error) {
    return '語音錯誤: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return '抱歉，AI 服務暫時不可用: $error';
  }

  @override
  String shareFailed(String error) {
    return '分享失敗: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count處';
  }

  @override
  String matchCount(int count) {
    return '匹配: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return '來源: $source';
  }

  @override
  String get createNew => '新建';

  @override
  String micStartFailed(String error) {
    return '麥克風啟動失敗: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return '帳戶: +$created / 更新 $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return '日記: +$created / 更新 $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return '提醒: +$created / 更新 $updated';
  }

  @override
  String importResultSkipped(int count) {
    return '跳過: $count';
  }

  @override
  String importResultTotal(int count) {
    return '總計變更: $count';
  }

  @override
  String get settingsApplied => '備份中的設定已套用。';

  @override
  String get settingsNotApplied => '備份中的設定未套用。';

  @override
  String backupExported(String path) {
    return '備份已匯出: $path';
  }

  @override
  String exportFailed(String error) {
    return '匯出失敗: $error';
  }

  @override
  String importFailed(String error) {
    return '匯入失敗: $error';
  }
}

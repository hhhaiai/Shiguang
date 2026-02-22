// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get languageName => '日本語';

  @override
  String get languageNameEn => 'Japanese';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => '設定';

  @override
  String get account => 'アカウント';

  @override
  String get reminders => 'リマインダー';

  @override
  String get language => '言語';

  @override
  String get appLanguage => 'アプリの言語';

  @override
  String get appearance => '外観';

  @override
  String get themeMode => 'テーマモード';

  @override
  String get dark => 'ダーク';

  @override
  String get light => 'ライト';

  @override
  String get system => 'システム';

  @override
  String get aiService => 'AIサービス';

  @override
  String get aiChatProvider => 'AIチャットプロバイダー';

  @override
  String get chatModel => 'チャットモデル';

  @override
  String get localModel => 'ローカルモデル';

  @override
  String get localModelDefault => 'ローカルモデル（デフォルト）';

  @override
  String get ollamaEndpoint => 'Ollamaエンドポイント';

  @override
  String get ollamaModel => 'Ollamaモデル';

  @override
  String get openAiEndpoint => 'OpenAIエンドポイント';

  @override
  String get openAiApiKey => 'OpenAI APIキー';

  @override
  String get openAiModel => 'OpenAIモデル';

  @override
  String get geminiEndpoint => 'Geminiエンドポイント';

  @override
  String get geminiApiKey => 'Gemini APIキー';

  @override
  String get geminiModel => 'Geminiモデル';

  @override
  String get anthropicEndpoint => 'Anthropicエンドポイント';

  @override
  String get anthropicApiKey => 'Anthropic APIキー';

  @override
  String get anthropicModel => 'Anthropicモデル';

  @override
  String get customProtocol => 'カスタムプロトコル';

  @override
  String get protocol => 'プロトコル';

  @override
  String get customEndpoint => 'カスタムエンドポイント';

  @override
  String get customApiKey => 'カスタムAPIキー';

  @override
  String get customModel => 'カスタムモデル';

  @override
  String get optionalForLocalServers => 'ローカル/カスタムサーバーは任意';

  @override
  String get speechRecognitionEngine => '音声認識エンジン';

  @override
  String get local => 'ローカル';

  @override
  String get endpoint => 'エンドポイント';

  @override
  String get localSpeechModel => 'ローカル音声モデル';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX（デバイス上）';

  @override
  String get systemSpeechRecognition => 'システム音声認識';

  @override
  String get systemRecognitionAndroidIos => 'システム認識（Android/iOS）';

  @override
  String get endpointRecognitionCloudWs => 'エンドポイント認識（Cloud/WS）';

  @override
  String get useBuiltInRecognizer => 'Android/iOSの組み込み認識を使用（クラウド使用の可能性あり）';

  @override
  String get voiceAiEndpoint => '音声AIエンドポイント';

  @override
  String get embeddingModel => 'Embeddingモデル';

  @override
  String get crossDeviceSync => 'クロスデバイス同期';

  @override
  String get sendToOtherDevices => '他のデバイスに送信（LocalSend）';

  @override
  String get exportBackupAndSend => 'バックアップをエクスポートして送信';

  @override
  String get importFromLocalSend => 'LocalSendからインポート';

  @override
  String get selectBackupJson => 'バックアップJSONを選択してローカルデータをマージ';

  @override
  String get autoGeneration => '自動生成';

  @override
  String get autoGenerateSummary => '要約を自動生成';

  @override
  String get generateAiSummaryForNewEntries => '新しいエントリにAI要約を生成';

  @override
  String get autoGenerateEmbedding => 'Embeddingを自動生成';

  @override
  String get generateVectorEmbedding => '検索用のベクトルEmbeddingを生成';

  @override
  String get enableNetworkSearch => 'ネットワーク検索を有効にする';

  @override
  String get allowOnlineRetrieval => '検索とAIチャットのオンライン取得を許可（デフォルトではオフ）';

  @override
  String get about => 'について';

  @override
  String version(String version) {
    return 'バージョン $version';
  }

  @override
  String get database => 'データベース';

  @override
  String get objectBoxWithHnsw => 'HNSWインデックス付きObjectBox';

  @override
  String get logOut => 'ログアウト';

  @override
  String get custom => 'カスタム';

  @override
  String get openAiCompatible => 'OpenAI互換';

  @override
  String get notSet => '未設定';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... または http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'ローカル/LAN/パブリックエンドポイントをサポート';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSendバックアップ';

  @override
  String get localBackupFromShiguang => 'Shiguangからのローカルバックアップ（LocalSendで受信）';

  @override
  String get selectBackupFileFromLocalSend => 'LocalSendで受信したバックアップファイルを選択';

  @override
  String get failedToResolveFilePath => '選択したファイルパスを解決できませんでした';

  @override
  String get importOptions => 'インポートオプション';

  @override
  String get importSettingsAsWell => '設定もインポートしますか？\n（APIキーは上書きされません）';

  @override
  String get dataOnly => 'データのみ';

  @override
  String get dataAndSettings => 'データ + 設定';

  @override
  String get importCompleted => 'インポート完了';

  @override
  String get settingsInBackupWereApplied => 'バックアップの設定が適用されました。';

  @override
  String get settingsInBackupWereNotApplied => 'バックアップの設定は適用されませんでした。';

  @override
  String get ok => 'わかりました';

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get delete => '削除';

  @override
  String get clear => 'クリア';

  @override
  String get add => '追加';

  @override
  String get create => '作成';

  @override
  String get edit => '編集';

  @override
  String get search => '検索';

  @override
  String get areYouSureYouWantToLogOut => 'ログアウトしてもよろしいですか？';

  @override
  String get chooseLanguage => '言語を選択';

  @override
  String get databaseInfo => 'データベース情報';

  @override
  String get storage => 'ストレージ: ObjectBox';

  @override
  String get vectorIndex => 'ベクトルインデックス: HNSW';

  @override
  String get dimensions => '次元: 384';

  @override
  String get embeddingModelBge => 'Embeddingモデル: bge-small-zh-v1.5';

  @override
  String get takePhoto => '写真を撮る';

  @override
  String get chooseFromGallery => 'ギャラリーから選択';

  @override
  String get editNickname => 'ニックネームを編集';

  @override
  String get enterNickname => 'ニックネームを入力';

  @override
  String get pleaseEnterNickname => 'ニックネームを入力してください';

  @override
  String get nicknameAlreadyExistsOrInvalid => 'ニックネームは既に存在するか無効です';

  @override
  String get user => 'ユーザー';

  @override
  String get manageScheduledReminders => 'スケジュールされたリマインダーとアラームを管理';

  @override
  String get imageFailedToLoad => '画像の読み込みに失敗しました。再度選択してください。';

  @override
  String get imageIsStillLoading => '画像はまだ読み込み中です';

  @override
  String get imageAreaNotReady => '画像エリアの準備ができません。再度お試しください。';

  @override
  String get cropFrameNotReady => '切り抜きフレームの準備ができません。再度お試しください。';

  @override
  String get invalidCropArea => '無効な切り抜き領域です。再度お試しください。';

  @override
  String get cropFailed => '切り抜きに失敗しました。再度お試しください。';

  @override
  String get cropAvatar => 'アバターをトリミング';

  @override
  String get chooseAgain => '再選択';

  @override
  String get rotate90 => '90°回転';

  @override
  String get dragFrameToMove => 'フレームをドラッグして移動、右下をドラッグしてリサイズ、ピンチでズームと画像移動。';

  @override
  String get pleaseFillInAllFields => 'すべてのフィールドを入力してください';

  @override
  String get pinMustBeAtLeast4Digits => 'PINは4桁以上である必要があります';

  @override
  String get pinAtLeast4Digits => 'PINは4桁以上である必要があります';

  @override
  String get invalidUsernameOrPin => 'ユーザー名またはPINが無効です';

  @override
  String get invalidUsernameOrPinError => 'ユーザー名またはPINが無効です';

  @override
  String get usernameAlreadyExists => 'ユーザー名は既に存在します';

  @override
  String get captureMomentsKeepMemories => '瞬間を捉え、記憶を残す';

  @override
  String get username => 'ユーザー名';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'ログイン';

  @override
  String get createAccount => 'アカウント作成';

  @override
  String get dontHaveAccountCreateOne => 'アカウントをお持ちでないですか？作成する';

  @override
  String get alreadyHaveAccountLogin => '既にアカウントをお持ちですか？ログイン';

  @override
  String get pleaseEnterUsername => 'ユーザー名を入力してください';

  @override
  String get pinsDoNotMatch => 'PINが一致しません';

  @override
  String get tapToAddAvatar => 'タップしてアバターを追加';

  @override
  String get yourName => 'お名前';

  @override
  String get privatePinOptional => 'プライベートPIN（任意）';

  @override
  String get usedToEncryptPrivateRecords => 'プライベート記録の暗号化に使用';

  @override
  String get privatePin => 'プライベートPIN';

  @override
  String get leaveEmptyForNoEncryption => '暗号化なしは空のまま';

  @override
  String get confirmPin => 'PINを確認';

  @override
  String get getStarted => '始める';

  @override
  String get noReminders => 'リマインダーなし';

  @override
  String get addReminder => 'リマインダーを追加';

  @override
  String get title => 'タイトル';

  @override
  String get descriptionOptional => '説明（任意）';

  @override
  String get microphonePermissionRequired => 'マイクの許可が必要です';

  @override
  String get aiAssistant => 'AIアシスタント';

  @override
  String get listening => '聞いています...';

  @override
  String get typeAMessage => 'メッセージを入力...';

  @override
  String get aiChat => 'AIチャット';

  @override
  String get startAConversation => '会話を始める';

  @override
  String get typeYourMessage => 'メッセージを入力...';

  @override
  String get asrReconnecting => 'ASR再接続中...';

  @override
  String get write => '書く';

  @override
  String get writeEntry => 'エントリを書く';

  @override
  String get noMemoriesYet => 'まだ記憶がありません';

  @override
  String get tapPlusToCapture => '+をタップして考えを記録';

  @override
  String get tapPlusToCaptureYourThoughts => '+をタップして考えを記録';

  @override
  String get deleteMemory => '記憶を削除';

  @override
  String get deleteRecord => '記録を削除';

  @override
  String get thisEntryWillBeRemoved => 'このエントリはタイムラインから削除されます。';

  @override
  String get thisRecordWillBeRemoved => 'この記録はタイムラインから削除されます。';

  @override
  String get searchYourRecords => '記録を検索...';

  @override
  String get exactMatches => '完全一致';

  @override
  String get noExactMatches => '完全一致なし';

  @override
  String get exact => '完全';

  @override
  String get exactMatch => '完全一致';

  @override
  String get fuzzyMatches => 'ファジー一致';

  @override
  String get noFuzzyMatches => 'ファジー一致なし';

  @override
  String get vectorMatch => 'ベクトル一致';

  @override
  String get networkMatches => 'ネットワーク一致';

  @override
  String get noNetworkMatches => 'ネットワーク一致なし';

  @override
  String get networkSearchIsOff => 'ネットワーク検索はオフです。設定で有効にしてください。';

  @override
  String get network => 'ネットワーク';

  @override
  String get networkMatch => 'ネットワーク一致';

  @override
  String get noSearchHistory => '検索履歴なし';

  @override
  String get searchHistory => '検索履歴';

  @override
  String get invalidLink => '無効なリンク';

  @override
  String get unableToOpenWebPage => 'Webページを開けません';

  @override
  String get imageMemory => '[画像記憶]';

  @override
  String get tapToOpenWebPage => 'タップしてWebページを開く';

  @override
  String get editEntry => 'エントリを編集';

  @override
  String get entryDetails => 'エントリ詳細';

  @override
  String get noContent => '内容なし';

  @override
  String get diaryNotFound => '日記が見つかりません';

  @override
  String get diaryNotFoundShort => '記録が見つかりません';

  @override
  String get aiSummary => 'AI要約';

  @override
  String get microphoneInterrupted => 'マイクが中断され、録音停止了。';

  @override
  String get bold => '太字';

  @override
  String get italic => '斜体';

  @override
  String get strikethrough => '取り消し線';

  @override
  String get image => '画像';

  @override
  String get asrUnavailableRecordingActive => 'ASR利用不可。録音はまだアクティブです。';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'エントリを書いてください...';

  @override
  String get writeYourContent => '内容を書いてください...';

  @override
  String microphoneStartFailed(String error) {
    return 'マイクの起動に失敗しました: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped => 'マイクが中断され、録音停止了。';

  @override
  String asrReconnectingError(String error) {
    return 'ASR再接続中: $error';
  }

  @override
  String imageInserted(String name) {
    return '画像挿入: $name';
  }

  @override
  String voiceError(String error) {
    return '音声エラー: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return '申し訳ありませんが、AIサービスは現在利用できません: $error';
  }

  @override
  String shareFailed(String error) {
    return '共有に失敗しました: $error';
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
    return '$matchType · $count件';
  }

  @override
  String matchCount(int count) {
    return '一致: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'ソース: $source';
  }

  @override
  String get createNew => '作成';

  @override
  String micStartFailed(String error) {
    return 'マイクの起動に失敗しました: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'アカウント: +$created / 更新 $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return '日記: +$created / 更新 $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'リマインダー: +$created / 更新 $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'スキップ: $count';
  }

  @override
  String importResultTotal(int count) {
    return '変更合計: $count';
  }

  @override
  String get settingsApplied => 'バックアップの設定が適用されました。';

  @override
  String get settingsNotApplied => 'バックアップの設定は適用されませんでした。';

  @override
  String backupExported(String path) {
    return 'バックアップをエクスポートしました: $path';
  }

  @override
  String exportFailed(String error) {
    return 'エクスポートに失敗しました: $error';
  }

  @override
  String importFailed(String error) {
    return 'インポートに失敗しました: $error';
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

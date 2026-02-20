// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get languageName => '한국어';

  @override
  String get languageNameEn => 'Korean';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => '설정';

  @override
  String get account => '계정';

  @override
  String get reminders => '알림';

  @override
  String get language => '언어';

  @override
  String get appLanguage => '앱 언어';

  @override
  String get appearance => '외관';

  @override
  String get themeMode => '테마 모드';

  @override
  String get dark => '다크';

  @override
  String get light => '라이트';

  @override
  String get system => '시스템';

  @override
  String get aiService => 'AI 서비스';

  @override
  String get aiChatProvider => 'AI 채팅 제공자';

  @override
  String get chatModel => '채팅 모델';

  @override
  String get localModel => '로컬 모델';

  @override
  String get localModelDefault => '로컬 모델 (기본)';

  @override
  String get ollamaEndpoint => 'Ollama 엔드포인트';

  @override
  String get ollamaModel => 'Ollama 모델';

  @override
  String get openAiEndpoint => 'OpenAI 엔드포인트';

  @override
  String get openAiApiKey => 'OpenAI API 키';

  @override
  String get openAiModel => 'OpenAI 모델';

  @override
  String get geminiEndpoint => 'Gemini 엔드포인트';

  @override
  String get geminiApiKey => 'Gemini API 키';

  @override
  String get geminiModel => 'Gemini 모델';

  @override
  String get anthropicEndpoint => 'Anthropic 엔드포인트';

  @override
  String get anthropicApiKey => 'Anthropic API 키';

  @override
  String get anthropicModel => 'Anthropic 모델';

  @override
  String get customProtocol => '사용자 정의 프로토콜';

  @override
  String get protocol => '프로토콜';

  @override
  String get customEndpoint => '사용자 정의 엔드포인트';

  @override
  String get customApiKey => '사용자 정의 API 키';

  @override
  String get customModel => '사용자 정의 모델';

  @override
  String get optionalForLocalServers => '로컬/사용자 정의 서버는 선택사항';

  @override
  String get speechRecognitionEngine => '음성 인식 엔진';

  @override
  String get local => '로컬';

  @override
  String get endpoint => '엔드포인트';

  @override
  String get localSpeechModel => '로컬 음성 모델';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (장치 내)';

  @override
  String get systemSpeechRecognition => '시스템 음성 인식';

  @override
  String get systemRecognitionAndroidIos => '시스템 인식 (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => '엔드포인트 인식 (Cloud/WS)';

  @override
  String get useBuiltInRecognizer => 'Android/iOS 내장 인식기 사용 (클라우드 사용 가능)';

  @override
  String get voiceAiEndpoint => '음성 AI 엔드포인트';

  @override
  String get embeddingModel => '임베딩 모델';

  @override
  String get crossDeviceSync => '기기 간 동기화';

  @override
  String get sendToOtherDevices => '다른 기기로 보내기 (LocalSend)';

  @override
  String get exportBackupAndSend => '백업 내보내기 및 보내기';

  @override
  String get importFromLocalSend => 'LocalSend에서 가져오기';

  @override
  String get selectBackupJson => '백업 JSON 선택 및 로컬 데이터 병합';

  @override
  String get autoGeneration => '자동 생성';

  @override
  String get autoGenerateSummary => '요약 자동 생성';

  @override
  String get generateAiSummaryForNewEntries => '새 항목에 AI 요약 생성';

  @override
  String get autoGenerateEmbedding => '임베딩 자동 생성';

  @override
  String get generateVectorEmbedding => '검색용 벡터 임베딩 생성';

  @override
  String get enableNetworkSearch => '네트워크 검색 활성화';

  @override
  String get allowOnlineRetrieval => '검색 및 AI 채팅을 위한 온라인 검색 허용 (기본적으로 꺼짐)';

  @override
  String get about => '정보';

  @override
  String version(String version) {
    return '버전 $version';
  }

  @override
  String get database => '데이터베이스';

  @override
  String get objectBoxWithHnsw => 'HNSW 인덱스가 있는 ObjectBox';

  @override
  String get logOut => '로그아웃';

  @override
  String get custom => '사용자 정의';

  @override
  String get openAiCompatible => 'OpenAI 호환';

  @override
  String get notSet => '설정되지 않음';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... 또는 http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => '로컬/LAN/공용 엔드포인트 지원';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend 백업';

  @override
  String get localBackupFromShiguang => 'Shiguang의 로컬 백업 (LocalSend로 수신)';

  @override
  String get selectBackupFileFromLocalSend => 'LocalSend에서 수신한 백업 파일 선택';

  @override
  String get failedToResolveFilePath => '선택한 파일 경로를 해결하지 못했습니다';

  @override
  String get importOptions => '가져오기 옵션';

  @override
  String get importSettingsAsWell => '설정도 가져오시겠습니까?\n(API 키는 덮어쓰지 않습니다)';

  @override
  String get dataOnly => '데이터만';

  @override
  String get dataAndSettings => '데이터 + 설정';

  @override
  String get importCompleted => '가져오기 완료';

  @override
  String get settingsInBackupWereApplied => '백업의 설정이 적용되었습니다.';

  @override
  String get settingsInBackupWereNotApplied => '백업의 설정이 적용되지 않았습니다.';

  @override
  String get ok => '확인';

  @override
  String get cancel => '취소';

  @override
  String get save => '저장';

  @override
  String get delete => '삭제';

  @override
  String get clear => '지우기';

  @override
  String get add => '추가';

  @override
  String get create => '만들기';

  @override
  String get edit => '편집';

  @override
  String get search => '검색';

  @override
  String get areYouSureYouWantToLogOut => '로그아웃하시겠습니까?';

  @override
  String get chooseLanguage => '언어 선택';

  @override
  String get databaseInfo => '데이터베이스 정보';

  @override
  String get storage => '저장소: ObjectBox';

  @override
  String get vectorIndex => '벡터 인덱스: HNSW';

  @override
  String get dimensions => '차원: 384';

  @override
  String get embeddingModelBge => '임베딩 모델: bge-small-zh-v1.5';

  @override
  String get takePhoto => '사진 찍기';

  @override
  String get chooseFromGallery => '갤러리에서 선택';

  @override
  String get editNickname => '닉네임 편집';

  @override
  String get enterNickname => '닉네임 입력';

  @override
  String get pleaseEnterNickname => '닉네임을 입력해 주세요';

  @override
  String get nicknameAlreadyExistsOrInvalid => '닉네임이 이미 존재하거나 유효하지 않습니다';

  @override
  String get user => '사용자';

  @override
  String get manageScheduledReminders => '예약된 알림 및 알람 관리';

  @override
  String get imageFailedToLoad => '이미지를 불러오지 못했습니다. 다시 선택해 주세요.';

  @override
  String get imageIsStillLoading => '이미지를 아직 불러오는 중입니다';

  @override
  String get imageAreaNotReady => '이미지 영역이 준비되지 않았습니다. 다시 시도해 주세요.';

  @override
  String get cropFrameNotReady => '자르기 프레임이 준비되지 않았습니다. 다시 시도해 주세요.';

  @override
  String get invalidCropArea => '잘못된 자르기 영역입니다. 다시 시도해 주세요.';

  @override
  String get cropFailed => '자르기 실패했습니다. 다시 시도해 주세요.';

  @override
  String get cropAvatar => '아바타 자르기';

  @override
  String get chooseAgain => '다시 선택';

  @override
  String get rotate90 => '90도 회전';

  @override
  String get dragFrameToMove =>
      '프레임을 드래그하여 이동, 우하단을 드래그하여 크기 조절; 두 손가락으로 줌 및 이미지 이동.';

  @override
  String get pleaseFillInAllFields => '모든 필드를 입력해 주세요';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN은 최소 4자리여야 합니다';

  @override
  String get pinAtLeast4Digits => 'PIN은 최소 4자리여야 합니다';

  @override
  String get invalidUsernameOrPin => '사용자 이름 또는 PIN이 유효하지 않습니다';

  @override
  String get invalidUsernameOrPinError => '사용자 이름 또는 PIN이 유효하지 않습니다';

  @override
  String get usernameAlreadyExists => '사용자 이름이 이미 존재합니다';

  @override
  String get captureMomentsKeepMemories => '순간을 포착하고 추억을 보존';

  @override
  String get username => '사용자 이름';

  @override
  String get pin => 'PIN';

  @override
  String get login => '로그인';

  @override
  String get createAccount => '계정 만들기';

  @override
  String get dontHaveAccountCreateOne => '계정이 없으신가요? 만들기';

  @override
  String get alreadyHaveAccountLogin => '이미 계정이 있으신가요? 로그인';

  @override
  String get pleaseEnterUsername => '사용자 이름을 입력해 주세요';

  @override
  String get pinsDoNotMatch => 'PIN이 일치하지 않습니다';

  @override
  String get tapToAddAvatar => '탭하여 아바타 추가';

  @override
  String get yourName => '이름';

  @override
  String get privatePinOptional => '개인 PIN (선택사항)';

  @override
  String get usedToEncryptPrivateRecords => '개인 기록 암호화에 사용';

  @override
  String get privatePin => '개인 PIN';

  @override
  String get leaveEmptyForNoEncryption => '암호화 안 함은 빈칸으로 두기';

  @override
  String get confirmPin => 'PIN 확인';

  @override
  String get getStarted => '시작하기';

  @override
  String get noReminders => '알림 없음';

  @override
  String get addReminder => '알림 추가';

  @override
  String get title => '제목';

  @override
  String get descriptionOptional => '설명 (선택사항)';

  @override
  String get microphonePermissionRequired => '마이크 권한 필요';

  @override
  String get aiAssistant => 'AI 어시스턴트';

  @override
  String get listening => '듣는 중...';

  @override
  String get typeAMessage => '메시지 입력...';

  @override
  String get aiChat => 'AI 채팅';

  @override
  String get startAConversation => '대화 시작';

  @override
  String get typeYourMessage => '메시지 입력...';

  @override
  String get asrReconnecting => 'ASR 재연결 중...';

  @override
  String get write => '쓰기';

  @override
  String get writeEntry => '항목 쓰기';

  @override
  String get noMemoriesYet => '아직 추억이 없습니다';

  @override
  String get tapPlusToCapture => '+를 눌러 생각 기록';

  @override
  String get tapPlusToCaptureYourThoughts => '+를 눌러 생각 기록';

  @override
  String get deleteMemory => '추억 삭제';

  @override
  String get deleteRecord => '기록 삭제';

  @override
  String get thisEntryWillBeRemoved => '이 항목은 타임라인에서 제거됩니다.';

  @override
  String get thisRecordWillBeRemoved => '이 기록은 타임라인에서 제거됩니다.';

  @override
  String get searchYourRecords => '기록 검색...';

  @override
  String get exactMatches => '정확한 일치';

  @override
  String get noExactMatches => '정확한 일치 없음';

  @override
  String get exact => '정확';

  @override
  String get exactMatch => '정확한 일치';

  @override
  String get fuzzyMatches => '유사 일치';

  @override
  String get noFuzzyMatches => '유사 일치 없음';

  @override
  String get vectorMatch => '벡터 일치';

  @override
  String get networkMatches => '네트워크 일치';

  @override
  String get noNetworkMatches => '네트워크 일치 없음';

  @override
  String get networkSearchIsOff => '네트워크 검색이 꺼져 있습니다. 설정에서 활성화해 주세요.';

  @override
  String get network => '네트워크';

  @override
  String get networkMatch => '네트워크 일치';

  @override
  String get noSearchHistory => '검색 기록 없음';

  @override
  String get searchHistory => '검색 기록';

  @override
  String get invalidLink => '잘못된 링크';

  @override
  String get unableToOpenWebPage => '웹 페이지를 열 수 없습니다';

  @override
  String get imageMemory => '[이미지 기억]';

  @override
  String get tapToOpenWebPage => '탭하여 웹 페이지 열기';

  @override
  String get editEntry => '항목 편집';

  @override
  String get entryDetails => '항목 상세';

  @override
  String get noContent => '내용 없음';

  @override
  String get diaryNotFound => '다이어리를 찾을 수 없습니다';

  @override
  String get diaryNotFoundShort => '기록을 찾을 수 없습니다';

  @override
  String get aiSummary => 'AI 요약';

  @override
  String get microphoneInterrupted => '마이크가 중단되어 녹음이 중지되었습니다.';

  @override
  String get bold => '굵게';

  @override
  String get italic => '기울임꼴';

  @override
  String get strikethrough => '취소선';

  @override
  String get image => '이미지';

  @override
  String get asrUnavailableRecordingActive => 'ASR 사용 불가. 녹음은 여전히 활성 상태입니다.';

  @override
  String get writeYourEntry => '항목을 작성해 주세요...';

  @override
  String get writeYourContent => '내용을 작성해 주세요...';

  @override
  String microphoneStartFailed(String error) {
    return '마이크 시작 실패: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped => '마이크가 중단되어 녹음이 중지되었습니다.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR 재연결 중: $error';
  }

  @override
  String imageInserted(String name) {
    return '이미지 삽입됨: $name';
  }

  @override
  String voiceError(String error) {
    return '음성 오류: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return '죄송합니다. AI 서비스가 현재 사용할 수 없습니다: $error';
  }

  @override
  String shareFailed(String error) {
    return '공유 실패: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count개 일치';
  }

  @override
  String matchCount(int count) {
    return '일치: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return '출처: $source';
  }

  @override
  String get createNew => '만들기';

  @override
  String micStartFailed(String error) {
    return '마이크 시작 실패: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return '계정: +$created / 업데이트 $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return '다이어리: +$created / 업데이트 $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return '알림: +$created / 업데이트 $updated';
  }

  @override
  String importResultSkipped(int count) {
    return '건너뛰기: $count';
  }

  @override
  String importResultTotal(int count) {
    return '총 변경: $count';
  }

  @override
  String get settingsApplied => '백업의 설정이 적용되었습니다.';

  @override
  String get settingsNotApplied => '백업의 설정이 적용되지 않았습니다.';

  @override
  String backupExported(String path) {
    return '백업 내보냄: $path';
  }

  @override
  String exportFailed(String error) {
    return '내보내기 실패: $error';
  }

  @override
  String importFailed(String error) {
    return '가져오기 실패: $error';
  }
}

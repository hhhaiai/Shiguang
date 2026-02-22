// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get languageName => 'Filipino';

  @override
  String get languageNameEn => 'Filipino';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Mga setting';

  @override
  String get account => 'Account';

  @override
  String get reminders => 'Mga paalala';

  @override
  String get language => 'Wika';

  @override
  String get appLanguage => 'Wika ng App';

  @override
  String get appearance => 'Hitsura';

  @override
  String get themeMode => 'Mode ng Tema';

  @override
  String get dark => 'Madilim';

  @override
  String get light => 'Liwanag';

  @override
  String get system => 'Sistema';

  @override
  String get aiService => 'Serbisyo ng AI';

  @override
  String get aiChatProvider => 'AI Chat Provider';

  @override
  String get chatModel => 'Modelo ng Chat';

  @override
  String get localModel => 'Lokal na Modelo';

  @override
  String get localModelDefault => 'Lokal na Modelo (Default)';

  @override
  String get ollamaEndpoint => 'Ollama Endpoint';

  @override
  String get ollamaModel => 'Ollama Model';

  @override
  String get openAiEndpoint => 'OpenAI Endpoint';

  @override
  String get openAiApiKey => 'OpenAI API Key';

  @override
  String get openAiModel => 'Modelo ng OpenAI';

  @override
  String get geminiEndpoint => 'Gemini Endpoint';

  @override
  String get geminiApiKey => 'Gemini API Key';

  @override
  String get geminiModel => 'Mga Modelong Gemini';

  @override
  String get anthropicEndpoint => 'Anthropic Endpoint';

  @override
  String get anthropicApiKey => 'Anthropic API Key';

  @override
  String get anthropicModel => 'Modelong Antropiko';

  @override
  String get customProtocol => 'Custom na Protocol';

  @override
  String get protocol => 'Protocol';

  @override
  String get customEndpoint => 'Custom na Endpoint';

  @override
  String get customApiKey => 'Custom na API Key';

  @override
  String get customModel => 'Custom na Modelo';

  @override
  String get optionalForLocalServers =>
      'Opsyonal para sa mga lokal/custom na server';

  @override
  String get speechRecognitionEngine => 'Speech Recognition Engine';

  @override
  String get local => 'Lokal';

  @override
  String get endpoint => 'Endpoint';

  @override
  String get localSpeechModel => 'Lokal na Modelo ng Pagsasalita';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (on-device)';

  @override
  String get systemSpeechRecognition => 'System Speech Recognition';

  @override
  String get systemRecognitionAndroidIos => 'System Recognition (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Endpoint Recognition (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Gumamit ng built-in na Android / iOS na kinikilala (maaaring gumamit ng cloud)';

  @override
  String get voiceAiEndpoint => 'Endpoint ng Voice AI';

  @override
  String get embeddingModel => 'Pag-embed ng Modelo';

  @override
  String get crossDeviceSync => 'Cross-Device Sync';

  @override
  String get sendToOtherDevices => 'Ipadala sa Iba Pang Mga Device (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'I-export ang backup at ipadala sa pamamagitan ng share sheet';

  @override
  String get importFromLocalSend => 'Mag-import mula sa LocalSend';

  @override
  String get selectBackupJson =>
      'Piliin ang backup na JSON at pagsamahin ang lokal na data';

  @override
  String get autoGeneration => 'Auto Generation';

  @override
  String get autoGenerateSummary => 'Awtomatikong Bumuo ng Buod';

  @override
  String get generateAiSummaryForNewEntries =>
      'Bumuo ng buod ng AI para sa mga bagong entry';

  @override
  String get autoGenerateEmbedding => 'Awtomatikong Bumuo ng Pag-embed';

  @override
  String get generateVectorEmbedding =>
      'Bumuo ng pag-embed ng vector para sa paghahanap';

  @override
  String get enableNetworkSearch => 'Paganahin ang Network Search';

  @override
  String get allowOnlineRetrieval =>
      'Payagan ang online retrieval para sa paghahanap at AI chat (naka-off bilang default)';

  @override
  String get about => 'Tungkol sa';

  @override
  String version(String version) {
    return 'Bersyon $version';
  }

  @override
  String get database => 'Database';

  @override
  String get objectBoxWithHnsw => 'ObjectBox na may HNSW index';

  @override
  String get logOut => 'Log Out';

  @override
  String get custom => 'Custom';

  @override
  String get openAiCompatible => 'OpenAI Compatible';

  @override
  String get notSet => 'Hindi nakatakda';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Sinusuportahan ang mga lokal/LAN/pampublikong endpoint';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend Backup';

  @override
  String get localBackupFromShiguang =>
      'Lokal na backup mula sa Shiguang (makatanggap sa pamamagitan ng LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Piliin ang backup na file na natanggap mula sa LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Nabigong lutasin ang napiling landas ng file';

  @override
  String get importOptions => 'Mga Opsyon sa Pag-import';

  @override
  String get importSettingsAsWell =>
      'Mag-import din ng mga setting?\n(Hindi ma-overwrite ang mga API key)';

  @override
  String get dataOnly => 'Data Lang';

  @override
  String get dataAndSettings => 'Data + Mga Setting';

  @override
  String get importCompleted => 'Nakumpleto ang Pag-import';

  @override
  String get settingsInBackupWereApplied =>
      'Inilapat ang mga setting sa backup.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Hindi nailapat ang mga setting sa backup.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Kanselahin';

  @override
  String get save => 'I-save';

  @override
  String get delete => 'Tanggalin';

  @override
  String get clear => 'Maaliwalas';

  @override
  String get add => 'Idagdag';

  @override
  String get create => 'Lumikha';

  @override
  String get edit => 'I-edit';

  @override
  String get search => 'Maghanap';

  @override
  String get areYouSureYouWantToLogOut =>
      'Sigurado ka bang gusto mong mag-log out?';

  @override
  String get chooseLanguage => 'Pumili ng Wika';

  @override
  String get databaseInfo => 'Impormasyon sa Database';

  @override
  String get storage => 'Imbakan: ObjectBox';

  @override
  String get vectorIndex => 'Vector Index: HNSW';

  @override
  String get dimensions => 'Mga sukat: 384';

  @override
  String get embeddingModelBge => 'Pag-embed ng Modelo: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Kumuha ng Larawan';

  @override
  String get chooseFromGallery => 'Pumili mula sa Gallery';

  @override
  String get editNickname => 'I-edit ang Palayaw';

  @override
  String get enterNickname => 'Ilagay ang palayaw';

  @override
  String get pleaseEnterNickname => 'Mangyaring maglagay ng palayaw';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Umiiral na o di-wasto ang palayaw';

  @override
  String get user => 'Gumagamit';

  @override
  String get manageScheduledReminders =>
      'Pamahalaan ang mga nakaiskedyul na paalala at alarma';

  @override
  String get imageFailedToLoad =>
      'Nabigong ma-load ang larawan. Mangyaring pumili muli.';

  @override
  String get imageIsStillLoading => 'Naglo-load pa rin ang larawan';

  @override
  String get imageAreaNotReady =>
      'Hindi pa handa ang lugar ng larawan. Pakisubukang muli.';

  @override
  String get cropFrameNotReady =>
      'Ang crop frame ay hindi pa handa. Pakisubukang muli.';

  @override
  String get invalidCropArea => 'Di-wastong crop area. Pakisubukang muli.';

  @override
  String get cropFailed => 'Nabigo ang pag-crop. Pakisubukang muli.';

  @override
  String get cropAvatar => 'I-crop ang Avatar';

  @override
  String get chooseAgain => 'Pumili Muli';

  @override
  String get rotate90 => 'Iikot 90°';

  @override
  String get dragFrameToMove =>
      'I-drag ang frame upang ilipat, i-drag sa ibaba-kanan upang baguhin ang laki; kurutin para mag-zoom at ilipat ang imahe.';

  @override
  String get pleaseFillInAllFields =>
      'Mangyaring punan ang lahat ng mga patlang';

  @override
  String get pinMustBeAtLeast4Digits =>
      'Ang PIN ay dapat na hindi bababa sa 4 na digit';

  @override
  String get pinAtLeast4Digits =>
      'Ang PIN ay dapat na hindi bababa sa 4 na digit';

  @override
  String get invalidUsernameOrPin => 'Di-wastong username o PIN';

  @override
  String get invalidUsernameOrPinError => 'Di-wastong username o PIN';

  @override
  String get usernameAlreadyExists => 'Umiiral na ang username';

  @override
  String get captureMomentsKeepMemories =>
      'Kunin ang mga sandali, panatilihin ang mga alaala';

  @override
  String get username => 'Username';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Mag-login';

  @override
  String get createAccount => 'Lumikha ng Account';

  @override
  String get dontHaveAccountCreateOne => 'Walang account? Lumikha ng isa';

  @override
  String get alreadyHaveAccountLogin => 'Mayroon ka nang account? Mag-login';

  @override
  String get pleaseEnterUsername => 'Mangyaring magpasok ng isang username';

  @override
  String get pinsDoNotMatch => 'Hindi tugma ang mga PIN';

  @override
  String get tapToAddAvatar => 'I-tap para magdagdag ng avatar';

  @override
  String get yourName => 'Pangalan mo';

  @override
  String get privatePinOptional => 'Pribadong PIN (opsyonal)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Ginagamit upang i-encrypt ang mga pribadong tala';

  @override
  String get privatePin => 'Pribadong PIN';

  @override
  String get leaveEmptyForNoEncryption =>
      'Iwanang walang laman para walang encryption';

  @override
  String get confirmPin => 'Kumpirmahin ang PIN';

  @override
  String get getStarted => 'Magsimula';

  @override
  String get noReminders => 'Walang mga paalala';

  @override
  String get addReminder => 'Magdagdag ng Paalala';

  @override
  String get title => 'Pamagat';

  @override
  String get descriptionOptional => 'Paglalarawan (opsyonal)';

  @override
  String get microphonePermissionRequired =>
      'Kinakailangan ang pahintulot sa mikropono';

  @override
  String get aiAssistant => 'AI Assistant';

  @override
  String get listening => 'Nakikinig...';

  @override
  String get typeAMessage => 'Mag-type ng mensahe...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Magsimula ng pag-uusap';

  @override
  String get typeYourMessage => 'I-type ang iyong mensahe...';

  @override
  String get asrReconnecting => 'Muling kumokonekta ang ASR...';

  @override
  String get write => 'Sumulat';

  @override
  String get writeEntry => 'Sumulat ng Entry';

  @override
  String get noMemoriesYet => 'Wala pang alaala';

  @override
  String get tapPlusToCapture =>
      'I-tap ang + para makuha ang iyong mga iniisip';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'I-tap ang + para makuha ang iyong mga iniisip';

  @override
  String get deleteMemory => 'Tanggalin ang Memorya';

  @override
  String get deleteRecord => 'Tanggalin ang Tala';

  @override
  String get thisEntryWillBeRemoved =>
      'Aalisin ang entry na ito sa iyong timeline.';

  @override
  String get thisRecordWillBeRemoved =>
      'Aalisin ang tala na ito sa iyong timeline.';

  @override
  String get searchYourRecords => 'Hanapin ang iyong mga tala...';

  @override
  String get exactMatches => 'Mga Eksaktong Tugma';

  @override
  String get noExactMatches => 'Walang eksaktong tugma';

  @override
  String get exact => 'Eksakto';

  @override
  String get exactMatch => 'Eksaktong Tugma';

  @override
  String get fuzzyMatches => 'Malabo na Tugma';

  @override
  String get noFuzzyMatches => 'Walang malabo na tugma';

  @override
  String get vectorMatch => 'Vector Match';

  @override
  String get networkMatches => 'Mga Tugma sa Network';

  @override
  String get noNetworkMatches => 'Walang tugma sa network';

  @override
  String get networkSearchIsOff =>
      'Naka-off ang paghahanap sa network. Paganahin ito sa Mga Setting.';

  @override
  String get network => 'Network';

  @override
  String get networkMatch => 'Tugma sa Network';

  @override
  String get noSearchHistory => 'Walang history ng paghahanap';

  @override
  String get searchHistory => 'Kasaysayan ng Paghahanap';

  @override
  String get invalidLink => 'Di-wastong link';

  @override
  String get unableToOpenWebPage => 'Hindi mabuksan ang web page';

  @override
  String get imageMemory => '[Image memory]';

  @override
  String get tapToOpenWebPage => 'I-tap para buksan ang web page';

  @override
  String get editEntry => 'I-edit ang Entry';

  @override
  String get entryDetails => 'Mga Detalye ng Entry';

  @override
  String get noContent => 'Walang nilalaman';

  @override
  String get diaryNotFound => 'Hindi natagpuan ang talaarawan';

  @override
  String get diaryNotFoundShort => 'Hindi nahanap ang record';

  @override
  String get aiSummary => 'Buod ng AI';

  @override
  String get microphoneInterrupted =>
      'Naputol ang mikropono, huminto ang pagre-record.';

  @override
  String get bold => 'Matapang';

  @override
  String get italic => 'Italic';

  @override
  String get strikethrough => 'Strikethrough';

  @override
  String get image => 'Imahe';

  @override
  String get asrUnavailableRecordingActive =>
      'Hindi available ang ASR. Aktibo pa rin ang pagre-record.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Isulat ang iyong entry...';

  @override
  String get writeYourContent => 'Isulat ang iyong nilalaman...';

  @override
  String microphoneStartFailed(String error) {
    return 'Nabigong simulan ang mikropono: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Naputol ang mikropono, huminto ang pagre-record.';

  @override
  String asrReconnectingError(String error) {
    return 'Muling kumonekta sa ASR: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Inilagay ang larawan: $name';
  }

  @override
  String voiceError(String error) {
    return 'Error sa boses: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Paumanhin, kasalukuyang hindi available ang serbisyo ng AI: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Nabigong ibahagi: $error';
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
    return '$matchType · $count hit';
  }

  @override
  String matchCount(int count) {
    return 'Tugma: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Pinagmulan: $source';
  }

  @override
  String get createNew => 'Lumikha';

  @override
  String micStartFailed(String error) {
    return 'Nabigo ang pagsisimula ng mikropono: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Mga Account: +$created / na-update $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Diary: +$created / na-update $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Mga Paalala: +$created / na-update $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Nilaktawan: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Kabuuang nabago: $count';
  }

  @override
  String get settingsApplied => 'Inilapat ang mga setting sa backup.';

  @override
  String get settingsNotApplied => 'Hindi nailapat ang mga setting sa backup.';

  @override
  String backupExported(String path) {
    return 'Na-export ang backup: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Nabigo ang pag-export: $error';
  }

  @override
  String importFailed(String error) {
    return 'Nabigo ang pag-import: $error';
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

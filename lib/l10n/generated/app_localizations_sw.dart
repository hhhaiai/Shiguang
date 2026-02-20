// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get languageName => 'Kiswahili';

  @override
  String get languageNameEn => 'Swahili';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Mipangilio';

  @override
  String get account => 'Akaunti';

  @override
  String get reminders => 'Vikumbusho';

  @override
  String get language => 'Lugha';

  @override
  String get appLanguage => 'Lugha ya Programu';

  @override
  String get appearance => 'Muonekano';

  @override
  String get themeMode => 'Hali ya Mandhari';

  @override
  String get dark => 'Giza';

  @override
  String get light => 'Mwanga';

  @override
  String get system => 'Mfumo';

  @override
  String get aiService => 'Huduma ya AI';

  @override
  String get aiChatProvider => 'Mtoa Gumzo wa AI';

  @override
  String get chatModel => 'Mfano wa Gumzo';

  @override
  String get localModel => 'Mfano wa Mitaa';

  @override
  String get localModelDefault => 'Muundo wa Karibu (Chaguomsingi)';

  @override
  String get ollamaEndpoint => 'Mwisho wa Ollama';

  @override
  String get ollamaModel => 'Mfano wa Ollama';

  @override
  String get openAiEndpoint => 'Mwisho wa OpenAI';

  @override
  String get openAiApiKey => 'Kitufe cha OpenAI API';

  @override
  String get openAiModel => 'Mfano wa OpenAI';

  @override
  String get geminiEndpoint => 'Mwisho wa Gemini';

  @override
  String get geminiApiKey => 'Ufunguo wa API ya Gemini';

  @override
  String get geminiModel => 'Mifano ya Gemini';

  @override
  String get anthropicEndpoint => 'Mwisho wa Anthropic';

  @override
  String get anthropicApiKey => 'Ufunguo wa API ya Anthropic';

  @override
  String get anthropicModel => 'Mfano wa Anthropic';

  @override
  String get customProtocol => 'Itifaki Maalum';

  @override
  String get protocol => 'Itifaki';

  @override
  String get customEndpoint => 'Sehemu Maalum ya Mwisho';

  @override
  String get customApiKey => 'Ufunguo Maalum wa API';

  @override
  String get customModel => 'Muundo Maalum';

  @override
  String get optionalForLocalServers => 'Hiari kwa seva za kawaida/maalum';

  @override
  String get speechRecognitionEngine => 'Injini ya Utambuzi wa Hotuba';

  @override
  String get local => 'Ndani';

  @override
  String get endpoint => 'Mwisho';

  @override
  String get localSpeechModel => 'Muundo wa Usemi wa Karibu';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (kwenye kifaa)';

  @override
  String get systemSpeechRecognition => 'Utambuzi wa Usemi wa Mfumo';

  @override
  String get systemRecognitionAndroidIos => 'Utambuzi wa Mfumo (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Utambuzi wa sehemu ya mwisho (Wingu/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Tumia kitambuaji cha ndani cha Android / iOS (kinaweza kutumia wingu)';

  @override
  String get voiceAiEndpoint => 'Sehemu ya Mwisho ya Sauti AI';

  @override
  String get embeddingModel => 'Muundo wa Kupachika';

  @override
  String get crossDeviceSync => 'Usawazishaji wa Kifaa Mtambuka';

  @override
  String get sendToOtherDevices => 'Tuma kwa Vifaa Vingine (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Hamisha nakala rudufu na utume kupitia laha ya kushiriki';

  @override
  String get importFromLocalSend => 'Ingiza kutoka kwa LocalSend';

  @override
  String get selectBackupJson =>
      'Chagua nakala ya JSON na uunganishe data ya ndani';

  @override
  String get autoGeneration => 'Kizazi Otomatiki';

  @override
  String get autoGenerateSummary => 'Tengeneza Muhtasari Otomatiki';

  @override
  String get generateAiSummaryForNewEntries =>
      'Tengeneza muhtasari wa AI kwa maingizo mapya';

  @override
  String get autoGenerateEmbedding => 'Tengeneza Upachikaji Kiotomatiki';

  @override
  String get generateVectorEmbedding =>
      'Tengeneza upachikaji wa vekta kwa utafutaji';

  @override
  String get enableNetworkSearch => 'Washa Utafutaji wa Mtandao';

  @override
  String get allowOnlineRetrieval =>
      'Ruhusu urejeshaji mtandaoni kwa utafutaji na gumzo la AI (zimwa kwa chaguomsingi)';

  @override
  String get about => 'Kuhusu';

  @override
  String version(String version) {
    return 'Toleo la $version';
  }

  @override
  String get database => 'Hifadhidata';

  @override
  String get objectBoxWithHnsw => 'ObjectBox na HNSW index';

  @override
  String get logOut => 'Toka nje';

  @override
  String get custom => 'Desturi';

  @override
  String get openAiCompatible => 'OpenAI Sambamba';

  @override
  String get notSet => 'Haijawekwa';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'Inaauni miisho ya ndani/LAN/ya umma';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalTuma Backup';

  @override
  String get localBackupFromShiguang =>
      'Hifadhi nakala ya ndani kutoka kwa Shiguang (pokea kupitia LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Chagua faili ya chelezo iliyopokelewa kutoka kwa LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Imeshindwa kutatua njia ya faili iliyochaguliwa';

  @override
  String get importOptions => 'Chaguzi za Kuingiza';

  @override
  String get importSettingsAsWell =>
      'Leta mipangilio pia?\n(Vifunguo vya API hazitafutwa)';

  @override
  String get dataOnly => 'Data Pekee';

  @override
  String get dataAndSettings => 'Data + Mipangilio';

  @override
  String get importCompleted => 'Uingizaji Umekamilika';

  @override
  String get settingsInBackupWereApplied =>
      'Mipangilio katika chelezo ilitumika.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Mipangilio katika chelezo haikutumika.';

  @override
  String get ok => 'Sawa';

  @override
  String get cancel => 'Ghairi';

  @override
  String get save => 'Hifadhi';

  @override
  String get delete => 'Futa';

  @override
  String get clear => 'Wazi';

  @override
  String get add => 'Ongeza';

  @override
  String get create => 'Unda';

  @override
  String get edit => 'Hariri';

  @override
  String get search => 'Tafuta';

  @override
  String get areYouSureYouWantToLogOut => 'Je, una uhakika unataka kutoka?';

  @override
  String get chooseLanguage => 'Chagua Lugha';

  @override
  String get databaseInfo => 'Maelezo ya Hifadhidata';

  @override
  String get storage => 'Hifadhi: ObjectBox';

  @override
  String get vectorIndex => 'Kielezo cha Vekta: HNSW';

  @override
  String get dimensions => 'Vipimo: 384';

  @override
  String get embeddingModelBge => 'Muundo wa Kupachika: bge-ndogo-zh-v1.5';

  @override
  String get takePhoto => 'Piga Picha';

  @override
  String get chooseFromGallery => 'Chagua kutoka kwenye Matunzio';

  @override
  String get editNickname => 'Hariri Jina la Utani';

  @override
  String get enterNickname => 'Weka jina la utani';

  @override
  String get pleaseEnterNickname => 'Tafadhali weka jina la utani';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Jina la utani tayari lipo au ni batili';

  @override
  String get user => 'Mtumiaji';

  @override
  String get manageScheduledReminders =>
      'Dhibiti vikumbusho na kengele zilizoratibiwa';

  @override
  String get imageFailedToLoad =>
      'Picha imeshindwa kupakia. Tafadhali chagua tena.';

  @override
  String get imageIsStillLoading => 'Picha bado inapakia';

  @override
  String get imageAreaNotReady =>
      'Eneo la picha haliko tayari. Tafadhali jaribu tena.';

  @override
  String get cropFrameNotReady =>
      'Fremu ya mazao haiko tayari. Tafadhali jaribu tena.';

  @override
  String get invalidCropArea =>
      'Eneo la upunguzaji batili. Tafadhali jaribu tena.';

  @override
  String get cropFailed => 'Imeshindwa kupunguza. Tafadhali jaribu tena.';

  @override
  String get cropAvatar => 'Avatar ya mazao';

  @override
  String get chooseAgain => 'Chagua Tena';

  @override
  String get rotate90 => 'Zungusha 90 °';

  @override
  String get dragFrameToMove =>
      'Buruta fremu ili usogeze, buruta chini kulia ili kubadilisha ukubwa; Bana ili kukuza na kusogeza picha.';

  @override
  String get pleaseFillInAllFields => 'Tafadhali jaza sehemu zote';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN lazima iwe na angalau tarakimu 4';

  @override
  String get pinAtLeast4Digits => 'PIN lazima iwe na angalau tarakimu 4';

  @override
  String get invalidUsernameOrPin => 'Jina la mtumiaji au PIN si sahihi';

  @override
  String get invalidUsernameOrPinError => 'Jina la mtumiaji au PIN si sahihi';

  @override
  String get usernameAlreadyExists => 'Jina la mtumiaji tayari lipo';

  @override
  String get captureMomentsKeepMemories => 'Nasa matukio, weka kumbukumbu';

  @override
  String get username => 'Jina la mtumiaji';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Ingia';

  @override
  String get createAccount => 'Fungua Akaunti';

  @override
  String get dontHaveAccountCreateOne => 'Je, huna akaunti? Unda moja';

  @override
  String get alreadyHaveAccountLogin => 'Je, tayari una akaunti? Ingia';

  @override
  String get pleaseEnterUsername => 'Tafadhali weka jina la mtumiaji';

  @override
  String get pinsDoNotMatch => 'PIN hazilingani';

  @override
  String get tapToAddAvatar => 'Gusa ili kuongeza avatar';

  @override
  String get yourName => 'Jina Lako';

  @override
  String get privatePinOptional => 'PIN ya Faragha (si lazima)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Inatumika kusimba rekodi za kibinafsi';

  @override
  String get privatePin => 'PIN ya faragha';

  @override
  String get leaveEmptyForNoEncryption => 'Acha tupu bila usimbaji fiche';

  @override
  String get confirmPin => 'Thibitisha PIN';

  @override
  String get getStarted => 'Anza';

  @override
  String get noReminders => 'Hakuna vikumbusho';

  @override
  String get addReminder => 'Ongeza Kikumbusho';

  @override
  String get title => 'Kichwa';

  @override
  String get descriptionOptional => 'Maelezo (ya hiari)';

  @override
  String get microphonePermissionRequired => 'Ruhusa ya maikrofoni inahitajika';

  @override
  String get aiAssistant => 'Msaidizi wa AI';

  @override
  String get listening => 'Inasikiliza...';

  @override
  String get typeAMessage => 'Andika ujumbe...';

  @override
  String get aiChat => 'Gumzo la AI';

  @override
  String get startAConversation => 'Anzisha mazungumzo';

  @override
  String get typeYourMessage => 'Andika ujumbe wako...';

  @override
  String get asrReconnecting => 'ASR inaunganisha upya...';

  @override
  String get write => 'Andika';

  @override
  String get writeEntry => 'Andika Ingizo';

  @override
  String get noMemoriesYet => 'Hakuna kumbukumbu bado';

  @override
  String get tapPlusToCapture => 'Gonga + ili kunasa mawazo yako';

  @override
  String get tapPlusToCaptureYourThoughts => 'Gonga + ili kunasa mawazo yako';

  @override
  String get deleteMemory => 'Futa Kumbukumbu';

  @override
  String get deleteRecord => 'Futa Rekodi';

  @override
  String get thisEntryWillBeRemoved =>
      'Ingizo hili litaondolewa kwenye rekodi yako ya matukio.';

  @override
  String get thisRecordWillBeRemoved =>
      'Rekodi hii itaondolewa kwenye rekodi yako ya matukio.';

  @override
  String get searchYourRecords => 'Tafuta rekodi zako...';

  @override
  String get exactMatches => 'Mechi Halisi';

  @override
  String get noExactMatches => 'Hakuna zinazolingana kabisa';

  @override
  String get exact => 'Hasa';

  @override
  String get exactMatch => 'Mechi Halisi';

  @override
  String get fuzzyMatches => 'Mechi za Fuzzy';

  @override
  String get noFuzzyMatches => 'Hakuna mechi za fuzzy';

  @override
  String get vectorMatch => 'Mechi ya Vector';

  @override
  String get networkMatches => 'Mechi za Mtandao';

  @override
  String get noNetworkMatches => 'Hakuna mtandao unaolingana';

  @override
  String get networkSearchIsOff =>
      'Utafutaji wa mtandao umezimwa. Iwashe katika Mipangilio.';

  @override
  String get network => 'Mtandao';

  @override
  String get networkMatch => 'Mechi ya Mtandao';

  @override
  String get noSearchHistory => 'Hakuna historia ya utafutaji';

  @override
  String get searchHistory => 'Historia ya Utafutaji';

  @override
  String get invalidLink => 'Kiungo batili';

  @override
  String get unableToOpenWebPage => 'Imeshindwa kufungua ukurasa wa wavuti';

  @override
  String get imageMemory => '[Kumbukumbu ya picha]';

  @override
  String get tapToOpenWebPage => 'Gusa ili kufungua ukurasa wa wavuti';

  @override
  String get editEntry => 'Badilisha Ingizo';

  @override
  String get entryDetails => 'Maelezo ya Kuingia';

  @override
  String get noContent => 'Hakuna maudhui';

  @override
  String get diaryNotFound => 'Shajara haijapatikana';

  @override
  String get diaryNotFoundShort => 'Rekodi haijapatikana';

  @override
  String get aiSummary => 'Muhtasari wa AI';

  @override
  String get microphoneInterrupted =>
      'Maikrofoni imekatizwa, kurekodi kumesimamishwa.';

  @override
  String get bold => 'Ujasiri';

  @override
  String get italic => 'Italiki';

  @override
  String get strikethrough => 'Mgomo';

  @override
  String get image => 'Picha';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR haipatikani. Kurekodi bado kunatumika.';

  @override
  String get writeYourEntry => 'Andika ingizo lako...';

  @override
  String get writeYourContent => 'Andika maudhui yako...';

  @override
  String microphoneStartFailed(String error) {
    return 'Imeshindwa kuwasha maikrofoni: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Maikrofoni imekatizwa, kurekodi kumesimamishwa.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR inaunganisha upya: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Picha imeingizwa: $name';
  }

  @override
  String voiceError(String error) {
    return 'Hitilafu ya sauti: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Samahani, huduma ya AI haipatikani kwa sasa: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Imeshindwa kushiriki: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count vibao';
  }

  @override
  String matchCount(int count) {
    return 'Inayolingana: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Chanzo: $source';
  }

  @override
  String get createNew => 'Unda';

  @override
  String micStartFailed(String error) {
    return 'Kuanza kwa maikrofoni kumeshindwa: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Akaunti: +$created / imesasishwa $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Shajara: +$created / imesasishwa $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Vikumbusho: +$created / imesasishwa $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Imeruka: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Jumla imebadilishwa: $count';
  }

  @override
  String get settingsApplied => 'Mipangilio katika chelezo ilitumika.';

  @override
  String get settingsNotApplied => 'Mipangilio katika chelezo haikutumika.';

  @override
  String backupExported(String path) {
    return 'Hifadhi rudufu imehamishwa: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Uhamishaji haukufaulu: $error';
  }

  @override
  String importFailed(String error) {
    return 'Imeshindwa kuleta: $error';
  }
}

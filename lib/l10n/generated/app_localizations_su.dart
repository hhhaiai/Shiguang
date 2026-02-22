// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sundanese (`su`).
class AppLocalizationsSu extends AppLocalizations {
  AppLocalizationsSu([String locale = 'su']) : super(locale);

  @override
  String get languageName => 'Basa Sunda';

  @override
  String get languageNameEn => 'Sundanese';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Setélan';

  @override
  String get account => 'Rekening';

  @override
  String get reminders => 'Pangéling-ngéling';

  @override
  String get language => 'Basa';

  @override
  String get appLanguage => 'Basa Aplikasi';

  @override
  String get appearance => 'Penampilan';

  @override
  String get themeMode => 'Mode Téma';

  @override
  String get dark => 'Poek';

  @override
  String get light => 'Caang';

  @override
  String get system => 'Sistim';

  @override
  String get aiService => 'Layanan AI';

  @override
  String get aiChatProvider => 'AI Chat Provider';

  @override
  String get chatModel => 'Modél obrolan';

  @override
  String get localModel => 'Modél Lokal';

  @override
  String get localModelDefault => 'Modél Lokal (Default)';

  @override
  String get ollamaEndpoint => 'Ollama Endpoint';

  @override
  String get ollamaModel => 'Modél Ollama';

  @override
  String get openAiEndpoint => 'OpenAI Endpoint';

  @override
  String get openAiApiKey => 'Konci API OpenAI';

  @override
  String get openAiModel => 'Modél OpenAI';

  @override
  String get geminiEndpoint => 'Gemini Endpoint';

  @override
  String get geminiApiKey => 'Gemini API Key';

  @override
  String get geminiModel => 'Modél Gemini';

  @override
  String get anthropicEndpoint => 'Titik Tungtung Antropik';

  @override
  String get anthropicApiKey => 'Konci API antropik';

  @override
  String get anthropicModel => 'Modél Antropik';

  @override
  String get customProtocol => 'Protokol Adat';

  @override
  String get protocol => 'Protokol';

  @override
  String get customEndpoint => 'Custom Endpoint';

  @override
  String get customApiKey => 'Custom API Key';

  @override
  String get customModel => 'Modél custom';

  @override
  String get optionalForLocalServers => 'Pilihan pikeun lokal / server custom';

  @override
  String get speechRecognitionEngine => 'Mesin Pangenal Biantara';

  @override
  String get local => 'Lokal';

  @override
  String get endpoint => 'Titik tungtung';

  @override
  String get localSpeechModel => 'Modél Biantara Lokal';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (dina alat)';

  @override
  String get systemSpeechRecognition => 'Pangenal Biantara Sistem';

  @override
  String get systemRecognitionAndroidIos => 'Pangenal Sistem (Android/ios)';

  @override
  String get endpointRecognitionCloudWs => 'Pangenal Titik Tungtung (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Anggo pangenal Android / iOS anu diwangun (tiasa nganggo awan)';

  @override
  String get voiceAiEndpoint => 'Sora AI Endpoint';

  @override
  String get embeddingModel => 'Modél Embedding';

  @override
  String get crossDeviceSync => 'Sinkronisasi lintas-alat';

  @override
  String get sendToOtherDevices => 'Kirim ka Alat Lain (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Ékspor cadangan sareng kirimkeun via lambar saham';

  @override
  String get importFromLocalSend => 'Impor ti LocalSend';

  @override
  String get selectBackupJson =>
      'Pilih cadangan JSON sareng gabungkeun data lokal';

  @override
  String get autoGeneration => 'Generasi Otomatis';

  @override
  String get autoGenerateSummary => 'Otomatis Generate Ringkesan';

  @override
  String get generateAiSummaryForNewEntries =>
      'Ngahasilkeun kasimpulan AI pikeun éntri anyar';

  @override
  String get autoGenerateEmbedding => 'Otomatis Ngahasilkeun Embedding';

  @override
  String get generateVectorEmbedding =>
      'Ngahasilkeun embedding vektor pikeun milarian';

  @override
  String get enableNetworkSearch => 'Aktipkeun Search Network';

  @override
  String get allowOnlineRetrieval =>
      'Ngidinan panéangan online pikeun milarian sareng obrolan AI (pareum sacara standar)';

  @override
  String get about => 'Ngeunaan';

  @override
  String version(String version) {
    return 'Vérsi $version';
  }

  @override
  String get database => 'Pangkalan data';

  @override
  String get objectBoxWithHnsw => 'ObjectBox kalawan indéks HNSW';

  @override
  String get logOut => 'Kaluar';

  @override
  String get custom => 'Adat';

  @override
  String get openAiCompatible => 'OpenAI Cocog';

  @override
  String get notSet => 'Teu diatur';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Ngarojong lokal / LAN / titik tungtung umum';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend Nyadangkeun';

  @override
  String get localBackupFromShiguang =>
      'Cadangan lokal ti Shiguang (nampi via LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Pilih payel cadangan nampi ti LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Gagal ngabéréskeun jalur file anu dipilih';

  @override
  String get importOptions => 'Pilihan impor';

  @override
  String get importSettingsAsWell =>
      'Setélan impor ogé?\n(Konci API moal ditimpa)';

  @override
  String get dataOnly => 'Data Ngan';

  @override
  String get dataAndSettings => 'Data + Setélan';

  @override
  String get importCompleted => 'Impor Réngsé';

  @override
  String get settingsInBackupWereApplied =>
      'Setélan dina cadangan diterapkeun.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Setélan dina cadangan teu dilarapkeun.';

  @override
  String get ok => 'OKÉ';

  @override
  String get cancel => 'Ngabolaykeun';

  @override
  String get save => 'Simpen';

  @override
  String get delete => 'Hapus';

  @override
  String get clear => 'Jelas';

  @override
  String get add => 'Tambihan';

  @override
  String get create => 'Nyiptakeun';

  @override
  String get edit => 'Édit';

  @override
  String get search => 'Pilarian';

  @override
  String get areYouSureYouWantToLogOut => 'Anjeun yakin rék kaluar?';

  @override
  String get chooseLanguage => 'Pilih Basa';

  @override
  String get databaseInfo => 'Inpormasi pangkalan data';

  @override
  String get storage => 'Panyimpenan: ObjectBox';

  @override
  String get vectorIndex => 'Indéks Véktor: HNSW';

  @override
  String get dimensions => 'Ukuran: 384';

  @override
  String get embeddingModelBge => 'Embedding Modél: bge-leutik-zh-v1.5';

  @override
  String get takePhoto => 'Nyokot Poto';

  @override
  String get chooseFromGallery => 'Pilih ti Galeri';

  @override
  String get editNickname => 'Edit Nickname';

  @override
  String get enterNickname => 'Lebetkeun landihan';

  @override
  String get pleaseEnterNickname => 'Mangga lebetkeun nickname';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Nickname geus aya atawa teu valid';

  @override
  String get user => 'Pamaké';

  @override
  String get manageScheduledReminders =>
      'Atur panginget sareng alarm anu dijadwalkeun';

  @override
  String get imageFailedToLoad => 'Gambar gagal dimuat. Mangga pilih deui.';

  @override
  String get imageIsStillLoading => 'Gambar masih dimuat';

  @override
  String get imageAreaNotReady =>
      'Wewengkon gambar teu siap. Mangga cobian deui.';

  @override
  String get cropFrameNotReady =>
      'Pigura pamotongan teu siap. Mangga cobian deui.';

  @override
  String get invalidCropArea =>
      'Wewengkon pamotongan teu valid. Mangga cobian deui.';

  @override
  String get cropFailed => 'Pamotongan gagal. Mangga cobian deui.';

  @override
  String get cropAvatar => 'Potong Avatar';

  @override
  String get chooseAgain => 'Pilih Deui';

  @override
  String get rotate90 => 'Puteran 90°';

  @override
  String get dragFrameToMove =>
      'Sered pigura pikeun mindahkeun, sered ka katuhu handap pikeun ngarobah ukuran; ciwit pikeun ngazum sareng mindahkeun gambar.';

  @override
  String get pleaseFillInAllFields => 'Mangga eusian sagala widang';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN kedah sahenteuna 4 digit';

  @override
  String get pinAtLeast4Digits => 'PIN kedah sahenteuna 4 digit';

  @override
  String get invalidUsernameOrPin => 'ngaran pamaké atawa PIN teu valid';

  @override
  String get invalidUsernameOrPinError => 'ngaran pamaké atawa PIN teu valid';

  @override
  String get usernameAlreadyExists => 'Ngaran pamaké geus aya';

  @override
  String get captureMomentsKeepMemories => 'Candak moments, tetep kenangan';

  @override
  String get username => 'Ngaran pamaké';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Lebet';

  @override
  String get createAccount => 'Ngadamel akun';

  @override
  String get dontHaveAccountCreateOne => 'Teu gaduh akun? Jieun hiji';

  @override
  String get alreadyHaveAccountLogin => 'Geus boga akun? Lebet';

  @override
  String get pleaseEnterUsername => 'Mangga lebetkeun ngaran pamaké';

  @override
  String get pinsDoNotMatch => 'PIN teu cocog';

  @override
  String get tapToAddAvatar => 'Ketok pikeun nambahkeun avatar';

  @override
  String get yourName => 'Nami anjeun';

  @override
  String get privatePinOptional => 'PIN swasta (opsional)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Dipaké pikeun énkripsi rékaman pribadi';

  @override
  String get privatePin => 'PIN swasta';

  @override
  String get leaveEmptyForNoEncryption =>
      'Ninggalkeun kosong pikeun euweuh enkripsi';

  @override
  String get confirmPin => 'Konfirmasi PIN';

  @override
  String get getStarted => 'Mimitian';

  @override
  String get noReminders => 'Taya panginget';

  @override
  String get addReminder => 'Tambahkeun Panginget';

  @override
  String get title => 'Judul';

  @override
  String get descriptionOptional => 'Katerangan (opsional)';

  @override
  String get microphonePermissionRequired => 'idin mikropon diperlukeun';

  @override
  String get aiAssistant => 'Asisten AI';

  @override
  String get listening => 'Dengekeun...';

  @override
  String get typeAMessage => 'Ketik pesen...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Mimitian paguneman';

  @override
  String get typeYourMessage => 'Ketik pesen anjeun...';

  @override
  String get asrReconnecting => 'ASR nyambung deui...';

  @override
  String get write => 'Tulis';

  @override
  String get writeEntry => 'Tulis Éntri';

  @override
  String get noMemoriesYet => 'Euweuh kenangan acan';

  @override
  String get tapPlusToCapture => 'Ketok + pikeun moto pikiran anjeun';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Ketok + pikeun moto pikiran anjeun';

  @override
  String get deleteMemory => 'Pupus Mémori';

  @override
  String get deleteRecord => 'Pupus Rékam';

  @override
  String get thisEntryWillBeRemoved =>
      'Éntri ieu bakal dipiceun tina timeline anjeun.';

  @override
  String get thisRecordWillBeRemoved =>
      'Rékam ieu bakal dipupus tina timeline anjeun.';

  @override
  String get searchYourRecords => 'Pilarian rékaman anjeun...';

  @override
  String get exactMatches => 'Cocog Pas';

  @override
  String get noExactMatches => 'Taya patandingan pasti';

  @override
  String get exact => 'Persis';

  @override
  String get exactMatch => 'Cocog Pas';

  @override
  String get fuzzyMatches => 'Cocog Fuzzy';

  @override
  String get noFuzzyMatches => 'Taya patandingan Fuzzy';

  @override
  String get vectorMatch => 'Véktor Cocog';

  @override
  String get networkMatches => 'Pertandingan jaringan';

  @override
  String get noNetworkMatches => 'Taya jaringan cocog';

  @override
  String get networkSearchIsOff =>
      'Pilarian jaringan pareum. Aktipkeun dina Setélan.';

  @override
  String get network => 'Jaringan';

  @override
  String get networkMatch => 'Pertandingan Jaringan';

  @override
  String get noSearchHistory => 'Taya sajarah pilarian';

  @override
  String get searchHistory => 'Sajarah Pilarian';

  @override
  String get invalidLink => 'Tumbu teu valid';

  @override
  String get unableToOpenWebPage => 'Teu tiasa muka halaman wéb';

  @override
  String get imageMemory => '[Memori gambar]';

  @override
  String get tapToOpenWebPage => 'Ketok pikeun muka halaman wéb';

  @override
  String get editEntry => 'Éntri Éntri';

  @override
  String get entryDetails => 'Rincian Éntri';

  @override
  String get noContent => 'Taya eusi';

  @override
  String get diaryNotFound => 'Diary teu kapanggih';

  @override
  String get diaryNotFoundShort => 'Rékam teu kapanggih';

  @override
  String get aiSummary => 'Ringkesan AI';

  @override
  String get microphoneInterrupted => 'Mikropon diganggu, ngarékam eureun.';

  @override
  String get bold => 'Kandel';

  @override
  String get italic => 'Miring';

  @override
  String get strikethrough => 'neunggeul';

  @override
  String get image => 'Gambar';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR teu sadia. Ngarékam masih aktip.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Tulis entri anjeun ...';

  @override
  String get writeYourContent => 'Tulis eusi anjeun...';

  @override
  String microphoneStartFailed(String error) {
    return 'Gagal ngamimitian mikropon: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikropon diganggu, ngarékam eureun.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR nyambungkeun deui: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Gambar diselapkeun: $name';
  }

  @override
  String voiceError(String error) {
    return 'Kasalahan sora: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Punten, jasa AI ayeuna teu sayogi: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Gagal dibagikeun: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count hits';
  }

  @override
  String matchCount(int count) {
    return 'Cocog: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Sumber: $source';
  }

  @override
  String get createNew => 'Nyiptakeun';

  @override
  String micStartFailed(String error) {
    return 'Mic mimiti gagal: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Akun: +$created / diropéa $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Diaries: +$created / diropéa $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Panginget: +$created / diropéa $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Dilewatan: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Total robah: $count';
  }

  @override
  String get settingsApplied => 'Setélan dina cadangan diterapkeun.';

  @override
  String get settingsNotApplied => 'Setélan dina cadangan teu dilarapkeun.';

  @override
  String backupExported(String path) {
    return 'Cadangan diékspor: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Ékspor gagal: $error';
  }

  @override
  String importFailed(String error) {
    return 'Impor gagal: $error';
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

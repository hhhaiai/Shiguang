// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get languageName => 'Bahasa Melayu';

  @override
  String get languageNameEn => 'Malay';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'tetapan';

  @override
  String get account => 'Akaun';

  @override
  String get reminders => 'Peringatan';

  @override
  String get language => 'Bahasa';

  @override
  String get appLanguage => 'Bahasa Apl';

  @override
  String get appearance => 'Penampilan';

  @override
  String get themeMode => 'Mod Tema';

  @override
  String get dark => 'Gelap';

  @override
  String get light => 'Cahaya';

  @override
  String get system => 'Sistem';

  @override
  String get aiService => 'Perkhidmatan AI';

  @override
  String get aiChatProvider => 'Pembekal Sembang AI';

  @override
  String get chatModel => 'Model Sembang';

  @override
  String get localModel => 'Model Tempatan';

  @override
  String get localModelDefault => 'Model Setempat (Lalai)';

  @override
  String get ollamaEndpoint => 'Titik Akhir Ollama';

  @override
  String get ollamaModel => 'Model Ollama';

  @override
  String get openAiEndpoint => 'Titik Akhir OpenAI';

  @override
  String get openAiApiKey => 'OpenAI API Key';

  @override
  String get openAiModel => 'OpenAI Model';

  @override
  String get geminiEndpoint => 'Titik Akhir Gemini';

  @override
  String get geminiApiKey => 'Kunci API Gemini';

  @override
  String get geminiModel => 'Model Gemini';

  @override
  String get anthropicEndpoint => 'Titik Akhir Antropik';

  @override
  String get anthropicApiKey => 'Kunci API Anthropic';

  @override
  String get anthropicModel => 'Model Antropik';

  @override
  String get customProtocol => 'Protokol Tersuai';

  @override
  String get protocol => 'Protokol';

  @override
  String get customEndpoint => 'Titik Akhir Tersuai';

  @override
  String get customApiKey => 'Kunci API Tersuai';

  @override
  String get customModel => 'Model Tersuai';

  @override
  String get optionalForLocalServers =>
      'Pilihan untuk pelayan tempatan/tersuai';

  @override
  String get speechRecognitionEngine => 'Enjin Pengecaman Pertuturan';

  @override
  String get local => 'Tempatan';

  @override
  String get endpoint => 'Titik akhir';

  @override
  String get localSpeechModel => 'Model Pertuturan Tempatan';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (pada peranti)';

  @override
  String get systemSpeechRecognition => 'Pengecaman Pertuturan Sistem';

  @override
  String get systemRecognitionAndroidIos => 'Pengecaman Sistem (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Pengecaman Titik Akhir (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Gunakan pengecam Android / iOS terbina dalam (mungkin menggunakan awan)';

  @override
  String get voiceAiEndpoint => 'Titik Akhir AI Suara';

  @override
  String get embeddingModel => 'Model Benam';

  @override
  String get crossDeviceSync => 'Penyegerakan Merentas Peranti';

  @override
  String get sendToOtherDevices => 'Hantar ke Peranti Lain (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Eksport sandaran dan hantar melalui helaian saham';

  @override
  String get importFromLocalSend => 'Import daripada LocalSend';

  @override
  String get selectBackupJson =>
      'Pilih JSON sandaran dan gabungkan data setempat';

  @override
  String get autoGeneration => 'Penjanaan Auto';

  @override
  String get autoGenerateSummary => 'Auto Jana Ringkasan';

  @override
  String get generateAiSummaryForNewEntries =>
      'Hasilkan ringkasan AI untuk entri baharu';

  @override
  String get autoGenerateEmbedding => 'Auto Generate Embedding';

  @override
  String get generateVectorEmbedding =>
      'Hasilkan pembenaman vektor untuk carian';

  @override
  String get enableNetworkSearch => 'Dayakan Carian Rangkaian';

  @override
  String get allowOnlineRetrieval =>
      'Benarkan mendapatkan semula dalam talian untuk carian dan sembang AI (dimatikan secara lalai)';

  @override
  String get about => 'Tentang';

  @override
  String version(String version) {
    return 'Versi $version';
  }

  @override
  String get database => 'Pangkalan data';

  @override
  String get objectBoxWithHnsw => 'ObjectBox dengan indeks HNSW';

  @override
  String get logOut => 'Log Keluar';

  @override
  String get custom => 'Adat';

  @override
  String get openAiCompatible => 'Serasi OpenAI';

  @override
  String get notSet => 'Tidak ditetapkan';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Menyokong titik akhir tempatan/LAN/awam';

  @override
  String get shiguangLocalSendBackup => 'Sandaran Hantar Tempatan Shiguang';

  @override
  String get localBackupFromShiguang =>
      'Sandaran tempatan daripada Shiguang (terima melalui LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Pilih fail sandaran yang diterima daripada LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Gagal menyelesaikan laluan fail yang dipilih';

  @override
  String get importOptions => 'Pilihan Import';

  @override
  String get importSettingsAsWell =>
      'Import tetapan juga?\n(Kunci API tidak akan ditimpa)';

  @override
  String get dataOnly => 'Data Sahaja';

  @override
  String get dataAndSettings => 'Data + Tetapan';

  @override
  String get importCompleted => 'Import Selesai';

  @override
  String get settingsInBackupWereApplied =>
      'Tetapan dalam sandaran telah digunakan.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Tetapan dalam sandaran tidak digunakan.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Batal';

  @override
  String get save => 'Jimat';

  @override
  String get delete => 'Padam';

  @override
  String get clear => 'Jelas';

  @override
  String get add => 'Tambah';

  @override
  String get create => 'Buat';

  @override
  String get edit => 'Sunting';

  @override
  String get search => 'Cari';

  @override
  String get areYouSureYouWantToLogOut => 'Adakah anda pasti mahu log keluar?';

  @override
  String get chooseLanguage => 'Pilih Bahasa';

  @override
  String get databaseInfo => 'Maklumat Pangkalan Data';

  @override
  String get storage => 'Penyimpanan: ObjectBox';

  @override
  String get vectorIndex => 'Indeks Vektor: HNSW';

  @override
  String get dimensions => 'Saiz: 384';

  @override
  String get embeddingModelBge => 'Model Benam: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Ambil Foto';

  @override
  String get chooseFromGallery => 'Pilih daripada Galeri';

  @override
  String get editNickname => 'Edit Nama Panggilan';

  @override
  String get enterNickname => 'Masukkan nama panggilan';

  @override
  String get pleaseEnterNickname => 'Sila masukkan nama panggilan';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Nama panggilan sudah wujud atau tidak sah';

  @override
  String get user => 'pengguna';

  @override
  String get manageScheduledReminders =>
      'Urus peringatan dan penggera yang dijadualkan';

  @override
  String get imageFailedToLoad => 'Imej gagal dimuatkan. Sila pilih lagi.';

  @override
  String get imageIsStillLoading => 'Imej masih dimuatkan';

  @override
  String get imageAreaNotReady => 'Kawasan imej belum sedia. Sila cuba lagi.';

  @override
  String get cropFrameNotReady => 'Bingkai pangkas belum siap. Sila cuba lagi.';

  @override
  String get invalidCropArea => 'Kawasan tanaman tidak sah. Sila cuba lagi.';

  @override
  String get cropFailed => 'Tanaman gagal. Sila cuba lagi.';

  @override
  String get cropAvatar => 'Pangkas Avatar';

  @override
  String get chooseAgain => 'Pilih Lagi';

  @override
  String get rotate90 => 'Putar 90°';

  @override
  String get dragFrameToMove =>
      'Seret bingkai untuk bergerak, seret bahagian bawah ke kanan untuk mengubah saiz; cubit untuk zum dan gerakkan imej.';

  @override
  String get pleaseFillInAllFields => 'Sila isi semua ruangan';

  @override
  String get pinMustBeAtLeast4Digits =>
      'PIN mestilah sekurang-kurangnya 4 digit';

  @override
  String get pinAtLeast4Digits => 'PIN mestilah sekurang-kurangnya 4 digit';

  @override
  String get invalidUsernameOrPin => 'Nama pengguna atau PIN tidak sah';

  @override
  String get invalidUsernameOrPinError => 'Nama pengguna atau PIN tidak sah';

  @override
  String get usernameAlreadyExists => 'Nama pengguna sudah wujud';

  @override
  String get captureMomentsKeepMemories => 'Abadikan detik, simpan kenangan';

  @override
  String get username => 'Nama pengguna';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Log masuk';

  @override
  String get createAccount => 'Buat Akaun';

  @override
  String get dontHaveAccountCreateOne => 'Tiada akaun? Buat satu';

  @override
  String get alreadyHaveAccountLogin => 'Sudah mempunyai akaun? Log masuk';

  @override
  String get pleaseEnterUsername => 'Sila masukkan nama pengguna';

  @override
  String get pinsDoNotMatch => 'PIN tidak sepadan';

  @override
  String get tapToAddAvatar => 'Ketik untuk menambah avatar';

  @override
  String get yourName => 'Nama awak';

  @override
  String get privatePinOptional => 'PIN peribadi (pilihan)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Digunakan untuk menyulitkan rekod peribadi';

  @override
  String get privatePin => 'PIN peribadi';

  @override
  String get leaveEmptyForNoEncryption =>
      'Biarkan kosong untuk tiada penyulitan';

  @override
  String get confirmPin => 'Sahkan PIN';

  @override
  String get getStarted => 'Mulakan';

  @override
  String get noReminders => 'Tiada peringatan';

  @override
  String get addReminder => 'Tambah Peringatan';

  @override
  String get title => 'Tajuk';

  @override
  String get descriptionOptional => 'Penerangan (pilihan)';

  @override
  String get microphonePermissionRequired => 'Kebenaran mikrofon diperlukan';

  @override
  String get aiAssistant => 'Penolong AI';

  @override
  String get listening => 'Mendengar...';

  @override
  String get typeAMessage => 'Taip mesej...';

  @override
  String get aiChat => 'Sembang AI';

  @override
  String get startAConversation => 'Mulakan perbualan';

  @override
  String get typeYourMessage => 'Taip mesej anda...';

  @override
  String get asrReconnecting => 'ASR menyambung semula...';

  @override
  String get write => 'tulis';

  @override
  String get writeEntry => 'Tulis Entri';

  @override
  String get noMemoriesYet => 'Tiada kenangan lagi';

  @override
  String get tapPlusToCapture => 'Ketik + untuk menangkap pemikiran anda';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Ketik + untuk menangkap pemikiran anda';

  @override
  String get deleteMemory => 'Padamkan Memori';

  @override
  String get deleteRecord => 'Padam Rekod';

  @override
  String get thisEntryWillBeRemoved =>
      'Entri ini akan dialih keluar daripada garis masa anda.';

  @override
  String get thisRecordWillBeRemoved =>
      'Rekod ini akan dialih keluar daripada garis masa anda.';

  @override
  String get searchYourRecords => 'Cari rekod anda...';

  @override
  String get exactMatches => 'Padanan Tepat';

  @override
  String get noExactMatches => 'Tiada padanan tepat';

  @override
  String get exact => 'tepat';

  @override
  String get exactMatch => 'Padanan Tepat';

  @override
  String get fuzzyMatches => 'Padanan Kabur';

  @override
  String get noFuzzyMatches => 'Tiada padanan kabur';

  @override
  String get vectorMatch => 'Padanan Vektor';

  @override
  String get networkMatches => 'Padanan Rangkaian';

  @override
  String get noNetworkMatches => 'Tiada padanan rangkaian';

  @override
  String get networkSearchIsOff =>
      'Carian rangkaian dimatikan. Dayakannya dalam Tetapan.';

  @override
  String get network => 'Rangkaian';

  @override
  String get networkMatch => 'Padanan Rangkaian';

  @override
  String get noSearchHistory => 'Tiada sejarah carian';

  @override
  String get searchHistory => 'Sejarah Carian';

  @override
  String get invalidLink => 'Pautan tidak sah';

  @override
  String get unableToOpenWebPage => 'Tidak dapat membuka halaman web';

  @override
  String get imageMemory => '[Memori imej]';

  @override
  String get tapToOpenWebPage => 'Ketik untuk membuka halaman web';

  @override
  String get editEntry => 'Edit Entri';

  @override
  String get entryDetails => 'Butiran Kemasukan';

  @override
  String get noContent => 'Tiada kandungan';

  @override
  String get diaryNotFound => 'Diari tidak ditemui';

  @override
  String get diaryNotFoundShort => 'Rekod tidak ditemui';

  @override
  String get aiSummary => 'Ringkasan AI';

  @override
  String get microphoneInterrupted => 'Mikrofon terganggu, rakaman berhenti.';

  @override
  String get bold => 'berani';

  @override
  String get italic => 'Italic';

  @override
  String get strikethrough => 'Strikethrough';

  @override
  String get image => 'Imej';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR tidak tersedia. Rakaman masih aktif.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Tulis entri anda...';

  @override
  String get writeYourContent => 'Tulis kandungan anda...';

  @override
  String microphoneStartFailed(String error) {
    return 'Gagal memulakan mikrofon: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofon terganggu, rakaman berhenti.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR menyambung semula: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Imej disisipkan: $name';
  }

  @override
  String voiceError(String error) {
    return 'Ralat suara: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Maaf, perkhidmatan AI tidak tersedia pada masa ini: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Gagal berkongsi: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count hits';
  }

  @override
  String matchCount(int count) {
    return 'Padanan: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Sumber: $source';
  }

  @override
  String get createNew => 'Buat';

  @override
  String micStartFailed(String error) {
    return 'Permulaan mikrofon gagal: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Akaun: +$created / dikemas kini $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Diari: +$created / dikemas kini $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Peringatan: +$created / dikemas kini $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Dilangkau: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Jumlah perubahan: $count';
  }

  @override
  String get settingsApplied => 'Tetapan dalam sandaran telah digunakan.';

  @override
  String get settingsNotApplied => 'Tetapan dalam sandaran tidak digunakan.';

  @override
  String backupExported(String path) {
    return 'Sandaran dieksport: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Eksport gagal: $error';
  }

  @override
  String importFailed(String error) {
    return 'Import gagal: $error';
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

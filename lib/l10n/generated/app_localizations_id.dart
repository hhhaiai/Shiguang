// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get languageName => 'Bahasa Indonesia';

  @override
  String get languageNameEn => 'Indonesian';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Pengaturan';

  @override
  String get account => 'Akun';

  @override
  String get reminders => 'Pengingat';

  @override
  String get language => 'Bahasa';

  @override
  String get appLanguage => 'Bahasa Aplikasi';

  @override
  String get appearance => 'Tampilan';

  @override
  String get themeMode => 'Mode Tema';

  @override
  String get dark => 'Gelap';

  @override
  String get light => 'Terang';

  @override
  String get system => 'Sistem';

  @override
  String get aiService => 'Layanan AI';

  @override
  String get aiChatProvider => 'Penyedia Obrolan AI';

  @override
  String get chatModel => 'Model Obrolan';

  @override
  String get localModel => 'Model Lokal';

  @override
  String get localModelDefault => 'Model Lokal (Default)';

  @override
  String get ollamaEndpoint => 'Endpoint Ollama';

  @override
  String get ollamaModel => 'Model Ollama';

  @override
  String get openAiEndpoint => 'Endpoint OpenAI';

  @override
  String get openAiApiKey => 'Kunci API OpenAI';

  @override
  String get openAiModel => 'Model OpenAI';

  @override
  String get geminiEndpoint => 'Endpoint Gemini';

  @override
  String get geminiApiKey => 'Kunci API Gemini';

  @override
  String get geminiModel => 'Model Gemini';

  @override
  String get anthropicEndpoint => 'Endpoint Anthropic';

  @override
  String get anthropicApiKey => 'Kunci API Anthropic';

  @override
  String get anthropicModel => 'Model Anthropic';

  @override
  String get customProtocol => 'Protokol Kustom';

  @override
  String get protocol => 'Protokol';

  @override
  String get customEndpoint => 'Endpoint Kustom';

  @override
  String get customApiKey => 'Kunci API Kustom';

  @override
  String get customModel => 'Model Kustom';

  @override
  String get optionalForLocalServers => 'Opsional untuk server lokal/kustom';

  @override
  String get speechRecognitionEngine => 'Mesin Pengenalan Suara';

  @override
  String get local => 'Lokal';

  @override
  String get endpoint => 'Titik akhir';

  @override
  String get localSpeechModel => 'Model Suara Lokal';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (di perangkat)';

  @override
  String get systemSpeechRecognition => 'Pengenalan Suara Sistem';

  @override
  String get systemRecognitionAndroidIos => 'Pengenalan Sistem (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Pengenalan Endpoint (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Gunakan pengenal bawaan Android/iOS (mungkin menggunakan cloud)';

  @override
  String get voiceAiEndpoint => 'Endpoint Voice AI';

  @override
  String get embeddingModel => 'Model Embedding';

  @override
  String get crossDeviceSync => 'Sinkronisasi Lintas Perangkat';

  @override
  String get sendToOtherDevices => 'Kirim ke Perangkat Lain (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Ekspor cadangan dan kirim melalui lembar berbagi';

  @override
  String get importFromLocalSend => 'Impor dari LocalSend';

  @override
  String get selectBackupJson => 'Pilih JSON cadangan dan gabungkan data lokal';

  @override
  String get autoGeneration => 'Generasi Otomatis';

  @override
  String get autoGenerateSummary => 'Buat Ringkasan Otomatis';

  @override
  String get generateAiSummaryForNewEntries =>
      'Buat ringkasan AI untuk entri baru';

  @override
  String get autoGenerateEmbedding => 'Buat Embedding Otomatis';

  @override
  String get generateVectorEmbedding => 'Buat embedding vektor untuk pencarian';

  @override
  String get enableNetworkSearch => 'Aktifkan Pencarian Jaringan';

  @override
  String get allowOnlineRetrieval =>
      'Izinkan pengambilan online untuk pencarian dan obrolan AI (default mati)';

  @override
  String get about => 'Tentang';

  @override
  String version(String version) {
    return 'Versi $version';
  }

  @override
  String get database => 'Basis data';

  @override
  String get objectBoxWithHnsw => 'ObjectBox dengan indeks HNSW';

  @override
  String get logOut => 'Keluar';

  @override
  String get custom => 'Kustom';

  @override
  String get openAiCompatible => 'Kompatibel OpenAI';

  @override
  String get notSet => 'Belum diatur';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... atau http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'Mendukung endpoint lokal/LAN/public';

  @override
  String get shiguangLocalSendBackup => 'Cadangan LocalSend Shiguang';

  @override
  String get localBackupFromShiguang =>
      'Cadangan lokal dari Shiguang (terima melalui LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Pilih file cadangan yang diterima dari LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Gagal menyelesaikan jalur file yang dipilih';

  @override
  String get importOptions => 'Opsi Impor';

  @override
  String get importSettingsAsWell =>
      'Impor pengaturan juga?\n(Kunci API tidak akan ditimpa)';

  @override
  String get dataOnly => 'Data Saja';

  @override
  String get dataAndSettings => 'Data + Pengaturan';

  @override
  String get importCompleted => 'Impor Selesai';

  @override
  String get settingsInBackupWereApplied =>
      'Pengaturan dalam cadangan telah diterapkan.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Pengaturan dalam cadangan belum diterapkan.';

  @override
  String get ok => 'OKE';

  @override
  String get cancel => 'Batal';

  @override
  String get save => 'Simpan';

  @override
  String get delete => 'Hapus';

  @override
  String get clear => 'Hapus';

  @override
  String get add => 'Tambah';

  @override
  String get create => 'Buat';

  @override
  String get edit => 'Sunting';

  @override
  String get search => 'Cari';

  @override
  String get areYouSureYouWantToLogOut => 'Apakah Anda yakin ingin keluar?';

  @override
  String get chooseLanguage => 'Pilih Bahasa';

  @override
  String get databaseInfo => 'Info Database';

  @override
  String get storage => 'Penyimpanan: ObjectBox';

  @override
  String get vectorIndex => 'Indeks Vektor: HNSW';

  @override
  String get dimensions => 'Dimensi: 384';

  @override
  String get embeddingModelBge => 'Model Embedding: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Ambil Foto';

  @override
  String get chooseFromGallery => 'Pilih dari Galeri';

  @override
  String get editNickname => 'Ubah Nama Panggilan';

  @override
  String get enterNickname => 'Masukkan nama panggilan';

  @override
  String get pleaseEnterNickname => 'Silakan masukkan nama panggilan';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Nama panggilan sudah ada atau tidak valid';

  @override
  String get user => 'Pengguna';

  @override
  String get manageScheduledReminders => 'Kelola pengingat terjadwal dan alarm';

  @override
  String get imageFailedToLoad => 'Gambar gagal dimuat. Silakan pilih lagi.';

  @override
  String get imageIsStillLoading => 'Gambar masih memuat';

  @override
  String get imageAreaNotReady => 'Area gambar belum siap. Silakan coba lagi.';

  @override
  String get cropFrameNotReady =>
      'Bingkai pemotongan belum siap. Silakan coba lagi.';

  @override
  String get invalidCropArea =>
      'Area pemotongan tidak valid. Silakan coba lagi.';

  @override
  String get cropFailed => 'Pemotongan gagal. Silakan coba lagi.';

  @override
  String get cropAvatar => 'Potong Avatar';

  @override
  String get chooseAgain => 'Pilih Lagi';

  @override
  String get rotate90 => 'Putar 90°';

  @override
  String get dragFrameToMove =>
      'Seret bingkai untuk memindahkan, seret sudut kanan bawah untuk mengubah ukuran; cubit untuk zoom dan memindahkan gambar.';

  @override
  String get pleaseFillInAllFields => 'Silakan isi semua kolom';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN harus minimal 4 digit';

  @override
  String get pinAtLeast4Digits => 'PIN minimal 4 digit';

  @override
  String get invalidUsernameOrPin => 'Nama pengguna atau PIN tidak valid';

  @override
  String get invalidUsernameOrPinError => 'Nama pengguna atau PIN salah';

  @override
  String get usernameAlreadyExists => 'Nama pengguna sudah ada';

  @override
  String get captureMomentsKeepMemories => 'Abadikan momen, simpan kenangan';

  @override
  String get username => 'Nama Pengguna';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Masuk';

  @override
  String get createAccount => 'Buat Akun';

  @override
  String get dontHaveAccountCreateOne => 'Tidak punya akun? Buat satu';

  @override
  String get alreadyHaveAccountLogin => 'Sudah punya akun? Masuk';

  @override
  String get pleaseEnterUsername => 'Silakan masukkan nama pengguna';

  @override
  String get pinsDoNotMatch => 'PIN tidak cocok';

  @override
  String get tapToAddAvatar => 'Ketuk untuk menambahkan avatar';

  @override
  String get yourName => 'Nama Anda';

  @override
  String get privatePinOptional => 'PIN Pribadi (opsional)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Digunakan untuk mengenkripsi catatan pribadi';

  @override
  String get privatePin => 'PIN Pribadi';

  @override
  String get leaveEmptyForNoEncryption => 'Kosongkan untuk tanpa enkripsi';

  @override
  String get confirmPin => 'Konfirmasi PIN';

  @override
  String get getStarted => 'Mulai';

  @override
  String get noReminders => 'Tidak ada pengingat';

  @override
  String get addReminder => 'Tambah Pengingat';

  @override
  String get title => 'Judul';

  @override
  String get descriptionOptional => 'Deskripsi (opsional)';

  @override
  String get microphonePermissionRequired => 'Izin mikrofon diperlukan';

  @override
  String get aiAssistant => 'Asisten AI';

  @override
  String get listening => 'Mendengarkan...';

  @override
  String get typeAMessage => 'Ketik pesan...';

  @override
  String get aiChat => 'Obrolan AI';

  @override
  String get startAConversation => 'Mulai percakapan';

  @override
  String get typeYourMessage => 'Ketik pesan Anda...';

  @override
  String get asrReconnecting => 'ASR menyambungkan ulang...';

  @override
  String get write => 'Tulis';

  @override
  String get writeEntry => 'Tulis Entri';

  @override
  String get noMemoriesYet => 'Belum ada kenangan';

  @override
  String get tapPlusToCapture => 'Ketuk + untuk mencatat pikiran Anda';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Ketuk + untuk mencatat pikiran Anda';

  @override
  String get deleteMemory => 'Hapus Kenangan';

  @override
  String get deleteRecord => 'Hapus Catatan';

  @override
  String get thisEntryWillBeRemoved =>
      'Entri ini akan dihapus dari lini waktu Anda.';

  @override
  String get thisRecordWillBeRemoved =>
      'Catatan ini akan dihapus dari lini waktu Anda.';

  @override
  String get searchYourRecords => 'Cari catatan Anda...';

  @override
  String get exactMatches => 'Pencocokan Tepat';

  @override
  String get noExactMatches => 'Tidak ada pencocokan tepat';

  @override
  String get exact => 'Tepat';

  @override
  String get exactMatch => 'Pencocokan Tepat';

  @override
  String get fuzzyMatches => 'Pencocokan Fuzzy';

  @override
  String get noFuzzyMatches => 'Tidak ada pencocokan fuzzy';

  @override
  String get vectorMatch => 'Pencocokan Vektor';

  @override
  String get networkMatches => 'Pencocokan Jaringan';

  @override
  String get noNetworkMatches => 'Tidak ada pencocokan jaringan';

  @override
  String get networkSearchIsOff =>
      'Pencarian jaringan mati. Aktifkan di Pengaturan.';

  @override
  String get network => 'Jaringan';

  @override
  String get networkMatch => 'Pencocokan Jaringan';

  @override
  String get noSearchHistory => 'Tidak ada riwayat pencarian';

  @override
  String get searchHistory => 'Riwayat Pencarian';

  @override
  String get invalidLink => 'Tautan tidak valid';

  @override
  String get unableToOpenWebPage => 'Tidak dapat membuka halaman web';

  @override
  String get imageMemory => '[Kenangan gambar]';

  @override
  String get tapToOpenWebPage => 'Ketuk untuk membuka halaman web';

  @override
  String get editEntry => 'Edit Entri';

  @override
  String get entryDetails => 'Detail Entri';

  @override
  String get noContent => 'Tidak ada konten';

  @override
  String get diaryNotFound => 'Diari tidak ditemukan';

  @override
  String get diaryNotFoundShort => 'Catatan tidak ditemukan';

  @override
  String get aiSummary => 'Ringkasan AI';

  @override
  String get microphoneInterrupted => 'Mikrofon terputus, rekaman dihentikan.';

  @override
  String get bold => 'Tebal';

  @override
  String get italic => 'Miring';

  @override
  String get strikethrough => 'Coret';

  @override
  String get image => 'Gambar';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR tidak tersedia. Rekaman masih aktif.';

  @override
  String get writeYourEntry => 'Tulis entri Anda...';

  @override
  String get writeYourContent => 'Tulis konten Anda...';

  @override
  String microphoneStartFailed(String error) {
    return 'Gagal memulai mikrofon: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofon terputus, rekaman dihentikan.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR menyambungkan ulang: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Gambar disisipkan: $name';
  }

  @override
  String voiceError(String error) {
    return 'Kesalahan suara: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Maaf, layanan AI saat ini tidak tersedia: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Gagal berbagi: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count hasil';
  }

  @override
  String matchCount(int count) {
    return 'Cocok: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Sumber: $source';
  }

  @override
  String get createNew => 'Buat';

  @override
  String micStartFailed(String error) {
    return 'Gagal memulai mikrofon: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Akun: +$created / diperbarui $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Diari: +$created / diperbarui $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Pengingat: +$created / diperbarui $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Dilewati: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Total berubah: $count';
  }

  @override
  String get settingsApplied => 'Pengaturan dalam cadangan telah diterapkan.';

  @override
  String get settingsNotApplied =>
      'Pengaturan dalam cadangan belum diterapkan.';

  @override
  String backupExported(String path) {
    return 'Cadangan diekspor: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Ekspor gagal: $error';
  }

  @override
  String importFailed(String error) {
    return 'Impor gagal: $error';
  }
}

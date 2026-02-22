// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get languageName => 'Türkçe';

  @override
  String get languageNameEn => 'Turkish';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Ayarlar';

  @override
  String get account => 'Hesap';

  @override
  String get reminders => 'Hatırlatmalar';

  @override
  String get language => 'Dil';

  @override
  String get appLanguage => 'Uygulama Dili';

  @override
  String get appearance => 'Görünüm';

  @override
  String get themeMode => 'Tema Modu';

  @override
  String get dark => 'Karanlık';

  @override
  String get light => 'Aydınlık';

  @override
  String get system => 'Sistem';

  @override
  String get aiService => 'AI Hizmeti';

  @override
  String get aiChatProvider => 'AI Sohbet Sağlayıcı';

  @override
  String get chatModel => 'Sohbet Modeli';

  @override
  String get localModel => 'Yerel Model';

  @override
  String get localModelDefault => 'Yerel Model (Varsayılan)';

  @override
  String get ollamaEndpoint => 'Ollama Uç Noktası';

  @override
  String get ollamaModel => 'Ollama Modeli';

  @override
  String get openAiEndpoint => 'OpenAI Uç Noktası';

  @override
  String get openAiApiKey => 'OpenAI API Anahtarı';

  @override
  String get openAiModel => 'OpenAI Modeli';

  @override
  String get geminiEndpoint => 'Gemini Uç Noktası';

  @override
  String get geminiApiKey => 'Gemini API Anahtarı';

  @override
  String get geminiModel => 'Gemini Modeli';

  @override
  String get anthropicEndpoint => 'Anthropic Uç Noktası';

  @override
  String get anthropicApiKey => 'Anthropic API Anahtarı';

  @override
  String get anthropicModel => 'Anthropic Modeli';

  @override
  String get customProtocol => 'Özel Protokol';

  @override
  String get protocol => 'Protokol';

  @override
  String get customEndpoint => 'Özel Uç Nokta';

  @override
  String get customApiKey => 'Özel API Anahtarı';

  @override
  String get customModel => 'Özel Model';

  @override
  String get optionalForLocalServers =>
      'Yerel/özel sunucular için isteğe bağlı';

  @override
  String get speechRecognitionEngine => 'Konuşma Tanıma Motoru';

  @override
  String get local => 'Yerel';

  @override
  String get endpoint => 'Uç Nokta';

  @override
  String get localSpeechModel => 'Yerel Konuşma Modeli';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (cihaz üzerinde)';

  @override
  String get systemSpeechRecognition => 'Sistem Konuşma Tanıma';

  @override
  String get systemRecognitionAndroidIos => 'Sistem Tanıma (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Uç Nokta Tanıma (Bulut/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Yerleşik Android / iOS tanıyıcısını kullanın (bulut kullanabilir)';

  @override
  String get voiceAiEndpoint => 'Ses AI Uç Noktası';

  @override
  String get embeddingModel => 'Embedding Modeli';

  @override
  String get crossDeviceSync => 'Cihazlar Arası Senkronizasyon';

  @override
  String get sendToOtherDevices => 'Diğer Cihazlara Gönder (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Yedeklemeyi dışa aktar ve paylaşım sheet ile gönder';

  @override
  String get importFromLocalSend => 'LocalSend\'ten İçe Aktar';

  @override
  String get selectBackupJson =>
      'Yedekleme JSON seç ve yerel verileri birleştir';

  @override
  String get autoGeneration => 'Otomatik Oluşturma';

  @override
  String get autoGenerateSummary => 'Otomatik Özet Oluştur';

  @override
  String get generateAiSummaryForNewEntries =>
      'Yeni girdiler için AI özeti oluştur';

  @override
  String get autoGenerateEmbedding => 'Otomatik Embedding Oluştur';

  @override
  String get generateVectorEmbedding => 'Arama için vektör embedding oluştur';

  @override
  String get enableNetworkSearch => 'Ağ Aramasını Etkinleştir';

  @override
  String get allowOnlineRetrieval =>
      'Arama ve AI sohbet için çevrimiçi alma izni (varsayılan olarak kapalı)';

  @override
  String get about => 'Hakkında';

  @override
  String version(String version) {
    return 'Sürüm $version';
  }

  @override
  String get database => 'Veritabanı';

  @override
  String get objectBoxWithHnsw => 'HNSW indeksli ObjectBox';

  @override
  String get logOut => 'Çıkış Yap';

  @override
  String get custom => 'Özel';

  @override
  String get openAiCompatible => 'OpenAI Uyumlu';

  @override
  String get notSet => 'Ayarlanmadı';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... veya http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Yerel/LAN/ umumî uç noktaları destekler';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend Yedeği';

  @override
  String get localBackupFromShiguang =>
      'Shiguang\'dan yerel yedekleme (LocalSend ile al)';

  @override
  String get selectBackupFileFromLocalSend =>
      'LocalSend\'ten alınan yedekleme dosyasını seç';

  @override
  String get failedToResolveFilePath => 'Seçilen dosya yolu çözülemedi';

  @override
  String get importOptions => 'İçe Aktarma Seçenekleri';

  @override
  String get importSettingsAsWell =>
      'Ayarları da içe aktar?\n(API anahtarları üzerine yazılmayacak)';

  @override
  String get dataOnly => 'Yalnızca Veri';

  @override
  String get dataAndSettings => 'Veri + Ayarlar';

  @override
  String get importCompleted => 'İçe Aktarma Tamamlandı';

  @override
  String get settingsInBackupWereApplied => 'Yedekteki ayarlar uygulandı.';

  @override
  String get settingsInBackupWereNotApplied => 'Yedekteki ayarlar uygulanmadı.';

  @override
  String get ok => 'Tamam';

  @override
  String get cancel => 'İptal';

  @override
  String get save => 'Kaydet';

  @override
  String get delete => 'Sil';

  @override
  String get clear => 'Temizle';

  @override
  String get add => 'Ekle';

  @override
  String get create => 'Oluştur';

  @override
  String get edit => 'Düzenle';

  @override
  String get search => 'Ara';

  @override
  String get areYouSureYouWantToLogOut =>
      'Çıkış yapmak istediğinizden emin misiniz?';

  @override
  String get chooseLanguage => 'Dil Seçin';

  @override
  String get databaseInfo => 'Veritabanı Bilgisi';

  @override
  String get storage => 'Depolama: ObjectBox';

  @override
  String get vectorIndex => 'Vektör İndeksi: HNSW';

  @override
  String get dimensions => 'Boyutlar: 384';

  @override
  String get embeddingModelBge => 'Embedding Modeli: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Fotoğraf Çek';

  @override
  String get chooseFromGallery => 'Galeriden Seç';

  @override
  String get editNickname => 'Takma Adı Düzenle';

  @override
  String get enterNickname => 'Takma ad girin';

  @override
  String get pleaseEnterNickname => 'Lütfen takma ad girin';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Takma ad zaten mevcut veya geçersiz';

  @override
  String get user => 'Kullanıcı';

  @override
  String get manageScheduledReminders =>
      'Planlanan hatırlatmaları ve alarmları yönet';

  @override
  String get imageFailedToLoad => 'Resim yüklenemedi. Lütfen tekrar seçin.';

  @override
  String get imageIsStillLoading => 'Resim hâlâ yükleniyor';

  @override
  String get imageAreaNotReady =>
      'Resim alanı hazır değil. Lütfen tekrar deneyin.';

  @override
  String get cropFrameNotReady =>
      'Kırpma çerçevesi hazır değil. Lütfen tekrar deneyin.';

  @override
  String get invalidCropArea => 'Geçersiz kırpma alanı. Lütfen tekrar deneyin.';

  @override
  String get cropFailed => 'Kırpma başarısız. Lütfen tekrar deneyin.';

  @override
  String get cropAvatar => 'Avatarı Kırp';

  @override
  String get chooseAgain => 'Tekrar Seç';

  @override
  String get rotate90 => '90° Döndür';

  @override
  String get dragFrameToMove =>
      'Taşımak için çerçeveyi sürükleyin, yeniden boyutlandırmak için sağ alt köşeyi sürükleyin; yakınlaştırmak ve resmi taşımak için iki parmağınızla sıkıştırın.';

  @override
  String get pleaseFillInAllFields => 'Lütfen tüm alanları doldurun';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN en az 4 basamaklı olmalı';

  @override
  String get pinAtLeast4Digits => 'PIN en az 4 basamaklı olmalı';

  @override
  String get invalidUsernameOrPin => 'Geçersiz kullanıcı adı veya PIN';

  @override
  String get invalidUsernameOrPinError => 'Geçersiz kullanıcı adı veya PIN';

  @override
  String get usernameAlreadyExists => 'Kullanıcı adı zaten mevcut';

  @override
  String get captureMomentsKeepMemories => 'Anları yakala, hatıraları koru';

  @override
  String get username => 'Kullanıcı Adı';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Giriş Yap';

  @override
  String get createAccount => 'Hesap Oluştur';

  @override
  String get dontHaveAccountCreateOne => 'Hesabınız yok mu? Bir tane oluşturun';

  @override
  String get alreadyHaveAccountLogin => 'Zaten hesabınız var mı? Giriş yapın';

  @override
  String get pleaseEnterUsername => 'Lütfen kullanıcı adı girin';

  @override
  String get pinsDoNotMatch => 'PIN\'ler eşleşmiyor';

  @override
  String get tapToAddAvatar => 'Avatar eklemek için dokunun';

  @override
  String get yourName => 'Adınız';

  @override
  String get privatePinOptional => 'Özel PIN (isteğe bağlı)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Özel kayıtları şifrelemek için kullanılır';

  @override
  String get privatePin => 'Özel PIN';

  @override
  String get leaveEmptyForNoEncryption => 'Şifreleme için boş bırakın';

  @override
  String get confirmPin => 'PIN\'i Onayla';

  @override
  String get getStarted => 'Başla';

  @override
  String get noReminders => 'Hatırlatmalar yok';

  @override
  String get addReminder => 'Hatırlatıcı Ekle';

  @override
  String get title => 'Başlık';

  @override
  String get descriptionOptional => 'Açıklama (isteğe bağlı)';

  @override
  String get microphonePermissionRequired => 'Mikrofon izni gerekli';

  @override
  String get aiAssistant => 'AI Asistanı';

  @override
  String get listening => 'Dinleniyor...';

  @override
  String get typeAMessage => 'Bir mesaj yazın...';

  @override
  String get aiChat => 'AI Sohbet';

  @override
  String get startAConversation => 'Bir konuşma başlat';

  @override
  String get typeYourMessage => 'Mesajınızı yazın...';

  @override
  String get asrReconnecting => 'ASR yeniden bağlanıyor...';

  @override
  String get write => 'Yaz';

  @override
  String get writeEntry => 'Girdi Yaz';

  @override
  String get noMemoriesYet => 'Henüz anı yok';

  @override
  String get tapPlusToCapture => 'Düşüncelerinizi yakalamak için +\'ya dokunun';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Düşüncelerinizi yakalamak için +\'ya dokunun';

  @override
  String get deleteMemory => 'Anıyı Sil';

  @override
  String get deleteRecord => 'Kaydı Sil';

  @override
  String get thisEntryWillBeRemoved =>
      'Bu girdi zaman çizelgenizden kaldırılacak.';

  @override
  String get thisRecordWillBeRemoved =>
      'Bu kayıt zaman çizelgenizden kaldırılacak.';

  @override
  String get searchYourRecords => 'Kayıtlarınızı arayın...';

  @override
  String get exactMatches => 'Tam Eşleşmeler';

  @override
  String get noExactMatches => 'Tam eşleşme yok';

  @override
  String get exact => 'Tam';

  @override
  String get exactMatch => 'Tam Eşleşme';

  @override
  String get fuzzyMatches => 'Bulanık Eşleşmeler';

  @override
  String get noFuzzyMatches => 'Bulanık eşleşme yok';

  @override
  String get vectorMatch => 'Vektör Eşleşmesi';

  @override
  String get networkMatches => 'Ağ Eşleşmeleri';

  @override
  String get noNetworkMatches => 'Ağ eşleşmesi yok';

  @override
  String get networkSearchIsOff =>
      'Ağ araması kapalı. Ayarlar\'da etkinleştirin.';

  @override
  String get network => 'Ağ';

  @override
  String get networkMatch => 'Ağ Eşleşmesi';

  @override
  String get noSearchHistory => 'Arama geçmişi yok';

  @override
  String get searchHistory => 'Arama Geçmişi';

  @override
  String get invalidLink => 'Geçersiz bağlantı';

  @override
  String get unableToOpenWebPage => 'Web sayfası açılamıyor';

  @override
  String get imageMemory => '[Resim anısı]';

  @override
  String get tapToOpenWebPage => 'Web sayfasını açmak için dokunun';

  @override
  String get editEntry => 'Girdiyi Düzenle';

  @override
  String get entryDetails => 'Girdi Ayrıntıları';

  @override
  String get noContent => 'İçerik yok';

  @override
  String get diaryNotFound => 'Günlük bulunamadı';

  @override
  String get diaryNotFoundShort => 'Kayıt bulunamadı';

  @override
  String get aiSummary => 'AI Özeti';

  @override
  String get microphoneInterrupted =>
      'Mikrofon kesintiye uğradı, kayıt durduruldu.';

  @override
  String get bold => 'Kalın';

  @override
  String get italic => 'İtalik';

  @override
  String get strikethrough => 'Üstü çizili';

  @override
  String get image => 'Resim';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR kullanılamıyor. Kayıt hâlâ aktif.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Girdinizi yazın...';

  @override
  String get writeYourContent => 'İçeriğinizi yazın...';

  @override
  String microphoneStartFailed(String error) {
    return 'Mikrofon başlatılamadı: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofon kesintiye uğradı, kayıt durduruldu.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR yeniden bağlanıyor: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Resim eklendi: $name';
  }

  @override
  String voiceError(String error) {
    return 'Ses hatası: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Üzgünüz, AI hizmeti şu anda kullanılamıyor: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Paylaşım başarısız: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count sonuç';
  }

  @override
  String matchCount(int count) {
    return 'Eşleşme: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Kaynak: $source';
  }

  @override
  String get createNew => 'Oluştur';

  @override
  String micStartFailed(String error) {
    return 'Mikrofon başlatılamadı: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Hesaplar: +$created / güncellendi $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Günlükler: +$created / güncellendi $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Hatırlatmalar: +$created / güncellendi $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Atlandı: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Toplam değişiklik: $count';
  }

  @override
  String get settingsApplied => 'Yedekteki ayarlar uygulandı.';

  @override
  String get settingsNotApplied => 'Yedekteki ayarlar uygulanmadı.';

  @override
  String backupExported(String path) {
    return 'Yedekleme dışa aktarıldı: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Dışa aktarma başarısız: $error';
  }

  @override
  String importFailed(String error) {
    return 'İçe aktarma başarısız: $error';
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

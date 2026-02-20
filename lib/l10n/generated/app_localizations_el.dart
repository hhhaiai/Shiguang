// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get languageName => 'Ελληνικά';

  @override
  String get languageNameEn => 'Greek';

  @override
  String get appTitle => 'Σιγκουάνγκ';

  @override
  String get settings => 'Ρυθμίσεις';

  @override
  String get account => 'Λογαριασμός';

  @override
  String get reminders => 'Υπενθυμίσεις';

  @override
  String get language => 'Γλώσσα';

  @override
  String get appLanguage => 'Γλώσσα εφαρμογής';

  @override
  String get appearance => 'Εμφάνιση';

  @override
  String get themeMode => 'Λειτουργία θέματος';

  @override
  String get dark => 'Σκοτάδι';

  @override
  String get light => 'Φως';

  @override
  String get system => 'Σύστημα';

  @override
  String get aiService => 'Υπηρεσία AI';

  @override
  String get aiChatProvider => 'Πάροχος συνομιλίας AI';

  @override
  String get chatModel => 'Μοντέλο συνομιλίας';

  @override
  String get localModel => 'Τοπικό μοντέλο';

  @override
  String get localModelDefault => 'Τοπικό μοντέλο (Προεπιλογή)';

  @override
  String get ollamaEndpoint => 'Τελικό σημείο Ollama';

  @override
  String get ollamaModel => 'Μοντέλο Olama';

  @override
  String get openAiEndpoint => 'OpenAI Endpoint';

  @override
  String get openAiApiKey => 'Κλειδί OpenAI API';

  @override
  String get openAiModel => 'Μοντέλο OpenAI';

  @override
  String get geminiEndpoint => 'Τελικό σημείο Διδύμων';

  @override
  String get geminiApiKey => 'Κλειδί API Gemini';

  @override
  String get geminiModel => 'Μοντέλα Gemini';

  @override
  String get anthropicEndpoint => 'Anthropic Endpoint';

  @override
  String get anthropicApiKey => 'Κλειδί API Anthropic';

  @override
  String get anthropicModel => 'Anthropic Model';

  @override
  String get customProtocol => 'Προσαρμοσμένο πρωτόκολλο';

  @override
  String get protocol => 'Πρωτόκολλο';

  @override
  String get customEndpoint => 'Προσαρμοσμένο τελικό σημείο';

  @override
  String get customApiKey => 'Προσαρμοσμένο κλειδί API';

  @override
  String get customModel => 'Προσαρμοσμένο μοντέλο';

  @override
  String get optionalForLocalServers =>
      'Προαιρετικό για τοπικούς/προσαρμοσμένους διακομιστές';

  @override
  String get speechRecognitionEngine => 'Μηχανή αναγνώρισης ομιλίας';

  @override
  String get local => 'Τοπικός';

  @override
  String get endpoint => 'Τελικό σημείο';

  @override
  String get localSpeechModel => 'Τοπικό μοντέλο λόγου';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (σε συσκευή)';

  @override
  String get systemSpeechRecognition => 'Αναγνώριση ομιλίας συστήματος';

  @override
  String get systemRecognitionAndroidIos =>
      'Αναγνώριση συστήματος (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Αναγνώριση τελικού σημείου (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Χρησιμοποιήστε ενσωματωμένο αναγνωριστικό Android / iOS (μπορεί να χρησιμοποιήσετε σύννεφο)';

  @override
  String get voiceAiEndpoint => 'Τελικό σημείο τεχνητής νοημοσύνης φωνής';

  @override
  String get embeddingModel => 'Ενσωμάτωση μοντέλου';

  @override
  String get crossDeviceSync => 'Συγχρονισμός μεταξύ συσκευών';

  @override
  String get sendToOtherDevices => 'Αποστολή σε άλλες συσκευές (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Εξαγωγή αντιγράφων ασφαλείας και αποστολή μέσω φύλλου κοινής χρήσης';

  @override
  String get importFromLocalSend => 'Εισαγωγή από LocalSend';

  @override
  String get selectBackupJson =>
      'Επιλέξτε backup JSON και συγχωνεύστε τοπικά δεδομένα';

  @override
  String get autoGeneration => 'Auto Generation';

  @override
  String get autoGenerateSummary => 'Αυτόματη δημιουργία σύνοψης';

  @override
  String get generateAiSummaryForNewEntries =>
      'Δημιουργήστε σύνοψη AI για νέες καταχωρήσεις';

  @override
  String get autoGenerateEmbedding => 'Αυτόματη δημιουργία ενσωμάτωσης';

  @override
  String get generateVectorEmbedding =>
      'Δημιουργία διανυσματικής ενσωμάτωσης για αναζήτηση';

  @override
  String get enableNetworkSearch => 'Ενεργοποιήστε την Αναζήτηση δικτύου';

  @override
  String get allowOnlineRetrieval =>
      'Να επιτρέπεται η ηλεκτρονική ανάκτηση για αναζήτηση και συνομιλία AI (απενεργοποιημένη από προεπιλογή)';

  @override
  String get about => 'Για';

  @override
  String version(String version) {
    return 'Έκδοση $version';
  }

  @override
  String get database => 'Βάση δεδομένων';

  @override
  String get objectBoxWithHnsw => 'ObjectBox με ευρετήριο HNSW';

  @override
  String get logOut => 'Αποσύνδεση';

  @override
  String get custom => 'Εθιμο';

  @override
  String get openAiCompatible => 'Συμβατό με OpenAI';

  @override
  String get notSet => 'Δεν έχει οριστεί';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... ή http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Υποστηρίζει τοπικά/LAN/δημόσια τελικά σημεία';

  @override
  String get shiguangLocalSendBackup =>
      'Αντίγραφο ασφαλείας Shiguang LocalSend';

  @override
  String get localBackupFromShiguang =>
      'Τοπικό αντίγραφο ασφαλείας από το Shiguang (λήψη μέσω LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Επιλέξτε το αρχείο αντιγράφου ασφαλείας που ελήφθη από το LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Αποτυχία επίλυσης της επιλεγμένης διαδρομής αρχείου';

  @override
  String get importOptions => 'Επιλογές εισαγωγής';

  @override
  String get importSettingsAsWell =>
      'Εισαγωγή ρυθμίσεων επίσης;\n(Τα κλειδιά API δεν θα αντικατασταθούν)';

  @override
  String get dataOnly => 'Μόνο δεδομένα';

  @override
  String get dataAndSettings => 'Δεδομένα + Ρυθμίσεις';

  @override
  String get importCompleted => 'Η εισαγωγή ολοκληρώθηκε';

  @override
  String get settingsInBackupWereApplied =>
      'Εφαρμόστηκαν ρυθμίσεις στο backup.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Οι ρυθμίσεις στο αντίγραφο ασφαλείας δεν εφαρμόστηκαν.';

  @override
  String get ok => 'ΕΝΤΑΞΕΙ';

  @override
  String get cancel => 'Ματαίωση';

  @override
  String get save => 'Εκτός';

  @override
  String get delete => 'Διαγράφω';

  @override
  String get clear => 'Σαφής';

  @override
  String get add => 'Προσθέτω';

  @override
  String get create => 'Δημιουργώ';

  @override
  String get edit => 'Εκδίδω';

  @override
  String get search => 'Ερευνα';

  @override
  String get areYouSureYouWantToLogOut =>
      'Είστε βέβαιοι ότι θέλετε να αποσυνδεθείτε;';

  @override
  String get chooseLanguage => 'Επιλέξτε Γλώσσα';

  @override
  String get databaseInfo => 'Πληροφορίες βάσης δεδομένων';

  @override
  String get storage => 'Αποθήκευση: ObjectBox';

  @override
  String get vectorIndex => 'Διάνυσμα Ευρετήριο: HNSW';

  @override
  String get dimensions => 'Διαστάσεις: 384';

  @override
  String get embeddingModelBge => 'Μοντέλο ενσωμάτωσης: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Τραβήξτε φωτογραφία';

  @override
  String get chooseFromGallery => 'Επιλέξτε από τη Γκαλερί';

  @override
  String get editNickname => 'Επεξεργασία ψευδώνυμου';

  @override
  String get enterNickname => 'Εισαγάγετε ψευδώνυμο';

  @override
  String get pleaseEnterNickname => 'Εισαγάγετε ένα ψευδώνυμο';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Το ψευδώνυμο υπάρχει ήδη ή δεν είναι έγκυρο';

  @override
  String get user => 'Μεταχειριζόμενος';

  @override
  String get manageScheduledReminders =>
      'Διαχειριστείτε προγραμματισμένες υπενθυμίσεις και ξυπνητήρια';

  @override
  String get imageFailedToLoad =>
      'Η φόρτωση της εικόνας απέτυχε. Επιλέξτε ξανά.';

  @override
  String get imageIsStillLoading => 'Η εικόνα εξακολουθεί να φορτώνεται';

  @override
  String get imageAreaNotReady =>
      'Η περιοχή εικόνας δεν είναι έτοιμη. Δοκιμάστε ξανά.';

  @override
  String get cropFrameNotReady =>
      'Το πλαίσιο περικοπής δεν είναι έτοιμο. Δοκιμάστε ξανά.';

  @override
  String get invalidCropArea => 'Μη έγκυρη περιοχή περικοπής. Δοκιμάστε ξανά.';

  @override
  String get cropFailed => 'Η περικοπή απέτυχε. Δοκιμάστε ξανά.';

  @override
  String get cropAvatar => 'Περικοπή Avatar';

  @override
  String get chooseAgain => 'Επιλέξτε ξανά';

  @override
  String get rotate90 => 'Περιστροφή 90°';

  @override
  String get dragFrameToMove =>
      'Σύρετε το πλαίσιο για να μετακινήσετε, σύρετε κάτω δεξιά για αλλαγή μεγέθους. τσιμπήστε για να μεγεθύνετε και να μετακινήσετε την εικόνα.';

  @override
  String get pleaseFillInAllFields => 'Παρακαλούμε συμπληρώστε όλα τα πεδία';

  @override
  String get pinMustBeAtLeast4Digits =>
      'Το PIN πρέπει να είναι τουλάχιστον 4 ψηφία';

  @override
  String get pinAtLeast4Digits => 'Το PIN πρέπει να είναι τουλάχιστον 4 ψηφία';

  @override
  String get invalidUsernameOrPin => 'Μη έγκυρο όνομα χρήστη ή PIN';

  @override
  String get invalidUsernameOrPinError => 'Μη έγκυρο όνομα χρήστη ή PIN';

  @override
  String get usernameAlreadyExists => 'Το όνομα χρήστη υπάρχει ήδη';

  @override
  String get captureMomentsKeepMemories =>
      'Αποτυπώστε στιγμές, κρατήστε αναμνήσεις';

  @override
  String get username => 'Όνομα χρήστη';

  @override
  String get pin => 'ΚΑΡΦΙΤΣΑ';

  @override
  String get login => 'Σύνδεση';

  @override
  String get createAccount => 'Δημιουργία λογαριασμού';

  @override
  String get dontHaveAccountCreateOne =>
      'Δεν έχετε λογαριασμό; Δημιουργήστε ένα';

  @override
  String get alreadyHaveAccountLogin => 'Έχετε ήδη λογαριασμό; Σύνδεση';

  @override
  String get pleaseEnterUsername => 'Εισαγάγετε ένα όνομα χρήστη';

  @override
  String get pinsDoNotMatch => 'Τα PIN δεν ταιριάζουν';

  @override
  String get tapToAddAvatar => 'Πατήστε για προσθήκη avatar';

  @override
  String get yourName => 'Το όνομά σας';

  @override
  String get privatePinOptional => 'Ιδιωτικό PIN (προαιρετικό)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Χρησιμοποιείται για την κρυπτογράφηση ιδιωτικών εγγραφών';

  @override
  String get privatePin => 'Ιδιωτικό PIN';

  @override
  String get leaveEmptyForNoEncryption => 'Αφήστε κενό χωρίς κρυπτογράφηση';

  @override
  String get confirmPin => 'Επιβεβαίωση PIN';

  @override
  String get getStarted => 'Ξεκινήστε';

  @override
  String get noReminders => 'Χωρίς υπενθυμίσεις';

  @override
  String get addReminder => 'Προσθήκη υπενθύμισης';

  @override
  String get title => 'Τίτλος';

  @override
  String get descriptionOptional => 'Περιγραφή (προαιρετικό)';

  @override
  String get microphonePermissionRequired => 'Απαιτείται άδεια μικροφώνου';

  @override
  String get aiAssistant => 'Βοηθός AI';

  @override
  String get listening => 'Ακούγοντας...';

  @override
  String get typeAMessage => 'Πληκτρολογήστε ένα μήνυμα...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Ξεκινήστε μια συνομιλία';

  @override
  String get typeYourMessage => 'Πληκτρολογήστε το μήνυμά σας...';

  @override
  String get asrReconnecting => 'ASR επανασύνδεση...';

  @override
  String get write => 'Γράφω';

  @override
  String get writeEntry => 'Γράψτε την καταχώριση';

  @override
  String get noMemoriesYet => 'Δεν υπάρχουν ακόμα αναμνήσεις';

  @override
  String get tapPlusToCapture => 'Πατήστε + για να καταγράψετε τις σκέψεις σας';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Πατήστε + για να καταγράψετε τις σκέψεις σας';

  @override
  String get deleteMemory => 'Διαγραφή μνήμης';

  @override
  String get deleteRecord => 'Διαγραφή εγγραφής';

  @override
  String get thisEntryWillBeRemoved =>
      'Αυτή η καταχώρηση θα αφαιρεθεί από το χρονολόγιό σας.';

  @override
  String get thisRecordWillBeRemoved =>
      'Αυτή η εγγραφή θα αφαιρεθεί από το χρονολόγιό σας.';

  @override
  String get searchYourRecords => 'Αναζήτηση στα αρχεία σας...';

  @override
  String get exactMatches => 'Ακριβείς αντιστοιχίσεις';

  @override
  String get noExactMatches => 'Δεν υπάρχουν ακριβείς αντιστοιχίσεις';

  @override
  String get exact => 'Ακριβής';

  @override
  String get exactMatch => 'Ακριβής αντιστοιχία';

  @override
  String get fuzzyMatches => 'Ασαφείς αγώνες';

  @override
  String get noFuzzyMatches => 'Χωρίς ασαφείς αντιστοιχίες';

  @override
  String get vectorMatch => 'Διάνυσμα αγώνα';

  @override
  String get networkMatches => 'Αντιστοιχίσεις δικτύου';

  @override
  String get noNetworkMatches => 'Δεν υπάρχουν αντιστοιχίες δικτύου';

  @override
  String get networkSearchIsOff =>
      'Η αναζήτηση δικτύου είναι απενεργοποιημένη. Ενεργοποιήστε το στις Ρυθμίσεις.';

  @override
  String get network => 'Δίκτυο';

  @override
  String get networkMatch => 'Αντιστοίχιση δικτύου';

  @override
  String get noSearchHistory => 'Δεν υπάρχει ιστορικό αναζήτησης';

  @override
  String get searchHistory => 'Ιστορικό αναζήτησης';

  @override
  String get invalidLink => 'Μη έγκυρος σύνδεσμος';

  @override
  String get unableToOpenWebPage =>
      'Δεν είναι δυνατό το άνοιγμα της ιστοσελίδας';

  @override
  String get imageMemory => '[Μνήμη εικόνας]';

  @override
  String get tapToOpenWebPage => 'Πατήστε για να ανοίξετε την ιστοσελίδα';

  @override
  String get editEntry => 'Επεξεργασία καταχώρισης';

  @override
  String get entryDetails => 'Στοιχεία Εισόδου';

  @override
  String get noContent => 'Χωρίς περιεχόμενο';

  @override
  String get diaryNotFound => 'Το ημερολόγιο δεν βρέθηκε';

  @override
  String get diaryNotFoundShort => 'Η εγγραφή δεν βρέθηκε';

  @override
  String get aiSummary => 'Περίληψη AI';

  @override
  String get microphoneInterrupted =>
      'Το μικρόφωνο διακόπηκε, η εγγραφή σταμάτησε.';

  @override
  String get bold => 'Τολμηρός';

  @override
  String get italic => 'Πλάγια γραφή';

  @override
  String get strikethrough => 'Strikethrough';

  @override
  String get image => 'Εικών';

  @override
  String get asrUnavailableRecordingActive =>
      'Το ASR δεν είναι διαθέσιμο. Η εγγραφή είναι ακόμα ενεργή.';

  @override
  String get writeYourEntry => 'Γράψτε την καταχώρισή σας...';

  @override
  String get writeYourContent => 'Γράψτε το περιεχόμενό σας...';

  @override
  String microphoneStartFailed(String error) {
    return 'Αποτυχία εκκίνησης μικροφώνου: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Το μικρόφωνο διακόπηκε, η εγγραφή σταμάτησε.';

  @override
  String asrReconnectingError(String error) {
    return 'Επανασύνδεση ASR: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Εισήχθη εικόνα: $name';
  }

  @override
  String voiceError(String error) {
    return 'Σφάλμα φωνής: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Λυπούμαστε, η υπηρεσία AI δεν είναι διαθέσιμη αυτήν τη στιγμή: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Αποτυχία κοινοποίησης: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count επισκέψεις';
  }

  @override
  String matchCount(int count) {
    return 'Ταίριασμα: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Πηγή: $source';
  }

  @override
  String get createNew => 'Δημιουργώ';

  @override
  String micStartFailed(String error) {
    return 'Η εκκίνηση του μικροφώνου απέτυχε: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Λογαριασμοί: +$created / ενημερωμένος $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Ημερολόγια: +$created / ενημερώθηκε $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Υπενθυμίσεις: +$created / ενημερώθηκε $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Παράβλεψη: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Συνολικές αλλαγές: $count';
  }

  @override
  String get settingsApplied => 'Εφαρμόστηκαν οι ρυθμίσεις στο backup.';

  @override
  String get settingsNotApplied =>
      'Οι ρυθμίσεις στο αντίγραφο ασφαλείας δεν εφαρμόστηκαν.';

  @override
  String backupExported(String path) {
    return 'Εξαγωγή αντιγράφων ασφαλείας: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Η εξαγωγή απέτυχε: $error';
  }

  @override
  String importFailed(String error) {
    return 'Η εισαγωγή απέτυχε: $error';
  }
}

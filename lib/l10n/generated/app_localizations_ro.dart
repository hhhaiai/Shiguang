// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get languageName => 'Română';

  @override
  String get languageNameEn => 'Romanian';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Setări';

  @override
  String get account => 'Cont';

  @override
  String get reminders => 'Mementouri';

  @override
  String get language => 'Limbă';

  @override
  String get appLanguage => 'Limba aplicației';

  @override
  String get appearance => 'Aspect';

  @override
  String get themeMode => 'Modul Temă';

  @override
  String get dark => 'Întuneric';

  @override
  String get light => 'Aprinde';

  @override
  String get system => 'Sistem';

  @override
  String get aiService => 'Serviciul AI';

  @override
  String get aiChatProvider => 'Furnizor de chat AI';

  @override
  String get chatModel => 'Model de chat';

  @override
  String get localModel => 'Model local';

  @override
  String get localModelDefault => 'Model local (implicit)';

  @override
  String get ollamaEndpoint => 'Ollama Endpoint';

  @override
  String get ollamaModel => 'Modelul Ollama';

  @override
  String get openAiEndpoint => 'OpenAI Endpoint';

  @override
  String get openAiApiKey => 'Cheia API OpenAI';

  @override
  String get openAiModel => 'Model OpenAI';

  @override
  String get geminiEndpoint => 'Punctul final Gemeni';

  @override
  String get geminiApiKey => 'Cheia API Gemini';

  @override
  String get geminiModel => 'Modele Gemeni';

  @override
  String get anthropicEndpoint => 'Punctul final antropic';

  @override
  String get anthropicApiKey => 'Cheie API antropică';

  @override
  String get anthropicModel => 'Model antropic';

  @override
  String get customProtocol => 'Protocol personalizat';

  @override
  String get protocol => 'Protocol';

  @override
  String get customEndpoint => 'Punct final personalizat';

  @override
  String get customApiKey => 'Cheie API personalizată';

  @override
  String get customModel => 'Model personalizat';

  @override
  String get optionalForLocalServers =>
      'Opțional pentru serverele locale/personalizate';

  @override
  String get speechRecognitionEngine => 'Motor de recunoaștere a vorbirii';

  @override
  String get local => 'Local';

  @override
  String get endpoint => 'Punct final';

  @override
  String get localSpeechModel => 'Model local de vorbire';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (pe dispozitiv)';

  @override
  String get systemSpeechRecognition => 'Sistem de recunoaștere a vorbirii';

  @override
  String get systemRecognitionAndroidIos =>
      'Recunoașterea sistemului (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Recunoaștere endpoint (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Utilizați dispozitivul de recunoaștere Android / iOS încorporat (poate folosi cloud)';

  @override
  String get voiceAiEndpoint => 'Voice AI Endpoint';

  @override
  String get embeddingModel => 'Model de încorporare';

  @override
  String get crossDeviceSync => 'Sincronizare pe mai multe dispozitive';

  @override
  String get sendToOtherDevices =>
      'Trimiteți către alte dispozitive (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Exportați backup și trimiteți prin foaie de partajare';

  @override
  String get importFromLocalSend => 'Importați din LocalSend';

  @override
  String get selectBackupJson =>
      'Selectați JSON de rezervă și îmbinați datele locale';

  @override
  String get autoGeneration => 'Generare automată';

  @override
  String get autoGenerateSummary => 'Generare automată a rezumatului';

  @override
  String get generateAiSummaryForNewEntries =>
      'Generați un rezumat AI pentru noile intrări';

  @override
  String get autoGenerateEmbedding => 'Generare automată încorporare';

  @override
  String get generateVectorEmbedding =>
      'Generați încorporare vectorială pentru căutare';

  @override
  String get enableNetworkSearch => 'Activați căutarea în rețea';

  @override
  String get allowOnlineRetrieval =>
      'Permiteți preluarea online pentru căutare și chat AI (dezactivat în mod prestabilit)';

  @override
  String get about => 'Despre';

  @override
  String version(String version) {
    return 'Versiunea $version';
  }

  @override
  String get database => 'Baza de date';

  @override
  String get objectBoxWithHnsw => 'ObjectBox cu index HNSW';

  @override
  String get logOut => 'Deconectați-vă';

  @override
  String get custom => 'Personalizat';

  @override
  String get openAiCompatible => 'Compatibil cu OpenAI';

  @override
  String get notSet => 'Nu setat';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... sau http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Suportă puncte finale locale/LAN/publice';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend Backup';

  @override
  String get localBackupFromShiguang =>
      'Backup local de la Shiguang (primire prin LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Selectați fișierul de rezervă primit de la LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Nu s-a putut rezolva calea fișierului selectat';

  @override
  String get importOptions => 'Opțiuni de import';

  @override
  String get importSettingsAsWell =>
      'Import și setări?\n(Cheile API nu vor fi suprascrise)';

  @override
  String get dataOnly => 'Numai date';

  @override
  String get dataAndSettings => 'Date + Setări';

  @override
  String get importCompleted => 'Import finalizat';

  @override
  String get settingsInBackupWereApplied =>
      'Au fost aplicate setările din backup.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Setările din backup nu au fost aplicate.';

  @override
  String get ok => 'Bine';

  @override
  String get cancel => 'Anula';

  @override
  String get save => 'Salva';

  @override
  String get delete => 'Şterge';

  @override
  String get clear => 'Clar';

  @override
  String get add => 'Adăuga';

  @override
  String get create => 'Crea';

  @override
  String get edit => 'Edita';

  @override
  String get search => 'Căutare';

  @override
  String get areYouSureYouWantToLogOut => 'Sigur doriți să vă deconectați?';

  @override
  String get chooseLanguage => 'Alegeți limba';

  @override
  String get databaseInfo => 'Informații baza de date';

  @override
  String get storage => 'Stocare: ObjectBox';

  @override
  String get vectorIndex => 'Index vectorial: HNSW';

  @override
  String get dimensions => 'Dimensiuni: 384';

  @override
  String get embeddingModelBge => 'Model de încorporare: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Faceți o fotografie';

  @override
  String get chooseFromGallery => 'Alegeți din Galerie';

  @override
  String get editNickname => 'Editați porecla';

  @override
  String get enterNickname => 'Introduceți porecla';

  @override
  String get pleaseEnterNickname => 'Vă rugăm să introduceți o poreclă';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Pseudomul există deja sau este invalid';

  @override
  String get user => 'Utilizator';

  @override
  String get manageScheduledReminders =>
      'Gestionați mementourile și alarmele programate';

  @override
  String get imageFailedToLoad =>
      'Imaginea nu s-a încărcat. Vă rugăm să alegeți din nou.';

  @override
  String get imageIsStillLoading => 'Imaginea încă se încarcă';

  @override
  String get imageAreaNotReady =>
      'Zona de imagine nu este pregătită. Vă rugăm să încercați din nou.';

  @override
  String get cropFrameNotReady =>
      'Cadrul de decupare nu este pregătit. Vă rugăm să încercați din nou.';

  @override
  String get invalidCropArea =>
      'Zona de decupare nevalidă. Vă rugăm să încercați din nou.';

  @override
  String get cropFailed => 'Decuparea a eșuat. Vă rugăm să încercați din nou.';

  @override
  String get cropAvatar => 'Decupați avatarul';

  @override
  String get chooseAgain => 'Alege din nou';

  @override
  String get rotate90 => 'Rotiți 90°';

  @override
  String get dragFrameToMove =>
      'Trageți cadrul pentru a muta, trageți în dreapta jos pentru a redimensiona; ciupiți pentru a mări și muta imaginea.';

  @override
  String get pleaseFillInAllFields => 'Vă rugăm să completați toate câmpurile';

  @override
  String get pinMustBeAtLeast4Digits =>
      'PIN-ul trebuie să aibă cel puțin 4 cifre';

  @override
  String get pinAtLeast4Digits => 'PIN-ul trebuie să aibă cel puțin 4 cifre';

  @override
  String get invalidUsernameOrPin => 'Nume de utilizator sau PIN nevalid';

  @override
  String get invalidUsernameOrPinError => 'Nume de utilizator sau PIN nevalid';

  @override
  String get usernameAlreadyExists => 'Numele de utilizator există deja';

  @override
  String get captureMomentsKeepMemories =>
      'Captează momente, păstrează amintiri';

  @override
  String get username => 'Nume de utilizator';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Log in';

  @override
  String get createAccount => 'Creează cont';

  @override
  String get dontHaveAccountCreateOne => 'Nu ai un cont? Creați unul';

  @override
  String get alreadyHaveAccountLogin => 'Aveți deja un cont? Log in';

  @override
  String get pleaseEnterUsername =>
      'Vă rugăm să introduceți un nume de utilizator';

  @override
  String get pinsDoNotMatch => 'PIN-urile nu se potrivesc';

  @override
  String get tapToAddAvatar => 'Atingeți pentru a adăuga un avatar';

  @override
  String get yourName => 'Numele dumneavoastră';

  @override
  String get privatePinOptional => 'PIN privat (opțional)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Folosit pentru a cripta înregistrările private';

  @override
  String get privatePin => 'PIN privat';

  @override
  String get leaveEmptyForNoEncryption => 'Lăsați gol pentru nicio criptare';

  @override
  String get confirmPin => 'Confirmați codul PIN';

  @override
  String get getStarted => 'Începeți';

  @override
  String get noReminders => 'Fără mementouri';

  @override
  String get addReminder => 'Adăugați un memento';

  @override
  String get title => 'Titlu';

  @override
  String get descriptionOptional => 'Descriere (opțional)';

  @override
  String get microphonePermissionRequired =>
      'Este necesară permisiunea microfonului';

  @override
  String get aiAssistant => 'Asistent AI';

  @override
  String get listening => 'Ascultare...';

  @override
  String get typeAMessage => 'Tastați un mesaj...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Începeți o conversație';

  @override
  String get typeYourMessage => 'Introduceți mesajul dvs....';

  @override
  String get asrReconnecting => 'ASR se reconecta...';

  @override
  String get write => 'Scrie';

  @override
  String get writeEntry => 'Scrieți intrarea';

  @override
  String get noMemoriesYet => 'Nicio amintire încă';

  @override
  String get tapPlusToCapture => 'Atingeți + pentru a vă surprinde gândurile';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Atingeți + pentru a vă surprinde gândurile';

  @override
  String get deleteMemory => 'Ștergeți memoria';

  @override
  String get deleteRecord => 'Șterge înregistrarea';

  @override
  String get thisEntryWillBeRemoved =>
      'Această intrare va fi eliminată din cronologia dvs.';

  @override
  String get thisRecordWillBeRemoved =>
      'Această înregistrare va fi eliminată din cronologia dvs.';

  @override
  String get searchYourRecords => 'Căutați înregistrările dvs....';

  @override
  String get exactMatches => 'Potriviri exacte';

  @override
  String get noExactMatches => 'Fără potriviri exacte';

  @override
  String get exact => 'Corect';

  @override
  String get exactMatch => 'Potrivire exactă';

  @override
  String get fuzzyMatches => 'Meciuri neclare';

  @override
  String get noFuzzyMatches => 'Fără potriviri neclare';

  @override
  String get vectorMatch => 'Potrivire vectorială';

  @override
  String get networkMatches => 'Potriviri în rețea';

  @override
  String get noNetworkMatches => 'Nicio potrivire de rețea';

  @override
  String get networkSearchIsOff =>
      'Căutarea în rețea este dezactivată. Activați-l în Setări.';

  @override
  String get network => 'Reţea';

  @override
  String get networkMatch => 'Potrivire în rețea';

  @override
  String get noSearchHistory => 'Fără istoric de căutare';

  @override
  String get searchHistory => 'Istoricul căutărilor';

  @override
  String get invalidLink => 'Link nevalid';

  @override
  String get unableToOpenWebPage => 'Pagina web nu poate fi deschisă';

  @override
  String get imageMemory => '[Memorie imagine]';

  @override
  String get tapToOpenWebPage => 'Atingeți pentru a deschide pagina web';

  @override
  String get editEntry => 'Editați intrarea';

  @override
  String get entryDetails => 'Detalii de intrare';

  @override
  String get noContent => 'Fără conținut';

  @override
  String get diaryNotFound => 'Jurnalul nu a fost găsit';

  @override
  String get diaryNotFoundShort => 'Înregistrare nu a fost găsită';

  @override
  String get aiSummary => 'Rezumat AI';

  @override
  String get microphoneInterrupted =>
      'Microfonul întrerupt, înregistrarea oprită.';

  @override
  String get bold => 'Îndrăzneţ';

  @override
  String get italic => 'Cursiv';

  @override
  String get strikethrough => 'Striat';

  @override
  String get image => 'Imagine';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR indisponibil. Înregistrarea este încă activă.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Scrie-ți intrarea...';

  @override
  String get writeYourContent => 'Scrie-ți conținutul...';

  @override
  String microphoneStartFailed(String error) {
    return 'Nu s-a pornit microfonul: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Microfonul întrerupt, înregistrarea oprită.';

  @override
  String asrReconnectingError(String error) {
    return 'Reconectare ASR: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Imaginea inserată: $name';
  }

  @override
  String voiceError(String error) {
    return 'Eroare de voce: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Ne pare rău, serviciul AI este momentan indisponibil: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Partajarea eșuată: $error';
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
    return '$matchType · $count accesări';
  }

  @override
  String matchCount(int count) {
    return 'Potrivire: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Sursa: $source';
  }

  @override
  String get createNew => 'Crea';

  @override
  String micStartFailed(String error) {
    return 'Pornirea microfonului a eșuat: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Conturi: +$created / actualizat $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Jurnale: +$created / actualizat $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Mementouri: +$created / actualizat $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Omis: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Total schimbat: $count';
  }

  @override
  String get settingsApplied => 'Au fost aplicate setările din backup.';

  @override
  String get settingsNotApplied => 'Setările din backup nu au fost aplicate.';

  @override
  String backupExported(String path) {
    return 'Backup exportat: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Export eșuat: $error';
  }

  @override
  String importFailed(String error) {
    return 'Import eșuat: $error';
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

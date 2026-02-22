// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get languageName => 'Català';

  @override
  String get languageNameEn => 'Catalan';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Configuració';

  @override
  String get account => 'Compte';

  @override
  String get reminders => 'Recordatoris';

  @override
  String get language => 'Llengua';

  @override
  String get appLanguage => 'Idioma de l\'aplicació';

  @override
  String get appearance => 'Aparença';

  @override
  String get themeMode => 'Mode de tema';

  @override
  String get dark => 'Fosc';

  @override
  String get light => 'Llum';

  @override
  String get system => 'Sistema';

  @override
  String get aiService => 'Servei d\'IA';

  @override
  String get aiChatProvider => 'Proveïdor de xat AI';

  @override
  String get chatModel => 'Model de xat';

  @override
  String get localModel => 'Model local';

  @override
  String get localModelDefault => 'Model local (predeterminat)';

  @override
  String get ollamaEndpoint => 'Ollama Endpoint';

  @override
  String get ollamaModel => 'Model Ollama';

  @override
  String get openAiEndpoint => 'Punt final d\'OpenAI';

  @override
  String get openAiApiKey => 'Clau de l\'API OpenAI';

  @override
  String get openAiModel => 'Model OpenAI';

  @override
  String get geminiEndpoint => 'Punt final Gemini';

  @override
  String get geminiApiKey => 'Clau de l\'API Gemini';

  @override
  String get geminiModel => 'Models Bessons';

  @override
  String get anthropicEndpoint => 'Punt final antròpic';

  @override
  String get anthropicApiKey => 'Clau de l\'API antròpica';

  @override
  String get anthropicModel => 'Model antròpic';

  @override
  String get customProtocol => 'Protocol personalitzat';

  @override
  String get protocol => 'Protocol';

  @override
  String get customEndpoint => 'Punt final personalitzat';

  @override
  String get customApiKey => 'Clau d\'API personalitzada';

  @override
  String get customModel => 'Model personalitzat';

  @override
  String get optionalForLocalServers =>
      'Opcional per a servidors locals/personalitzats';

  @override
  String get speechRecognitionEngine => 'Motor de reconeixement de veu';

  @override
  String get local => 'Local';

  @override
  String get endpoint => 'Punt final';

  @override
  String get localSpeechModel => 'Model de parla local';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (al dispositiu)';

  @override
  String get systemSpeechRecognition => 'Sistema de reconeixement de veu';

  @override
  String get systemRecognitionAndroidIos =>
      'Reconeixement del sistema (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Reconeixement de punt final (núvol/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Utilitzeu el reconeixement integrat d\'Android/iOS (pot utilitzar el núvol)';

  @override
  String get voiceAiEndpoint => 'Punt final d\'IA de veu';

  @override
  String get embeddingModel => 'Model d\'incrustació';

  @override
  String get crossDeviceSync => 'Sincronització entre dispositius';

  @override
  String get sendToOtherDevices => 'Envia a altres dispositius (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Exporta la còpia de seguretat i envia\'l mitjançant un full de compartició';

  @override
  String get importFromLocalSend => 'Importa des de LocalSend';

  @override
  String get selectBackupJson =>
      'Seleccioneu JSON de còpia de seguretat i fusioneu les dades locals';

  @override
  String get autoGeneration => 'Generació automàtica';

  @override
  String get autoGenerateSummary => 'Generació automàtica de resum';

  @override
  String get generateAiSummaryForNewEntries =>
      'Genereu un resum d\'IA per a noves entrades';

  @override
  String get autoGenerateEmbedding => 'Incrustació de generació automàtica';

  @override
  String get generateVectorEmbedding =>
      'Generar incrustació vectorial per a la cerca';

  @override
  String get enableNetworkSearch => 'Activa la cerca a la xarxa';

  @override
  String get allowOnlineRetrieval =>
      'Permet la recuperació en línia per a la cerca i el xat AI (desactivat per defecte)';

  @override
  String get about => 'Sobre';

  @override
  String version(String version) {
    return 'Versió $version';
  }

  @override
  String get database => 'Base de dades';

  @override
  String get objectBoxWithHnsw => 'ObjectBox amb índex HNSW';

  @override
  String get logOut => 'Tanca la sessió';

  @override
  String get custom => 'Personalitzat';

  @override
  String get openAiCompatible => 'Compatible amb OpenAI';

  @override
  String get notSet => 'No configurat';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... o http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'Admet punts finals locals/LAN/públics';

  @override
  String get shiguangLocalSendBackup =>
      'Còpia de seguretat de Shiguang LocalSend';

  @override
  String get localBackupFromShiguang =>
      'Còpia de seguretat local de Shiguang (rebre mitjançant LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Seleccioneu el fitxer de còpia de seguretat rebut de LocalSend';

  @override
  String get failedToResolveFilePath =>
      'No s\'ha pogut resoldre el camí del fitxer seleccionat';

  @override
  String get importOptions => 'Opcions d\'importació';

  @override
  String get importSettingsAsWell =>
      'També importar la configuració?\n(Les claus API no es sobreescriuran)';

  @override
  String get dataOnly => 'Només dades';

  @override
  String get dataAndSettings => 'Dades + Configuració';

  @override
  String get importCompleted => 'Importació completada';

  @override
  String get settingsInBackupWereApplied =>
      'S\'ha aplicat la configuració de la còpia de seguretat.';

  @override
  String get settingsInBackupWereNotApplied =>
      'La configuració de la còpia de seguretat no s\'ha aplicat.';

  @override
  String get ok => 'D\'acord';

  @override
  String get cancel => 'Cancel·la';

  @override
  String get save => 'Desa';

  @override
  String get delete => 'Suprimeix';

  @override
  String get clear => 'Clar';

  @override
  String get add => 'Afegeix';

  @override
  String get create => 'Crear';

  @override
  String get edit => 'Edita';

  @override
  String get search => 'Cerca';

  @override
  String get areYouSureYouWantToLogOut =>
      'Esteu segur que voleu tancar la sessió?';

  @override
  String get chooseLanguage => 'Trieu Idioma';

  @override
  String get databaseInfo => 'Informació de la base de dades';

  @override
  String get storage => 'Emmagatzematge: ObjectBox';

  @override
  String get vectorIndex => 'Índex vectorial: HNSW';

  @override
  String get dimensions => 'Mides: 384';

  @override
  String get embeddingModelBge => 'Model d\'incrustació: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Fes una foto';

  @override
  String get chooseFromGallery => 'Trieu a la Galeria';

  @override
  String get editNickname => 'Edita el sobrenom';

  @override
  String get enterNickname => 'Introduïu l\'àlies';

  @override
  String get pleaseEnterNickname => 'Introduïu un àlies';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'El sobrenom ja existeix o no és vàlid';

  @override
  String get user => 'Usuari';

  @override
  String get manageScheduledReminders =>
      'Gestioneu els recordatoris i les alarmes programades';

  @override
  String get imageFailedToLoad =>
      'La imatge no s\'ha pogut carregar. Si us plau, torna a triar.';

  @override
  String get imageIsStillLoading => 'La imatge encara s\'està carregant';

  @override
  String get imageAreaNotReady =>
      'L\'àrea d\'imatge no està preparada. Si us plau, torna-ho a provar.';

  @override
  String get cropFrameNotReady =>
      'El marc de retall no està preparat. Si us plau, torna-ho a provar.';

  @override
  String get invalidCropArea =>
      'Àrea de tall no vàlida. Si us plau, torna-ho a provar.';

  @override
  String get cropFailed =>
      'El retall ha fallat. Si us plau, torna-ho a provar.';

  @override
  String get cropAvatar => 'Retalla l\'avatar';

  @override
  String get chooseAgain => 'Trieu de nou';

  @override
  String get rotate90 => 'Gira 90°';

  @override
  String get dragFrameToMove =>
      'Arrossegueu el marc per moure\'s, arrossegueu la part inferior dreta per canviar la mida; pessigueu per fer zoom i moure la imatge.';

  @override
  String get pleaseFillInAllFields => 'Si us plau, ompliu tots els camps';

  @override
  String get pinMustBeAtLeast4Digits => 'El PIN ha de tenir almenys 4 dígits';

  @override
  String get pinAtLeast4Digits => 'El PIN ha de tenir almenys 4 dígits';

  @override
  String get invalidUsernameOrPin => 'Nom d\'usuari o PIN no vàlid';

  @override
  String get invalidUsernameOrPinError => 'Nom d\'usuari o PIN no vàlid';

  @override
  String get usernameAlreadyExists => 'El nom d\'usuari ja existeix';

  @override
  String get captureMomentsKeepMemories => 'Captura moments, guarda records';

  @override
  String get username => 'Nom d\'usuari';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Inicieu sessió';

  @override
  String get createAccount => 'Crea un compte';

  @override
  String get dontHaveAccountCreateOne => 'No tens un compte? Crea\'n un';

  @override
  String get alreadyHaveAccountLogin => 'Ja tens un compte? Inicieu sessió';

  @override
  String get pleaseEnterUsername => 'Introduïu un nom d\'usuari';

  @override
  String get pinsDoNotMatch => 'Els PIN no coincideixen';

  @override
  String get tapToAddAvatar => 'Toca per afegir un avatar';

  @override
  String get yourName => 'El teu nom';

  @override
  String get privatePinOptional => 'PIN privat (opcional)';

  @override
  String get usedToEncryptPrivateRecords =>
      'S\'utilitza per xifrar registres privats';

  @override
  String get privatePin => 'PIN privat';

  @override
  String get leaveEmptyForNoEncryption => 'Deixeu buit per no xifrar';

  @override
  String get confirmPin => 'Confirmeu el PIN';

  @override
  String get getStarted => 'Comença';

  @override
  String get noReminders => 'Sense recordatoris';

  @override
  String get addReminder => 'Afegeix un recordatori';

  @override
  String get title => 'Títol';

  @override
  String get descriptionOptional => 'Descripció (opcional)';

  @override
  String get microphonePermissionRequired => 'Cal permís de micròfon';

  @override
  String get aiAssistant => 'Assistent d\'IA';

  @override
  String get listening => 'Escoltant...';

  @override
  String get typeAMessage => 'Escriu un missatge...';

  @override
  String get aiChat => 'Xat amb IA';

  @override
  String get startAConversation => 'Iniciar una conversa';

  @override
  String get typeYourMessage => 'Escriu el teu missatge...';

  @override
  String get asrReconnecting => 'ASR tornant a connectar...';

  @override
  String get write => 'Escriu';

  @override
  String get writeEntry => 'Escriu l\'entrada';

  @override
  String get noMemoriesYet => 'Encara no hi ha records';

  @override
  String get tapPlusToCapture => 'Toca + per capturar els teus pensaments';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Toca + per capturar els teus pensaments';

  @override
  String get deleteMemory => 'Suprimeix la memòria';

  @override
  String get deleteRecord => 'Suprimeix el registre';

  @override
  String get thisEntryWillBeRemoved =>
      'Aquesta entrada s\'eliminarà de la vostra línia de temps.';

  @override
  String get thisRecordWillBeRemoved =>
      'Aquest registre s\'eliminarà de la vostra línia de temps.';

  @override
  String get searchYourRecords => 'Cerca els teus registres...';

  @override
  String get exactMatches => 'Coincidències exactes';

  @override
  String get noExactMatches => 'Sense coincidències exactes';

  @override
  String get exact => 'Exacte';

  @override
  String get exactMatch => 'Coincidència exacta';

  @override
  String get fuzzyMatches => 'Partits difusos';

  @override
  String get noFuzzyMatches => 'Sense coincidències difuses';

  @override
  String get vectorMatch => 'Concordança vectorial';

  @override
  String get networkMatches => 'Coincidències de xarxa';

  @override
  String get noNetworkMatches => 'No hi ha coincidències de xarxa';

  @override
  String get networkSearchIsOff =>
      'La cerca a la xarxa està desactivada. Activeu-lo a Configuració.';

  @override
  String get network => 'Xarxa';

  @override
  String get networkMatch => 'Coincidència de xarxa';

  @override
  String get noSearchHistory => 'No hi ha historial de cerques';

  @override
  String get searchHistory => 'Historial de cerques';

  @override
  String get invalidLink => 'Enllaç no vàlid';

  @override
  String get unableToOpenWebPage => 'No es pot obrir la pàgina web';

  @override
  String get imageMemory => '[Memòria d\'imatge]';

  @override
  String get tapToOpenWebPage => 'Toqueu per obrir la pàgina web';

  @override
  String get editEntry => 'Edita l\'entrada';

  @override
  String get entryDetails => 'Detalls de l\'entrada';

  @override
  String get noContent => 'Sense contingut';

  @override
  String get diaryNotFound => 'No s\'ha trobat el diari';

  @override
  String get diaryNotFoundShort => 'No s\'ha trobat el registre';

  @override
  String get aiSummary => 'Resum de l\'IA';

  @override
  String get microphoneInterrupted =>
      'S\'ha interromput el micròfon, la gravació s\'ha aturat.';

  @override
  String get bold => 'Atrevit';

  @override
  String get italic => 'Cursiva';

  @override
  String get strikethrough => 'Tallat';

  @override
  String get image => 'Imatge';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR no disponible. La gravació encara està activa.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Escriu la teva entrada...';

  @override
  String get writeYourContent => 'Escriu el teu contingut...';

  @override
  String microphoneStartFailed(String error) {
    return 'No s\'ha pogut iniciar el micròfon: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'S\'ha interromput el micròfon, la gravació s\'ha aturat.';

  @override
  String asrReconnectingError(String error) {
    return 'S\'està tornant a connectar: ​​$error';
  }

  @override
  String imageInserted(String name) {
    return 'Imatge inserida: $name';
  }

  @override
  String voiceError(String error) {
    return 'Error de veu: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Ho sentim, el servei d\'IA no està disponible actualment: $error';
  }

  @override
  String shareFailed(String error) {
    return 'No s\'ha pogut compartir: $error';
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
    return '$matchType · $count visites';
  }

  @override
  String matchCount(int count) {
    return 'Coincidència: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Font: $source';
  }

  @override
  String get createNew => 'Crear';

  @override
  String micStartFailed(String error) {
    return 'Ha fallat l\'inici del micròfon: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Comptes: +$created / actualitzat $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Diaris: +$created / actualitzat $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Recordatoris: +$created / actualitzat $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'S\'ha omès: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Total canviat: $count';
  }

  @override
  String get settingsApplied =>
      'S\'ha aplicat la configuració de la còpia de seguretat.';

  @override
  String get settingsNotApplied =>
      'La configuració de la còpia de seguretat no s\'ha aplicat.';

  @override
  String backupExported(String path) {
    return 'Còpia de seguretat exportada: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Ha fallat l\'exportació: $error';
  }

  @override
  String importFailed(String error) {
    return 'La importació ha fallat: $error';
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

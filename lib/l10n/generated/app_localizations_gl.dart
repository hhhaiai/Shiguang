// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Galician (`gl`).
class AppLocalizationsGl extends AppLocalizations {
  AppLocalizationsGl([String locale = 'gl']) : super(locale);

  @override
  String get languageName => 'Galego';

  @override
  String get languageNameEn => 'Galician';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Configuración';

  @override
  String get account => 'Conta';

  @override
  String get reminders => 'Recordatorios';

  @override
  String get language => 'Linguaxe';

  @override
  String get appLanguage => 'Idioma da aplicación';

  @override
  String get appearance => 'Aparición';

  @override
  String get themeMode => 'Modo tema';

  @override
  String get dark => 'Escuro';

  @override
  String get light => 'Luz';

  @override
  String get system => 'Sistema';

  @override
  String get aiService => 'Servizo de IA';

  @override
  String get aiChatProvider => 'Provedor de chat AI';

  @override
  String get chatModel => 'Modelo de chat';

  @override
  String get localModel => 'Modelo Local';

  @override
  String get localModelDefault => 'Modelo local (predeterminado)';

  @override
  String get ollamaEndpoint => 'Ollama Endpoint';

  @override
  String get ollamaModel => 'Modelo Ollama';

  @override
  String get openAiEndpoint => 'Punto final de OpenAI';

  @override
  String get openAiApiKey => 'Clave API OpenAI';

  @override
  String get openAiModel => 'Modelo OpenAI';

  @override
  String get geminiEndpoint => 'Punto final Gemini';

  @override
  String get geminiApiKey => 'Chave da API Gemini';

  @override
  String get geminiModel => 'Modelos Gemini';

  @override
  String get anthropicEndpoint => 'Punto final antrópico';

  @override
  String get anthropicApiKey => 'Clave de API antrópica';

  @override
  String get anthropicModel => 'Modelo antrópico';

  @override
  String get customProtocol => 'Protocolo personalizado';

  @override
  String get protocol => 'Protocolo';

  @override
  String get customEndpoint => 'Punto final personalizado';

  @override
  String get customApiKey => 'Chave de API personalizada';

  @override
  String get customModel => 'Modelo personalizado';

  @override
  String get optionalForLocalServers =>
      'Opcional para servidores locais/personalizados';

  @override
  String get speechRecognitionEngine => 'Motor de recoñecemento de voz';

  @override
  String get local => 'Local';

  @override
  String get endpoint => 'Punto final';

  @override
  String get localSpeechModel => 'Modelo de fala local';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (no dispositivo)';

  @override
  String get systemSpeechRecognition => 'Sistema de recoñecemento de voz';

  @override
  String get systemRecognitionAndroidIos =>
      'Recoñecemento do sistema (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Recoñecemento de puntos finais (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Usa o recoñecemento integrado de Android/iOS (pode usar a nube)';

  @override
  String get voiceAiEndpoint => 'Punto final de IA de voz';

  @override
  String get embeddingModel => 'Modelo de incorporación';

  @override
  String get crossDeviceSync => 'Sincronización entre dispositivos';

  @override
  String get sendToOtherDevices => 'Enviar a outros dispositivos (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Exportar copia de seguranza e enviar a través da folla de compartición';

  @override
  String get importFromLocalSend => 'Importar desde LocalSend';

  @override
  String get selectBackupJson =>
      'Seleccione JSON de copia de seguridade e combine os datos locais';

  @override
  String get autoGeneration => 'Xeración automática';

  @override
  String get autoGenerateSummary => 'Xerar automáticamente un resumo';

  @override
  String get generateAiSummaryForNewEntries =>
      'Xera un resumo de AI para novas entradas';

  @override
  String get autoGenerateEmbedding => 'Xeración automática de incorporación';

  @override
  String get generateVectorEmbedding =>
      'Xerar incrustación de vectores para a busca';

  @override
  String get enableNetworkSearch => 'Activar a busca en rede';

  @override
  String get allowOnlineRetrieval =>
      'Permitir a recuperación en liña para a busca e o chat AI (desactivado por defecto)';

  @override
  String get about => 'Sobre';

  @override
  String version(String version) {
    return 'Versión $version';
  }

  @override
  String get database => 'Base de datos';

  @override
  String get objectBoxWithHnsw => 'ObjectBox con índice HNSW';

  @override
  String get logOut => 'Pechar sesión';

  @override
  String get custom => 'Personalizado';

  @override
  String get openAiCompatible => 'Compatible con OpenAI';

  @override
  String get notSet => 'Non definido';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Admite puntos finais locais/LAN/públicos';

  @override
  String get shiguangLocalSendBackup =>
      'Copia de seguranza de Shiguang LocalSend';

  @override
  String get localBackupFromShiguang =>
      'Copia de seguridade local de Shiguang (recibir a través de LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Seleccione o ficheiro de copia de seguranza recibido de LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Produciuse un erro ao resolver o camiño do ficheiro seleccionado';

  @override
  String get importOptions => 'Opcións de importación';

  @override
  String get importSettingsAsWell =>
      'Importar a configuración tamén?\n(As claves API non se sobrescribirán)';

  @override
  String get dataOnly => 'Só datos';

  @override
  String get dataAndSettings => 'Datos + Configuración';

  @override
  String get importCompleted => 'Importación completada';

  @override
  String get settingsInBackupWereApplied =>
      'Aplicáronse a configuración na copia de seguranza.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Non se aplicou a configuración da copia de seguranza.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Gardar';

  @override
  String get delete => 'Eliminar';

  @override
  String get clear => 'Limpar';

  @override
  String get add => 'Engadir';

  @override
  String get create => 'Crear';

  @override
  String get edit => 'Editar';

  @override
  String get search => 'Busca';

  @override
  String get areYouSureYouWantToLogOut =>
      'Estás seguro de que queres pechar a sesión?';

  @override
  String get chooseLanguage => 'Escolla Idioma';

  @override
  String get databaseInfo => 'Información da base de datos';

  @override
  String get storage => 'Almacenamento: ObjectBox';

  @override
  String get vectorIndex => 'Índice vectorial: HNSW';

  @override
  String get dimensions => 'Dimensións: 384';

  @override
  String get embeddingModelBge => 'Modelo de incorporación: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Sacar a foto';

  @override
  String get chooseFromGallery => 'Escolle na Galería';

  @override
  String get editNickname => 'Editar o apelido';

  @override
  String get enterNickname => 'Introduce o apelido';

  @override
  String get pleaseEnterNickname => 'Introduce un alcume';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'O alcume xa existe ou non é válido';

  @override
  String get user => 'Usuario';

  @override
  String get manageScheduledReminders =>
      'Xestiona recordatorios e alarmas programados';

  @override
  String get imageFailedToLoad =>
      'Non se puido cargar a imaxe. Escolle de novo.';

  @override
  String get imageIsStillLoading => 'A imaxe aínda se está cargando';

  @override
  String get imageAreaNotReady =>
      'A área da imaxe non está lista. Téntao de novo.';

  @override
  String get cropFrameNotReady =>
      'O marco de recorte non está listo. Téntao de novo.';

  @override
  String get invalidCropArea => 'Área de recorte non válida. Téntao de novo.';

  @override
  String get cropFailed => 'Fallou o recorte. Téntao de novo.';

  @override
  String get cropAvatar => 'Recortar avatar';

  @override
  String get chooseAgain => 'Escolle de novo';

  @override
  String get rotate90 => 'Xirar 90°';

  @override
  String get dragFrameToMove =>
      'Arrastra o marco para mover, arrastra a parte inferior dereita para cambiar o tamaño; beliscar para facer zoom e mover a imaxe.';

  @override
  String get pleaseFillInAllFields => 'Enche todos os campos';

  @override
  String get pinMustBeAtLeast4Digits => 'O PIN debe ter polo menos 4 díxitos';

  @override
  String get pinAtLeast4Digits => 'O PIN debe ter polo menos 4 díxitos';

  @override
  String get invalidUsernameOrPin => 'Nome de usuario ou PIN non válido';

  @override
  String get invalidUsernameOrPinError => 'Nome de usuario ou PIN non válido';

  @override
  String get usernameAlreadyExists => 'O nome de usuario xa existe';

  @override
  String get captureMomentsKeepMemories => 'Captura momentos, garda recordos';

  @override
  String get username => 'Nome de usuario';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get createAccount => 'Crear conta';

  @override
  String get dontHaveAccountCreateOne => 'Non tes unha conta? Crea un';

  @override
  String get alreadyHaveAccountLogin => 'Xa tes unha conta? Iniciar sesión';

  @override
  String get pleaseEnterUsername => 'Introduce un nome de usuario';

  @override
  String get pinsDoNotMatch => 'Os PIN non coinciden';

  @override
  String get tapToAddAvatar => 'Toca para engadir un avatar';

  @override
  String get yourName => 'O teu nome';

  @override
  String get privatePinOptional => 'PIN privado (opcional)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Usado para cifrar rexistros privados';

  @override
  String get privatePin => 'PIN privado';

  @override
  String get leaveEmptyForNoEncryption => 'Déixao baleiro sen cifrar';

  @override
  String get confirmPin => 'Confirmar o PIN';

  @override
  String get getStarted => 'Comeza';

  @override
  String get noReminders => 'Sen recordatorios';

  @override
  String get addReminder => 'Engadir recordatorio';

  @override
  String get title => 'Título';

  @override
  String get descriptionOptional => 'Descrición (opcional)';

  @override
  String get microphonePermissionRequired => 'Requírese permiso de micrófono';

  @override
  String get aiAssistant => 'Asistente de IA';

  @override
  String get listening => 'Escoitando...';

  @override
  String get typeAMessage => 'Escribe unha mensaxe...';

  @override
  String get aiChat => 'Chat AI';

  @override
  String get startAConversation => 'Iniciar unha conversa';

  @override
  String get typeYourMessage => 'Escribe a túa mensaxe...';

  @override
  String get asrReconnecting => 'ASR reconectando...';

  @override
  String get write => 'Escribe';

  @override
  String get writeEntry => 'Escribir entrada';

  @override
  String get noMemoriesYet => 'Aínda non hai recordos';

  @override
  String get tapPlusToCapture => 'Toca + para capturar os teus pensamentos';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Toca + para capturar os teus pensamentos';

  @override
  String get deleteMemory => 'Borrar memoria';

  @override
  String get deleteRecord => 'Eliminar rexistro';

  @override
  String get thisEntryWillBeRemoved =>
      'Esta entrada eliminarase da túa cronoloxía.';

  @override
  String get thisRecordWillBeRemoved =>
      'Este rexistro eliminarase da túa cronoloxía.';

  @override
  String get searchYourRecords => 'Busca nos teus rexistros...';

  @override
  String get exactMatches => 'Coincidencias exactas';

  @override
  String get noExactMatches => 'Non hai coincidencias exactas';

  @override
  String get exact => 'Exacto';

  @override
  String get exactMatch => 'Coincidencia exacta';

  @override
  String get fuzzyMatches => 'Partidos difusos';

  @override
  String get noFuzzyMatches => 'Non hai coincidencias difusas';

  @override
  String get vectorMatch => 'Partido Vectorial';

  @override
  String get networkMatches => 'Partidos de rede';

  @override
  String get noNetworkMatches => 'Non hai coincidencias de rede';

  @override
  String get networkSearchIsOff =>
      'A busca na rede está desactivada. Habilitalo en Configuración.';

  @override
  String get network => 'Rede';

  @override
  String get networkMatch => 'Correspondencia de rede';

  @override
  String get noSearchHistory => 'Non hai historial de busca';

  @override
  String get searchHistory => 'Historial de busca';

  @override
  String get invalidLink => 'Ligazón non válida';

  @override
  String get unableToOpenWebPage => 'Non se puido abrir a páxina web';

  @override
  String get imageMemory => '[Memoria de imaxe]';

  @override
  String get tapToOpenWebPage => 'Toca para abrir a páxina web';

  @override
  String get editEntry => 'Editar entrada';

  @override
  String get entryDetails => 'Detalles da entrada';

  @override
  String get noContent => 'Sen contido';

  @override
  String get diaryNotFound => 'Non se atopou o diario';

  @override
  String get diaryNotFoundShort => 'Non se atopou o rexistro';

  @override
  String get aiSummary => 'Resumo da IA';

  @override
  String get microphoneInterrupted =>
      'Interrompeuse o micrófono, detívose a gravación.';

  @override
  String get bold => 'Atrevido';

  @override
  String get italic => 'Cursiva';

  @override
  String get strikethrough => 'Tachado';

  @override
  String get image => 'Imaxe';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR non dispoñible. A gravación aínda está activa.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Escribe a túa entrada...';

  @override
  String get writeYourContent => 'Escribe o teu contido...';

  @override
  String microphoneStartFailed(String error) {
    return 'Produciuse un erro ao iniciar o micrófono: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Interrompeuse o micrófono, detívose a gravación.';

  @override
  String asrReconnectingError(String error) {
    return 'Reconectando ASR: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Imaxe inserida: $name';
  }

  @override
  String voiceError(String error) {
    return 'Erro de voz: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'O servizo de intelixencia artificial non está dispoñible actualmente: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Produciuse un erro ao compartir: $error';
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
    return '$matchType · $count visitas';
  }

  @override
  String matchCount(int count) {
    return 'Coincidencia: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Fonte: $source';
  }

  @override
  String get createNew => 'Crear';

  @override
  String micStartFailed(String error) {
    return 'Fallou o inicio do micrófono: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Contas: +$created / actualizadas $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Diarios: +$created / actualizado $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Recordatorios: +$created / actualizado $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Omitido: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Total de cambios: $count';
  }

  @override
  String get settingsApplied =>
      'Aplicáronse a configuración na copia de seguranza.';

  @override
  String get settingsNotApplied =>
      'Non se aplicou a configuración da copia de seguranza.';

  @override
  String backupExported(String path) {
    return 'Copia de seguranza exportada: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Produciuse un erro na exportación: $error';
  }

  @override
  String importFailed(String error) {
    return 'Produciuse un erro na importación: $error';
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

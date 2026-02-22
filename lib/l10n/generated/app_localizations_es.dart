// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get languageName => 'Español';

  @override
  String get languageNameEn => 'Spanish';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Configuración';

  @override
  String get account => 'Cuenta';

  @override
  String get reminders => 'Recordatorios';

  @override
  String get language => 'Idioma';

  @override
  String get appLanguage => 'Idioma de la aplicación';

  @override
  String get appearance => 'Apariencia';

  @override
  String get themeMode => 'Modo de tema';

  @override
  String get dark => 'Oscuro';

  @override
  String get light => 'Claro';

  @override
  String get system => 'Sistema';

  @override
  String get aiService => 'Servicio de IA';

  @override
  String get aiChatProvider => 'Proveedor de chat de IA';

  @override
  String get chatModel => 'Modelo de chat';

  @override
  String get localModel => 'Modelo local';

  @override
  String get localModelDefault => 'Modelo local (predeterminado)';

  @override
  String get ollamaEndpoint => 'Punto de conexión Ollama';

  @override
  String get ollamaModel => 'Modelo Ollama';

  @override
  String get openAiEndpoint => 'Punto de conexión OpenAI';

  @override
  String get openAiApiKey => 'Clave API de OpenAI';

  @override
  String get openAiModel => 'Modelo OpenAI';

  @override
  String get geminiEndpoint => 'Punto de conexión Gemini';

  @override
  String get geminiApiKey => 'Clave API de Gemini';

  @override
  String get geminiModel => 'Modelo Gemini';

  @override
  String get anthropicEndpoint => 'Punto de conexión Anthropic';

  @override
  String get anthropicApiKey => 'Clave API de Anthropic';

  @override
  String get anthropicModel => 'Modelo Anthropic';

  @override
  String get customProtocol => 'Protocolo personalizado';

  @override
  String get protocol => 'Protocolo';

  @override
  String get customEndpoint => 'Punto de conexión personalizado';

  @override
  String get customApiKey => 'Clave API personalizada';

  @override
  String get customModel => 'Modelo personalizado';

  @override
  String get optionalForLocalServers =>
      'Opcional para servidores locales/personalizados';

  @override
  String get speechRecognitionEngine => 'Motor de reconocimiento de voz';

  @override
  String get local => 'Local';

  @override
  String get endpoint => 'Punto de conexión';

  @override
  String get localSpeechModel => 'Modelo de voz local';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (en dispositivo)';

  @override
  String get systemSpeechRecognition => 'Reconocimiento de voz del sistema';

  @override
  String get systemRecognitionAndroidIos =>
      'Reconocimiento del sistema (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Reconocimiento por punto de conexión (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Usar reconocimiento integrado de Android/iOS (puede usar la nube)';

  @override
  String get voiceAiEndpoint => 'Punto de conexión de IA de voz';

  @override
  String get embeddingModel => 'Modelo de embedding';

  @override
  String get crossDeviceSync => 'Sincronización entre dispositivos';

  @override
  String get sendToOtherDevices => 'Enviar a otros dispositivos (LocalSend)';

  @override
  String get exportBackupAndSend => 'Exportar copia de seguridad y enviar';

  @override
  String get importFromLocalSend => 'Importar desde LocalSend';

  @override
  String get selectBackupJson =>
      'Seleccionar JSON de copia de seguridad y fusionar datos locales';

  @override
  String get autoGeneration => 'Generación automática';

  @override
  String get autoGenerateSummary => 'Generar resumen automáticamente';

  @override
  String get generateAiSummaryForNewEntries =>
      'Generar resumen de IA para nuevas entradas';

  @override
  String get autoGenerateEmbedding => 'Generar embedding automáticamente';

  @override
  String get generateVectorEmbedding =>
      'Generar embedding vectorial para búsqueda';

  @override
  String get enableNetworkSearch => 'Habilitar búsqueda en red';

  @override
  String get allowOnlineRetrieval =>
      'Permitir recuperación en línea para búsqueda y chat de IA (desactivado por defecto)';

  @override
  String get about => 'Acerca de';

  @override
  String version(String version) {
    return 'Versión $version';
  }

  @override
  String get database => 'Base de datos';

  @override
  String get objectBoxWithHnsw => 'ObjectBox con índice HNSW';

  @override
  String get logOut => 'Cerrar sesión';

  @override
  String get custom => 'Personalizado';

  @override
  String get openAiCompatible => 'Compatible con OpenAI';

  @override
  String get notSet => 'No establecido';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... o http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Soporta puntos de conexión locales/LAN/públicos';

  @override
  String get shiguangLocalSendBackup =>
      'Copia de seguridad LocalSend de Shiguang';

  @override
  String get localBackupFromShiguang =>
      'Copia de seguridad local de Shiguang (recibir vía LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Seleccionar archivo de copia de seguridad recibido de LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Error al resolver la ruta del archivo seleccionado';

  @override
  String get importOptions => 'Opciones de importación';

  @override
  String get importSettingsAsWell =>
      '¿Importar también la configuración?\n(Las claves API no se sobrescribirán)';

  @override
  String get dataOnly => 'Solo datos';

  @override
  String get dataAndSettings => 'Datos + Configuración';

  @override
  String get importCompleted => 'Importación completada';

  @override
  String get settingsInBackupWereApplied =>
      'La configuración de la copia de seguridad se aplicó.';

  @override
  String get settingsInBackupWereNotApplied =>
      'La configuración de la copia de seguridad no se aplicó.';

  @override
  String get ok => 'Aceptar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get delete => 'Eliminar';

  @override
  String get clear => 'Limpiar';

  @override
  String get add => 'Añadir';

  @override
  String get create => 'Crear';

  @override
  String get edit => 'Editar';

  @override
  String get search => 'Buscar';

  @override
  String get areYouSureYouWantToLogOut =>
      '¿Está seguro de que desea cerrar sesión?';

  @override
  String get chooseLanguage => 'Elegir idioma';

  @override
  String get databaseInfo => 'Información de la base de datos';

  @override
  String get storage => 'Almacenamiento: ObjectBox';

  @override
  String get vectorIndex => 'Índice vectorial: HNSW';

  @override
  String get dimensions => 'Dimensiones: 384';

  @override
  String get embeddingModelBge => 'Modelo de embedding: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Tomar foto';

  @override
  String get chooseFromGallery => 'Elegir de la galería';

  @override
  String get editNickname => 'Editar apodo';

  @override
  String get enterNickname => 'Ingrese un apodo';

  @override
  String get pleaseEnterNickname => 'Por favor ingrese un apodo';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'El apodo ya existe o es inválido';

  @override
  String get user => 'Usuario';

  @override
  String get manageScheduledReminders =>
      'Gestionar recordatorios programados y alarmas';

  @override
  String get imageFailedToLoad =>
      'Error al cargar la imagen. Por favor elija de nuevo.';

  @override
  String get imageIsStillLoading => 'La imagen todavía se está cargando';

  @override
  String get imageAreaNotReady =>
      'El área de imagen no está lista. Por favor intente de nuevo.';

  @override
  String get cropFrameNotReady =>
      'El marco de recorte no está listo. Por favor intente de nuevo.';

  @override
  String get invalidCropArea =>
      'Área de recorte inválida. Por favor intente de nuevo.';

  @override
  String get cropFailed => 'Error al recortar. Por favor intente de nuevo.';

  @override
  String get cropAvatar => 'Recortar avatar';

  @override
  String get chooseAgain => 'Elegir de nuevo';

  @override
  String get rotate90 => 'Rotar 90°';

  @override
  String get dragFrameToMove =>
      'Arrastre el marco para mover, arrastre la esquina inferior derecha para redimensionar; pellizque para zoom y mover imagen.';

  @override
  String get pleaseFillInAllFields => 'Por favor complete todos los campos';

  @override
  String get pinMustBeAtLeast4Digits => 'El PIN debe tener al menos 4 dígitos';

  @override
  String get pinAtLeast4Digits => 'El PIN debe tener al menos 4 dígitos';

  @override
  String get invalidUsernameOrPin => 'Usuario o PIN inválido';

  @override
  String get invalidUsernameOrPinError => 'Usuario o PIN inválido';

  @override
  String get usernameAlreadyExists => 'El nombre de usuario ya existe';

  @override
  String get captureMomentsKeepMemories => 'Captura momentos, guarda recuerdos';

  @override
  String get username => 'Nombre de usuario';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get createAccount => 'Crear cuenta';

  @override
  String get dontHaveAccountCreateOne => '¿No tiene cuenta? Cree una';

  @override
  String get alreadyHaveAccountLogin => '¿Ya tiene cuenta? Inicie sesión';

  @override
  String get pleaseEnterUsername => 'Por favor ingrese un nombre de usuario';

  @override
  String get pinsDoNotMatch => 'Los PINs no coinciden';

  @override
  String get tapToAddAvatar => 'Toque para añadir avatar';

  @override
  String get yourName => 'Tu nombre';

  @override
  String get privatePinOptional => 'PIN privado (opcional)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Usado para cifrar registros privados';

  @override
  String get privatePin => 'PIN privado';

  @override
  String get leaveEmptyForNoEncryption => 'Dejar vacío para sin cifrado';

  @override
  String get confirmPin => 'Confirmar PIN';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get noReminders => 'Sin recordatorios';

  @override
  String get addReminder => 'Añadir recordatorio';

  @override
  String get title => 'Título';

  @override
  String get descriptionOptional => 'Descripción (opcional)';

  @override
  String get microphonePermissionRequired => 'Se requiere permiso de micrófono';

  @override
  String get aiAssistant => 'Asistente de IA';

  @override
  String get listening => 'Escuchando...';

  @override
  String get typeAMessage => 'Escriba un mensaje...';

  @override
  String get aiChat => 'Chat de IA';

  @override
  String get startAConversation => 'Iniciar una conversación';

  @override
  String get typeYourMessage => 'Escriba su mensaje...';

  @override
  String get asrReconnecting => 'ASR reconectando...';

  @override
  String get write => 'Escribir';

  @override
  String get writeEntry => 'Escribir entrada';

  @override
  String get noMemoriesYet => 'Aún no hay recuerdos';

  @override
  String get tapPlusToCapture => 'Toque + para capturar sus pensamientos';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Toque + para capturar sus pensamientos';

  @override
  String get deleteMemory => 'Eliminar recuerdo';

  @override
  String get deleteRecord => 'Eliminar registro';

  @override
  String get thisEntryWillBeRemoved =>
      'Esta entrada se eliminará de su línea de tiempo.';

  @override
  String get thisRecordWillBeRemoved =>
      'Este registro se eliminará de su línea de tiempo.';

  @override
  String get searchYourRecords => 'Buscar en sus registros...';

  @override
  String get exactMatches => 'Coincidencias exactas';

  @override
  String get noExactMatches => 'Sin coincidencias exactas';

  @override
  String get exact => 'Exacto';

  @override
  String get exactMatch => 'Coincidencia exacta';

  @override
  String get fuzzyMatches => 'Coincidencias aproximadas';

  @override
  String get noFuzzyMatches => 'Sin coincidencias aproximadas';

  @override
  String get vectorMatch => 'Coincidencia vectorial';

  @override
  String get networkMatches => 'Coincidencias de red';

  @override
  String get noNetworkMatches => 'Sin coincidencias de red';

  @override
  String get networkSearchIsOff =>
      'La búsqueda de red está desactivada. Habilítela en Configuración.';

  @override
  String get network => 'Red';

  @override
  String get networkMatch => 'Coincidencia de red';

  @override
  String get noSearchHistory => 'Sin historial de búsqueda';

  @override
  String get searchHistory => 'Historial de búsqueda';

  @override
  String get invalidLink => 'Enlace inválido';

  @override
  String get unableToOpenWebPage => 'No se puede abrir la página web';

  @override
  String get imageMemory => '[Memoria de imagen]';

  @override
  String get tapToOpenWebPage => 'Toque para abrir la página web';

  @override
  String get editEntry => 'Editar entrada';

  @override
  String get entryDetails => 'Detalles de la entrada';

  @override
  String get noContent => 'Sin contenido';

  @override
  String get diaryNotFound => 'Diario no encontrado';

  @override
  String get diaryNotFoundShort => 'Registro no encontrado';

  @override
  String get aiSummary => 'Resumen de IA';

  @override
  String get microphoneInterrupted =>
      'Micrófono interrumpido, grabación detenida.';

  @override
  String get bold => 'Negrita';

  @override
  String get italic => 'Cursiva';

  @override
  String get strikethrough => 'Tachado';

  @override
  String get image => 'Imagen';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR no disponible. La grabación todavía está activa.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Escriba su entrada...';

  @override
  String get writeYourContent => 'Escriba su contenido...';

  @override
  String microphoneStartFailed(String error) {
    return 'Error al iniciar el micrófono: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Micrófono interrumpido, grabación detenida.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR reconectando: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Imagen insertada: $name';
  }

  @override
  String voiceError(String error) {
    return 'Error de voz: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Lo sentimos, el servicio de IA no está disponible actualmente: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Error al compartir: $error';
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
    return '$matchType · $count coincidencias';
  }

  @override
  String matchCount(int count) {
    return 'Coincidencia: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Fuente: $source';
  }

  @override
  String get createNew => 'Crear';

  @override
  String micStartFailed(String error) {
    return 'Error al iniciar el micrófono: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Cuentas: +$created / actualizadas $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Diarios: +$created / actualizados $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Recordatorios: +$created / actualizados $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Omitidos: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Total modificado: $count';
  }

  @override
  String get settingsApplied =>
      'La configuración de la copia de seguridad se aplicó.';

  @override
  String get settingsNotApplied =>
      'La configuración de la copia de seguridad no se aplicó.';

  @override
  String backupExported(String path) {
    return 'Copia de seguridad exportada: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Error al exportar: $error';
  }

  @override
  String importFailed(String error) {
    return 'Error al importar: $error';
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

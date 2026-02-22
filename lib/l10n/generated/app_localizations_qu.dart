// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Quechua (`qu`).
class AppLocalizationsQu extends AppLocalizations {
  AppLocalizationsQu([String locale = 'qu']) : super(locale);

  @override
  String get languageName => 'Runasimi';

  @override
  String get languageNameEn => 'Quechua';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Ajustes';

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
  String get themeMode => 'Modo temático';

  @override
  String get dark => 'Oscuro';

  @override
  String get light => 'Luz';

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
  String get ollamaEndpoint => 'Punto final de Ollama';

  @override
  String get ollamaModel => 'Modelo Ollama';

  @override
  String get openAiEndpoint => 'Punto final OpenAI';

  @override
  String get openAiApiKey => 'Clave API de OpenAI';

  @override
  String get openAiModel => 'Modelo abierto de IA';

  @override
  String get geminiEndpoint => 'Punto final de Géminis';

  @override
  String get geminiApiKey => 'Clave API de Géminis';

  @override
  String get geminiModel => 'Modelos Géminis';

  @override
  String get anthropicEndpoint => 'Punto final antrópico';

  @override
  String get anthropicApiKey => 'Clave API antrópica';

  @override
  String get anthropicModel => 'Modelo antrópico';

  @override
  String get customProtocol => 'Protocolo personalizado';

  @override
  String get protocol => 'Protocolo';

  @override
  String get customEndpoint => 'Punto final personalizado';

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
  String get endpoint => 'Punto final';

  @override
  String get localSpeechModel => 'Modelo de habla local';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (en el dispositivo)';

  @override
  String get systemSpeechRecognition => 'Sistema de reconocimiento de voz';

  @override
  String get systemRecognitionAndroidIos =>
      'Reconocimiento del sistema (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Reconocimiento de terminales (nube/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Utilice el reconocedor integrado de Android/iOS (puede utilizar la nube)';

  @override
  String get voiceAiEndpoint => 'Punto final de IA de voz';

  @override
  String get embeddingModel => 'Modelo de incrustación';

  @override
  String get crossDeviceSync => 'Sincronización entre dispositivos';

  @override
  String get sendToOtherDevices => 'Enviar a otros dispositivos (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Exportar copia de seguridad y enviar mediante hoja compartida';

  @override
  String get importFromLocalSend => 'Importar desde LocalSend';

  @override
  String get selectBackupJson =>
      'Seleccione la copia de seguridad JSON y combine los datos locales';

  @override
  String get autoGeneration => 'Generación automática';

  @override
  String get autoGenerateSummary => 'Resumen de generación automática';

  @override
  String get generateAiSummaryForNewEntries =>
      'Generar resumen de IA para nuevas entradas';

  @override
  String get autoGenerateEmbedding => 'Generar automáticamente incrustación';

  @override
  String get generateVectorEmbedding =>
      'Generar incrustación de vectores para búsqueda';

  @override
  String get enableNetworkSearch => 'Habilitar búsqueda de red';

  @override
  String get allowOnlineRetrieval =>
      'Permitir la recuperación en línea para búsqueda y chat AI (desactivado de forma predeterminada)';

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
  String get logOut => 'Finalizar la sesión';

  @override
  String get custom => 'Costumbre';

  @override
  String get openAiCompatible => 'Compatible con OpenAI';

  @override
  String get notSet => 'No establecido';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Admite puntos finales locales/LAN/públicos';

  @override
  String get shiguangLocalSendBackup =>
      'Copia de seguridad de Shiguang LocalSend';

  @override
  String get localBackupFromShiguang =>
      'Copia de seguridad local de Shiguang (recibir a través de LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Seleccione el archivo de copia de seguridad recibido de LocalSend';

  @override
  String get failedToResolveFilePath =>
      'No se pudo resolver la ruta del archivo seleccionado';

  @override
  String get importOptions => 'Opciones de importación';

  @override
  String get importSettingsAsWell =>
      '¿Importar configuraciones también?\n(Las claves API no se sobrescribirán)';

  @override
  String get dataOnly => 'Sólo datos';

  @override
  String get dataAndSettings => 'Datos + Configuración';

  @override
  String get importCompleted => 'Importación completada';

  @override
  String get settingsInBackupWereApplied =>
      'Se aplicaron las configuraciones en la copia de seguridad.';

  @override
  String get settingsInBackupWereNotApplied =>
      'No se aplicaron las configuraciones en la copia de seguridad.';

  @override
  String get ok => 'DE ACUERDO';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Ahorrar';

  @override
  String get delete => 'Borrar';

  @override
  String get clear => 'Claro';

  @override
  String get add => 'Agregar';

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
  String get chooseLanguage => 'Elija idioma';

  @override
  String get databaseInfo => 'Información de la base de datos';

  @override
  String get storage => 'Almacenamiento: Caja de objetos';

  @override
  String get vectorIndex => 'Índice de vectores: HNSW';

  @override
  String get dimensions => 'Dimensiones: 384';

  @override
  String get embeddingModelBge => 'Modelo de incrustación: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'tomar foto';

  @override
  String get chooseFromGallery => 'Elige de la galería';

  @override
  String get editNickname => 'Editar apodo';

  @override
  String get enterNickname => 'Introduce el apodo';

  @override
  String get pleaseEnterNickname => 'Por favor ingresa un apodo';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'El apodo ya existe o no es válido';

  @override
  String get user => 'Usuario';

  @override
  String get manageScheduledReminders =>
      'Gestionar recordatorios y alarmas programadas';

  @override
  String get imageFailedToLoad =>
      'La imagen no se pudo cargar. Por favor elige de nuevo.';

  @override
  String get imageIsStillLoading => 'La imagen aún se está cargando';

  @override
  String get imageAreaNotReady =>
      'El área de la imagen no está lista. Por favor inténtalo de nuevo.';

  @override
  String get cropFrameNotReady =>
      'El marco de recorte no está listo. Por favor inténtalo de nuevo.';

  @override
  String get invalidCropArea =>
      'Área de cultivo no válida. Por favor inténtalo de nuevo.';

  @override
  String get cropFailed => 'La cosecha falló. Por favor inténtalo de nuevo.';

  @override
  String get cropAvatar => 'Avatar de cultivo';

  @override
  String get chooseAgain => 'Elige de nuevo';

  @override
  String get rotate90 => 'Girar 90°';

  @override
  String get dragFrameToMove =>
      'Arrastre el marco para moverlo, arrastre hacia abajo a la derecha para cambiar el tamaño; pellizcar para hacer zoom y mover la imagen.';

  @override
  String get pleaseFillInAllFields => 'Por favor complete todos los campos';

  @override
  String get pinMustBeAtLeast4Digits => 'El PIN debe tener al menos 4 dígitos';

  @override
  String get pinAtLeast4Digits => 'El PIN debe tener al menos 4 dígitos';

  @override
  String get invalidUsernameOrPin => 'Nombre de usuario o PIN no válido';

  @override
  String get invalidUsernameOrPinError => 'Nombre de usuario o PIN no válido';

  @override
  String get usernameAlreadyExists => 'El nombre de usuario ya existe';

  @override
  String get captureMomentsKeepMemories => 'Captura momentos, guarda recuerdos';

  @override
  String get username => 'Nombre de usuario';

  @override
  String get pin => 'ALFILER';

  @override
  String get login => 'Acceso';

  @override
  String get createAccount => 'Crear una cuenta';

  @override
  String get dontHaveAccountCreateOne => '¿No tienes una cuenta? Crea uno';

  @override
  String get alreadyHaveAccountLogin => '¿Ya tienes una cuenta? Acceso';

  @override
  String get pleaseEnterUsername => 'Por favor ingrese un nombre de usuario';

  @override
  String get pinsDoNotMatch => 'Los PIN no coinciden';

  @override
  String get tapToAddAvatar => 'Toca para agregar avatar';

  @override
  String get yourName => 'Su nombre';

  @override
  String get privatePinOptional => 'PIN privado (opcional)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Se utiliza para cifrar registros privados.';

  @override
  String get privatePin => 'PIN privado';

  @override
  String get leaveEmptyForNoEncryption => 'Déjelo vacío para no cifrar';

  @override
  String get confirmPin => 'Confirmar PIN';

  @override
  String get getStarted => 'Empezar';

  @override
  String get noReminders => 'No reminders';

  @override
  String get addReminder => 'Agregar recordatorio';

  @override
  String get title => 'Título';

  @override
  String get descriptionOptional => 'Descripción (opcional)';

  @override
  String get microphonePermissionRequired =>
      'Se requiere permiso para el micrófono';

  @override
  String get aiAssistant => 'Asistente de IA';

  @override
  String get listening => 'Escuchando...';

  @override
  String get typeAMessage => 'Escribe un mensaje...';

  @override
  String get aiChat => 'Chat de IA';

  @override
  String get startAConversation => 'iniciar una conversación';

  @override
  String get typeYourMessage => 'Escribe tu mensaje...';

  @override
  String get asrReconnecting => 'ASR reconectando...';

  @override
  String get write => 'Escribir';

  @override
  String get writeEntry => 'Escribir entrada';

  @override
  String get noMemoriesYet => 'Aún no hay recuerdos';

  @override
  String get tapPlusToCapture => 'Toca + para capturar tus pensamientos';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Toca + para capturar tus pensamientos';

  @override
  String get deleteMemory => 'Eliminar memoria';

  @override
  String get deleteRecord => 'Eliminar registro';

  @override
  String get thisEntryWillBeRemoved =>
      'Esta entrada será eliminada de tu línea de tiempo.';

  @override
  String get thisRecordWillBeRemoved =>
      'Este registro se eliminará de su línea de tiempo.';

  @override
  String get searchYourRecords => 'Busca en tus registros...';

  @override
  String get exactMatches => 'Coincidencias exactas';

  @override
  String get noExactMatches => 'No exact matches';

  @override
  String get exact => 'Exacto';

  @override
  String get exactMatch => 'Coincidencia exacta';

  @override
  String get fuzzyMatches => 'Coincidencias difusas';

  @override
  String get noFuzzyMatches => 'No hay coincidencias difusas';

  @override
  String get vectorMatch => 'Coincidencia de vectores';

  @override
  String get networkMatches => 'Coincidencias de red';

  @override
  String get noNetworkMatches => 'No hay coincidencias de red';

  @override
  String get networkSearchIsOff =>
      'La búsqueda de red está desactivada. Habilítelo en Configuración.';

  @override
  String get network => 'Red';

  @override
  String get networkMatch => 'Coincidencia de red';

  @override
  String get noSearchHistory => 'Sin historial de búsqueda';

  @override
  String get searchHistory => 'Historial de búsqueda';

  @override
  String get invalidLink => 'Enlace no válido';

  @override
  String get unableToOpenWebPage => 'No se puede abrir la página web';

  @override
  String get imageMemory => '[Memoria de imagen]';

  @override
  String get tapToOpenWebPage => 'Toque para abrir la página web';

  @override
  String get editEntry => 'Editar entrada';

  @override
  String get entryDetails => 'Detalles de entrada';

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
  String get bold => 'Atrevido';

  @override
  String get italic => 'Itálico';

  @override
  String get strikethrough => 'Tachado';

  @override
  String get image => 'Imagen';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR no disponible. La grabación aún está activa.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Escribe tu entrada...';

  @override
  String get writeYourContent => 'Escribe tu contenido...';

  @override
  String microphoneStartFailed(String error) {
    return 'No se pudo iniciar el micrófono: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Micrófono interrumpido, grabación detenida.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR reconectándose: $error';
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
    return 'No se pudo compartir: $error';
  }

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
    return 'Cuentas: +$created / actualizado $updated';
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
    return 'Total cambiado: $count';
  }

  @override
  String get settingsApplied =>
      'Se aplicaron las configuraciones en la copia de seguridad.';

  @override
  String get settingsNotApplied =>
      'No se aplicaron las configuraciones en la copia de seguridad.';

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
    return 'Error de importación: $error';
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

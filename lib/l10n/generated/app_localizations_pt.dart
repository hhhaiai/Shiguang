// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get languageName => 'Português';

  @override
  String get languageNameEn => 'Portuguese';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Definições';

  @override
  String get account => 'Conta';

  @override
  String get reminders => 'Lembretes';

  @override
  String get language => 'Idioma';

  @override
  String get appLanguage => 'Idioma da aplicação';

  @override
  String get appearance => 'Aparência';

  @override
  String get themeMode => 'Modo de tema';

  @override
  String get dark => 'Escuro';

  @override
  String get light => 'Claro';

  @override
  String get system => 'Sistema';

  @override
  String get aiService => 'Serviço de IA';

  @override
  String get aiChatProvider => 'Fornecedor de chat de IA';

  @override
  String get chatModel => 'Modelo de chat';

  @override
  String get localModel => 'Modelo local';

  @override
  String get localModelDefault => 'Modelo local (predefinido)';

  @override
  String get ollamaEndpoint => 'Endpoint Ollama';

  @override
  String get ollamaModel => 'Modelo Ollama';

  @override
  String get openAiEndpoint => 'Endpoint OpenAI';

  @override
  String get openAiApiKey => 'Chave API OpenAI';

  @override
  String get openAiModel => 'Modelo OpenAI';

  @override
  String get geminiEndpoint => 'Endpoint Gemini';

  @override
  String get geminiApiKey => 'Chave API Gemini';

  @override
  String get geminiModel => 'Modelo Gemini';

  @override
  String get anthropicEndpoint => 'Endpoint Anthropic';

  @override
  String get anthropicApiKey => 'Chave API Anthropic';

  @override
  String get anthropicModel => 'Modelo Anthropic';

  @override
  String get customProtocol => 'Protocolo personalizado';

  @override
  String get protocol => 'Protocolo';

  @override
  String get customEndpoint => 'Endpoint personalizado';

  @override
  String get customApiKey => 'Chave API personalizada';

  @override
  String get customModel => 'Modelo personalizado';

  @override
  String get optionalForLocalServers =>
      'Opcional para servidores locais/personalizados';

  @override
  String get speechRecognitionEngine => 'Motor de reconhecimento de voz';

  @override
  String get local => 'Local';

  @override
  String get endpoint => 'Ponto final';

  @override
  String get localSpeechModel => 'Modelo de voz local';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (no dispositivo)';

  @override
  String get systemSpeechRecognition => 'Reconhecimento de voz do sistema';

  @override
  String get systemRecognitionAndroidIos =>
      'Reconhecimento do sistema (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Reconhecimento por endpoint (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Usar reconhecimento integrado do Android/iOS (pode usar a cloud)';

  @override
  String get voiceAiEndpoint => 'Endpoint de IA de voz';

  @override
  String get embeddingModel => 'Modelo de embedding';

  @override
  String get crossDeviceSync => 'Sincronização entre dispositivos';

  @override
  String get sendToOtherDevices =>
      'Enviar para outros dispositivos (LocalSend)';

  @override
  String get exportBackupAndSend => 'Exportar backup e enviar';

  @override
  String get importFromLocalSend => 'Importar do LocalSend';

  @override
  String get selectBackupJson =>
      'Selecionar JSON de backup e mesclar dados locais';

  @override
  String get autoGeneration => 'Geração automática';

  @override
  String get autoGenerateSummary => 'Gerar resumo automaticamente';

  @override
  String get generateAiSummaryForNewEntries =>
      'Gerar resumo de IA para novas entradas';

  @override
  String get autoGenerateEmbedding => 'Gerar embedding automaticamente';

  @override
  String get generateVectorEmbedding =>
      'Gerar embedding vetorial para pesquisa';

  @override
  String get enableNetworkSearch => 'Ativar pesquisa na rede';

  @override
  String get allowOnlineRetrieval =>
      'Permitir recuperação online para pesquisa e chat de IA (desativado por padrão)';

  @override
  String get about => 'Sobre';

  @override
  String version(String version) {
    return 'Versão $version';
  }

  @override
  String get database => 'Base de dados';

  @override
  String get objectBoxWithHnsw => 'ObjectBox com índice HNSW';

  @override
  String get logOut => 'Terminar sessão';

  @override
  String get custom => 'Personalizado';

  @override
  String get openAiCompatible => 'Compatível com OpenAI';

  @override
  String get notSet => 'Não definido';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... ou http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'Suporta endpoints locais/LAN/públicos';

  @override
  String get shiguangLocalSendBackup => 'Backup LocalSend do Shiguang';

  @override
  String get localBackupFromShiguang =>
      'Backup local do Shiguang (receber via LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Selecionar ficheiro de backup recebido do LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Falha ao resolver o caminho do ficheiro selecionado';

  @override
  String get importOptions => 'Opções de importação';

  @override
  String get importSettingsAsWell =>
      'Importar também definições?\n(As chaves API não serão sobrescritas)';

  @override
  String get dataOnly => 'Apenas dados';

  @override
  String get dataAndSettings => 'Dados + Definições';

  @override
  String get importCompleted => 'Importação concluída';

  @override
  String get settingsInBackupWereApplied =>
      'As definições do backup foram aplicadas.';

  @override
  String get settingsInBackupWereNotApplied =>
      'As definições do backup não foram aplicadas.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get delete => 'Eliminar';

  @override
  String get clear => 'Limpar';

  @override
  String get add => 'Adicionar';

  @override
  String get create => 'Criar';

  @override
  String get edit => 'Editar';

  @override
  String get search => 'Pesquisar';

  @override
  String get areYouSureYouWantToLogOut =>
      'Tem a certeza que deseja terminar sessão?';

  @override
  String get chooseLanguage => 'Escolher idioma';

  @override
  String get databaseInfo => 'Info da base de dados';

  @override
  String get storage => 'Armazenamento: ObjectBox';

  @override
  String get vectorIndex => 'Índice vetorial: HNSW';

  @override
  String get dimensions => 'Dimensões: 384';

  @override
  String get embeddingModelBge => 'Modelo de embedding: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Tirar foto';

  @override
  String get chooseFromGallery => 'Escolher da galeria';

  @override
  String get editNickname => 'Editar apelido';

  @override
  String get enterNickname => 'Inserir apelido';

  @override
  String get pleaseEnterNickname => 'Por favor insira um apelido';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'O apelido já existe ou é inválido';

  @override
  String get user => 'Utilizador';

  @override
  String get manageScheduledReminders =>
      'Gerir lembretes programados e alarmes';

  @override
  String get imageFailedToLoad =>
      'Falha ao carregar a imagem. Por favor escolha novamente.';

  @override
  String get imageIsStillLoading => 'A imagem ainda está a carregar';

  @override
  String get imageAreaNotReady =>
      'Área de imagem não pronta. Por favor tente novamente.';

  @override
  String get cropFrameNotReady =>
      'Moldura de corte não pronta. Por favor tente novamente.';

  @override
  String get invalidCropArea =>
      'Área de corte inválida. Por favor tente novamente.';

  @override
  String get cropFailed => 'Falha ao cortar. Por favor tente novamente.';

  @override
  String get cropAvatar => 'Cortar avatar';

  @override
  String get chooseAgain => 'Escolher novamente';

  @override
  String get rotate90 => 'Rodar 90°';

  @override
  String get dragFrameToMove =>
      'Arraste a moldura para mover, arraste o canto inferior direito para redimensionar; belisque para zoom e mover a imagem.';

  @override
  String get pleaseFillInAllFields => 'Por favor preencha todos os campos';

  @override
  String get pinMustBeAtLeast4Digits => 'O PIN deve ter pelo menos 4 dígitos';

  @override
  String get pinAtLeast4Digits => 'O PIN deve ter pelo menos 4 dígitos';

  @override
  String get invalidUsernameOrPin => 'Nome de utilizador ou PIN inválido';

  @override
  String get invalidUsernameOrPinError => 'Nome de utilizador ou PIN inválido';

  @override
  String get usernameAlreadyExists => 'O nome de utilizador já existe';

  @override
  String get captureMomentsKeepMemories => 'Capture momentos, guarde memórias';

  @override
  String get username => 'Nome de utilizador';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Iniciar sessão';

  @override
  String get createAccount => 'Criar conta';

  @override
  String get dontHaveAccountCreateOne => 'Não tem conta? Crie uma';

  @override
  String get alreadyHaveAccountLogin => 'Já tem conta? Inicie sessão';

  @override
  String get pleaseEnterUsername => 'Por favor insira um nome de utilizador';

  @override
  String get pinsDoNotMatch => 'Os PINs não coincidem';

  @override
  String get tapToAddAvatar => 'Toque para adicionar avatar';

  @override
  String get yourName => 'O seu nome';

  @override
  String get privatePinOptional => 'PIN privado (opcional)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Usado para encriptar registos privados';

  @override
  String get privatePin => 'PIN privado';

  @override
  String get leaveEmptyForNoEncryption => 'Deixe vazio para sem encriptação';

  @override
  String get confirmPin => 'Confirmar PIN';

  @override
  String get getStarted => 'Começar';

  @override
  String get noReminders => 'Sem lembretes';

  @override
  String get addReminder => 'Adicionar lembrete';

  @override
  String get title => 'Título';

  @override
  String get descriptionOptional => 'Descrição (opcional)';

  @override
  String get microphonePermissionRequired =>
      'Permissão de microfone necessária';

  @override
  String get aiAssistant => 'Assistente de IA';

  @override
  String get listening => 'A ouvir...';

  @override
  String get typeAMessage => 'Escreva uma mensagem...';

  @override
  String get aiChat => 'Chat de IA';

  @override
  String get startAConversation => 'Iniciar uma conversa';

  @override
  String get typeYourMessage => 'Escreva a sua mensagem...';

  @override
  String get asrReconnecting => 'ASR a reconectar...';

  @override
  String get write => 'Escrever';

  @override
  String get writeEntry => 'Escrever entrada';

  @override
  String get noMemoriesYet => 'Ainda sem memórias';

  @override
  String get tapPlusToCapture => 'Toque em + para capturar os seus pensamentos';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Toque em + para capturar os seus pensamentos';

  @override
  String get deleteMemory => 'Eliminar memória';

  @override
  String get deleteRecord => 'Eliminar registo';

  @override
  String get thisEntryWillBeRemoved =>
      'Esta entrada será removida da sua linha do tempo.';

  @override
  String get thisRecordWillBeRemoved =>
      'Este registo será removido da sua linha do tempo.';

  @override
  String get searchYourRecords => 'Pesquisar nos seus registos...';

  @override
  String get exactMatches => 'Correspondências exatas';

  @override
  String get noExactMatches => 'Sem correspondências exatas';

  @override
  String get exact => 'Exato';

  @override
  String get exactMatch => 'Correspondência exata';

  @override
  String get fuzzyMatches => 'Correspondências aproximadas';

  @override
  String get noFuzzyMatches => 'Sem correspondências aproximadas';

  @override
  String get vectorMatch => 'Correspondência vetorial';

  @override
  String get networkMatches => 'Correspondências de rede';

  @override
  String get noNetworkMatches => 'Sem correspondências de rede';

  @override
  String get networkSearchIsOff =>
      'Pesquisa de rede está desativada. Ative-a nas Definições.';

  @override
  String get network => 'Rede';

  @override
  String get networkMatch => 'Correspondência de rede';

  @override
  String get noSearchHistory => 'Sem histórico de pesquisa';

  @override
  String get searchHistory => 'Histórico de pesquisa';

  @override
  String get invalidLink => 'Link inválido';

  @override
  String get unableToOpenWebPage => 'Incapaz de abrir página web';

  @override
  String get imageMemory => '[Memória de imagem]';

  @override
  String get tapToOpenWebPage => 'Toque para abrir página web';

  @override
  String get editEntry => 'Editar entrada';

  @override
  String get entryDetails => 'Detalhes da entrada';

  @override
  String get noContent => 'Sem conteúdo';

  @override
  String get diaryNotFound => 'Diário não encontrado';

  @override
  String get diaryNotFoundShort => 'Registo não encontrado';

  @override
  String get aiSummary => 'Resumo de IA';

  @override
  String get microphoneInterrupted =>
      'Microfone interrompido, gravação parada.';

  @override
  String get bold => 'Negrito';

  @override
  String get italic => 'Itálico';

  @override
  String get strikethrough => 'Rasurado';

  @override
  String get image => 'Imagem';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR indisponível. Gravação ainda ativa.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Escreva a sua entrada...';

  @override
  String get writeYourContent => 'Escreva o seu conteúdo...';

  @override
  String microphoneStartFailed(String error) {
    return 'Falha ao iniciar microfone: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Microfone interrompido, gravação parada.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR a reconectar: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Imagem inserida: $name';
  }

  @override
  String voiceError(String error) {
    return 'Erro de voz: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Desculpe, serviço de IA indisponível atualmente: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Falha ao partilhar: $error';
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
    return '$matchType · $count correspondências';
  }

  @override
  String matchCount(int count) {
    return 'Correspondência: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Fonte: $source';
  }

  @override
  String get createNew => 'Criar';

  @override
  String micStartFailed(String error) {
    return 'Falha ao iniciar microfone: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Contas: +$created / atualizadas $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Diários: +$created / atualizados $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Lembretes: +$created / atualizados $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Ignorados: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Total alterado: $count';
  }

  @override
  String get settingsApplied => 'As definições do backup foram aplicadas.';

  @override
  String get settingsNotApplied =>
      'As definições do backup não foram aplicadas.';

  @override
  String backupExported(String path) {
    return 'Backup exportado: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Falha ao exportar: $error';
  }

  @override
  String importFailed(String error) {
    return 'Falha ao importar: $error';
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

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get languageName => 'Português (Brasil)';

  @override
  String get languageNameEn => 'Portuguese (Brazil)';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Configuracoes';

  @override
  String get account => 'Conta';

  @override
  String get reminders => 'Lembretes';

  @override
  String get language => 'Idioma';

  @override
  String get appLanguage => 'Idioma do Aplicativo';

  @override
  String get appearance => 'Aparencia';

  @override
  String get themeMode => 'Modo de Tema';

  @override
  String get dark => 'Escuro';

  @override
  String get light => 'Claro';

  @override
  String get system => 'Sistema';

  @override
  String get aiService => 'Servico de IA';

  @override
  String get aiChatProvider => 'Provedor de Chat de IA';

  @override
  String get chatModel => 'Modelo de Chat';

  @override
  String get localModel => 'Modelo Local';

  @override
  String get localModelDefault => 'Modelo Local (Padrao)';

  @override
  String get ollamaEndpoint => 'Endpoint Ollama';

  @override
  String get ollamaModel => 'Modelo Ollama';

  @override
  String get openAiEndpoint => 'Endpoint OpenAI';

  @override
  String get openAiApiKey => 'Chave API OpenAI';

  @override
  String get openAiModel => 'Modelo OpenAI';

  @override
  String get geminiEndpoint => 'Endpoint Gemini';

  @override
  String get geminiApiKey => 'Chave API Gemini';

  @override
  String get geminiModel => 'Modelo Gemini';

  @override
  String get anthropicEndpoint => 'Endpoint Anthropic';

  @override
  String get anthropicApiKey => 'Chave API Anthropic';

  @override
  String get anthropicModel => 'Modelo Anthropic';

  @override
  String get customProtocol => 'Protocolo Personalizado';

  @override
  String get protocol => 'Protocolo';

  @override
  String get customEndpoint => 'Endpoint Personalizado';

  @override
  String get customApiKey => 'Chave API Personalizada';

  @override
  String get customModel => 'Modelo Personalizado';

  @override
  String get optionalForLocalServers =>
      'Opcional para servidores locais/personalizados';

  @override
  String get speechRecognitionEngine => 'Motor de Reconhecimento de Voz';

  @override
  String get local => 'Local';

  @override
  String get endpoint => 'Ponto final';

  @override
  String get localSpeechModel => 'Modelo de Voz Local';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (no dispositivo)';

  @override
  String get systemSpeechRecognition => 'Reconhecimento de Voz do Sistema';

  @override
  String get systemRecognitionAndroidIos =>
      'Reconhecimento do Sistema (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Reconhecimento por Endpoint (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Usar reconhecedor nativo do Android/iOS (pode usar cloud)';

  @override
  String get voiceAiEndpoint => 'Endpoint de Voz IA';

  @override
  String get embeddingModel => 'Modelo de Embedding';

  @override
  String get crossDeviceSync => 'Sincronizacao entre Dispositivos';

  @override
  String get sendToOtherDevices =>
      'Enviar para Outros Dispositivos (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Exportar backup e enviar via compartilhamento';

  @override
  String get importFromLocalSend => 'Importar do LocalSend';

  @override
  String get selectBackupJson =>
      'Selecionar JSON de backup e mesclar dados locais';

  @override
  String get autoGeneration => 'Geracao Automatica';

  @override
  String get autoGenerateSummary => 'Gerar Resumo Automaticamente';

  @override
  String get generateAiSummaryForNewEntries =>
      'Gerar resumo de IA para novas entradas';

  @override
  String get autoGenerateEmbedding => 'Gerar Embedding Automaticamente';

  @override
  String get generateVectorEmbedding => 'Gerar embedding vetorial para busca';

  @override
  String get enableNetworkSearch => 'Habilitar Busca na Rede';

  @override
  String get allowOnlineRetrieval =>
      'Permitir recuperacao online para busca e chat de IA (desligado por padrao)';

  @override
  String get about => 'Sobre';

  @override
  String version(String version) {
    return 'Versao $version';
  }

  @override
  String get database => 'Banco de Dados';

  @override
  String get objectBoxWithHnsw => 'ObjectBox com indice HNSW';

  @override
  String get logOut => 'Sair';

  @override
  String get custom => 'Personalizado';

  @override
  String get openAiCompatible => 'Compativel com OpenAI';

  @override
  String get notSet => 'Nao configurado';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... ou http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'Suporta endpoints locais/LAN/publicos';

  @override
  String get shiguangLocalSendBackup => 'Backup LocalSend do Shiguang';

  @override
  String get localBackupFromShiguang =>
      'Backup local do Shiguang (receber via LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Selecionar arquivo de backup recebido do LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Falha ao resolver o caminho do arquivo selecionado';

  @override
  String get importOptions => 'Opcoes de Importacao';

  @override
  String get importSettingsAsWell =>
      'Importar configuracoes tambem?\n(Chaves de API nao serao sobrescritas)';

  @override
  String get dataOnly => 'Somente Dados';

  @override
  String get dataAndSettings => 'Dados + Configuracoes';

  @override
  String get importCompleted => 'Importacao Concluida';

  @override
  String get settingsInBackupWereApplied =>
      'Configuracoes do backup foram aplicadas.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Configuracoes do backup nao foram aplicadas.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Salvar';

  @override
  String get delete => 'Excluir';

  @override
  String get clear => 'Limpar';

  @override
  String get add => 'Adicionar';

  @override
  String get create => 'Criar';

  @override
  String get edit => 'Editar';

  @override
  String get search => 'Buscar';

  @override
  String get areYouSureYouWantToLogOut => 'Tem certeza que deseja sair?';

  @override
  String get chooseLanguage => 'Escolher Idioma';

  @override
  String get databaseInfo => 'Informacoes do Banco de Dados';

  @override
  String get storage => 'Armazenamento: ObjectBox';

  @override
  String get vectorIndex => 'Indice Vetorial: HNSW';

  @override
  String get dimensions => 'Dimensoes: 384';

  @override
  String get embeddingModelBge => 'Modelo de Embedding: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Tirar Foto';

  @override
  String get chooseFromGallery => 'Escolher da Galeria';

  @override
  String get editNickname => 'Editar Apelido';

  @override
  String get enterNickname => 'Digite o apelido';

  @override
  String get pleaseEnterNickname => 'Por favor, digite um apelido';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Apelido ja existe ou e invalido';

  @override
  String get user => 'Usuario';

  @override
  String get manageScheduledReminders =>
      'Gerenciar lembretes e alarmes agendados';

  @override
  String get imageFailedToLoad =>
      'Falha ao carregar imagem. Por favor, escolha novamente.';

  @override
  String get imageIsStillLoading => 'Imagem ainda esta carregando';

  @override
  String get imageAreaNotReady =>
      'Area da imagem nao esta pronta. Por favor, tente novamente.';

  @override
  String get cropFrameNotReady =>
      'Moldura de corte nao esta pronta. Por favor, tente novamente.';

  @override
  String get invalidCropArea =>
      'Area de corte invalida. Por favor, tente novamente.';

  @override
  String get cropFailed => 'Falha ao cortar. Por favor, tente novamente.';

  @override
  String get cropAvatar => 'Cortar Avatar';

  @override
  String get chooseAgain => 'Escolher Novamente';

  @override
  String get rotate90 => 'Girar 90 graus';

  @override
  String get dragFrameToMove =>
      'Arraste a moldura para mover, arraste o canto inferior direito para redimensionar; belisce para zoom e mover a imagem.';

  @override
  String get pleaseFillInAllFields => 'Por favor, preencha todos os campos';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN deve ter pelo menos 4 digitos';

  @override
  String get pinAtLeast4Digits => 'PIN deve ter pelo menos 4 digitos';

  @override
  String get invalidUsernameOrPin => 'Nome de usuario ou PIN invalido';

  @override
  String get invalidUsernameOrPinError => 'Nome de usuario ou PIN invalido';

  @override
  String get usernameAlreadyExists => 'Nome de usuario ja existe';

  @override
  String get captureMomentsKeepMemories => 'Capture momentos, guarde memorias';

  @override
  String get username => 'Nome de usuario';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Entrar';

  @override
  String get createAccount => 'Criar Conta';

  @override
  String get dontHaveAccountCreateOne => 'Nao tem uma conta? Crie uma';

  @override
  String get alreadyHaveAccountLogin => 'Ja tem uma conta? Entre';

  @override
  String get pleaseEnterUsername => 'Por favor, digite o nome de usuario';

  @override
  String get pinsDoNotMatch => 'PINs nao coincidem';

  @override
  String get tapToAddAvatar => 'Toque para adicionar avatar';

  @override
  String get yourName => 'Seu Nome';

  @override
  String get privatePinOptional => 'PIN Privado (opcional)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Usado para criptografar registros privados';

  @override
  String get privatePin => 'PIN Privado';

  @override
  String get leaveEmptyForNoEncryption => 'Deixe vazio para sem criptografia';

  @override
  String get confirmPin => 'Confirmar PIN';

  @override
  String get getStarted => 'Comecar';

  @override
  String get noReminders => 'Sem lembretes';

  @override
  String get addReminder => 'Adicionar Lembrete';

  @override
  String get title => 'Titulo';

  @override
  String get descriptionOptional => 'Descricao (opcional)';

  @override
  String get microphonePermissionRequired =>
      'Permissao de microfone necessaria';

  @override
  String get aiAssistant => 'Assistente de IA';

  @override
  String get listening => 'Ouvindo...';

  @override
  String get typeAMessage => 'Digite uma mensagem...';

  @override
  String get aiChat => 'Chat de IA';

  @override
  String get startAConversation => 'Iniciar uma conversa';

  @override
  String get typeYourMessage => 'Digite sua mensagem...';

  @override
  String get asrReconnecting => 'ASR reconectando...';

  @override
  String get write => 'Escrever';

  @override
  String get writeEntry => 'Escrever Entrada';

  @override
  String get noMemoriesYet => 'Ainda sem memorias';

  @override
  String get tapPlusToCapture => 'Toque em + para capturar seus pensamentos';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Toque em + para capturar seus pensamentos';

  @override
  String get deleteMemory => 'Excluir Memoria';

  @override
  String get deleteRecord => 'Excluir Registro';

  @override
  String get thisEntryWillBeRemoved =>
      'Esta entrada sera removida da sua linha do tempo.';

  @override
  String get thisRecordWillBeRemoved =>
      'Este registro sera removido da sua linha do tempo.';

  @override
  String get searchYourRecords => 'Buscar seus registros...';

  @override
  String get exactMatches => 'Correspondencias Exatas';

  @override
  String get noExactMatches => 'Sem correspondencias exatas';

  @override
  String get exact => 'Exato';

  @override
  String get exactMatch => 'Correspondencia Exata';

  @override
  String get fuzzyMatches => 'Correspondencias Aproximadas';

  @override
  String get noFuzzyMatches => 'Sem correspondencias aproximadas';

  @override
  String get vectorMatch => 'Correspondencia Vetorial';

  @override
  String get networkMatches => 'Correspondencias de Rede';

  @override
  String get noNetworkMatches => 'Sem correspondencias de rede';

  @override
  String get networkSearchIsOff =>
      'Busca de rede esta desligada. Ative nas Configuracoes.';

  @override
  String get network => 'Rede';

  @override
  String get networkMatch => 'Correspondencia de Rede';

  @override
  String get noSearchHistory => 'Sem historico de busca';

  @override
  String get searchHistory => 'Historico de Busca';

  @override
  String get invalidLink => 'Link invalido';

  @override
  String get unableToOpenWebPage => 'Nao foi possivel abrir a pagina web';

  @override
  String get imageMemory => '[Memoria de imagem]';

  @override
  String get tapToOpenWebPage => 'Toque para abrir a pagina web';

  @override
  String get editEntry => 'Editar Entrada';

  @override
  String get entryDetails => 'Detalhes da Entrada';

  @override
  String get noContent => 'Sem conteudo';

  @override
  String get diaryNotFound => 'Diario nao encontrado';

  @override
  String get diaryNotFoundShort => 'Registro nao encontrado';

  @override
  String get aiSummary => 'Resumo de IA';

  @override
  String get microphoneInterrupted =>
      'Microfone interrompido, gravacao parada.';

  @override
  String get bold => 'Negrito';

  @override
  String get italic => 'Italico';

  @override
  String get strikethrough => 'Tachado';

  @override
  String get image => 'Imagem';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR indisponivel. Gravacao ainda esta ativa.';

  @override
  String get writeYourEntry => 'Escreva sua entrada...';

  @override
  String get writeYourContent => 'Escreva seu conteudo...';

  @override
  String microphoneStartFailed(String error) {
    return 'Falha ao iniciar microfone: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Microfone interrompido, gravacao parada.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR reconectando: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Imagem inserida: $name';
  }

  @override
  String voiceError(String error) {
    return 'Erro de voz: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Desculpe, servico de IA indisponivel no momento: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Falha ao compartilhar: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType - $count resultados';
  }

  @override
  String matchCount(int count) {
    return 'Correspondencia: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Fonte: $source';
  }

  @override
  String get createNew => 'Criar';

  @override
  String micStartFailed(String error) {
    return 'Falha ao iniciar microfone: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Contas: +$created / atualizados $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Diarios: +$created / atualizados $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Lembretes: +$created / atualizados $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Ignorados: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Total alterado: $count';
  }

  @override
  String get settingsApplied => 'Configuracoes do backup foram aplicadas.';

  @override
  String get settingsNotApplied =>
      'Configuracoes do backup nao foram aplicadas.';

  @override
  String backupExported(String path) {
    return 'Backup exportado: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Falha ao exportar: $error';
  }

  @override
  String importFailed(String error) {
    return 'Falha ao importar: $error';
  }
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get languageName => 'Português';

  @override
  String get languageNameEn => 'Portuguese';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Definições';

  @override
  String get account => 'Conta';

  @override
  String get reminders => 'Lembretes';

  @override
  String get language => 'Idioma';

  @override
  String get appLanguage => 'Idioma da aplicação';

  @override
  String get appearance => 'Aparência';

  @override
  String get themeMode => 'Modo de tema';

  @override
  String get dark => 'Escuro';

  @override
  String get light => 'Claro';

  @override
  String get system => 'Sistema';

  @override
  String get aiService => 'Serviço de IA';

  @override
  String get aiChatProvider => 'Fornecedor de chat de IA';

  @override
  String get chatModel => 'Modelo de chat';

  @override
  String get localModel => 'Modelo local';

  @override
  String get localModelDefault => 'Modelo local (predefinido)';

  @override
  String get ollamaEndpoint => 'Endpoint Ollama';

  @override
  String get ollamaModel => 'Modelo Ollama';

  @override
  String get openAiEndpoint => 'Endpoint OpenAI';

  @override
  String get openAiApiKey => 'Chave API OpenAI';

  @override
  String get openAiModel => 'Modelo OpenAI';

  @override
  String get geminiEndpoint => 'Endpoint Gemini';

  @override
  String get geminiApiKey => 'Chave API Gemini';

  @override
  String get geminiModel => 'Modelo Gemini';

  @override
  String get anthropicEndpoint => 'Endpoint Anthropic';

  @override
  String get anthropicApiKey => 'Chave API Anthropic';

  @override
  String get anthropicModel => 'Modelo Anthropic';

  @override
  String get customProtocol => 'Protocolo personalizado';

  @override
  String get protocol => 'Protocolo';

  @override
  String get customEndpoint => 'Endpoint personalizado';

  @override
  String get customApiKey => 'Chave API personalizada';

  @override
  String get customModel => 'Modelo personalizado';

  @override
  String get optionalForLocalServers =>
      'Opcional para servidores locais/personalizados';

  @override
  String get speechRecognitionEngine => 'Motor de reconhecimento de voz';

  @override
  String get local => 'Local';

  @override
  String get endpoint => 'Ponto final';

  @override
  String get localSpeechModel => 'Modelo de voz local';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (no dispositivo)';

  @override
  String get systemSpeechRecognition => 'Reconhecimento de voz do sistema';

  @override
  String get systemRecognitionAndroidIos =>
      'Reconhecimento do sistema (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Reconhecimento por endpoint (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Usar reconhecimento integrado do Android/iOS (pode usar a cloud)';

  @override
  String get voiceAiEndpoint => 'Endpoint de IA de voz';

  @override
  String get embeddingModel => 'Modelo de embedding';

  @override
  String get crossDeviceSync => 'Sincronização entre dispositivos';

  @override
  String get sendToOtherDevices =>
      'Enviar para outros dispositivos (LocalSend)';

  @override
  String get exportBackupAndSend => 'Exportar backup e enviar';

  @override
  String get importFromLocalSend => 'Importar do LocalSend';

  @override
  String get selectBackupJson =>
      'Selecionar JSON de backup e mesclar dados locais';

  @override
  String get autoGeneration => 'Geração automática';

  @override
  String get autoGenerateSummary => 'Gerar resumo automaticamente';

  @override
  String get generateAiSummaryForNewEntries =>
      'Gerar resumo de IA para novas entradas';

  @override
  String get autoGenerateEmbedding => 'Gerar embedding automaticamente';

  @override
  String get generateVectorEmbedding =>
      'Gerar embedding vetorial para pesquisa';

  @override
  String get enableNetworkSearch => 'Ativar pesquisa na rede';

  @override
  String get allowOnlineRetrieval =>
      'Permitir recuperação online para pesquisa e chat de IA (desativado por padrão)';

  @override
  String get about => 'Sobre';

  @override
  String version(String version) {
    return 'Versão $version';
  }

  @override
  String get database => 'Base de dados';

  @override
  String get objectBoxWithHnsw => 'ObjectBox com índice HNSW';

  @override
  String get logOut => 'Terminar sessão';

  @override
  String get custom => 'Personalizado';

  @override
  String get openAiCompatible => 'Compatível com OpenAI';

  @override
  String get notSet => 'Não definido';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... ou http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'Suporta endpoints locais/LAN/públicos';

  @override
  String get shiguangLocalSendBackup => 'Backup LocalSend do Shiguang';

  @override
  String get localBackupFromShiguang =>
      'Backup local do Shiguang (receber via LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Selecionar ficheiro de backup recebido do LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Falha ao resolver o caminho do ficheiro selecionado';

  @override
  String get importOptions => 'Opções de importação';

  @override
  String get importSettingsAsWell =>
      'Importar também definições?\n(As chaves API não serão sobrescritas)';

  @override
  String get dataOnly => 'Apenas dados';

  @override
  String get dataAndSettings => 'Dados + Definições';

  @override
  String get importCompleted => 'Importação concluída';

  @override
  String get settingsInBackupWereApplied =>
      'As definições do backup foram aplicadas.';

  @override
  String get settingsInBackupWereNotApplied =>
      'As definições do backup não foram aplicadas.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get delete => 'Eliminar';

  @override
  String get clear => 'Limpar';

  @override
  String get add => 'Adicionar';

  @override
  String get create => 'Criar';

  @override
  String get edit => 'Editar';

  @override
  String get search => 'Pesquisar';

  @override
  String get areYouSureYouWantToLogOut =>
      'Tem a certeza que deseja terminar sessão?';

  @override
  String get chooseLanguage => 'Escolher idioma';

  @override
  String get databaseInfo => 'Info da base de dados';

  @override
  String get storage => 'Armazenamento: ObjectBox';

  @override
  String get vectorIndex => 'Índice vetorial: HNSW';

  @override
  String get dimensions => 'Dimensões: 384';

  @override
  String get embeddingModelBge => 'Modelo de embedding: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Tirar foto';

  @override
  String get chooseFromGallery => 'Escolher da galeria';

  @override
  String get editNickname => 'Editar apelido';

  @override
  String get enterNickname => 'Inserir apelido';

  @override
  String get pleaseEnterNickname => 'Por favor insira um apelido';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'O apelido já existe ou é inválido';

  @override
  String get user => 'Utilizador';

  @override
  String get manageScheduledReminders =>
      'Gerir lembretes programados e alarmes';

  @override
  String get imageFailedToLoad =>
      'Falha ao carregar a imagem. Por favor escolha novamente.';

  @override
  String get imageIsStillLoading => 'A imagem ainda está a carregar';

  @override
  String get imageAreaNotReady =>
      'Área de imagem não pronta. Por favor tente novamente.';

  @override
  String get cropFrameNotReady =>
      'Moldura de corte não pronta. Por favor tente novamente.';

  @override
  String get invalidCropArea =>
      'Área de corte inválida. Por favor tente novamente.';

  @override
  String get cropFailed => 'Falha ao cortar. Por favor tente novamente.';

  @override
  String get cropAvatar => 'Cortar avatar';

  @override
  String get chooseAgain => 'Escolher novamente';

  @override
  String get rotate90 => 'Rodar 90°';

  @override
  String get dragFrameToMove =>
      'Arraste a moldura para mover, arraste o canto inferior direito para redimensionar; belisque para zoom e mover a imagem.';

  @override
  String get pleaseFillInAllFields => 'Por favor preencha todos os campos';

  @override
  String get pinMustBeAtLeast4Digits => 'O PIN deve ter pelo menos 4 dígitos';

  @override
  String get pinAtLeast4Digits => 'O PIN deve ter pelo menos 4 dígitos';

  @override
  String get invalidUsernameOrPin => 'Nome de utilizador ou PIN inválido';

  @override
  String get invalidUsernameOrPinError => 'Nome de utilizador ou PIN inválido';

  @override
  String get usernameAlreadyExists => 'O nome de utilizador já existe';

  @override
  String get captureMomentsKeepMemories => 'Capture momentos, guarde memórias';

  @override
  String get username => 'Nome de utilizador';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Iniciar sessão';

  @override
  String get createAccount => 'Criar conta';

  @override
  String get dontHaveAccountCreateOne => 'Não tem conta? Crie uma';

  @override
  String get alreadyHaveAccountLogin => 'Já tem conta? Inicie sessão';

  @override
  String get pleaseEnterUsername => 'Por favor insira um nome de utilizador';

  @override
  String get pinsDoNotMatch => 'Os PINs não coincidem';

  @override
  String get tapToAddAvatar => 'Toque para adicionar avatar';

  @override
  String get yourName => 'O seu nome';

  @override
  String get privatePinOptional => 'PIN privado (opcional)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Usado para encriptar registos privados';

  @override
  String get privatePin => 'PIN privado';

  @override
  String get leaveEmptyForNoEncryption => 'Deixe vazio para sem encriptação';

  @override
  String get confirmPin => 'Confirmar PIN';

  @override
  String get getStarted => 'Começar';

  @override
  String get noReminders => 'Sem lembretes';

  @override
  String get addReminder => 'Adicionar lembrete';

  @override
  String get title => 'Título';

  @override
  String get descriptionOptional => 'Descrição (opcional)';

  @override
  String get microphonePermissionRequired =>
      'Permissão de microfone necessária';

  @override
  String get aiAssistant => 'Assistente de IA';

  @override
  String get listening => 'A ouvir...';

  @override
  String get typeAMessage => 'Escreva uma mensagem...';

  @override
  String get aiChat => 'Chat de IA';

  @override
  String get startAConversation => 'Iniciar uma conversa';

  @override
  String get typeYourMessage => 'Escreva a sua mensagem...';

  @override
  String get asrReconnecting => 'ASR a reconectar...';

  @override
  String get write => 'Escrever';

  @override
  String get writeEntry => 'Escrever entrada';

  @override
  String get noMemoriesYet => 'Ainda sem memórias';

  @override
  String get tapPlusToCapture => 'Toque em + para capturar os seus pensamentos';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Toque em + para capturar os seus pensamentos';

  @override
  String get deleteMemory => 'Eliminar memória';

  @override
  String get deleteRecord => 'Eliminar registo';

  @override
  String get thisEntryWillBeRemoved =>
      'Esta entrada será removida da sua linha do tempo.';

  @override
  String get thisRecordWillBeRemoved =>
      'Este registo será removido da sua linha do tempo.';

  @override
  String get searchYourRecords => 'Pesquisar nos seus registos...';

  @override
  String get exactMatches => 'Correspondências exatas';

  @override
  String get noExactMatches => 'Sem correspondências exatas';

  @override
  String get exact => 'Exato';

  @override
  String get exactMatch => 'Correspondência exata';

  @override
  String get fuzzyMatches => 'Correspondências aproximadas';

  @override
  String get noFuzzyMatches => 'Sem correspondências aproximadas';

  @override
  String get vectorMatch => 'Correspondência vetorial';

  @override
  String get networkMatches => 'Correspondências de rede';

  @override
  String get noNetworkMatches => 'Sem correspondências de rede';

  @override
  String get networkSearchIsOff =>
      'Pesquisa de rede está desativada. Ative-a nas Definições.';

  @override
  String get network => 'Rede';

  @override
  String get networkMatch => 'Correspondência de rede';

  @override
  String get noSearchHistory => 'Sem histórico de pesquisa';

  @override
  String get searchHistory => 'Histórico de pesquisa';

  @override
  String get invalidLink => 'Link inválido';

  @override
  String get unableToOpenWebPage => 'Incapaz de abrir página web';

  @override
  String get imageMemory => '[Memória de imagem]';

  @override
  String get tapToOpenWebPage => 'Toque para abrir página web';

  @override
  String get editEntry => 'Editar entrada';

  @override
  String get entryDetails => 'Detalhes da entrada';

  @override
  String get noContent => 'Sem conteúdo';

  @override
  String get diaryNotFound => 'Diário não encontrado';

  @override
  String get diaryNotFoundShort => 'Registo não encontrado';

  @override
  String get aiSummary => 'Resumo de IA';

  @override
  String get microphoneInterrupted =>
      'Microfone interrompido, gravação parada.';

  @override
  String get bold => 'Negrito';

  @override
  String get italic => 'Itálico';

  @override
  String get strikethrough => 'Rasurado';

  @override
  String get image => 'Imagem';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR indisponível. Gravação ainda ativa.';

  @override
  String get writeYourEntry => 'Escreva a sua entrada...';

  @override
  String get writeYourContent => 'Escreva o seu conteúdo...';

  @override
  String microphoneStartFailed(String error) {
    return 'Falha ao iniciar microfone: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Microfone interrompido, gravação parada.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR a reconectar: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Imagem inserida: $name';
  }

  @override
  String voiceError(String error) {
    return 'Erro de voz: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Desculpe, serviço de IA indisponível atualmente: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Falha ao partilhar: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count correspondências';
  }

  @override
  String matchCount(int count) {
    return 'Correspondência: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Fonte: $source';
  }

  @override
  String get createNew => 'Criar';

  @override
  String micStartFailed(String error) {
    return 'Falha ao iniciar microfone: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Contas: +$created / atualizadas $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Diários: +$created / atualizados $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Lembretes: +$created / atualizados $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Ignorados: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Total alterado: $count';
  }

  @override
  String get settingsApplied => 'As definições do backup foram aplicadas.';

  @override
  String get settingsNotApplied =>
      'As definições do backup não foram aplicadas.';

  @override
  String backupExported(String path) {
    return 'Backup exportado: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Falha ao exportar: $error';
  }

  @override
  String importFailed(String error) {
    return 'Falha ao importar: $error';
  }
}

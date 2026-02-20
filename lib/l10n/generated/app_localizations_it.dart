// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get languageName => 'Italiano';

  @override
  String get languageNameEn => 'Italian';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Impostazioni';

  @override
  String get account => 'Account';

  @override
  String get reminders => 'Promemoria';

  @override
  String get language => 'Lingua';

  @override
  String get appLanguage => 'Lingua dell\'app';

  @override
  String get appearance => 'Aspetto';

  @override
  String get themeMode => 'Modalita\' tema';

  @override
  String get dark => 'Scuro';

  @override
  String get light => 'Chiaro';

  @override
  String get system => 'Sistema';

  @override
  String get aiService => 'Servizio AI';

  @override
  String get aiChatProvider => 'Provider di chat AI';

  @override
  String get chatModel => 'Modello di chat';

  @override
  String get localModel => 'Modello locale';

  @override
  String get localModelDefault => 'Modello locale (predefinito)';

  @override
  String get ollamaEndpoint => 'Endpoint Ollama';

  @override
  String get ollamaModel => 'Modello Ollama';

  @override
  String get openAiEndpoint => 'Endpoint OpenAI';

  @override
  String get openAiApiKey => 'Chiave API OpenAI';

  @override
  String get openAiModel => 'Modello OpenAI';

  @override
  String get geminiEndpoint => 'Endpoint Gemini';

  @override
  String get geminiApiKey => 'Chiave API Gemini';

  @override
  String get geminiModel => 'Modello Gemini';

  @override
  String get anthropicEndpoint => 'Endpoint Anthropic';

  @override
  String get anthropicApiKey => 'Chiave API Anthropic';

  @override
  String get anthropicModel => 'Modello Anthropic';

  @override
  String get customProtocol => 'Protocollo personalizzato';

  @override
  String get protocol => 'Protocollo';

  @override
  String get customEndpoint => 'Endpoint personalizzato';

  @override
  String get customApiKey => 'Chiave API personalizzata';

  @override
  String get customModel => 'Modello personalizzato';

  @override
  String get optionalForLocalServers =>
      'Opzionale per server locali/personalizzati';

  @override
  String get speechRecognitionEngine => 'Motore di riconoscimento vocale';

  @override
  String get local => 'Locale';

  @override
  String get endpoint => 'Punto finale';

  @override
  String get localSpeechModel => 'Modello vocale locale';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (sul dispositivo)';

  @override
  String get systemSpeechRecognition => 'Riconoscimento vocale di sistema';

  @override
  String get systemRecognitionAndroidIos =>
      'Riconoscimento di sistema (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Riconoscimento endpoint (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Usa il riconoscitore integrato di Android/iOS (puo\' usare il cloud)';

  @override
  String get voiceAiEndpoint => 'Endpoint Voice AI';

  @override
  String get embeddingModel => 'Modello di embedding';

  @override
  String get crossDeviceSync => 'Sincronizzazione tra dispositivi';

  @override
  String get sendToOtherDevices => 'Invia ad altri dispositivi (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Esporta backup e invia tramite foglio di condivisione';

  @override
  String get importFromLocalSend => 'Importa da LocalSend';

  @override
  String get selectBackupJson => 'Seleziona backup JSON e unisci dati locali';

  @override
  String get autoGeneration => 'Generazione automatica';

  @override
  String get autoGenerateSummary => 'Genera riepilogo automaticamente';

  @override
  String get generateAiSummaryForNewEntries =>
      'Genera riepilogo AI per nuove voci';

  @override
  String get autoGenerateEmbedding => 'Genera embedding automaticamente';

  @override
  String get generateVectorEmbedding =>
      'Genera embedding vettoriale per la ricerca';

  @override
  String get enableNetworkSearch => 'Abilita ricerca di rete';

  @override
  String get allowOnlineRetrieval =>
      'Consenti recupero online per ricerca e chat AI (disattivato per impostazione predefinita)';

  @override
  String get about => 'Info';

  @override
  String version(String version) {
    return 'Versione $version';
  }

  @override
  String get database => 'Banca dati';

  @override
  String get objectBoxWithHnsw => 'ObjectBox con indice HNSW';

  @override
  String get logOut => 'Esci';

  @override
  String get custom => 'Personalizzato';

  @override
  String get openAiCompatible => 'Compatibile con OpenAI';

  @override
  String get notSet => 'Non impostato';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... oppure http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic => 'Supporta endpoint locali/LAN/pubblici';

  @override
  String get shiguangLocalSendBackup => 'Backup Shiguang LocalSend';

  @override
  String get localBackupFromShiguang =>
      'Backup locale da Shiguang (ricevi tramite LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Seleziona file di backup ricevuto da LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Impossibile risolvere il percorso del file selezionato';

  @override
  String get importOptions => 'Opzioni di importazione';

  @override
  String get importSettingsAsWell =>
      'Importare anche le impostazioni?\n(Le chiavi API non verranno sovrascritte)';

  @override
  String get dataOnly => 'Solo dati';

  @override
  String get dataAndSettings => 'Dati + Impostazioni';

  @override
  String get importCompleted => 'Importazione completata';

  @override
  String get settingsInBackupWereApplied =>
      'Le impostazioni nel backup sono state applicate.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Le impostazioni nel backup non sono state applicate.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Annulla';

  @override
  String get save => 'Salva';

  @override
  String get delete => 'Elimina';

  @override
  String get clear => 'Cancella';

  @override
  String get add => 'Aggiungi';

  @override
  String get create => 'Crea';

  @override
  String get edit => 'Modifica';

  @override
  String get search => 'Cerca';

  @override
  String get areYouSureYouWantToLogOut => 'Sei sicuro di voler uscire?';

  @override
  String get chooseLanguage => 'Scegli lingua';

  @override
  String get databaseInfo => 'Info database';

  @override
  String get storage => 'Archiviazione: ObjectBox';

  @override
  String get vectorIndex => 'Indice vettoriale: HNSW';

  @override
  String get dimensions => 'Dimensioni: 384';

  @override
  String get embeddingModelBge => 'Modello embedding: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Scatta foto';

  @override
  String get chooseFromGallery => 'Scegli dalla galleria';

  @override
  String get editNickname => 'Modifica soprannome';

  @override
  String get enterNickname => 'Inserisci soprannome';

  @override
  String get pleaseEnterNickname => 'Per favore inserisci un soprannome';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Il soprannome esiste gia\' o non e\' valido';

  @override
  String get user => 'Utente';

  @override
  String get manageScheduledReminders =>
      'Gestisci promemoria programmati e sveglie';

  @override
  String get imageFailedToLoad =>
      'Caricamento immagine fallito. Per favore scegli di nuovo.';

  @override
  String get imageIsStillLoading => 'L\'immagine sta ancora caricando';

  @override
  String get imageAreaNotReady =>
      'L\'area immagine non e\' pronta. Per favore riprova.';

  @override
  String get cropFrameNotReady =>
      'La cornice di ritaglio non e\' pronta. Per favore riprova.';

  @override
  String get invalidCropArea =>
      'Area di ritaglio non valida. Per favore riprova.';

  @override
  String get cropFailed => 'Ritaglio fallito. Per favore riprova.';

  @override
  String get cropAvatar => 'Ritaglia avatar';

  @override
  String get chooseAgain => 'Scegli di nuovo';

  @override
  String get rotate90 => 'Ruota 90°';

  @override
  String get dragFrameToMove =>
      'Trascina la cornice per spostare, trascina in basso a destra per ridimensionare; pizzica per zoomare e spostare l\'immagine.';

  @override
  String get pleaseFillInAllFields => 'Per favore compila tutti i campi';

  @override
  String get pinMustBeAtLeast4Digits => 'Il PIN deve essere di almeno 4 cifre';

  @override
  String get pinAtLeast4Digits => 'Il PIN deve essere di almeno 4 cifre';

  @override
  String get invalidUsernameOrPin => 'Nome utente o PIN non valido';

  @override
  String get invalidUsernameOrPinError => 'Nome utente o PIN non valido';

  @override
  String get usernameAlreadyExists => 'Il nome utente esiste gia\'';

  @override
  String get captureMomentsKeepMemories =>
      ' Cattura i momenti, conserva i ricordi';

  @override
  String get username => 'Nome utente';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Accedi';

  @override
  String get createAccount => 'Crea account';

  @override
  String get dontHaveAccountCreateOne => 'Non hai un account? Creane uno';

  @override
  String get alreadyHaveAccountLogin => 'Hai gia\' un account? Accedi';

  @override
  String get pleaseEnterUsername => 'Per favore inserisci un nome utente';

  @override
  String get pinsDoNotMatch => 'I PIN non corrispondono';

  @override
  String get tapToAddAvatar => 'Tocca per aggiungere avatar';

  @override
  String get yourName => 'Il tuo nome';

  @override
  String get privatePinOptional => 'PIN privato (opzionale)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Usato per crittografare i record privati';

  @override
  String get privatePin => 'PIN privato';

  @override
  String get leaveEmptyForNoEncryption =>
      'Lascia vuoto per nessuna crittografia';

  @override
  String get confirmPin => 'Conferma PIN';

  @override
  String get getStarted => 'Inizia';

  @override
  String get noReminders => 'Nessun promemoria';

  @override
  String get addReminder => 'Aggiungi promemoria';

  @override
  String get title => 'Titolo';

  @override
  String get descriptionOptional => 'Descrizione (opzionale)';

  @override
  String get microphonePermissionRequired =>
      'E\' richiesta l\'autorizzazione del microfono';

  @override
  String get aiAssistant => 'Assistente AI';

  @override
  String get listening => 'Ascoltando...';

  @override
  String get typeAMessage => 'Scrivi un messaggio...';

  @override
  String get aiChat => 'Chat AI';

  @override
  String get startAConversation => 'Inizia una conversazione';

  @override
  String get typeYourMessage => 'Scrivi il tuo messaggio...';

  @override
  String get asrReconnecting => 'ASR riconnessione...';

  @override
  String get write => 'Scrivi';

  @override
  String get writeEntry => 'Scrivi voce';

  @override
  String get noMemoriesYet => 'Nessun ricordo ancora';

  @override
  String get tapPlusToCapture => 'Tocca + per catturare i tuoi pensieri';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Tocca + per catturare i tuoi pensieri';

  @override
  String get deleteMemory => 'Elimina ricordo';

  @override
  String get deleteRecord => 'Elimina record';

  @override
  String get thisEntryWillBeRemoved =>
      'Questa voce sara\' rimossa dalla tua timeline.';

  @override
  String get thisRecordWillBeRemoved =>
      'Questo record sara\' rimosso dalla tua timeline.';

  @override
  String get searchYourRecords => 'Cerca nei tuoi record...';

  @override
  String get exactMatches => 'Corrispondenze esatte';

  @override
  String get noExactMatches => 'Nessuna corrispondenza esatta';

  @override
  String get exact => 'Esatto';

  @override
  String get exactMatch => 'Corrispondenza esatta';

  @override
  String get fuzzyMatches => 'Corrispondenze approssimative';

  @override
  String get noFuzzyMatches => 'Nessuna corrispondenza approssimativa';

  @override
  String get vectorMatch => 'Corrispondenza vettoriale';

  @override
  String get networkMatches => 'Corrispondenze di rete';

  @override
  String get noNetworkMatches => 'Nessuna corrispondenza di rete';

  @override
  String get networkSearchIsOff =>
      'La ricerca di rete e\' disattivata. Abilitala nelle Impostazioni.';

  @override
  String get network => 'Rete';

  @override
  String get networkMatch => 'Corrispondenza di rete';

  @override
  String get noSearchHistory => 'Nessuna cronologia ricerche';

  @override
  String get searchHistory => 'Cronologia ricerche';

  @override
  String get invalidLink => 'Link non valido';

  @override
  String get unableToOpenWebPage => 'Impossibile aprire la pagina web';

  @override
  String get imageMemory => '[Ricordo immagine]';

  @override
  String get tapToOpenWebPage => 'Tocca per aprire la pagina web';

  @override
  String get editEntry => 'Modifica voce';

  @override
  String get entryDetails => 'Dettagli voce';

  @override
  String get noContent => 'Nessun contenuto';

  @override
  String get diaryNotFound => 'Diario non trovato';

  @override
  String get diaryNotFoundShort => 'Record non trovato';

  @override
  String get aiSummary => 'Riepilogo AI';

  @override
  String get microphoneInterrupted =>
      'Microfono interrotto, registrazione terminata.';

  @override
  String get bold => 'Grassetto';

  @override
  String get italic => 'Corsivo';

  @override
  String get strikethrough => 'Barrato';

  @override
  String get image => 'Immagine';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR non disponibile. La registrazione e\' ancora attiva.';

  @override
  String get writeYourEntry => 'Scrivi la tua voce...';

  @override
  String get writeYourContent => 'Scrivi il tuo contenuto...';

  @override
  String microphoneStartFailed(String error) {
    return 'Avvio microfono fallito: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Microfono interrotto, registrazione terminata.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR riconnessione: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Immagine inserita: $name';
  }

  @override
  String voiceError(String error) {
    return 'Errore vocale: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Spiacenti, il servizio AI non e\' attualmente disponibile: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Condivisione fallita: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count risultati';
  }

  @override
  String matchCount(int count) {
    return 'Corrispondenza: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Fonte: $source';
  }

  @override
  String get createNew => 'Crea';

  @override
  String micStartFailed(String error) {
    return 'Avvio microfono fallito: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Account: +$created / aggiornati $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Diari: +$created / aggiornati $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Promemoria: +$created / aggiornati $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Saltati: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Totale modificati: $count';
  }

  @override
  String get settingsApplied =>
      'Le impostazioni nel backup sono state applicate.';

  @override
  String get settingsNotApplied =>
      'Le impostazioni nel backup non sono state applicate.';

  @override
  String backupExported(String path) {
    return 'Backup esportato: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Esportazione fallita: $error';
  }

  @override
  String importFailed(String error) {
    return 'Importazione fallita: $error';
  }
}

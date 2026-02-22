// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get languageName => 'Français';

  @override
  String get languageNameEn => 'French';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Paramètres';

  @override
  String get account => 'Compte';

  @override
  String get reminders => 'Rappels';

  @override
  String get language => 'Langue';

  @override
  String get appLanguage => 'Langue de l\'application';

  @override
  String get appearance => 'Apparence';

  @override
  String get themeMode => 'Mode thème';

  @override
  String get dark => 'Sombre';

  @override
  String get light => 'Clair';

  @override
  String get system => 'Système';

  @override
  String get aiService => 'Service IA';

  @override
  String get aiChatProvider => 'Fournisseur de chat IA';

  @override
  String get chatModel => 'Modèle de chat';

  @override
  String get localModel => 'Modèle local';

  @override
  String get localModelDefault => 'Modèle local (par défaut)';

  @override
  String get ollamaEndpoint => 'Point de terminaison Ollama';

  @override
  String get ollamaModel => 'Modèle Ollama';

  @override
  String get openAiEndpoint => 'Point de terminaison OpenAI';

  @override
  String get openAiApiKey => 'Clé API OpenAI';

  @override
  String get openAiModel => 'Modèle OpenAI';

  @override
  String get geminiEndpoint => 'Point de terminaison Gemini';

  @override
  String get geminiApiKey => 'Clé API Gemini';

  @override
  String get geminiModel => 'Modèle Gemini';

  @override
  String get anthropicEndpoint => 'Point de terminaison Anthropic';

  @override
  String get anthropicApiKey => 'Clé API Anthropic';

  @override
  String get anthropicModel => 'Modèle Anthropic';

  @override
  String get customProtocol => 'Protocole personnalisé';

  @override
  String get protocol => 'Protocole';

  @override
  String get customEndpoint => 'Point de terminaison personnalisé';

  @override
  String get customApiKey => 'Clé API personnalisée';

  @override
  String get customModel => 'Modèle personnalisé';

  @override
  String get optionalForLocalServers =>
      'Optionnel pour serveurs locaux/personnalisés';

  @override
  String get speechRecognitionEngine => 'Moteur de reconnaissance vocale';

  @override
  String get local => 'Locale';

  @override
  String get endpoint => 'Point de terminaison';

  @override
  String get localSpeechModel => 'Modèle vocal local';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (sur appareil)';

  @override
  String get systemSpeechRecognition => 'Reconnaissance vocale système';

  @override
  String get systemRecognitionAndroidIos =>
      'Reconnaissance système (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Reconnaissance par point de terminaison (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Utiliser la reconnaissance intégrée Android/iOS (peut utiliser le cloud)';

  @override
  String get voiceAiEndpoint => 'Point de terminaison IA vocale';

  @override
  String get embeddingModel => 'Modèle d\'embedding';

  @override
  String get crossDeviceSync => 'Synchronisation inter-appareils';

  @override
  String get sendToOtherDevices =>
      'Envoyer vers d\'autres appareils (LocalSend)';

  @override
  String get exportBackupAndSend => 'Exporter la sauvegarde et envoyer';

  @override
  String get importFromLocalSend => 'Importer depuis LocalSend';

  @override
  String get selectBackupJson =>
      'Sélectionner JSON de sauvegarde et fusionner les données locales';

  @override
  String get autoGeneration => 'Génération automatique';

  @override
  String get autoGenerateSummary => 'Générer automatiquement le résumé';

  @override
  String get generateAiSummaryForNewEntries =>
      'Générer un résumé IA pour les nouvelles entrées';

  @override
  String get autoGenerateEmbedding => 'Générer automatiquement l\'embedding';

  @override
  String get generateVectorEmbedding =>
      'Générer un embedding vectoriel pour la recherche';

  @override
  String get enableNetworkSearch => 'Activer la recherche réseau';

  @override
  String get allowOnlineRetrieval =>
      'Permettre la récupération en ligne pour la recherche et le chat IA (désactivé par défaut)';

  @override
  String get about => 'À propos';

  @override
  String version(String version) {
    return 'Version$version';
  }

  @override
  String get database => 'Base de données';

  @override
  String get objectBoxWithHnsw => 'ObjectBox avec index HNSW';

  @override
  String get logOut => 'Déconnexion';

  @override
  String get custom => 'Personnalisé';

  @override
  String get openAiCompatible => 'Compatible OpenAI';

  @override
  String get notSet => 'Non défini';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... ou http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Supporte les points de terminaison locaux/LAN/publics';

  @override
  String get shiguangLocalSendBackup => 'Sauvegarde Shiguang LocalSend';

  @override
  String get localBackupFromShiguang =>
      'Sauvegarde locale de Shiguang (recevoir via LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Sélectionner le fichier de sauvegarde reçu de LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Échec de la résolution du chemin du fichier sélectionné';

  @override
  String get importOptions => 'Options d\'importation';

  @override
  String get importSettingsAsWell =>
      'Importer également les paramètres?\n(Les clés API ne seront pas écrasées)';

  @override
  String get dataOnly => 'Données uniquement';

  @override
  String get dataAndSettings => 'Données + Paramètres';

  @override
  String get importCompleted => 'Importation terminée';

  @override
  String get settingsInBackupWereApplied =>
      'Les paramètres de la sauvegarde ont été appliqués.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Les paramètres de la sauvegarde n\'ont pas été appliqués.';

  @override
  String get ok => 'D\'ACCORD';

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Enregistrer';

  @override
  String get delete => 'Supprimer';

  @override
  String get clear => 'Effacer';

  @override
  String get add => 'Ajouter';

  @override
  String get create => 'Créer';

  @override
  String get edit => 'Modifier';

  @override
  String get search => 'Rechercher';

  @override
  String get areYouSureYouWantToLogOut =>
      'Êtes-vous sûr de vouloir vous déconnecter?';

  @override
  String get chooseLanguage => 'Choisir la langue';

  @override
  String get databaseInfo => 'Info base de données';

  @override
  String get storage => 'Stockage: ObjectBox';

  @override
  String get vectorIndex => 'Index vectoriel: HNSW';

  @override
  String get dimensions => 'Dimensions : 384';

  @override
  String get embeddingModelBge => 'Modèle d\'embedding: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get chooseFromGallery => 'Choisir dans la galerie';

  @override
  String get editNickname => 'Modifier le pseudo';

  @override
  String get enterNickname => 'Entrer un pseudo';

  @override
  String get pleaseEnterNickname => 'Veuillez entrer un pseudo';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Le pseudo existe déjà ou est invalide';

  @override
  String get user => 'Utilisateur';

  @override
  String get manageScheduledReminders =>
      'Gérer les rappels planifiés et les alarmes';

  @override
  String get imageFailedToLoad =>
      'Échec du chargement de l\'image. Veuillez choisir à nouveau.';

  @override
  String get imageIsStillLoading =>
      'L\'image est toujours en cours de chargement';

  @override
  String get imageAreaNotReady =>
      'La zone d\'image n\'est pas prête. Veuillez réessayer.';

  @override
  String get cropFrameNotReady =>
      'Le cadre de recadrage n\'est pas prêt. Veuillez réessayer.';

  @override
  String get invalidCropArea =>
      'Zone de recadrage invalide. Veuillez réessayer.';

  @override
  String get cropFailed => 'Échec du recadrage. Veuillez réessayer.';

  @override
  String get cropAvatar => 'Recadrer l\'avatar';

  @override
  String get chooseAgain => 'Choisir à nouveau';

  @override
  String get rotate90 => 'Rotation 90°';

  @override
  String get dragFrameToMove =>
      'Faites glisser le cadre pour le déplacer, faites glisser le coin inférieur droit pour redimensionner; pincer pour zoomer et déplacer l\'image.';

  @override
  String get pleaseFillInAllFields => 'Veuillez remplir tous les champs';

  @override
  String get pinMustBeAtLeast4Digits =>
      'Le PIN doit comporter au moins 4 chiffres';

  @override
  String get pinAtLeast4Digits => 'Le PIN doit comporter au moins 4 chiffres';

  @override
  String get invalidUsernameOrPin => 'Nom d\'utilisateur ou PIN invalide';

  @override
  String get invalidUsernameOrPinError => 'Nom d\'utilisateur ou PIN invalide';

  @override
  String get usernameAlreadyExists => 'Le nom d\'utilisateur existe déjà';

  @override
  String get captureMomentsKeepMemories =>
      'Capturez des moments, gardez des souvenirs';

  @override
  String get username => 'Nom d\'utilisateur';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Connexion';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get dontHaveAccountCreateOne => 'Pas de compte? Créez-en un';

  @override
  String get alreadyHaveAccountLogin => 'Déjà un compte? Connectez-vous';

  @override
  String get pleaseEnterUsername => 'Veuillez entrer un nom d\'utilisateur';

  @override
  String get pinsDoNotMatch => 'Les PIN ne correspondent pas';

  @override
  String get tapToAddAvatar => 'Appuyez pour ajouter un avatar';

  @override
  String get yourName => 'Votre nom';

  @override
  String get privatePinOptional => 'PIN privé (optionnel)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Utilisé pour chiffrer les enregistrements privés';

  @override
  String get privatePin => 'PIN privé';

  @override
  String get leaveEmptyForNoEncryption => 'Laisser vide pour aucun chiffrement';

  @override
  String get confirmPin => 'Confirmer le PIN';

  @override
  String get getStarted => 'Commencer';

  @override
  String get noReminders => 'Aucun rappel';

  @override
  String get addReminder => 'Ajouter un rappel';

  @override
  String get title => 'Titre';

  @override
  String get descriptionOptional => 'Description (optionnel)';

  @override
  String get microphonePermissionRequired =>
      'Autorisation du microphone requise';

  @override
  String get aiAssistant => 'Assistant IA';

  @override
  String get listening => 'Écoute en cours...';

  @override
  String get typeAMessage => 'Tapez un message...';

  @override
  String get aiChat => 'Chat IA';

  @override
  String get startAConversation => 'Commencer une conversation';

  @override
  String get typeYourMessage => 'Tapez votre message...';

  @override
  String get asrReconnecting => 'ASR en cours de reconnexion...';

  @override
  String get write => 'Écrire';

  @override
  String get writeEntry => 'Écrire une entrée';

  @override
  String get noMemoriesYet => 'Pas encore de souvenirs';

  @override
  String get tapPlusToCapture => 'Appuyez sur + pour capturer vos pensées';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Appuyez sur + pour capturer vos pensées';

  @override
  String get deleteMemory => 'Supprimer le souvenir';

  @override
  String get deleteRecord => 'Supprimer l\'enregistrement';

  @override
  String get thisEntryWillBeRemoved =>
      'Cette entrée sera supprimée de votre chronologie.';

  @override
  String get thisRecordWillBeRemoved =>
      'Cet enregistrement sera supprimé de votre chronologie.';

  @override
  String get searchYourRecords => 'Rechercher dans vos enregistrements...';

  @override
  String get exactMatches => 'Correspondances exactes';

  @override
  String get noExactMatches => 'Aucune correspondance exacte';

  @override
  String get exact => 'Exact';

  @override
  String get exactMatch => 'Correspondance exacte';

  @override
  String get fuzzyMatches => 'Correspondances approximatives';

  @override
  String get noFuzzyMatches => 'Aucune correspondance approximative';

  @override
  String get vectorMatch => 'Correspondance vectorielle';

  @override
  String get networkMatches => 'Correspondances réseau';

  @override
  String get noNetworkMatches => 'Aucune correspondance réseau';

  @override
  String get networkSearchIsOff =>
      'La recherche réseau est désactivée. Activez-la dans les Paramètres.';

  @override
  String get network => 'Réseau';

  @override
  String get networkMatch => 'Correspondance réseau';

  @override
  String get noSearchHistory => 'Aucun historique de recherche';

  @override
  String get searchHistory => 'Historique de recherche';

  @override
  String get invalidLink => 'Lien invalide';

  @override
  String get unableToOpenWebPage => 'Impossible d\'ouvrir la page web';

  @override
  String get imageMemory => '[Mémoire d\'image]';

  @override
  String get tapToOpenWebPage => 'Appuyez pour ouvrir la page web';

  @override
  String get editEntry => 'Modifier l\'entrée';

  @override
  String get entryDetails => 'Détails de l\'entrée';

  @override
  String get noContent => 'Aucun contenu';

  @override
  String get diaryNotFound => 'Journal introuvable';

  @override
  String get diaryNotFoundShort => 'Enregistrement introuvable';

  @override
  String get aiSummary => 'Résumé IA';

  @override
  String get microphoneInterrupted =>
      'Microphone interrompu, enregistrement arrêté.';

  @override
  String get bold => 'Gras';

  @override
  String get italic => 'Italique';

  @override
  String get strikethrough => 'Barré';

  @override
  String get image => 'Image';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR indisponible. L\'enregistrement est toujours actif.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Écrivez votre entrée...';

  @override
  String get writeYourContent => 'Écrivez votre contenu...';

  @override
  String microphoneStartFailed(String error) {
    return 'Échec du démarrage du microphone: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Microphone interrompu, enregistrement arrêté.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR en cours de reconnexion: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Image insérée: $name';
  }

  @override
  String voiceError(String error) {
    return 'Erreur vocale: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Désolé, le service IA est actuellement indisponible: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Échec du partage: $error';
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
    return '$matchType · $count correspondances';
  }

  @override
  String matchCount(int count) {
    return 'Correspondance: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Source:$source';
  }

  @override
  String get createNew => 'Créer';

  @override
  String micStartFailed(String error) {
    return 'Échec du démarrage du microphone: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Comptes: +$created / mis à jour $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Journaux: +$created / mis à jour $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Rappels: +$created / mis à jour $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Ignorés: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Total modifié: $count';
  }

  @override
  String get settingsApplied =>
      'Les paramètres de la sauvegarde ont été appliqués.';

  @override
  String get settingsNotApplied =>
      'Les paramètres de la sauvegarde n\'ont pas été appliqués.';

  @override
  String backupExported(String path) {
    return 'Sauvegarde exportée: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Échec de l\'exportation: $error';
  }

  @override
  String importFailed(String error) {
    return 'Échec de l\'importation: $error';
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

/// The translations for French, as used in Canada (`fr_CA`).
class AppLocalizationsFrCa extends AppLocalizationsFr {
  AppLocalizationsFrCa() : super('fr_CA');

  @override
  String get languageName => 'Français (Canada)';

  @override
  String get languageNameEn => 'French (Canada)';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Paramètres';

  @override
  String get account => 'Compte';

  @override
  String get reminders => 'Rappels';

  @override
  String get language => 'Langue';

  @override
  String get appLanguage => 'Langue de l\'application';

  @override
  String get appearance => 'Apparence';

  @override
  String get themeMode => 'Mode Thème';

  @override
  String get dark => 'Sombre';

  @override
  String get light => 'Lumière';

  @override
  String get system => 'Système';

  @override
  String get aiService => 'AI Service';

  @override
  String get aiChatProvider => 'AI Chat Provider';

  @override
  String get chatModel => 'Modèle de discussion';

  @override
  String get localModel => 'Modèle local';

  @override
  String get localModelDefault => 'Modèle local (par défaut)';

  @override
  String get ollamaEndpoint => 'Point de terminaison Ollama';

  @override
  String get ollamaModel => 'Modèle Ollama';

  @override
  String get openAiEndpoint => 'Point de terminaison OpenAI';

  @override
  String get openAiApiKey => 'Clé API OpenAI';

  @override
  String get openAiModel => 'Modèle OpenAI';

  @override
  String get geminiEndpoint => 'Point de terminaison Gémeaux';

  @override
  String get geminiApiKey => 'Clé API Gémeaux';

  @override
  String get geminiModel => 'Modèles Gémeaux';

  @override
  String get anthropicEndpoint => 'Point final anthropique';

  @override
  String get anthropicApiKey => 'Clé API anthropique';

  @override
  String get anthropicModel => 'Modèle anthropique';

  @override
  String get customProtocol => 'Protocole personnalisé';

  @override
  String get protocol => 'Protocole';

  @override
  String get customEndpoint => 'Point de terminaison personnalisé';

  @override
  String get customApiKey => 'Clé API personnalisée';

  @override
  String get customModel => 'Modèle personnalisé';

  @override
  String get optionalForLocalServers =>
      'Facultatif pour les serveurs locaux/personnalisés';

  @override
  String get speechRecognitionEngine => 'Moteur de reconnaissance vocale';

  @override
  String get local => 'Locale';

  @override
  String get endpoint => 'Point de terminaison';

  @override
  String get localSpeechModel => 'Modèle de discours local';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (sur l\'appareil)';

  @override
  String get systemSpeechRecognition => 'Système de reconnaissance vocale';

  @override
  String get systemRecognitionAndroidIos =>
      'Reconnaissance du système (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Reconnaissance des points de terminaison (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Utiliser le système de reconnaissance Android/iOS intégré (peut utiliser le cloud)';

  @override
  String get voiceAiEndpoint => 'Voice AI Endpoint';

  @override
  String get embeddingModel => 'Modèle d\'intégration';

  @override
  String get crossDeviceSync => 'Synchronisation multi-appareils';

  @override
  String get sendToOtherDevices =>
      'Envoyer vers d\'autres appareils (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Exporter la sauvegarde et l\'envoyer via une feuille de partage';

  @override
  String get importFromLocalSend => 'Importer depuis LocalSend';

  @override
  String get selectBackupJson =>
      'Sélectionnez la sauvegarde JSON et fusionnez les données locales';

  @override
  String get autoGeneration => 'Génération automatique';

  @override
  String get autoGenerateSummary => 'Générer automatiquement un résumé';

  @override
  String get generateAiSummaryForNewEntries =>
      'Générer un résumé IA pour les nouvelles entrées';

  @override
  String get autoGenerateEmbedding => 'Générer automatiquement l\'intégration';

  @override
  String get generateVectorEmbedding =>
      'Générer une intégration vectorielle pour la recherche';

  @override
  String get enableNetworkSearch => 'Activer la recherche sur le réseau';

  @override
  String get allowOnlineRetrieval =>
      'Autoriser la récupération en ligne pour la recherche et le chat AI (désactivé par défaut)';

  @override
  String get about => 'À propos';

  @override
  String version(String version) {
    return 'Version $version';
  }

  @override
  String get database => 'Base de données';

  @override
  String get objectBoxWithHnsw => 'ObjectBox avec index HNSW';

  @override
  String get logOut => 'Se déconnecter';

  @override
  String get custom => 'Coutume';

  @override
  String get openAiCompatible => 'Compatible avec OpenAI';

  @override
  String get notSet => 'Non défini';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Prend en charge les points de terminaison locaux/LAN/publics';

  @override
  String get shiguangLocalSendBackup => 'Sauvegarde Shiguang LocalSend';

  @override
  String get localBackupFromShiguang =>
      'Sauvegarde locale depuis Shiguang (recevoir via LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Sélectionnez le fichier de sauvegarde reçu de LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Échec de la résolution du chemin du fichier sélectionné';

  @override
  String get importOptions => 'Options d\'importation';

  @override
  String get importSettingsAsWell =>
      'Importer également les paramètres ?\n(Les clés API ne seront pas écrasées)';

  @override
  String get dataOnly => 'Données uniquement';

  @override
  String get dataAndSettings => 'Données + Paramètres';

  @override
  String get importCompleted => 'Importation terminée';

  @override
  String get settingsInBackupWereApplied =>
      'Les paramètres de sauvegarde ont été appliqués.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Les paramètres de sauvegarde n\'ont pas été appliqués.';

  @override
  String get ok => 'D\'ACCORD';

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Sauvegarder';

  @override
  String get delete => 'Supprimer';

  @override
  String get clear => 'Clair';

  @override
  String get add => 'Ajouter';

  @override
  String get create => 'Créer';

  @override
  String get edit => 'Modifier';

  @override
  String get search => 'Recherche';

  @override
  String get areYouSureYouWantToLogOut =>
      'Êtes-vous sûr de vouloir vous déconnecter ?';

  @override
  String get chooseLanguage => 'Choisir la langue';

  @override
  String get databaseInfo => 'Informations sur la base de données';

  @override
  String get storage => 'Stockage : ObjectBox';

  @override
  String get vectorIndex => 'Indice vectoriel : HNSW';

  @override
  String get dimensions => 'Dimensions : 384';

  @override
  String get embeddingModelBge => 'Modèle d\'intégration : bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get chooseFromGallery => 'Choisissez dans la galerie';

  @override
  String get editNickname => 'Modifier le pseudo';

  @override
  String get enterNickname => 'Entrez le pseudo';

  @override
  String get pleaseEnterNickname => 'Veuillez entrer un pseudo';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Le pseudo existe déjà ou n\'est pas valide';

  @override
  String get user => 'Utilisateur';

  @override
  String get manageScheduledReminders =>
      'Gérer les rappels et les alarmes programmés';

  @override
  String get imageFailedToLoad =>
      'L\'image n\'a pas pu être chargée. Veuillez choisir à nouveau.';

  @override
  String get imageIsStillLoading =>
      'L\'image est toujours en cours de chargement';

  @override
  String get imageAreaNotReady =>
      'La zone d\'image n\'est pas prête. Veuillez réessayer.';

  @override
  String get cropFrameNotReady =>
      'Le cadre de recadrage n’est pas prêt. Veuillez réessayer.';

  @override
  String get invalidCropArea =>
      'Zone de recadrage invalide. Veuillez réessayer.';

  @override
  String get cropFailed => 'La récolte a échoué. Veuillez réessayer.';

  @override
  String get cropAvatar => 'Avatar de culture';

  @override
  String get chooseAgain => 'Choisissez à nouveau';

  @override
  String get rotate90 => 'Rotation à 90°';

  @override
  String get dragFrameToMove =>
      'Faites glisser le cadre pour le déplacer, faites-le glisser en bas à droite pour le redimensionner ; pincez pour zoomer et déplacer l’image.';

  @override
  String get pleaseFillInAllFields => 'Veuillez remplir tous les champs';

  @override
  String get pinMustBeAtLeast4Digits =>
      'Le code PIN doit comporter au moins 4 chiffres';

  @override
  String get pinAtLeast4Digits =>
      'Le code PIN doit comporter au moins 4 chiffres';

  @override
  String get invalidUsernameOrPin => 'Nom d\'utilisateur ou code PIN invalide';

  @override
  String get invalidUsernameOrPinError =>
      'Nom d\'utilisateur ou code PIN invalide';

  @override
  String get usernameAlreadyExists => 'Le nom d\'utilisateur existe déjà';

  @override
  String get captureMomentsKeepMemories =>
      'Capturez des moments, gardez des souvenirs';

  @override
  String get username => 'Nom d\'utilisateur';

  @override
  String get pin => 'ÉPINGLE';

  @override
  String get login => 'Se connecter';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get dontHaveAccountCreateOne =>
      'Vous n\'avez pas de compte ? Créez-en un';

  @override
  String get alreadyHaveAccountLogin =>
      'Vous avez déjà un compte ? Se connecter';

  @override
  String get pleaseEnterUsername => 'Veuillez entrer un nom d\'utilisateur';

  @override
  String get pinsDoNotMatch => 'Les codes PIN ne correspondent pas';

  @override
  String get tapToAddAvatar => 'Appuyez pour ajouter un avatar';

  @override
  String get yourName => 'Votre nom';

  @override
  String get privatePinOptional => 'Code PIN privé (facultatif)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Utilisé pour chiffrer les enregistrements privés';

  @override
  String get privatePin => 'Code PIN privé';

  @override
  String get leaveEmptyForNoEncryption => 'Laisser vide pour aucun cryptage';

  @override
  String get confirmPin => 'Confirmer le code PIN';

  @override
  String get getStarted => 'Commencer';

  @override
  String get noReminders => 'Aucun rappel';

  @override
  String get addReminder => 'Ajouter un rappel';

  @override
  String get title => 'Titre';

  @override
  String get descriptionOptional => 'Description (facultatif)';

  @override
  String get microphonePermissionRequired =>
      'Autorisation du microphone requise';

  @override
  String get aiAssistant => 'AI Assistant';

  @override
  String get listening => 'Écoute...';

  @override
  String get typeAMessage => 'Tapez un message...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Démarrer une conversation';

  @override
  String get typeYourMessage => 'Tapez votre message...';

  @override
  String get asrReconnecting => 'Reconnexion de l\'ASR...';

  @override
  String get write => 'Écrire';

  @override
  String get writeEntry => 'Écrire une entrée';

  @override
  String get noMemoriesYet => 'Pas encore de souvenirs';

  @override
  String get tapPlusToCapture => 'Appuyez sur + pour capturer vos pensées';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Appuyez sur + pour capturer vos pensées';

  @override
  String get deleteMemory => 'Supprimer la mémoire';

  @override
  String get deleteRecord => 'Supprimer l\'enregistrement';

  @override
  String get thisEntryWillBeRemoved =>
      'Cette entrée sera supprimée de votre timeline.';

  @override
  String get thisRecordWillBeRemoved =>
      'Cet enregistrement sera supprimé de votre chronologie.';

  @override
  String get searchYourRecords => 'Recherchez vos dossiers...';

  @override
  String get exactMatches => 'Correspondances exactes';

  @override
  String get noExactMatches => 'Aucune correspondance exacte';

  @override
  String get exact => 'Exact';

  @override
  String get exactMatch => 'Correspondance exacte';

  @override
  String get fuzzyMatches => 'Correspondances floues';

  @override
  String get noFuzzyMatches => 'Pas de correspondances floues';

  @override
  String get vectorMatch => 'Correspondance de vecteur';

  @override
  String get networkMatches => 'Correspondances réseau';

  @override
  String get noNetworkMatches => 'Aucune correspondance de réseau';

  @override
  String get networkSearchIsOff =>
      'La recherche sur le réseau est désactivée. Activez-le dans Paramètres.';

  @override
  String get network => 'Réseau';

  @override
  String get networkMatch => 'Correspondance du réseau';

  @override
  String get noSearchHistory => 'Aucun historique de recherche';

  @override
  String get searchHistory => 'Historique de recherche';

  @override
  String get invalidLink => 'Lien invalide';

  @override
  String get unableToOpenWebPage => 'Impossible d\'ouvrir la page Web';

  @override
  String get imageMemory => '[Mémoire d\'images]';

  @override
  String get tapToOpenWebPage => 'Appuyez pour ouvrir la page Web';

  @override
  String get editEntry => 'Modifier l\'entrée';

  @override
  String get entryDetails => 'Détails de l\'entrée';

  @override
  String get noContent => 'Aucun contenu';

  @override
  String get diaryNotFound => 'Journal introuvable';

  @override
  String get diaryNotFoundShort => 'Enregistrement introuvable';

  @override
  String get aiSummary => 'Résumé de l\'IA';

  @override
  String get microphoneInterrupted =>
      'Microphone interrompu, enregistrement arrêté.';

  @override
  String get bold => 'Audacieux';

  @override
  String get italic => 'Italique';

  @override
  String get strikethrough => 'Barré';

  @override
  String get image => 'Image';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR indisponible. L\'enregistrement est toujours actif.';

  @override
  String get writeYourEntry => 'Écrivez votre entrée...';

  @override
  String get writeYourContent => 'Écrivez votre contenu...';

  @override
  String microphoneStartFailed(String error) {
    return 'Échec du démarrage du microphone : $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Microphone interrompu, enregistrement arrêté.';

  @override
  String asrReconnectingError(String error) {
    return 'Reconnexion ASR : $error';
  }

  @override
  String imageInserted(String name) {
    return 'Image insérée : $name';
  }

  @override
  String voiceError(String error) {
    return 'Erreur vocale : $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Désolé, le service AI est actuellement indisponible : $error';
  }

  @override
  String shareFailed(String error) {
    return 'Échec du partage : $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count clics';
  }

  @override
  String matchCount(int count) {
    return 'Correspondance : $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Source : $source';
  }

  @override
  String get createNew => 'Créer';

  @override
  String micStartFailed(String error) {
    return 'Échec du démarrage du micro : $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Comptes : +$created / mis à jour $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Agendas : +$created / mis à jour $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Rappels : +$created / mis à jour $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Ignoré : $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Total modifié : $count';
  }

  @override
  String get settingsApplied =>
      'Les paramètres de sauvegarde ont été appliqués.';

  @override
  String get settingsNotApplied =>
      'Les paramètres de sauvegarde n\'ont pas été appliqués.';

  @override
  String backupExported(String path) {
    return 'Sauvegarde exportée : $path';
  }

  @override
  String exportFailed(String error) {
    return 'Échec de l\'exportation : $error';
  }

  @override
  String importFailed(String error) {
    return 'Échec de l\'importation : $error';
  }
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get languageName => 'Deutsch';

  @override
  String get languageNameEn => 'German';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Einstellungen';

  @override
  String get account => 'Konto';

  @override
  String get reminders => 'Erinnerungen';

  @override
  String get language => 'Sprache';

  @override
  String get appLanguage => 'App-Sprache';

  @override
  String get appearance => 'Erscheinungsbild';

  @override
  String get themeMode => 'Designmodus';

  @override
  String get dark => 'Dunkel';

  @override
  String get light => 'Hell';

  @override
  String get system => 'System';

  @override
  String get aiService => 'KI-Dienst';

  @override
  String get aiChatProvider => 'KI-Chat-Anbieter';

  @override
  String get chatModel => 'Chat-Modell';

  @override
  String get localModel => 'Lokales Modell';

  @override
  String get localModelDefault => 'Lokales Modell (Standard)';

  @override
  String get ollamaEndpoint => 'Ollama-Endpunkt';

  @override
  String get ollamaModel => 'Ollama-Modell';

  @override
  String get openAiEndpoint => 'OpenAI-Endpunkt';

  @override
  String get openAiApiKey => 'OpenAI API-Schlüssel';

  @override
  String get openAiModel => 'OpenAI-Modell';

  @override
  String get geminiEndpoint => 'Gemini-Endpunkt';

  @override
  String get geminiApiKey => 'Gemini API-Schlüssel';

  @override
  String get geminiModel => 'Gemini-Modell';

  @override
  String get anthropicEndpoint => 'Anthropic-Endpunkt';

  @override
  String get anthropicApiKey => 'Anthropic API-Schlüssel';

  @override
  String get anthropicModel => 'Anthropic-Modell';

  @override
  String get customProtocol => 'Benutzerdefiniertes Protokoll';

  @override
  String get protocol => 'Protokoll';

  @override
  String get customEndpoint => 'Benutzerdefinierter Endpunkt';

  @override
  String get customApiKey => 'Benutzerdefinierter API-Schlüssel';

  @override
  String get customModel => 'Benutzerdefiniertes Modell';

  @override
  String get optionalForLocalServers =>
      'Optional für lokale/benutzerdefinierte Server';

  @override
  String get speechRecognitionEngine => 'Spracherkennungsmodul';

  @override
  String get local => 'Lokal';

  @override
  String get endpoint => 'Endpunkt';

  @override
  String get localSpeechModel => 'Lokales Sprachmodell';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (auf dem Gerät)';

  @override
  String get systemSpeechRecognition => 'System-Spracherkennung';

  @override
  String get systemRecognitionAndroidIos => 'Systemerkennung (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Endpunkterkennung (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Integrierten Android/iOS-Recognizer verwenden (kann Cloud nutzen)';

  @override
  String get voiceAiEndpoint => 'Sprach-KI-Endpunkt';

  @override
  String get embeddingModel => 'Embedding-Modell';

  @override
  String get crossDeviceSync => 'Geräteübergreifende Synchronisierung';

  @override
  String get sendToOtherDevices => 'An andere Geräte senden (LocalSend)';

  @override
  String get exportBackupAndSend => 'Sicherung exportieren und senden';

  @override
  String get importFromLocalSend => 'Von LocalSend importieren';

  @override
  String get selectBackupJson =>
      'Sicherungs-JSON auswählen und lokale Daten zusammenführen';

  @override
  String get autoGeneration => 'Automatische Generierung';

  @override
  String get autoGenerateSummary => 'Zusammenfassung automatisch generieren';

  @override
  String get generateAiSummaryForNewEntries =>
      'KI-Zusammenfassung für neue Einträge generieren';

  @override
  String get autoGenerateEmbedding => 'Embedding automatisch generieren';

  @override
  String get generateVectorEmbedding => 'Vektor-Embedding für Suche generieren';

  @override
  String get enableNetworkSearch => 'Netzwerksuche aktivieren';

  @override
  String get allowOnlineRetrieval =>
      'Online-Abruf für Suche und KI-Chat erlauben (standardmäßig aus)';

  @override
  String get about => 'Über';

  @override
  String version(String version) {
    return 'Version$version';
  }

  @override
  String get database => 'Datenbank';

  @override
  String get objectBoxWithHnsw => 'ObjectBox mit HNSW-Index';

  @override
  String get logOut => 'Abmelden';

  @override
  String get custom => 'Benutzerdefiniert';

  @override
  String get openAiCompatible => 'OpenAI-kompatibel';

  @override
  String get notSet => 'Nicht festgelegt';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... oder http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Unterstützt lokale/LAN/öffentliche Endpunkte';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend-Sicherung';

  @override
  String get localBackupFromShiguang =>
      'Lokale Sicherung von Shiguang (über LocalSend empfangen)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Von LocalSend empfangene Sicherungsdatei auswählen';

  @override
  String get failedToResolveFilePath =>
      'Ausgewählter Dateipfad konnte nicht aufgelöst werden';

  @override
  String get importOptions => 'Importoptionen';

  @override
  String get importSettingsAsWell =>
      'Einstellungen auch importieren?\n(API-Schlüssel werden nicht überschrieben)';

  @override
  String get dataOnly => 'Nur Daten';

  @override
  String get dataAndSettings => 'Daten + Einstellungen';

  @override
  String get importCompleted => 'Import abgeschlossen';

  @override
  String get settingsInBackupWereApplied =>
      'Einstellungen aus der Sicherung wurden angewendet.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Einstellungen aus der Sicherung wurden nicht angewendet.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';

  @override
  String get delete => 'Löschen';

  @override
  String get clear => 'Löschen';

  @override
  String get add => 'Hinzufügen';

  @override
  String get create => 'Erstellen';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get search => 'Suchen';

  @override
  String get areYouSureYouWantToLogOut => 'Möchten Sie sich wirklich abmelden?';

  @override
  String get chooseLanguage => 'Sprache wählen';

  @override
  String get databaseInfo => 'Datenbankinfo';

  @override
  String get storage => 'Speicher: ObjectBox';

  @override
  String get vectorIndex => 'Vektorindex: HNSW';

  @override
  String get dimensions => 'Dimensionen: 384';

  @override
  String get embeddingModelBge => 'Embedding-Modell: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Foto aufnehmen';

  @override
  String get chooseFromGallery => 'Aus Galerie wählen';

  @override
  String get editNickname => 'Spitzname ändern';

  @override
  String get enterNickname => 'Spitzname eingeben';

  @override
  String get pleaseEnterNickname => 'Bitte geben Sie einen Spitznamen ein';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Spitzname existiert bereits oder ist ungültig';

  @override
  String get user => 'Benutzer';

  @override
  String get manageScheduledReminders =>
      'Geplante Erinnerungen und Alarme verwalten';

  @override
  String get imageFailedToLoad =>
      'Bild konnte nicht geladen werden. Bitte erneut wählen.';

  @override
  String get imageIsStillLoading => 'Bild wird noch geladen';

  @override
  String get imageAreaNotReady =>
      'Bildbereich nicht bereit. Bitte erneut versuchen.';

  @override
  String get cropFrameNotReady =>
      'Zuschnittrahmen nicht bereit. Bitte erneut versuchen.';

  @override
  String get invalidCropArea =>
      'Ungültiger Zuschnittbereich. Bitte erneut versuchen.';

  @override
  String get cropFailed => 'Zuschnitt fehlgeschlagen. Bitte erneut versuchen.';

  @override
  String get cropAvatar => 'Avatar zuschneiden';

  @override
  String get chooseAgain => 'Erneut wählen';

  @override
  String get rotate90 => '90° drehen';

  @override
  String get dragFrameToMove =>
      'Rahmen zum Verschieben ziehen, unten rechts zum Größenändern ziehen; Pinchen zum Zoomen und Verschieben des Bildes.';

  @override
  String get pleaseFillInAllFields => 'Bitte füllen Sie alle Felder aus';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN muss mindestens 4 Ziffern haben';

  @override
  String get pinAtLeast4Digits => 'PIN muss mindestens 4 Ziffern haben';

  @override
  String get invalidUsernameOrPin => 'Ungültiger Benutzername oder PIN';

  @override
  String get invalidUsernameOrPinError => 'Ungültiger Benutzername oder PIN';

  @override
  String get usernameAlreadyExists => 'Benutzername existiert bereits';

  @override
  String get captureMomentsKeepMemories =>
      'Momente einfangen, Erinnerungen bewahren';

  @override
  String get username => 'Benutzername';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Anmelden';

  @override
  String get createAccount => 'Konto erstellen';

  @override
  String get dontHaveAccountCreateOne => 'Kein Konto? Erstellen Sie eines';

  @override
  String get alreadyHaveAccountLogin => 'Bereits ein Konto? Anmelden';

  @override
  String get pleaseEnterUsername => 'Bitte geben Sie einen Benutzernamen ein';

  @override
  String get pinsDoNotMatch => 'PINs stimmen nicht überein';

  @override
  String get tapToAddAvatar => 'Tippen um Avatar hinzuzufügen';

  @override
  String get yourName => 'Ihr Name';

  @override
  String get privatePinOptional => 'Private PIN (optional)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Zur Verschlüsselung privater Aufzeichnungen verwendet';

  @override
  String get privatePin => 'Private PIN';

  @override
  String get leaveEmptyForNoEncryption =>
      'Leer lassen für keine Verschlüsselung';

  @override
  String get confirmPin => 'PIN bestätigen';

  @override
  String get getStarted => 'Loslegen';

  @override
  String get noReminders => 'Keine Erinnerungen';

  @override
  String get addReminder => 'Erinnerung hinzufügen';

  @override
  String get title => 'Titel';

  @override
  String get descriptionOptional => 'Beschreibung (optional)';

  @override
  String get microphonePermissionRequired =>
      'Mikrofonberechtigung erforderlich';

  @override
  String get aiAssistant => 'KI-Assistent';

  @override
  String get listening => 'Hört zu...';

  @override
  String get typeAMessage => 'Nachricht eingeben...';

  @override
  String get aiChat => 'KI-Chat';

  @override
  String get startAConversation => 'Gespräch beginnen';

  @override
  String get typeYourMessage => 'Ihre Nachricht eingeben...';

  @override
  String get asrReconnecting => 'ASR wird wieder verbunden...';

  @override
  String get write => 'Schreiben';

  @override
  String get writeEntry => 'Eintrag schreiben';

  @override
  String get noMemoriesYet => 'Noch keine Erinnerungen';

  @override
  String get tapPlusToCapture =>
      'Tippen Sie auf + um Ihre Gedanken festzuhalten';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Tippen Sie auf + um Ihre Gedanken festzuhalten';

  @override
  String get deleteMemory => 'Erinnerung löschen';

  @override
  String get deleteRecord => 'Aufzeichnung löschen';

  @override
  String get thisEntryWillBeRemoved =>
      'Dieser Eintrag wird von Ihrer Zeitleiste entfernt.';

  @override
  String get thisRecordWillBeRemoved =>
      'Dieser Eintrag wird von Ihrer Zeitleiste entfernt.';

  @override
  String get searchYourRecords => 'Ihre Aufzeichnungen durchsuchen...';

  @override
  String get exactMatches => 'Exakte Übereinstimmungen';

  @override
  String get noExactMatches => 'Keine exakten Übereinstimmungen';

  @override
  String get exact => 'Exakt';

  @override
  String get exactMatch => 'Exakte Übereinstimmung';

  @override
  String get fuzzyMatches => 'Unscharfe Übereinstimmungen';

  @override
  String get noFuzzyMatches => 'Keine unscharfen Übereinstimmungen';

  @override
  String get vectorMatch => 'Vektorübereinstimmung';

  @override
  String get networkMatches => 'Netzwerkübereinstimmungen';

  @override
  String get noNetworkMatches => 'Keine Netzwerkübereinstimmungen';

  @override
  String get networkSearchIsOff =>
      'Netzwerksuche ist aus. Aktivieren Sie sie in den Einstellungen.';

  @override
  String get network => 'Netzwerk';

  @override
  String get networkMatch => 'Netzwerkübereinstimmung';

  @override
  String get noSearchHistory => 'Kein Suchverlauf';

  @override
  String get searchHistory => 'Suchverlauf';

  @override
  String get invalidLink => 'Ungültiger Link';

  @override
  String get unableToOpenWebPage => 'Webseite kann nicht geöffnet werden';

  @override
  String get imageMemory => '[Bild-Erinnerung]';

  @override
  String get tapToOpenWebPage => 'Tippen um Webseite zu öffnen';

  @override
  String get editEntry => 'Eintrag bearbeiten';

  @override
  String get entryDetails => 'Eintragsdetails';

  @override
  String get noContent => 'Kein Inhalt';

  @override
  String get diaryNotFound => 'Tagebuch nicht gefunden';

  @override
  String get diaryNotFoundShort => 'Aufzeichnung nicht gefunden';

  @override
  String get aiSummary => 'KI-Zusammenfassung';

  @override
  String get microphoneInterrupted =>
      'Mikrofon unterbrochen, Aufnahme gestoppt.';

  @override
  String get bold => 'Fett';

  @override
  String get italic => 'Kursiv';

  @override
  String get strikethrough => 'Durchgestrichen';

  @override
  String get image => 'Bild';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR nicht verfügbar. Aufnahme ist noch aktiv.';

  @override
  String get writeYourEntry => 'Schreiben Sie Ihren Eintrag...';

  @override
  String get writeYourContent => 'Schreiben Sie Ihren Inhalt...';

  @override
  String microphoneStartFailed(String error) {
    return 'Mikrofon konnte nicht gestartet werden: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofon unterbrochen, Aufnahme gestoppt.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR wird wieder verbunden: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Bild eingefügt: $name';
  }

  @override
  String voiceError(String error) {
    return 'Sprachfehler: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Entschuldigung, KI-Dienst ist momentan nicht verfügbar: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Teilen fehlgeschlagen: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count Treffer';
  }

  @override
  String matchCount(int count) {
    return 'Treffer: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Quelle: $source';
  }

  @override
  String get createNew => 'Erstellen';

  @override
  String micStartFailed(String error) {
    return 'Mikrofon konnte nicht gestartet werden: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Konten: +$created / aktualisiert $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Tagebücher: +$created / aktualisiert $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Erinnerungen: +$created / aktualisiert $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Übersprungen: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Geändert: $count';
  }

  @override
  String get settingsApplied =>
      'Einstellungen aus der Sicherung wurden angewendet.';

  @override
  String get settingsNotApplied =>
      'Einstellungen aus der Sicherung wurden nicht angewendet.';

  @override
  String backupExported(String path) {
    return 'Sicherung exportiert: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Export fehlgeschlagen: $error';
  }

  @override
  String importFailed(String error) {
    return 'Import fehlgeschlagen: $error';
  }
}

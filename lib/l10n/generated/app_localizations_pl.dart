// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get languageName => 'Polski';

  @override
  String get languageNameEn => 'Polish';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Ustawienia';

  @override
  String get account => 'Konto';

  @override
  String get reminders => 'Przypomnienia';

  @override
  String get language => 'Język';

  @override
  String get appLanguage => 'Język aplikacji';

  @override
  String get appearance => 'Wygląd';

  @override
  String get themeMode => 'Tryb motywu';

  @override
  String get dark => 'Ciemny';

  @override
  String get light => 'Jasny';

  @override
  String get system => 'System';

  @override
  String get aiService => 'Usługa AI';

  @override
  String get aiChatProvider => 'Dostawca czatu AI';

  @override
  String get chatModel => 'Model czatu';

  @override
  String get localModel => 'Model lokalny';

  @override
  String get localModelDefault => 'Model lokalny (domyślny)';

  @override
  String get ollamaEndpoint => 'Punkt końcowy Ollama';

  @override
  String get ollamaModel => 'Model Ollama';

  @override
  String get openAiEndpoint => 'Punkt końcowy OpenAI';

  @override
  String get openAiApiKey => 'Klucz API OpenAI';

  @override
  String get openAiModel => 'Model OpenAI';

  @override
  String get geminiEndpoint => 'Punkt końcowy Gemini';

  @override
  String get geminiApiKey => 'Klucz API Gemini';

  @override
  String get geminiModel => 'Model Gemini';

  @override
  String get anthropicEndpoint => 'Punkt końcowy Anthropic';

  @override
  String get anthropicApiKey => 'Klucz API Anthropic';

  @override
  String get anthropicModel => 'Model Anthropic';

  @override
  String get customProtocol => 'Protokół niestandardowy';

  @override
  String get protocol => 'Protokół';

  @override
  String get customEndpoint => 'Punkt końcowy niestandardowy';

  @override
  String get customApiKey => 'Klucz API niestandardowy';

  @override
  String get customModel => 'Model niestandardowy';

  @override
  String get optionalForLocalServers =>
      'Opcjonalne dla serwerów lokalnych/niestandardowych';

  @override
  String get speechRecognitionEngine => 'Silnik rozpoznawania mowy';

  @override
  String get local => 'Lokalny';

  @override
  String get endpoint => 'Punkt końcowy';

  @override
  String get localSpeechModel => 'Lokalny model mowy';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (na urządzeniu)';

  @override
  String get systemSpeechRecognition => 'Systemowe rozpoznawanie mowy';

  @override
  String get systemRecognitionAndroidIos =>
      'Rozpoznawanie systemowe (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs =>
      'Rozpoznawanie punktu końcowego (Chmura/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Użyj wbudowanego rozpoznawania Android/iOS (może używać chmury)';

  @override
  String get voiceAiEndpoint => 'Punkt końcowy Voice AI';

  @override
  String get embeddingModel => 'Model osadzania';

  @override
  String get crossDeviceSync => 'Synchronizacja między urządzeniami';

  @override
  String get sendToOtherDevices => 'Wyślij na inne urządzenia (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Eksportuj kopię zapasową i wyślij przez arkusz udostępniania';

  @override
  String get importFromLocalSend => 'Importuj z LocalSend';

  @override
  String get selectBackupJson =>
      'Wybierz plik JSON kopii zapasowej i scal dane lokalne';

  @override
  String get autoGeneration => 'Automatyczne generowanie';

  @override
  String get autoGenerateSummary => 'Automatyczne generowanie podsumowania';

  @override
  String get generateAiSummaryForNewEntries =>
      'Generuj podsumowanie AI dla nowych wpisów';

  @override
  String get autoGenerateEmbedding => 'Automatyczne generowanie osadzania';

  @override
  String get generateVectorEmbedding =>
      'Generuj osadzanie wektorowe do wyszukiwania';

  @override
  String get enableNetworkSearch => 'Włącz wyszukiwanie sieciowe';

  @override
  String get allowOnlineRetrieval =>
      'Zezwól na pobieranie online do wyszukiwania i czatu AI (domyślnie wyłączone)';

  @override
  String get about => 'Informacje';

  @override
  String version(String version) {
    return 'Wersja $version';
  }

  @override
  String get database => 'Baza danych';

  @override
  String get objectBoxWithHnsw => 'ObjectBox z indeksem HNSW';

  @override
  String get logOut => 'Wyloguj';

  @override
  String get custom => 'Niestandardowy';

  @override
  String get openAiCompatible => 'Kompatybilny z OpenAI';

  @override
  String get notSet => 'Nie ustawiono';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... lub http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Obsługuje punkty końcowe lokalne/LAN/publiczne';

  @override
  String get shiguangLocalSendBackup => 'Kopia zapasowa Shiguang LocalSend';

  @override
  String get localBackupFromShiguang =>
      'Lokalna kopia zapasowa z Shiguang (odbierz przez LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Wybierz plik kopii zapasowej otrzymany z LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Nie udało się rozwiązać wybranej ścieżki pliku';

  @override
  String get importOptions => 'Opcje importu';

  @override
  String get importSettingsAsWell =>
      'Zaimportować również ustawienia?\n(Klucze API nie zostaną nadpisane)';

  @override
  String get dataOnly => 'Tylko dane';

  @override
  String get dataAndSettings => 'Dane + Ustawienia';

  @override
  String get importCompleted => 'Import zakończony';

  @override
  String get settingsInBackupWereApplied =>
      'Ustawienia z kopii zapasowej zostały zastosowane.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Ustawienia z kopii zapasowej nie zostały zastosowane.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Anuluj';

  @override
  String get save => 'Zapisz';

  @override
  String get delete => 'Usuń';

  @override
  String get clear => 'Wyczyść';

  @override
  String get add => 'Dodaj';

  @override
  String get create => 'Utwórz';

  @override
  String get edit => 'Edytuj';

  @override
  String get search => 'Szukaj';

  @override
  String get areYouSureYouWantToLogOut => 'Czy na pewno chcesz się wylogować?';

  @override
  String get chooseLanguage => 'Wybierz język';

  @override
  String get databaseInfo => 'Informacje o bazie danych';

  @override
  String get storage => 'Przechowywanie: ObjectBox';

  @override
  String get vectorIndex => 'Indeks wektorowy: HNSW';

  @override
  String get dimensions => 'Wymiary: 384';

  @override
  String get embeddingModelBge => 'Model osadzania: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Zrób zdjęcie';

  @override
  String get chooseFromGallery => 'Wybierz z galerii';

  @override
  String get editNickname => 'Edytuj pseudonim';

  @override
  String get enterNickname => 'Wprowadź pseudonim';

  @override
  String get pleaseEnterNickname => 'Wprowadź pseudonim';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Pseudonim już istnieje lub jest nieprawidłowy';

  @override
  String get user => 'Użytkownik';

  @override
  String get manageScheduledReminders =>
      'Zarządzaj zaplanowanymi przypomnieniami i alarmami';

  @override
  String get imageFailedToLoad =>
      'Nie udało się załadować obrazu. Wybierz ponownie.';

  @override
  String get imageIsStillLoading => 'Obraz nadal się ładuje';

  @override
  String get imageAreaNotReady =>
      'Obszar obrazu nie jest gotowy. Spróbuj ponownie.';

  @override
  String get cropFrameNotReady =>
      'Ramka przycinania nie jest gotowa. Spróbuj ponownie.';

  @override
  String get invalidCropArea =>
      'Nieprawidłowy obszar przycinania. Spróbuj ponownie.';

  @override
  String get cropFailed => 'Przycinanie nie powiodło się. Spróbuj ponownie.';

  @override
  String get cropAvatar => 'Przytnij awatar';

  @override
  String get chooseAgain => 'Wybierz ponownie';

  @override
  String get rotate90 => 'Obróć o 90°';

  @override
  String get dragFrameToMove =>
      'Przeciągnij ramkę, aby przesunąć, przeciągnij prawy dolny róg, aby zmienić rozmiar; szczypnij, aby powiększyć i przesunąć obraz.';

  @override
  String get pleaseFillInAllFields => 'Wypełnij wszystkie pola';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN musi mieć co najmniej 4 cyfry';

  @override
  String get pinAtLeast4Digits => 'PIN musi mieć co najmniej 4 cyfry';

  @override
  String get invalidUsernameOrPin => 'Nieprawidłowa nazwa użytkownika lub PIN';

  @override
  String get invalidUsernameOrPinError =>
      'Nieprawidłowa nazwa użytkownika lub PIN';

  @override
  String get usernameAlreadyExists => 'Nazwa użytkownika już istnieje';

  @override
  String get captureMomentsKeepMemories =>
      'Uchwyt chwile, zachowaj wspomnienia';

  @override
  String get username => 'Nazwa użytkownika';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Zaloguj';

  @override
  String get createAccount => 'Utwórz konto';

  @override
  String get dontHaveAccountCreateOne => 'Nie masz konta? Utwórz jedno';

  @override
  String get alreadyHaveAccountLogin => 'Masz już konto? Zaloguj się';

  @override
  String get pleaseEnterUsername => 'Wprowadź nazwę użytkownika';

  @override
  String get pinsDoNotMatch => 'PIN-y nie są zgodne';

  @override
  String get tapToAddAvatar => 'Dotknij, aby dodać awatar';

  @override
  String get yourName => 'Twoje imię';

  @override
  String get privatePinOptional => 'Prywatny PIN (opcjonalnie)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Służy do szyfrowania prywatnych rekordów';

  @override
  String get privatePin => 'Prywatny PIN';

  @override
  String get leaveEmptyForNoEncryption => 'Pozostaw puste, aby nie szyfrować';

  @override
  String get confirmPin => 'Potwierdź PIN';

  @override
  String get getStarted => 'Zacznij';

  @override
  String get noReminders => 'Brak przypomnień';

  @override
  String get addReminder => 'Dodaj przypomnienie';

  @override
  String get title => 'Tytuł';

  @override
  String get descriptionOptional => 'Opis (opcjonalnie)';

  @override
  String get microphonePermissionRequired => 'Wymagane uprawnienie mikrofonu';

  @override
  String get aiAssistant => 'Asystent AI';

  @override
  String get listening => 'Słuchanie...';

  @override
  String get typeAMessage => 'Wpisz wiadomość...';

  @override
  String get aiChat => 'Czat AI';

  @override
  String get startAConversation => 'Rozpocznij rozmowę';

  @override
  String get typeYourMessage => 'Wpisz swoją wiadomość...';

  @override
  String get asrReconnecting => 'ASR ponownie łączy...';

  @override
  String get write => 'Pisz';

  @override
  String get writeEntry => 'Napisz wpis';

  @override
  String get noMemoriesYet => 'Jeszcze brak wspomnień';

  @override
  String get tapPlusToCapture => 'Dotknij +, aby uchwycić swoje myśli';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Dotknij +, aby uchwycić swoje myśli';

  @override
  String get deleteMemory => 'Usuń wspomnienie';

  @override
  String get deleteRecord => 'Usuń rekord';

  @override
  String get thisEntryWillBeRemoved =>
      'Ten wpis zostanie usunięty z Twojej osi czasu.';

  @override
  String get thisRecordWillBeRemoved =>
      'Ten rekord zostanie usunięty z Twojej osi czasu.';

  @override
  String get searchYourRecords => 'Przeszukaj swoje rekordy...';

  @override
  String get exactMatches => 'Dokładne dopasowania';

  @override
  String get noExactMatches => 'Brak dokładnych dopasowań';

  @override
  String get exact => 'Dokładne';

  @override
  String get exactMatch => 'Dokładne dopasowanie';

  @override
  String get fuzzyMatches => 'Mniej dokładne dopasowania';

  @override
  String get noFuzzyMatches => 'Brak mniej dokładnych dopasowań';

  @override
  String get vectorMatch => 'Dopasowanie wektorowe';

  @override
  String get networkMatches => 'Dopasowania sieciowe';

  @override
  String get noNetworkMatches => 'Brak dopasowań sieciowych';

  @override
  String get networkSearchIsOff =>
      'Wyszukiwanie sieciowe jest wyłączone. Włącz je w Ustawieniach.';

  @override
  String get network => 'Sieć';

  @override
  String get networkMatch => 'Dopasowanie sieciowe';

  @override
  String get noSearchHistory => 'Brak historii wyszukiwania';

  @override
  String get searchHistory => 'Historia wyszukiwania';

  @override
  String get invalidLink => 'Nieprawidłowy link';

  @override
  String get unableToOpenWebPage => 'Nie można otworzyć strony internetowej';

  @override
  String get imageMemory => '[Wspomnienie obrazkowe]';

  @override
  String get tapToOpenWebPage => 'Dotknij, aby otworzyć stronę internetową';

  @override
  String get editEntry => 'Edytuj wpis';

  @override
  String get entryDetails => 'Szczegóły wpisu';

  @override
  String get noContent => 'Brak treści';

  @override
  String get diaryNotFound => 'Nie znaleziono dziennika';

  @override
  String get diaryNotFoundShort => 'Nie znaleziono rekordu';

  @override
  String get aiSummary => 'Podsumowanie AI';

  @override
  String get microphoneInterrupted =>
      'Mikrofon został przerwany, nagrywanie zatrzymane.';

  @override
  String get bold => 'Pogrubiony';

  @override
  String get italic => 'Kursywa';

  @override
  String get strikethrough => 'Przekreślony';

  @override
  String get image => 'Obraz';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR niedostępny. Nagrywanie nadal trwa.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Napisz swój wpis...';

  @override
  String get writeYourContent => 'Napisz swoją treść...';

  @override
  String microphoneStartFailed(String error) {
    return 'Nie udało się uruchomić mikrofonu: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofon został przerwany, nagrywanie zatrzymane.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR ponownie łączy: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Obraz wstawiony: $name';
  }

  @override
  String voiceError(String error) {
    return 'Błąd głosu: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Przepraszamy, usługa AI jest obecnie niedostępna: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Nie udało się udostępnić: $error';
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
    return '$matchType · $count wyników';
  }

  @override
  String matchCount(int count) {
    return 'Dopasowanie: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Źródło: $source';
  }

  @override
  String get createNew => 'Utwórz';

  @override
  String micStartFailed(String error) {
    return 'Nie udało się uruchomić mikrofonu: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Konta: +$created / zaktualizowano $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Dzienniki: +$created / zaktualizowano $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Przypomnienia: +$created / zaktualizowano $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Pominięto: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Łączna zmiana: $count';
  }

  @override
  String get settingsApplied =>
      'Ustawienia z kopii zapasowej zostały zastosowane.';

  @override
  String get settingsNotApplied =>
      'Ustawienia z kopii zapasowej nie zostały zastosowane.';

  @override
  String backupExported(String path) {
    return 'Kopia zapasowa wyeksportowana: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Eksport nie powiódł się: $error';
  }

  @override
  String importFailed(String error) {
    return 'Import nie powiódł się: $error';
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

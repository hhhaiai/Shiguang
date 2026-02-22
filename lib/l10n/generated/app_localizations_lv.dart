// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class AppLocalizationsLv extends AppLocalizations {
  AppLocalizationsLv([String locale = 'lv']) : super(locale);

  @override
  String get languageName => 'Latviešu';

  @override
  String get languageNameEn => 'Latvian';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Iestatījumi';

  @override
  String get account => 'Konts';

  @override
  String get reminders => 'Atgādinājumi';

  @override
  String get language => 'Valoda';

  @override
  String get appLanguage => 'Lietotnes valoda';

  @override
  String get appearance => 'Izskats';

  @override
  String get themeMode => 'Motīva režīms';

  @override
  String get dark => 'Tumšs';

  @override
  String get light => 'Gaisma';

  @override
  String get system => 'Sistēma';

  @override
  String get aiService => 'AI pakalpojums';

  @override
  String get aiChatProvider => 'AI tērzēšanas nodrošinātājs';

  @override
  String get chatModel => 'Tērzēšanas modelis';

  @override
  String get localModel => 'Vietējais modelis';

  @override
  String get localModelDefault => 'Vietējais modelis (noklusējums)';

  @override
  String get ollamaEndpoint => 'Ollama galapunkts';

  @override
  String get ollamaModel => 'Ollama modelis';

  @override
  String get openAiEndpoint => 'OpenAI galapunkts';

  @override
  String get openAiApiKey => 'OpenAI API atslēga';

  @override
  String get openAiModel => 'OpenAI modelis';

  @override
  String get geminiEndpoint => 'Gemini galapunkts';

  @override
  String get geminiApiKey => 'Gemini API atslēga';

  @override
  String get geminiModel => 'Dvīņu modeļi';

  @override
  String get anthropicEndpoint => 'Antropiskais galapunkts';

  @override
  String get anthropicApiKey => 'Antropiskā API atslēga';

  @override
  String get anthropicModel => 'Antropiskais modelis';

  @override
  String get customProtocol => 'Pielāgots protokols';

  @override
  String get protocol => 'Protokols';

  @override
  String get customEndpoint => 'Pielāgots galapunkts';

  @override
  String get customApiKey => 'Pielāgota API atslēga';

  @override
  String get customModel => 'Pielāgots modelis';

  @override
  String get optionalForLocalServers =>
      'Pēc izvēles vietējiem/pielāgotiem serveriem';

  @override
  String get speechRecognitionEngine => 'Runas atpazīšanas dzinējs';

  @override
  String get local => 'Vietējais';

  @override
  String get endpoint => 'Gala punkts';

  @override
  String get localSpeechModel => 'Vietējais runas modelis';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (ierīcē)';

  @override
  String get systemSpeechRecognition => 'Sistēmas runas atpazīšana';

  @override
  String get systemRecognitionAndroidIos => 'Sistēmas atpazīšana (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Galapunkta atpazīšana (mākonis/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Izmantojiet iebūvēto Android/iOS atpazinēju (var izmantot mākoni)';

  @override
  String get voiceAiEndpoint => 'Balss AI galapunkts';

  @override
  String get embeddingModel => 'Modeļa iegulšana';

  @override
  String get crossDeviceSync => 'Vairāku ierīču sinhronizācija';

  @override
  String get sendToOtherDevices => 'Sūtīt uz citām ierīcēm (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Eksportējiet dublējumu un nosūtiet, izmantojot koplietošanas lapu';

  @override
  String get importFromLocalSend => 'Importēt no LocalSend';

  @override
  String get selectBackupJson =>
      'Atlasiet dublējuma JSON un sapludiniet vietējos datus';

  @override
  String get autoGeneration => 'Auto ģenerēšana';

  @override
  String get autoGenerateSummary => 'Automātiski ģenerēt kopsavilkumu';

  @override
  String get generateAiSummaryForNewEntries =>
      'Izveidojiet AI kopsavilkumu jauniem ierakstiem';

  @override
  String get autoGenerateEmbedding => 'Automātiski ģenerēt iegulšanu';

  @override
  String get generateVectorEmbedding =>
      'Ģenerējiet vektora iegulšanu meklēšanai';

  @override
  String get enableNetworkSearch => 'Iespējot tīkla meklēšanu';

  @override
  String get allowOnlineRetrieval =>
      'Atļaut tiešsaistes izgūšanu meklēšanai un AI tērzēšanai (pēc noklusējuma izslēgts)';

  @override
  String get about => 'Par';

  @override
  String version(String version) {
    return 'Versija $version';
  }

  @override
  String get database => 'Datu bāze';

  @override
  String get objectBoxWithHnsw => 'ObjectBox ar HNSW indeksu';

  @override
  String get logOut => 'Iziet';

  @override
  String get custom => 'Pielāgots';

  @override
  String get openAiCompatible => 'OpenAI savietojams';

  @override
  String get notSet => 'Nav iestatīts';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... vai http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Atbalsta vietējos/LAN/publiskos galapunktus';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend dublējums';

  @override
  String get localBackupFromShiguang =>
      'Vietējais dublējums no Shiguang (saņemt, izmantojot LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Atlasiet dublējuma failu, kas saņemts no LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Neizdevās atrisināt atlasītā faila ceļu';

  @override
  String get importOptions => 'Importēšanas opcijas';

  @override
  String get importSettingsAsWell =>
      'Vai arī importēt iestatījumus?\n(API atslēgas netiks pārrakstītas)';

  @override
  String get dataOnly => 'Tikai dati';

  @override
  String get dataAndSettings => 'Dati + iestatījumi';

  @override
  String get importCompleted => 'Importēšana pabeigta';

  @override
  String get settingsInBackupWereApplied =>
      'Tika lietoti dublējuma iestatījumi.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Dublējuma iestatījumi netika lietoti.';

  @override
  String get ok => 'Labi';

  @override
  String get cancel => 'Atcelt';

  @override
  String get save => 'Saglabāt';

  @override
  String get delete => 'Dzēst';

  @override
  String get clear => 'Skaidrs';

  @override
  String get add => 'Pievienot';

  @override
  String get create => 'Izveidot';

  @override
  String get edit => 'Rediģēt';

  @override
  String get search => 'Meklēt';

  @override
  String get areYouSureYouWantToLogOut => 'Vai tiešām vēlaties atteikties?';

  @override
  String get chooseLanguage => 'Izvēlieties valodu';

  @override
  String get databaseInfo => 'Informācija par datu bāzi';

  @override
  String get storage => 'Uzglabāšana: ObjectBox';

  @override
  String get vectorIndex => 'Vektoru indekss: HNSW';

  @override
  String get dimensions => 'Izmēri: 384';

  @override
  String get embeddingModelBge => 'Iegulšanas modelis: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Uzņemiet fotoattēlu';

  @override
  String get chooseFromGallery => 'Izvēlieties no galerijas';

  @override
  String get editNickname => 'Rediģēt segvārdu';

  @override
  String get enterNickname => 'Ievadiet segvārdu';

  @override
  String get pleaseEnterNickname => 'Lūdzu, ievadiet segvārdu';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Segvārds jau pastāv vai ir nederīgs';

  @override
  String get user => 'Lietotājs';

  @override
  String get manageScheduledReminders =>
      'Pārvaldiet ieplānotos atgādinājumus un trauksmes signālus';

  @override
  String get imageFailedToLoad =>
      'Attēlu neizdevās ielādēt. Lūdzu, izvēlieties vēlreiz.';

  @override
  String get imageIsStillLoading => 'Attēls joprojām tiek ielādēts';

  @override
  String get imageAreaNotReady =>
      'Attēla apgabals nav gatavs. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get cropFrameNotReady =>
      'Apgriešanas rāmis nav gatavs. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get invalidCropArea =>
      'Nederīgs apgriešanas laukums. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get cropFailed => 'Apgriešana neizdevās. Lūdzu, mēģiniet vēlreiz.';

  @override
  String get cropAvatar => 'Crop Avatar';

  @override
  String get chooseAgain => 'Izvēlieties vēlreiz';

  @override
  String get rotate90 => 'Pagriezt par 90°';

  @override
  String get dragFrameToMove =>
      'Velciet rāmi, lai pārvietotu, velciet apakšā pa labi, lai mainītu izmēru; saspiediet, lai tuvinātu un pārvietotu attēlu.';

  @override
  String get pleaseFillInAllFields => 'Lūdzu, aizpildiet visus laukus';

  @override
  String get pinMustBeAtLeast4Digits => 'PIN ir jābūt vismaz 4 cipariem';

  @override
  String get pinAtLeast4Digits => 'PIN ir jābūt vismaz 4 cipariem';

  @override
  String get invalidUsernameOrPin => 'Nederīgs lietotājvārds vai PIN';

  @override
  String get invalidUsernameOrPinError => 'Nederīgs lietotājvārds vai PIN';

  @override
  String get usernameAlreadyExists => 'Lietotājvārds jau pastāv';

  @override
  String get captureMomentsKeepMemories =>
      'Iemūžiniet mirkļus, saglabājiet atmiņas';

  @override
  String get username => 'Lietotājvārds';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Pieteikties';

  @override
  String get createAccount => 'Izveidot kontu';

  @override
  String get dontHaveAccountCreateOne =>
      'Vai jums nav konta? Izveidojiet vienu';

  @override
  String get alreadyHaveAccountLogin => 'Vai jums jau ir konts? Pieteikties';

  @override
  String get pleaseEnterUsername => 'Lūdzu, ievadiet lietotājvārdu';

  @override
  String get pinsDoNotMatch => 'PIN kodi nesakrīt';

  @override
  String get tapToAddAvatar => 'Pieskarieties, lai pievienotu iemiesojumu';

  @override
  String get yourName => 'Jūsu Vārds';

  @override
  String get privatePinOptional => 'Privāts PIN (pēc izvēles)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Izmanto privāto ierakstu šifrēšanai';

  @override
  String get privatePin => 'Privāts PIN';

  @override
  String get leaveEmptyForNoEncryption =>
      'Atstājiet tukšu, lai netiktu veikta šifrēšana';

  @override
  String get confirmPin => 'Apstipriniet PIN';

  @override
  String get getStarted => 'Sāciet darbu';

  @override
  String get noReminders => 'Nav atgādinājumu';

  @override
  String get addReminder => 'Pievienot atgādinājumu';

  @override
  String get title => 'Nosaukums';

  @override
  String get descriptionOptional => 'Apraksts (pēc izvēles)';

  @override
  String get microphonePermissionRequired => 'Nepieciešama mikrofona atļauja';

  @override
  String get aiAssistant => 'AI palīgs';

  @override
  String get listening => 'Klausos...';

  @override
  String get typeAMessage => 'Ierakstiet ziņojumu...';

  @override
  String get aiChat => 'AI tērzēšana';

  @override
  String get startAConversation => 'Sāciet sarunu';

  @override
  String get typeYourMessage => 'Ierakstiet savu ziņojumu...';

  @override
  String get asrReconnecting => 'ASR tiek atkārtoti savienots...';

  @override
  String get write => 'Rakstiet';

  @override
  String get writeEntry => 'Rakstīt ierakstu';

  @override
  String get noMemoriesYet => 'Atmiņu vēl nav';

  @override
  String get tapPlusToCapture => 'Pieskarieties +, lai tvertu savas domas';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Pieskarieties +, lai tvertu savas domas';

  @override
  String get deleteMemory => 'Dzēst atmiņu';

  @override
  String get deleteRecord => 'Dzēst ierakstu';

  @override
  String get thisEntryWillBeRemoved =>
      'Šis ieraksts tiks noņemts no jūsu laika skalas.';

  @override
  String get thisRecordWillBeRemoved =>
      'Šis ieraksts tiks noņemts no jūsu laika skalas.';

  @override
  String get searchYourRecords => 'Meklējiet savus ierakstus...';

  @override
  String get exactMatches => 'Precīzās atbilstības';

  @override
  String get noExactMatches => 'Nav precīzu atbilstību';

  @override
  String get exact => 'Precīzi';

  @override
  String get exactMatch => 'Precīza atbilstība';

  @override
  String get fuzzyMatches => 'Izplūdušie mači';

  @override
  String get noFuzzyMatches => 'Nav neskaidru sakritību';

  @override
  String get vectorMatch => 'Vektoru atbilstība';

  @override
  String get networkMatches => 'Tīkla spēles';

  @override
  String get noNetworkMatches => 'Nav neviena tīkla atbilstības';

  @override
  String get networkSearchIsOff =>
      'Tīkla meklēšana ir izslēgta. Iespējojiet to sadaļā Iestatījumi.';

  @override
  String get network => 'Tīkls';

  @override
  String get networkMatch => 'Tīkla atbilstība';

  @override
  String get noSearchHistory => 'Nav meklēšanas vēstures';

  @override
  String get searchHistory => 'Meklēšanas vēsture';

  @override
  String get invalidLink => 'Nederīga saite';

  @override
  String get unableToOpenWebPage => 'Nevar atvērt tīmekļa lapu';

  @override
  String get imageMemory => '[Attēlu atmiņa]';

  @override
  String get tapToOpenWebPage => 'Pieskarieties, lai atvērtu tīmekļa lapu';

  @override
  String get editEntry => 'Rediģēt ierakstu';

  @override
  String get entryDetails => 'Ieejas informācija';

  @override
  String get noContent => 'Nav satura';

  @override
  String get diaryNotFound => 'Dienasgrāmata nav atrasta';

  @override
  String get diaryNotFoundShort => 'Ieraksts nav atrasts';

  @override
  String get aiSummary => 'AI kopsavilkums';

  @override
  String get microphoneInterrupted =>
      'Mikrofons pārtraukts, ierakstīšana pārtraukta.';

  @override
  String get bold => 'Treknrakstā';

  @override
  String get italic => 'Kursīvs';

  @override
  String get strikethrough => 'Pārsvītrots';

  @override
  String get image => 'Attēls';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR nav pieejams. Ieraksts joprojām ir aktīvs.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Uzraksti savu ierakstu...';

  @override
  String get writeYourContent => 'Uzrakstiet savu saturu...';

  @override
  String microphoneStartFailed(String error) {
    return 'Neizdevās palaist mikrofonu: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofons pārtraukts, ierakstīšana pārtraukta.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR atkārtota savienojuma izveide: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Ievietots attēls: $name';
  }

  @override
  String voiceError(String error) {
    return 'Balss kļūda: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Diemžēl AI pakalpojums pašlaik nav pieejams: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Neizdevās kopīgot: $error';
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
    return '$matchType · $count trāpījumi';
  }

  @override
  String matchCount(int count) {
    return 'Atbilstība: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Avots: $source';
  }

  @override
  String get createNew => 'Izveidot';

  @override
  String micStartFailed(String error) {
    return 'Mikrofona palaišana neizdevās: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Konti: +$created / atjaunināts $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Dienasgrāmatas: +$created / atjaunināta $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Atgādinājumi: +$created / atjaunināts $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Izlaists: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Kopējais izmaiņu skaits: $count';
  }

  @override
  String get settingsApplied => 'Tika lietoti dublējuma iestatījumi.';

  @override
  String get settingsNotApplied => 'Dublējuma iestatījumi netika lietoti.';

  @override
  String backupExported(String path) {
    return 'Dublējums eksportēts: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Eksportēšana neizdevās: $error';
  }

  @override
  String importFailed(String error) {
    return 'Importēšana neizdevās: $error';
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

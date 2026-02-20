// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AppLocalizationsSq extends AppLocalizations {
  AppLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get languageName => 'Shqip';

  @override
  String get languageNameEn => 'Albanian';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Cilësimet';

  @override
  String get account => 'Llogaria';

  @override
  String get reminders => 'Përkujtues';

  @override
  String get language => 'Gjuha';

  @override
  String get appLanguage => 'Gjuha e aplikacionit';

  @override
  String get appearance => 'Pamja e jashtme';

  @override
  String get themeMode => 'Modaliteti i temës';

  @override
  String get dark => 'E errët';

  @override
  String get light => 'Drita';

  @override
  String get system => 'Sistemi';

  @override
  String get aiService => 'Shërbimi i AI';

  @override
  String get aiChatProvider => 'Ofruesi i bisedës AI';

  @override
  String get chatModel => 'Modeli i bisedës';

  @override
  String get localModel => 'Modeli lokal';

  @override
  String get localModelDefault => 'Modeli lokal (i parazgjedhur)';

  @override
  String get ollamaEndpoint => 'Ollama Fundpoint';

  @override
  String get ollamaModel => 'Modeli Olama';

  @override
  String get openAiEndpoint => 'OpenAI Fundpoint';

  @override
  String get openAiApiKey => 'Çelësi OpenAI API';

  @override
  String get openAiModel => 'Modeli OpenAI';

  @override
  String get geminiEndpoint => 'Pika fundore e Binjakëve';

  @override
  String get geminiApiKey => 'Çelësi i API-së Gemini';

  @override
  String get geminiModel => 'Modelet e Binjakëve';

  @override
  String get anthropicEndpoint => 'Pika përfundimtare antropike';

  @override
  String get anthropicApiKey => 'Çelësi Antropik API';

  @override
  String get anthropicModel => 'Modeli Antropik';

  @override
  String get customProtocol => 'Protokolli i personalizuar';

  @override
  String get protocol => 'Protokolli';

  @override
  String get customEndpoint => 'Pika përfundimtare e personalizuar';

  @override
  String get customApiKey => 'Çelësi i personalizuar API';

  @override
  String get customModel => 'Modeli i personalizuar';

  @override
  String get optionalForLocalServers =>
      'Opsionale për serverët lokalë/me porosi';

  @override
  String get speechRecognitionEngine => 'Motori i njohjes së të folurit';

  @override
  String get local => 'Lokale';

  @override
  String get endpoint => 'Pika përfundimtare';

  @override
  String get localSpeechModel => 'Modeli lokal i të folurit';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (në pajisje)';

  @override
  String get systemSpeechRecognition => 'Sistemi i njohjes së të folurit';

  @override
  String get systemRecognitionAndroidIos => 'Njohja e sistemit (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Njohja e pikës fundore (Cloud/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Përdorni njohësin e integruar të Android / iOS (mund të përdorni renë kompjuterike)';

  @override
  String get voiceAiEndpoint =>
      'Pika përfundimtare e inteligjencës artificiale zanore';

  @override
  String get embeddingModel => 'Modeli i ngulitjes';

  @override
  String get crossDeviceSync => 'Sinkronizimi ndërmjet pajisjeve';

  @override
  String get sendToOtherDevices => 'Dërgo në pajisje të tjera (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Eksporto kopje rezervë dhe dërgo përmes fletës së ndarjes';

  @override
  String get importFromLocalSend => 'Importo nga LocalSend';

  @override
  String get selectBackupJson =>
      'Zgjidhni JSON rezervë dhe bashkoni të dhënat lokale';

  @override
  String get autoGeneration => 'Gjenerimi automatik';

  @override
  String get autoGenerateSummary => 'Përmbledhja e gjenerimit automatik';

  @override
  String get generateAiSummaryForNewEntries =>
      'Gjeneroni përmbledhjen e AI për hyrjet e reja';

  @override
  String get autoGenerateEmbedding => 'Auto Generate Embedding';

  @override
  String get generateVectorEmbedding => 'Krijo ngulitje vektoriale për kërkim';

  @override
  String get enableNetworkSearch => 'Aktivizo Kërkimin në Rrjet';

  @override
  String get allowOnlineRetrieval =>
      'Lejo rikthimin në internet për kërkimin dhe bisedën me AI (i çaktivizuar si parazgjedhje)';

  @override
  String get about => 'Rreth';

  @override
  String version(String version) {
    return 'Versioni $version';
  }

  @override
  String get database => 'Baza e të dhënave';

  @override
  String get objectBoxWithHnsw => 'ObjectBox me indeks HNSW';

  @override
  String get logOut => 'Dilni';

  @override
  String get custom => 'Me porosi';

  @override
  String get openAiCompatible => 'E përputhshme me OpenAI';

  @override
  String get notSet => 'Nuk është vendosur';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... or http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Mbështet pikat fundore lokale/LAN/publike';

  @override
  String get shiguangLocalSendBackup => 'Rezervimi i Shiguang LocalSend';

  @override
  String get localBackupFromShiguang =>
      'Rezervimi lokal nga Shiguang (merr nëpërmjet LocalSend)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Zgjidhni skedarin rezervë të marrë nga LocalSend';

  @override
  String get failedToResolveFilePath =>
      'Zgjidhja e shtegut të skedarit të zgjedhur dështoi';

  @override
  String get importOptions => 'Opsionet e importit';

  @override
  String get importSettingsAsWell =>
      'Të importohen edhe cilësimet?\n(Çelësat API nuk do të mbishkruhen)';

  @override
  String get dataOnly => 'Vetëm të dhëna';

  @override
  String get dataAndSettings => 'Të dhënat + Cilësimet';

  @override
  String get importCompleted => 'Importi përfundoi';

  @override
  String get settingsInBackupWereApplied =>
      'Janë aplikuar cilësimet në kopje rezervë.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Cilësimet në rezervë nuk u zbatuan.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Anulo';

  @override
  String get save => 'Ruaj';

  @override
  String get delete => 'Fshije';

  @override
  String get clear => 'E qartë';

  @override
  String get add => 'Shtoni';

  @override
  String get create => 'Krijo';

  @override
  String get edit => 'Redakto';

  @override
  String get search => 'Kërko';

  @override
  String get areYouSureYouWantToLogOut =>
      'Jeni i sigurt që dëshironi të dilni?';

  @override
  String get chooseLanguage => 'Zgjidhni gjuhën';

  @override
  String get databaseInfo => 'Informacion mbi bazën e të dhënave';

  @override
  String get storage => 'Ruajtja: ObjectBox';

  @override
  String get vectorIndex => 'Indeksi i Vektorit: HNSW';

  @override
  String get dimensions => 'Përmasat: 384';

  @override
  String get embeddingModelBge => 'Embedding Model: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Bëj foto';

  @override
  String get chooseFromGallery => 'Zgjidhni nga Galeria';

  @override
  String get editNickname => 'Redakto pseudonimin';

  @override
  String get enterNickname => 'Fut pseudonimin';

  @override
  String get pleaseEnterNickname => 'Ju lutemi shkruani një pseudonim';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Pseudonimi ekziston tashmë ose është i pavlefshëm';

  @override
  String get user => 'Përdoruesi';

  @override
  String get manageScheduledReminders =>
      'Menaxho rikujtuesit dhe alarmet e planifikuara';

  @override
  String get imageFailedToLoad =>
      'Imazhi nuk u ngarkua. Ju lutemi zgjidhni përsëri.';

  @override
  String get imageIsStillLoading => 'Imazhi është ende duke u ngarkuar';

  @override
  String get imageAreaNotReady =>
      'Zona e imazhit nuk është gati. Ju lutemi provoni përsëri.';

  @override
  String get cropFrameNotReady =>
      'Korniza e prerjes nuk është gati. Ju lutemi provoni përsëri.';

  @override
  String get invalidCropArea =>
      'Zonë e pavlefshme e prerjes. Ju lutemi provoni përsëri.';

  @override
  String get cropFailed => 'Prerja dështoi. Ju lutemi provoni përsëri.';

  @override
  String get cropAvatar => 'Pritini avatarin';

  @override
  String get chooseAgain => 'Zgjidhni Përsëri';

  @override
  String get rotate90 => 'Rrotulloni 90°';

  @override
  String get dragFrameToMove =>
      'Zvarritni kornizën për të lëvizur, zvarriteni poshtë-djathtas për të ndryshuar madhësinë; kapni për të zmadhuar dhe lëvizur imazhin.';

  @override
  String get pleaseFillInAllFields => 'Ju lutemi plotësoni të gjitha fushat';

  @override
  String get pinMustBeAtLeast4Digits =>
      'Kodi PIN duhet të jetë të paktën 4 shifror';

  @override
  String get pinAtLeast4Digits => 'Kodi PIN duhet të jetë të paktën 4 shifror';

  @override
  String get invalidUsernameOrPin => 'Emër përdoruesi ose PIN i pavlefshëm';

  @override
  String get invalidUsernameOrPinError =>
      'Emër përdoruesi ose PIN i pavlefshëm';

  @override
  String get usernameAlreadyExists => 'Emri i përdoruesit ekziston tashmë';

  @override
  String get captureMomentsKeepMemories => 'Kapni momente, mbani kujtime';

  @override
  String get username => 'Emri i përdoruesit';

  @override
  String get pin => 'PIN';

  @override
  String get login => 'Identifikohu';

  @override
  String get createAccount => 'Krijo llogari';

  @override
  String get dontHaveAccountCreateOne => 'Nuk keni një llogari? Krijo një';

  @override
  String get alreadyHaveAccountLogin => 'Keni tashmë një llogari? Identifikohu';

  @override
  String get pleaseEnterUsername => 'Ju lutemi shkruani një emër përdoruesi';

  @override
  String get pinsDoNotMatch => 'PIN-et nuk përputhen';

  @override
  String get tapToAddAvatar => 'Trokit për të shtuar avatar';

  @override
  String get yourName => 'Emri juaj';

  @override
  String get privatePinOptional => 'PIN privat (opsionale)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Përdoret për të enkriptuar të dhënat private';

  @override
  String get privatePin => 'PIN-i privat';

  @override
  String get leaveEmptyForNoEncryption => 'Lëreni bosh pa enkriptim';

  @override
  String get confirmPin => 'Konfirmo PIN-in';

  @override
  String get getStarted => 'Filloni';

  @override
  String get noReminders => 'Asnjë kujtesë';

  @override
  String get addReminder => 'Shto kujtesë';

  @override
  String get title => 'Titulli';

  @override
  String get descriptionOptional => 'Përshkrimi (opsionale)';

  @override
  String get microphonePermissionRequired => 'Kërkohet leja e mikrofonit';

  @override
  String get aiAssistant => 'Asistent i AI';

  @override
  String get listening => 'Duke dëgjuar...';

  @override
  String get typeAMessage => 'Shkruani një mesazh...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Filloni një bisedë';

  @override
  String get typeYourMessage => 'Shkruani mesazhin tuaj...';

  @override
  String get asrReconnecting => 'ASR po rilidhet...';

  @override
  String get write => 'Shkruani';

  @override
  String get writeEntry => 'Shkruani hyrjen';

  @override
  String get noMemoriesYet => 'Ende nuk ka kujtime';

  @override
  String get tapPlusToCapture => 'Prekni + për të kapur mendimet tuaja';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Prekni + për të kapur mendimet tuaja';

  @override
  String get deleteMemory => 'Fshi Memory';

  @override
  String get deleteRecord => 'Fshi regjistrimin';

  @override
  String get thisEntryWillBeRemoved =>
      'Kjo hyrje do të hiqet nga kronologjia juaj.';

  @override
  String get thisRecordWillBeRemoved =>
      'Ky regjistrim do të hiqet nga kronologjia juaj.';

  @override
  String get searchYourRecords => 'Kërkoni të dhënat tuaja...';

  @override
  String get exactMatches => 'Ndeshjet e sakta';

  @override
  String get noExactMatches => 'Nuk ka ndeshje të sakta';

  @override
  String get exact => 'E saktë';

  @override
  String get exactMatch => 'Përputhje e saktë';

  @override
  String get fuzzyMatches => 'Ndeshjet e paqarta';

  @override
  String get noFuzzyMatches => 'Nuk ka ndeshje të paqarta';

  @override
  String get vectorMatch => 'Përputhje vektoriale';

  @override
  String get networkMatches => 'Ndeshjet e rrjetit';

  @override
  String get noNetworkMatches => 'Nuk ka përputhje rrjeti';

  @override
  String get networkSearchIsOff =>
      'Kërkimi në rrjet është joaktiv. Aktivizojeni atë te \"Cilësimet\".';

  @override
  String get network => 'Rrjeti';

  @override
  String get networkMatch => 'Përputhja e rrjetit';

  @override
  String get noSearchHistory => 'Nuk ka histori kërkimi';

  @override
  String get searchHistory => 'Historia e Kërkimit';

  @override
  String get invalidLink => 'Lidhje e pavlefshme';

  @override
  String get unableToOpenWebPage => 'Faqja e internetit nuk mund të hapet';

  @override
  String get imageMemory => '[Kujtesa e imazhit]';

  @override
  String get tapToOpenWebPage => 'Prekni për të hapur faqen e internetit';

  @override
  String get editEntry => 'Redakto hyrjen';

  @override
  String get entryDetails => 'Detajet e hyrjes';

  @override
  String get noContent => 'Nuk ka përmbajtje';

  @override
  String get diaryNotFound => 'Ditari nuk u gjet';

  @override
  String get diaryNotFoundShort => 'Regjistrimi nuk u gjet';

  @override
  String get aiSummary => 'Përmbledhja e AI';

  @override
  String get microphoneInterrupted =>
      'Mikrofoni u ndërpre, regjistrimi u ndal.';

  @override
  String get bold => 'E guximshme';

  @override
  String get italic => 'Kursivë';

  @override
  String get strikethrough => 'Strikethrough';

  @override
  String get image => 'Imazhi';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR nuk disponohet. Regjistrimi është ende aktiv.';

  @override
  String get writeYourEntry => 'Shkruani hyrjen tuaj...';

  @override
  String get writeYourContent => 'Shkruani përmbajtjen tuaj...';

  @override
  String microphoneStartFailed(String error) {
    return 'Nisja e mikrofonit dështoi: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofoni u ndërpre, regjistrimi u ndal.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR rilidhja: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Imazhi i futur: $name';
  }

  @override
  String voiceError(String error) {
    return 'Gabim zëri: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Na vjen keq, shërbimi i AI nuk është aktualisht i disponueshëm: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Ndarja dështoi: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count goditje';
  }

  @override
  String matchCount(int count) {
    return 'Ndeshja: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Burimi: $source';
  }

  @override
  String get createNew => 'Krijo';

  @override
  String micStartFailed(String error) {
    return 'Nisja e mikrofonit dështoi: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Llogaritë: +$created / përditësuar $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Ditarët: +$created / përditësuar $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Përkujtues: +$created / përditësuar $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'U anashkalua: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Gjithsej i ndryshuar: $count';
  }

  @override
  String get settingsApplied => 'Janë aplikuar cilësimet në kopje rezervë.';

  @override
  String get settingsNotApplied => 'Cilësimet në rezervë nuk u zbatuan.';

  @override
  String backupExported(String path) {
    return 'Rezervimi u eksportua: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Eksporti dështoi: $error';
  }

  @override
  String importFailed(String error) {
    return 'Importi dështoi: $error';
  }
}

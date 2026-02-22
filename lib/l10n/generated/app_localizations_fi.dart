// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get languageName => 'Suomi';

  @override
  String get languageNameEn => 'Finnish';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Asetukset';

  @override
  String get account => 'Tili';

  @override
  String get reminders => 'Muistutukset';

  @override
  String get language => 'Kieli';

  @override
  String get appLanguage => 'Sovelluksen kieli';

  @override
  String get appearance => 'Ulkonäkö';

  @override
  String get themeMode => 'Teematila';

  @override
  String get dark => 'Tumma';

  @override
  String get light => 'Kevyt';

  @override
  String get system => 'Järjestelmä';

  @override
  String get aiService => 'AI-palvelu';

  @override
  String get aiChatProvider => 'AI Chat Provider';

  @override
  String get chatModel => 'Chat-malli';

  @override
  String get localModel => 'Paikallinen malli';

  @override
  String get localModelDefault => 'Paikallinen malli (oletus)';

  @override
  String get ollamaEndpoint => 'Ollaman päätepiste';

  @override
  String get ollamaModel => 'Ollama malli';

  @override
  String get openAiEndpoint => 'OpenAI-päätepiste';

  @override
  String get openAiApiKey => 'OpenAI API-avain';

  @override
  String get openAiModel => 'OpenAI malli';

  @override
  String get geminiEndpoint => 'Gemini päätepiste';

  @override
  String get geminiApiKey => 'Gemini API-avain';

  @override
  String get geminiModel => 'Gemini mallit';

  @override
  String get anthropicEndpoint => 'Antrooppinen päätepiste';

  @override
  String get anthropicApiKey => 'Antrooppinen API-avain';

  @override
  String get anthropicModel => 'Antrooppinen malli';

  @override
  String get customProtocol => 'Mukautettu protokolla';

  @override
  String get protocol => 'pöytäkirja';

  @override
  String get customEndpoint => 'Mukautettu päätepiste';

  @override
  String get customApiKey => 'Mukautettu API-avain';

  @override
  String get customModel => 'Mukautettu malli';

  @override
  String get optionalForLocalServers =>
      'Valinnainen paikallisille/muokatuille palvelimille';

  @override
  String get speechRecognitionEngine => 'Puheentunnistusmoottori';

  @override
  String get local => 'Paikallinen';

  @override
  String get endpoint => 'Päätepiste';

  @override
  String get localSpeechModel => 'Paikallinen puhemalli';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (laitteessa)';

  @override
  String get systemSpeechRecognition => 'Järjestelmän puheentunnistus';

  @override
  String get systemRecognitionAndroidIos =>
      'Järjestelmän tunnistus (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Päätepisteen tunnistus (pilvi/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Käytä sisäänrakennettua Android/iOS-tunnistinta (voi käyttää pilvipalvelua)';

  @override
  String get voiceAiEndpoint => 'Voice AI -päätepiste';

  @override
  String get embeddingModel => 'Upotusmalli';

  @override
  String get crossDeviceSync => 'Laitteiden välinen synkronointi';

  @override
  String get sendToOtherDevices => 'Lähetä muihin laitteisiin (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Vie varmuuskopio ja lähetä jakoarkin kautta';

  @override
  String get importFromLocalSend => 'Tuo LocalSendistä';

  @override
  String get selectBackupJson =>
      'Valitse varmuuskopio JSON ja yhdistä paikalliset tiedot';

  @override
  String get autoGeneration => 'Automaattinen sukupolvi';

  @override
  String get autoGenerateSummary => 'Luo yhteenveto automaattisesti';

  @override
  String get generateAiSummaryForNewEntries =>
      'Luo tekoälyn yhteenveto uusille merkinnöille';

  @override
  String get autoGenerateEmbedding => 'Luo upottaminen automaattisesti';

  @override
  String get generateVectorEmbedding => 'Luo vektori upotus hakua varten';

  @override
  String get enableNetworkSearch => 'Ota verkkohaku käyttöön';

  @override
  String get allowOnlineRetrieval =>
      'Salli online-haku haulle ja tekoälykeskusteluille (oletuksena pois päältä)';

  @override
  String get about => 'Noin';

  @override
  String version(String version) {
    return 'Versio $version';
  }

  @override
  String get database => 'Tietokanta';

  @override
  String get objectBoxWithHnsw => 'ObjectBox HNSW-indeksillä';

  @override
  String get logOut => 'Kirjaudu ulos';

  @override
  String get custom => 'Mukautettu';

  @override
  String get openAiCompatible => 'OpenAI-yhteensopiva';

  @override
  String get notSet => 'Ei asetettu';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... tai http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Tukee paikallisia/LAN/julkisia päätepisteitä';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend varmuuskopio';

  @override
  String get localBackupFromShiguang =>
      'Paikallinen varmuuskopio Shiguangista (vastaanota LocalSendin kautta)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Valitse LocalSendistä vastaanotettu varmuuskopiotiedosto';

  @override
  String get failedToResolveFilePath =>
      'Valitun tiedostopolun selvittäminen epäonnistui';

  @override
  String get importOptions => 'Tuontiasetukset';

  @override
  String get importSettingsAsWell =>
      'Tuodaanko myös asetukset?\n(API-avaimia ei korvata)';

  @override
  String get dataOnly => 'Vain tiedot';

  @override
  String get dataAndSettings => 'Data + Asetukset';

  @override
  String get importCompleted => 'Tuonti valmis';

  @override
  String get settingsInBackupWereApplied =>
      'Varmuuskopion asetukset otettiin käyttöön.';

  @override
  String get settingsInBackupWereNotApplied =>
      'Varmuuskopion asetuksia ei käytetty.';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Peruuttaa';

  @override
  String get save => 'Tallentaa';

  @override
  String get delete => 'Poistaa';

  @override
  String get clear => 'Selkeä';

  @override
  String get add => 'Lisätä';

  @override
  String get create => 'Luoda';

  @override
  String get edit => 'Muokata';

  @override
  String get search => 'Haku';

  @override
  String get areYouSureYouWantToLogOut => 'Haluatko varmasti kirjautua ulos?';

  @override
  String get chooseLanguage => 'Valitse Kieli';

  @override
  String get databaseInfo => 'Tietokannan tiedot';

  @override
  String get storage => 'Tallennus: ObjectBox';

  @override
  String get vectorIndex => 'Vektoriindeksi: HNSW';

  @override
  String get dimensions => 'Mitat: 384';

  @override
  String get embeddingModelBge => 'Upotusmalli: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Ota valokuva';

  @override
  String get chooseFromGallery => 'Valitse Galleriasta';

  @override
  String get editNickname => 'Muokkaa lempinimeä';

  @override
  String get enterNickname => 'Anna lempinimi';

  @override
  String get pleaseEnterNickname => 'Anna lempinimi';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'Lempinimi on jo olemassa tai se on virheellinen';

  @override
  String get user => 'Käyttäjä';

  @override
  String get manageScheduledReminders =>
      'Hallitse ajoitettuja muistutuksia ja hälytyksiä';

  @override
  String get imageFailedToLoad =>
      'Kuvan lataaminen epäonnistui. Valitse uudelleen.';

  @override
  String get imageIsStillLoading => 'Kuva latautuu edelleen';

  @override
  String get imageAreaNotReady => 'Kuva-alue ei ole valmis. Yritä uudelleen.';

  @override
  String get cropFrameNotReady => 'Rajauskehys ei ole valmis. Yritä uudelleen.';

  @override
  String get invalidCropArea => 'Virheellinen rajausalue. Yritä uudelleen.';

  @override
  String get cropFailed => 'Rajaus epäonnistui. Yritä uudelleen.';

  @override
  String get cropAvatar => 'Rajaa Avatar';

  @override
  String get chooseAgain => 'Valitse uudelleen';

  @override
  String get rotate90 => 'Kierrä 90°';

  @override
  String get dragFrameToMove =>
      'Siirrä kehystä vetämällä, muuta kokoa vetämällä alaoikealle. nipistämällä voit zoomata ja siirtää kuvaa.';

  @override
  String get pleaseFillInAllFields => 'Täytä kaikki kentät';

  @override
  String get pinMustBeAtLeast4Digits =>
      'PIN-koodissa on oltava vähintään 4 numeroa';

  @override
  String get pinAtLeast4Digits => 'PIN-koodissa on oltava vähintään 4 numeroa';

  @override
  String get invalidUsernameOrPin => 'Virheellinen käyttäjänimi tai PIN-koodi';

  @override
  String get invalidUsernameOrPinError =>
      'Virheellinen käyttäjänimi tai PIN-koodi';

  @override
  String get usernameAlreadyExists => 'Käyttäjätunnus on jo olemassa';

  @override
  String get captureMomentsKeepMemories => 'Ikuista hetkiä, säilytä muistoja';

  @override
  String get username => 'Käyttäjätunnus';

  @override
  String get pin => 'PIN-koodi';

  @override
  String get login => 'Kirjaudu sisään';

  @override
  String get createAccount => 'Luo tili';

  @override
  String get dontHaveAccountCreateOne =>
      'Eikö sinulla ole tiliä? Luo sellainen';

  @override
  String get alreadyHaveAccountLogin => 'Onko sinulla jo tili? Kirjaudu sisään';

  @override
  String get pleaseEnterUsername => 'Anna käyttäjänimi';

  @override
  String get pinsDoNotMatch => 'PIN-koodit eivät täsmää';

  @override
  String get tapToAddAvatar => 'Lisää avatar napauttamalla';

  @override
  String get yourName => 'Nimesi';

  @override
  String get privatePinOptional => 'Yksityinen PIN-koodi (valinnainen)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Käytetään yksityisten tietueiden salaamiseen';

  @override
  String get privatePin => 'Yksityinen PIN-koodi';

  @override
  String get leaveEmptyForNoEncryption => 'Jätä tyhjäksi, jos et salaa';

  @override
  String get confirmPin => 'Vahvista PIN';

  @override
  String get getStarted => 'Aloita';

  @override
  String get noReminders => 'Ei muistutuksia';

  @override
  String get addReminder => 'Lisää muistutus';

  @override
  String get title => 'Otsikko';

  @override
  String get descriptionOptional => 'Kuvaus (valinnainen)';

  @override
  String get microphonePermissionRequired => 'Mikrofonilupa vaaditaan';

  @override
  String get aiAssistant => 'AI Assistant';

  @override
  String get listening => 'Kuuntelee...';

  @override
  String get typeAMessage => 'Kirjoita viesti...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Aloita keskustelu';

  @override
  String get typeYourMessage => 'Kirjoita viestisi...';

  @override
  String get asrReconnecting => 'ASR yhdistetään uudelleen...';

  @override
  String get write => 'Kirjoittaa';

  @override
  String get writeEntry => 'Kirjoita merkintä';

  @override
  String get noMemoriesYet => 'Ei vielä muistoja';

  @override
  String get tapPlusToCapture => 'Napauta + napauttaaksesi ajatuksesi';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Napauta + napauttaaksesi ajatuksesi';

  @override
  String get deleteMemory => 'Poista muisti';

  @override
  String get deleteRecord => 'Poista tietue';

  @override
  String get thisEntryWillBeRemoved =>
      'Tämä merkintä poistetaan aikajanaltasi.';

  @override
  String get thisRecordWillBeRemoved => 'Tämä tietue poistetaan aikajanaltasi.';

  @override
  String get searchYourRecords => 'Etsi tietueistasi...';

  @override
  String get exactMatches => 'Tarkat ottelut';

  @override
  String get noExactMatches => 'Ei tarkkoja osumia';

  @override
  String get exact => 'Tarkka';

  @override
  String get exactMatch => 'Tarkka ottelu';

  @override
  String get fuzzyMatches => 'Sumeat ottelut';

  @override
  String get noFuzzyMatches => 'Ei sumeita otteluita';

  @override
  String get vectorMatch => 'Vector Match';

  @override
  String get networkMatches => 'Verkko-ottelut';

  @override
  String get noNetworkMatches => 'Verkko ei täsmää';

  @override
  String get networkSearchIsOff =>
      'Verkkohaku on pois päältä. Ota se käyttöön asetuksista.';

  @override
  String get network => 'Verkko';

  @override
  String get networkMatch => 'Network Match';

  @override
  String get noSearchHistory => 'Ei hakuhistoriaa';

  @override
  String get searchHistory => 'Hakuhistoria';

  @override
  String get invalidLink => 'Virheellinen linkki';

  @override
  String get unableToOpenWebPage => 'Verkkosivua ei voi avata';

  @override
  String get imageMemory => '[Kuvamuisti]';

  @override
  String get tapToOpenWebPage => 'Napauta avataksesi verkkosivun';

  @override
  String get editEntry => 'Muokkaa merkintää';

  @override
  String get entryDetails => 'Sisäänpääsyn tiedot';

  @override
  String get noContent => 'Ei sisältöä';

  @override
  String get diaryNotFound => 'Päiväkirjaa ei löydy';

  @override
  String get diaryNotFoundShort => 'Tietuetta ei löydy';

  @override
  String get aiSummary => 'AI yhteenveto';

  @override
  String get microphoneInterrupted =>
      'Mikrofoni keskeytetty, tallennus pysäytetty.';

  @override
  String get bold => 'Lihavoitu';

  @override
  String get italic => 'Kursiivi';

  @override
  String get strikethrough => 'Yliviivattu';

  @override
  String get image => 'Kuva';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR ei ole saatavilla. Tallennus on edelleen aktiivinen.';

  @override
  String get voiceListening => 'Listening...';

  @override
  String get tapToStartVoice => 'Tap to start voice input';

  @override
  String get writeYourEntry => 'Kirjoita kirjoituksesi...';

  @override
  String get writeYourContent => 'Kirjoita sisältösi...';

  @override
  String microphoneStartFailed(String error) {
    return 'Mikrofonin käynnistys epäonnistui: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'Mikrofoni keskeytetty, tallennus pysäytetty.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR-yhteys muodostetaan uudelleen: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Lisätty kuva: $name';
  }

  @override
  String voiceError(String error) {
    return 'Äänivirhe: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Anteeksi, tekoälypalvelu ei ole tällä hetkellä saatavilla: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Jakaminen epäonnistui: $error';
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
    return '$matchType · $count osumaa';
  }

  @override
  String matchCount(int count) {
    return 'Ottelu: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Lähde: $source';
  }

  @override
  String get createNew => 'Luoda';

  @override
  String micStartFailed(String error) {
    return 'Mikrofonin käynnistys epäonnistui: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Tilit: +$created / päivitetty $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Päiväkirjat: +$created / päivitetty $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Muistutukset: +$created / päivitetty $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Ohitettu: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Muutoksia yhteensä: $count';
  }

  @override
  String get settingsApplied => 'Varmuuskopion asetukset otettiin käyttöön.';

  @override
  String get settingsNotApplied => 'Varmuuskopion asetuksia ei käytetty.';

  @override
  String backupExported(String path) {
    return 'Varmuuskopio viety: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Vienti epäonnistui: $error';
  }

  @override
  String importFailed(String error) {
    return 'Tuonti epäonnistui: $error';
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

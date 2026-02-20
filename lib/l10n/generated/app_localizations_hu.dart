// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get languageName => 'Magyar';

  @override
  String get languageNameEn => 'Hungarian';

  @override
  String get appTitle => 'Shiguang';

  @override
  String get settings => 'Beállítások elemre';

  @override
  String get account => 'fiók';

  @override
  String get reminders => 'Emlékeztetők';

  @override
  String get language => 'Nyelv';

  @override
  String get appLanguage => 'Alkalmazás nyelve';

  @override
  String get appearance => 'Megjelenés';

  @override
  String get themeMode => 'Téma mód';

  @override
  String get dark => 'Sötét';

  @override
  String get light => 'Fény';

  @override
  String get system => 'Rendszer';

  @override
  String get aiService => 'AI szolgáltatás';

  @override
  String get aiChatProvider => 'AI Chat Provider';

  @override
  String get chatModel => 'Chat modell';

  @override
  String get localModel => 'Helyi modell';

  @override
  String get localModelDefault => 'Helyi modell (alapértelmezett)';

  @override
  String get ollamaEndpoint => 'Ollama végpont';

  @override
  String get ollamaModel => 'Ollama modell';

  @override
  String get openAiEndpoint => 'OpenAI végpont';

  @override
  String get openAiApiKey => 'OpenAI API kulcs';

  @override
  String get openAiModel => 'OpenAI modell';

  @override
  String get geminiEndpoint => 'Gemini végpont';

  @override
  String get geminiApiKey => 'Gemini API kulcs';

  @override
  String get geminiModel => 'Gemini modellek';

  @override
  String get anthropicEndpoint => 'Antropikus végpont';

  @override
  String get anthropicApiKey => 'Antropikus API kulcs';

  @override
  String get anthropicModel => 'Antropikus modell';

  @override
  String get customProtocol => 'Egyéni protokoll';

  @override
  String get protocol => 'Jegyzőkönyv';

  @override
  String get customEndpoint => 'Egyéni végpont';

  @override
  String get customApiKey => 'Egyéni API-kulcs';

  @override
  String get customModel => 'Egyedi modell';

  @override
  String get optionalForLocalServers => 'Opcionális helyi/egyéni szerverekhez';

  @override
  String get speechRecognitionEngine => 'Beszédfelismerő motor';

  @override
  String get local => 'Helyi';

  @override
  String get endpoint => 'Végpont';

  @override
  String get localSpeechModel => 'Helyi beszédmodell';

  @override
  String get senseVoiceOnnx => 'SenseVoice ONNX (eszközön)';

  @override
  String get systemSpeechRecognition => 'Rendszerbeszédfelismerés';

  @override
  String get systemRecognitionAndroidIos => 'Rendszerfelismerés (Android/iOS)';

  @override
  String get endpointRecognitionCloudWs => 'Végpont felismerés (felhő/WS)';

  @override
  String get useBuiltInRecognizer =>
      'Használja a beépített Android / iOS felismerőt (felhőt használhat)';

  @override
  String get voiceAiEndpoint => 'Voice AI végpont';

  @override
  String get embeddingModel => 'Modell beágyazása';

  @override
  String get crossDeviceSync => 'Eszközök közötti szinkronizálás';

  @override
  String get sendToOtherDevices => 'Küldés más eszközökre (LocalSend)';

  @override
  String get exportBackupAndSend =>
      'Exportálja a biztonsági másolatot és küldje el megosztási lapon keresztül';

  @override
  String get importFromLocalSend => 'Importálás a LocalSendből';

  @override
  String get selectBackupJson =>
      'Válassza ki a biztonsági mentési JSON-t, és egyesítse a helyi adatokat';

  @override
  String get autoGeneration => 'Automatikus generálás';

  @override
  String get autoGenerateSummary => 'Összegzés automatikus generálása';

  @override
  String get generateAiSummaryForNewEntries =>
      'AI összefoglaló létrehozása az új bejegyzésekhez';

  @override
  String get autoGenerateEmbedding => 'Beágyazás automatikus generálása';

  @override
  String get generateVectorEmbedding =>
      'Vektoros beágyazás létrehozása kereséshez';

  @override
  String get enableNetworkSearch => 'Hálózati keresés engedélyezése';

  @override
  String get allowOnlineRetrieval =>
      'Online visszakeresés engedélyezése a kereséshez és az AI-csevegéshez (alapértelmezés szerint ki van kapcsolva)';

  @override
  String get about => 'Körülbelül';

  @override
  String version(String version) {
    return '$version verzió';
  }

  @override
  String get database => 'Adatbázis';

  @override
  String get objectBoxWithHnsw => 'ObjectBox HNSW indexszel';

  @override
  String get logOut => 'Jelentkezzen ki';

  @override
  String get custom => 'Szokás';

  @override
  String get openAiCompatible => 'OpenAI kompatibilis';

  @override
  String get notSet => 'Nincs beállítva';

  @override
  String get ws1270018008OrHttp12700111434 =>
      'ws://127.0.0.1:8008/... vagy http://127.0.0.1:11434';

  @override
  String get supportsLocalLanPublic =>
      'Támogatja a helyi/LAN/nyilvános végpontokat';

  @override
  String get shiguangLocalSendBackup => 'Shiguang LocalSend biztonsági mentés';

  @override
  String get localBackupFromShiguang =>
      'Helyi biztonsági mentés a Shiguangtól (vétel a LocalSend szolgáltatáson keresztül)';

  @override
  String get selectBackupFileFromLocalSend =>
      'Válassza ki a LocalSendtől kapott biztonsági mentési fájlt';

  @override
  String get failedToResolveFilePath =>
      'Nem sikerült feloldani a kiválasztott fájl elérési útját';

  @override
  String get importOptions => 'Importálási beállítások';

  @override
  String get importSettingsAsWell =>
      'Importálja a beállításokat is?\n(Az API kulcsok nem kerülnek felülírásra)';

  @override
  String get dataOnly => 'Csak adatok';

  @override
  String get dataAndSettings => 'Adatok + Beállítások';

  @override
  String get importCompleted => 'Az importálás befejeződött';

  @override
  String get settingsInBackupWereApplied =>
      'A biztonsági mentés beállításai alkalmazva lettek.';

  @override
  String get settingsInBackupWereNotApplied =>
      'A biztonsági mentés beállításai nem lettek alkalmazva.';

  @override
  String get ok => 'RENDBEN';

  @override
  String get cancel => 'Mégse';

  @override
  String get save => 'Megtakarítás';

  @override
  String get delete => 'Töröl';

  @override
  String get clear => 'Világos';

  @override
  String get add => 'Hozzáadás';

  @override
  String get create => 'Teremt';

  @override
  String get edit => 'Szerkesztés';

  @override
  String get search => 'Keresés';

  @override
  String get areYouSureYouWantToLogOut => 'Biztos, hogy ki akar jelentkezni?';

  @override
  String get chooseLanguage => 'Válassza a Nyelv lehetőséget';

  @override
  String get databaseInfo => 'Adatbázis Info';

  @override
  String get storage => 'Tárolás: ObjectBox';

  @override
  String get vectorIndex => 'Vektor index: HNSW';

  @override
  String get dimensions => 'Méretek: 384';

  @override
  String get embeddingModelBge => 'Beágyazási modell: bge-small-zh-v1.5';

  @override
  String get takePhoto => 'Fotó készítése';

  @override
  String get chooseFromGallery => 'Válasszon a Galériából';

  @override
  String get editNickname => 'Becenév szerkesztése';

  @override
  String get enterNickname => 'Adja meg a becenevet';

  @override
  String get pleaseEnterNickname => 'Kérjük, adjon meg egy becenevet';

  @override
  String get nicknameAlreadyExistsOrInvalid =>
      'A becenév már létezik vagy érvénytelen';

  @override
  String get user => 'Felhasználó';

  @override
  String get manageScheduledReminders =>
      'Az ütemezett emlékeztetők és riasztások kezelése';

  @override
  String get imageFailedToLoad =>
      'Nem sikerült betölteni a képet. Kérjük, válasszon újra.';

  @override
  String get imageIsStillLoading => 'A kép még mindig betöltődik';

  @override
  String get imageAreaNotReady =>
      'A képterület nem áll készen. Kérjük, próbálja újra.';

  @override
  String get cropFrameNotReady =>
      'A vágási keret nincs készen. Kérjük, próbálja újra.';

  @override
  String get invalidCropArea =>
      'Érvénytelen bevetési terület. Kérjük, próbálja újra.';

  @override
  String get cropFailed => 'A kivágás nem sikerült. Kérjük, próbálja újra.';

  @override
  String get cropAvatar => 'Crop Avatar';

  @override
  String get chooseAgain => 'Válassza újra';

  @override
  String get rotate90 => '90°-kal elforgatni';

  @override
  String get dragFrameToMove =>
      'Húzza a keretet a mozgatáshoz, húzza jobbra lent az átméretezéshez; csípje össze a kép nagyításához és mozgatásához.';

  @override
  String get pleaseFillInAllFields => 'Kérjük, töltse ki az összes mezőt';

  @override
  String get pinMustBeAtLeast4Digits =>
      'A PIN-kódnak legalább 4 számjegyből kell állnia';

  @override
  String get pinAtLeast4Digits =>
      'A PIN-kódnak legalább 4 számjegyből kell állnia';

  @override
  String get invalidUsernameOrPin => 'Érvénytelen felhasználónév vagy PIN-kód';

  @override
  String get invalidUsernameOrPinError =>
      'Érvénytelen felhasználónév vagy PIN-kód';

  @override
  String get usernameAlreadyExists => 'A felhasználónév már létezik';

  @override
  String get captureMomentsKeepMemories =>
      'Ragadja meg a pillanatokat, őrizze meg az emlékeket';

  @override
  String get username => 'Felhasználónév';

  @override
  String get pin => 'PIN kód';

  @override
  String get login => 'Bejelentkezés';

  @override
  String get createAccount => 'Fiók létrehozása';

  @override
  String get dontHaveAccountCreateOne => 'Nincs fiókja? Hozzon létre egyet';

  @override
  String get alreadyHaveAccountLogin => 'Már van fiókja? Bejelentkezés';

  @override
  String get pleaseEnterUsername => 'Kérjük, adjon meg egy felhasználónevet';

  @override
  String get pinsDoNotMatch => 'A PIN-kódok nem egyeznek';

  @override
  String get tapToAddAvatar => 'Koppintson az avatar hozzáadásához';

  @override
  String get yourName => 'Az Ön neve';

  @override
  String get privatePinOptional => 'Privát PIN (nem kötelező)';

  @override
  String get usedToEncryptPrivateRecords =>
      'Privát rekordok titkosítására szolgál';

  @override
  String get privatePin => 'Privát PIN-kód';

  @override
  String get leaveEmptyForNoEncryption => 'Hagyja üresen, ha nincs titkosítás';

  @override
  String get confirmPin => 'Erősítse meg a PIN kódot';

  @override
  String get getStarted => 'Kezdje el';

  @override
  String get noReminders => 'Nincsenek emlékeztetők';

  @override
  String get addReminder => 'Emlékeztető hozzáadása';

  @override
  String get title => 'Cím';

  @override
  String get descriptionOptional => 'Leírás (nem kötelező)';

  @override
  String get microphonePermissionRequired => 'Mikrofon engedély szükséges';

  @override
  String get aiAssistant => 'AI asszisztens';

  @override
  String get listening => 'Hallgat...';

  @override
  String get typeAMessage => 'Írjon be egy üzenetet...';

  @override
  String get aiChat => 'AI Chat';

  @override
  String get startAConversation => 'Indítson el egy beszélgetést';

  @override
  String get typeYourMessage => 'Írja be üzenetét...';

  @override
  String get asrReconnecting => 'ASR újracsatlakozás...';

  @override
  String get write => 'Írj';

  @override
  String get writeEntry => 'Bejegyzés írása';

  @override
  String get noMemoriesYet => 'Még nincsenek emlékek';

  @override
  String get tapPlusToCapture =>
      'Koppintson a + gombra a gondolatok rögzítéséhez';

  @override
  String get tapPlusToCaptureYourThoughts =>
      'Koppintson a + gombra a gondolatok rögzítéséhez';

  @override
  String get deleteMemory => 'Memória törlése';

  @override
  String get deleteRecord => 'Rekord törlése';

  @override
  String get thisEntryWillBeRemoved =>
      'Ez a bejegyzés törlődik az idővonaláról.';

  @override
  String get thisRecordWillBeRemoved =>
      'Ezt a rekordot eltávolítjuk az idővonaláról.';

  @override
  String get searchYourRecords => 'Keresés a rekordok között...';

  @override
  String get exactMatches => 'Pontos egyezések';

  @override
  String get noExactMatches => 'Nincsenek pontos egyezések';

  @override
  String get exact => 'Pontos';

  @override
  String get exactMatch => 'Pontos egyezés';

  @override
  String get fuzzyMatches => 'Fuzzy Matches';

  @override
  String get noFuzzyMatches => 'Nincsenek homályos egyezések';

  @override
  String get vectorMatch => 'Vector Match';

  @override
  String get networkMatches => 'Hálózati mérkőzések';

  @override
  String get noNetworkMatches => 'Nincs hálózati egyezés';

  @override
  String get networkSearchIsOff =>
      'A hálózati keresés ki van kapcsolva. Engedélyezze a Beállításokban.';

  @override
  String get network => 'Hálózat';

  @override
  String get networkMatch => 'Network Match';

  @override
  String get noSearchHistory => 'Nincs keresési előzmény';

  @override
  String get searchHistory => 'Keresési előzmények';

  @override
  String get invalidLink => 'Érvénytelen link';

  @override
  String get unableToOpenWebPage => 'Nem lehet megnyitni a weboldalt';

  @override
  String get imageMemory => '[Képmemória]';

  @override
  String get tapToOpenWebPage => 'Koppintson a weboldal megnyitásához';

  @override
  String get editEntry => 'Bejegyzés szerkesztése';

  @override
  String get entryDetails => 'Belépés részletei';

  @override
  String get noContent => 'Nincs tartalom';

  @override
  String get diaryNotFound => 'A napló nem található';

  @override
  String get diaryNotFoundShort => 'A rekord nem található';

  @override
  String get aiSummary => 'AI összefoglaló';

  @override
  String get microphoneInterrupted =>
      'A mikrofon megszakadt, a felvétel leállt.';

  @override
  String get bold => 'Bátor';

  @override
  String get italic => 'Dőlt';

  @override
  String get strikethrough => 'Áthúzott';

  @override
  String get image => 'Kép';

  @override
  String get asrUnavailableRecordingActive =>
      'ASR nem elérhető. A felvétel továbbra is aktív.';

  @override
  String get writeYourEntry => 'Írd meg a bejegyzésedet...';

  @override
  String get writeYourContent => 'Írd meg a tartalmat...';

  @override
  String microphoneStartFailed(String error) {
    return 'Nem sikerült elindítani a mikrofont: $error';
  }

  @override
  String get microphoneInterruptedRecordingStopped =>
      'A mikrofon megszakadt, a felvétel leállt.';

  @override
  String asrReconnectingError(String error) {
    return 'ASR újracsatlakozás: $error';
  }

  @override
  String imageInserted(String name) {
    return 'Kép beszúrva: $name';
  }

  @override
  String voiceError(String error) {
    return 'Hanghiba: $error';
  }

  @override
  String aiServiceUnavailable(String error) {
    return 'Sajnáljuk, az AI szolgáltatás jelenleg nem érhető el: $error';
  }

  @override
  String shareFailed(String error) {
    return 'Nem sikerült megosztani: $error';
  }

  @override
  String searchMatchHits(String matchType, int count) {
    return '$matchType · $count találat';
  }

  @override
  String matchCount(int count) {
    return 'Egyezés: $count';
  }

  @override
  String sourceFromNetwork(String source) {
    return 'Forrás: $source';
  }

  @override
  String get createNew => 'Teremt';

  @override
  String micStartFailed(String error) {
    return 'A mikrofon indítása nem sikerült: $error';
  }

  @override
  String importResultAccounts(int created, int updated) {
    return 'Fiókok: +$created / frissítve $updated';
  }

  @override
  String importResultDiaries(int created, int updated) {
    return 'Naplók: +$created / frissítve $updated';
  }

  @override
  String importResultReminders(int created, int updated) {
    return 'Emlékeztetők: +$created / frissítve $updated';
  }

  @override
  String importResultSkipped(int count) {
    return 'Kihagyva: $count';
  }

  @override
  String importResultTotal(int count) {
    return 'Összes módosítás: $count';
  }

  @override
  String get settingsApplied =>
      'A biztonsági mentés beállításai alkalmazva lettek.';

  @override
  String get settingsNotApplied =>
      'A biztonsági mentés beállításai nem lettek alkalmazva.';

  @override
  String backupExported(String path) {
    return 'Biztonsági másolat exportálva: $path';
  }

  @override
  String exportFailed(String error) {
    return 'Az exportálás sikertelen: $error';
  }

  @override
  String importFailed(String error) {
    return 'Sikertelen importálás: $error';
  }
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  /// App name
  ///
  /// In en, this message translates to:
  /// **'Shiguang'**
  String get appTitle;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @appLanguage.
  ///
  /// In en, this message translates to:
  /// **'App Language'**
  String get appLanguage;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get themeMode;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @aiService.
  ///
  /// In en, this message translates to:
  /// **'AI Service'**
  String get aiService;

  /// No description provided for @aiChatProvider.
  ///
  /// In en, this message translates to:
  /// **'AI Chat Provider'**
  String get aiChatProvider;

  /// No description provided for @chatModel.
  ///
  /// In en, this message translates to:
  /// **'Chat Model'**
  String get chatModel;

  /// No description provided for @localModel.
  ///
  /// In en, this message translates to:
  /// **'Local Model'**
  String get localModel;

  /// No description provided for @localModelDefault.
  ///
  /// In en, this message translates to:
  /// **'Local Model (Default)'**
  String get localModelDefault;

  /// No description provided for @ollamaEndpoint.
  ///
  /// In en, this message translates to:
  /// **'Ollama Endpoint'**
  String get ollamaEndpoint;

  /// No description provided for @ollamaModel.
  ///
  /// In en, this message translates to:
  /// **'Ollama Model'**
  String get ollamaModel;

  /// No description provided for @openAiEndpoint.
  ///
  /// In en, this message translates to:
  /// **'OpenAI Endpoint'**
  String get openAiEndpoint;

  /// No description provided for @openAiApiKey.
  ///
  /// In en, this message translates to:
  /// **'OpenAI API Key'**
  String get openAiApiKey;

  /// No description provided for @openAiModel.
  ///
  /// In en, this message translates to:
  /// **'OpenAI Model'**
  String get openAiModel;

  /// No description provided for @geminiEndpoint.
  ///
  /// In en, this message translates to:
  /// **'Gemini Endpoint'**
  String get geminiEndpoint;

  /// No description provided for @geminiApiKey.
  ///
  /// In en, this message translates to:
  /// **'Gemini API Key'**
  String get geminiApiKey;

  /// No description provided for @geminiModel.
  ///
  /// In en, this message translates to:
  /// **'Gemini Model'**
  String get geminiModel;

  /// No description provided for @anthropicEndpoint.
  ///
  /// In en, this message translates to:
  /// **'Anthropic Endpoint'**
  String get anthropicEndpoint;

  /// No description provided for @anthropicApiKey.
  ///
  /// In en, this message translates to:
  /// **'Anthropic API Key'**
  String get anthropicApiKey;

  /// No description provided for @anthropicModel.
  ///
  /// In en, this message translates to:
  /// **'Anthropic Model'**
  String get anthropicModel;

  /// No description provided for @customProtocol.
  ///
  /// In en, this message translates to:
  /// **'Custom Protocol'**
  String get customProtocol;

  /// No description provided for @protocol.
  ///
  /// In en, this message translates to:
  /// **'Protocol'**
  String get protocol;

  /// No description provided for @customEndpoint.
  ///
  /// In en, this message translates to:
  /// **'Custom Endpoint'**
  String get customEndpoint;

  /// No description provided for @customApiKey.
  ///
  /// In en, this message translates to:
  /// **'Custom API Key'**
  String get customApiKey;

  /// No description provided for @customModel.
  ///
  /// In en, this message translates to:
  /// **'Custom Model'**
  String get customModel;

  /// No description provided for @optionalForLocalServers.
  ///
  /// In en, this message translates to:
  /// **'Optional for local/custom servers'**
  String get optionalForLocalServers;

  /// No description provided for @speechRecognitionEngine.
  ///
  /// In en, this message translates to:
  /// **'Speech Recognition Engine'**
  String get speechRecognitionEngine;

  /// No description provided for @local.
  ///
  /// In en, this message translates to:
  /// **'Local'**
  String get local;

  /// No description provided for @endpoint.
  ///
  /// In en, this message translates to:
  /// **'Endpoint'**
  String get endpoint;

  /// No description provided for @localSpeechModel.
  ///
  /// In en, this message translates to:
  /// **'Local Speech Model'**
  String get localSpeechModel;

  /// No description provided for @senseVoiceOnnx.
  ///
  /// In en, this message translates to:
  /// **'SenseVoice ONNX (on-device)'**
  String get senseVoiceOnnx;

  /// No description provided for @systemSpeechRecognition.
  ///
  /// In en, this message translates to:
  /// **'System Speech Recognition'**
  String get systemSpeechRecognition;

  /// No description provided for @systemRecognitionAndroidIos.
  ///
  /// In en, this message translates to:
  /// **'System Recognition (Android/iOS)'**
  String get systemRecognitionAndroidIos;

  /// No description provided for @endpointRecognitionCloudWs.
  ///
  /// In en, this message translates to:
  /// **'Endpoint Recognition (Cloud/WS)'**
  String get endpointRecognitionCloudWs;

  /// No description provided for @useBuiltInRecognizer.
  ///
  /// In en, this message translates to:
  /// **'Use built-in Android / iOS recognizer (may use cloud)'**
  String get useBuiltInRecognizer;

  /// No description provided for @voiceAiEndpoint.
  ///
  /// In en, this message translates to:
  /// **'Voice AI Endpoint'**
  String get voiceAiEndpoint;

  /// No description provided for @embeddingModel.
  ///
  /// In en, this message translates to:
  /// **'Embedding Model'**
  String get embeddingModel;

  /// No description provided for @crossDeviceSync.
  ///
  /// In en, this message translates to:
  /// **'Cross-Device Sync'**
  String get crossDeviceSync;

  /// No description provided for @sendToOtherDevices.
  ///
  /// In en, this message translates to:
  /// **'Send to Other Devices (LocalSend)'**
  String get sendToOtherDevices;

  /// No description provided for @exportBackupAndSend.
  ///
  /// In en, this message translates to:
  /// **'Export backup and send via share sheet'**
  String get exportBackupAndSend;

  /// No description provided for @importFromLocalSend.
  ///
  /// In en, this message translates to:
  /// **'Import from LocalSend'**
  String get importFromLocalSend;

  /// No description provided for @selectBackupJson.
  ///
  /// In en, this message translates to:
  /// **'Select backup JSON and merge local data'**
  String get selectBackupJson;

  /// No description provided for @autoGeneration.
  ///
  /// In en, this message translates to:
  /// **'Auto Generation'**
  String get autoGeneration;

  /// No description provided for @autoGenerateSummary.
  ///
  /// In en, this message translates to:
  /// **'Auto Generate Summary'**
  String get autoGenerateSummary;

  /// No description provided for @generateAiSummaryForNewEntries.
  ///
  /// In en, this message translates to:
  /// **'Generate AI summary for new entries'**
  String get generateAiSummaryForNewEntries;

  /// No description provided for @autoGenerateEmbedding.
  ///
  /// In en, this message translates to:
  /// **'Auto Generate Embedding'**
  String get autoGenerateEmbedding;

  /// No description provided for @generateVectorEmbedding.
  ///
  /// In en, this message translates to:
  /// **'Generate vector embedding for search'**
  String get generateVectorEmbedding;

  /// No description provided for @enableNetworkSearch.
  ///
  /// In en, this message translates to:
  /// **'Enable Network Search'**
  String get enableNetworkSearch;

  /// No description provided for @allowOnlineRetrieval.
  ///
  /// In en, this message translates to:
  /// **'Allow online retrieval for search and AI chat (off by default)'**
  String get allowOnlineRetrieval;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String version(String version);

  /// No description provided for @database.
  ///
  /// In en, this message translates to:
  /// **'Database'**
  String get database;

  /// No description provided for @objectBoxWithHnsw.
  ///
  /// In en, this message translates to:
  /// **'ObjectBox with HNSW index'**
  String get objectBoxWithHnsw;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut;

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// No description provided for @openAiCompatible.
  ///
  /// In en, this message translates to:
  /// **'OpenAI Compatible'**
  String get openAiCompatible;

  /// No description provided for @notSet.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get notSet;

  /// No description provided for @ws1270018008OrHttp12700111434.
  ///
  /// In en, this message translates to:
  /// **'ws://127.0.0.1:8008/... or http://127.0.0.1:11434'**
  String get ws1270018008OrHttp12700111434;

  /// No description provided for @supportsLocalLanPublic.
  ///
  /// In en, this message translates to:
  /// **'Supports local/LAN/public endpoints'**
  String get supportsLocalLanPublic;

  /// No description provided for @shiguangLocalSendBackup.
  ///
  /// In en, this message translates to:
  /// **'Shiguang LocalSend Backup'**
  String get shiguangLocalSendBackup;

  /// No description provided for @localBackupFromShiguang.
  ///
  /// In en, this message translates to:
  /// **'Local backup from Shiguang (receive via LocalSend)'**
  String get localBackupFromShiguang;

  /// No description provided for @selectBackupFileFromLocalSend.
  ///
  /// In en, this message translates to:
  /// **'Select backup file received from LocalSend'**
  String get selectBackupFileFromLocalSend;

  /// No description provided for @failedToResolveFilePath.
  ///
  /// In en, this message translates to:
  /// **'Failed to resolve selected file path'**
  String get failedToResolveFilePath;

  /// No description provided for @importOptions.
  ///
  /// In en, this message translates to:
  /// **'Import Options'**
  String get importOptions;

  /// No description provided for @importSettingsAsWell.
  ///
  /// In en, this message translates to:
  /// **'Import settings as well?\n(API keys will not be overwritten)'**
  String get importSettingsAsWell;

  /// No description provided for @dataOnly.
  ///
  /// In en, this message translates to:
  /// **'Data Only'**
  String get dataOnly;

  /// No description provided for @dataAndSettings.
  ///
  /// In en, this message translates to:
  /// **'Data + Settings'**
  String get dataAndSettings;

  /// No description provided for @importCompleted.
  ///
  /// In en, this message translates to:
  /// **'Import Completed'**
  String get importCompleted;

  /// No description provided for @settingsInBackupWereApplied.
  ///
  /// In en, this message translates to:
  /// **'Settings in backup were applied.'**
  String get settingsInBackupWereApplied;

  /// No description provided for @settingsInBackupWereNotApplied.
  ///
  /// In en, this message translates to:
  /// **'Settings in backup were not applied.'**
  String get settingsInBackupWereNotApplied;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @areYouSureYouWantToLogOut.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get areYouSureYouWantToLogOut;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguage;

  /// No description provided for @databaseInfo.
  ///
  /// In en, this message translates to:
  /// **'Database Info'**
  String get databaseInfo;

  /// No description provided for @storage.
  ///
  /// In en, this message translates to:
  /// **'Storage: ObjectBox'**
  String get storage;

  /// No description provided for @vectorIndex.
  ///
  /// In en, this message translates to:
  /// **'Vector Index: HNSW'**
  String get vectorIndex;

  /// No description provided for @dimensions.
  ///
  /// In en, this message translates to:
  /// **'Dimensions: 384'**
  String get dimensions;

  /// No description provided for @embeddingModelBge.
  ///
  /// In en, this message translates to:
  /// **'Embedding Model: bge-small-zh-v1.5'**
  String get embeddingModelBge;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// No description provided for @chooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get chooseFromGallery;

  /// No description provided for @editNickname.
  ///
  /// In en, this message translates to:
  /// **'Edit Nickname'**
  String get editNickname;

  /// No description provided for @enterNickname.
  ///
  /// In en, this message translates to:
  /// **'Enter nickname'**
  String get enterNickname;

  /// No description provided for @pleaseEnterNickname.
  ///
  /// In en, this message translates to:
  /// **'Please enter a nickname'**
  String get pleaseEnterNickname;

  /// No description provided for @nicknameAlreadyExistsOrInvalid.
  ///
  /// In en, this message translates to:
  /// **'Nickname already exists or is invalid'**
  String get nicknameAlreadyExistsOrInvalid;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @manageScheduledReminders.
  ///
  /// In en, this message translates to:
  /// **'Manage scheduled reminders and alarms'**
  String get manageScheduledReminders;

  /// No description provided for @imageFailedToLoad.
  ///
  /// In en, this message translates to:
  /// **'Image failed to load. Please choose again.'**
  String get imageFailedToLoad;

  /// No description provided for @imageIsStillLoading.
  ///
  /// In en, this message translates to:
  /// **'Image is still loading'**
  String get imageIsStillLoading;

  /// No description provided for @imageAreaNotReady.
  ///
  /// In en, this message translates to:
  /// **'Image area is not ready. Please try again.'**
  String get imageAreaNotReady;

  /// No description provided for @cropFrameNotReady.
  ///
  /// In en, this message translates to:
  /// **'Crop frame is not ready. Please try again.'**
  String get cropFrameNotReady;

  /// No description provided for @invalidCropArea.
  ///
  /// In en, this message translates to:
  /// **'Invalid crop area. Please try again.'**
  String get invalidCropArea;

  /// No description provided for @cropFailed.
  ///
  /// In en, this message translates to:
  /// **'Crop failed. Please try again.'**
  String get cropFailed;

  /// No description provided for @cropAvatar.
  ///
  /// In en, this message translates to:
  /// **'Crop Avatar'**
  String get cropAvatar;

  /// No description provided for @chooseAgain.
  ///
  /// In en, this message translates to:
  /// **'Choose Again'**
  String get chooseAgain;

  /// No description provided for @rotate90.
  ///
  /// In en, this message translates to:
  /// **'Rotate 90°'**
  String get rotate90;

  /// No description provided for @dragFrameToMove.
  ///
  /// In en, this message translates to:
  /// **'Drag the frame to move, drag bottom-right to resize; pinch to zoom and move image.'**
  String get dragFrameToMove;

  /// No description provided for @pleaseFillInAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all fields'**
  String get pleaseFillInAllFields;

  /// No description provided for @pinMustBeAtLeast4Digits.
  ///
  /// In en, this message translates to:
  /// **'PIN must be at least 4 digits'**
  String get pinMustBeAtLeast4Digits;

  /// No description provided for @pinAtLeast4Digits.
  ///
  /// In en, this message translates to:
  /// **'PIN must be at least 4 digits'**
  String get pinAtLeast4Digits;

  /// No description provided for @invalidUsernameOrPin.
  ///
  /// In en, this message translates to:
  /// **'Invalid username or PIN'**
  String get invalidUsernameOrPin;

  /// No description provided for @invalidUsernameOrPinError.
  ///
  /// In en, this message translates to:
  /// **'Invalid username or PIN'**
  String get invalidUsernameOrPinError;

  /// No description provided for @usernameAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Username already exists'**
  String get usernameAlreadyExists;

  /// No description provided for @captureMomentsKeepMemories.
  ///
  /// In en, this message translates to:
  /// **'Capture moments, keep memories'**
  String get captureMomentsKeepMemories;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @pin.
  ///
  /// In en, this message translates to:
  /// **'PIN'**
  String get pin;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @dontHaveAccountCreateOne.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Create one'**
  String get dontHaveAccountCreateOne;

  /// No description provided for @alreadyHaveAccountLogin.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Login'**
  String get alreadyHaveAccountLogin;

  /// No description provided for @pleaseEnterUsername.
  ///
  /// In en, this message translates to:
  /// **'Please enter a username'**
  String get pleaseEnterUsername;

  /// No description provided for @pinsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'PINs do not match'**
  String get pinsDoNotMatch;

  /// No description provided for @tapToAddAvatar.
  ///
  /// In en, this message translates to:
  /// **'Tap to add avatar'**
  String get tapToAddAvatar;

  /// No description provided for @yourName.
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get yourName;

  /// No description provided for @privatePinOptional.
  ///
  /// In en, this message translates to:
  /// **'Private PIN (optional)'**
  String get privatePinOptional;

  /// No description provided for @usedToEncryptPrivateRecords.
  ///
  /// In en, this message translates to:
  /// **'Used to encrypt private records'**
  String get usedToEncryptPrivateRecords;

  /// No description provided for @privatePin.
  ///
  /// In en, this message translates to:
  /// **'Private PIN'**
  String get privatePin;

  /// No description provided for @leaveEmptyForNoEncryption.
  ///
  /// In en, this message translates to:
  /// **'Leave empty for no encryption'**
  String get leaveEmptyForNoEncryption;

  /// No description provided for @confirmPin.
  ///
  /// In en, this message translates to:
  /// **'Confirm PIN'**
  String get confirmPin;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @noReminders.
  ///
  /// In en, this message translates to:
  /// **'No reminders'**
  String get noReminders;

  /// No description provided for @addReminder.
  ///
  /// In en, this message translates to:
  /// **'Add Reminder'**
  String get addReminder;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @descriptionOptional.
  ///
  /// In en, this message translates to:
  /// **'Description (optional)'**
  String get descriptionOptional;

  /// No description provided for @microphonePermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Microphone permission required'**
  String get microphonePermissionRequired;

  /// No description provided for @aiAssistant.
  ///
  /// In en, this message translates to:
  /// **'AI Assistant'**
  String get aiAssistant;

  /// No description provided for @listening.
  ///
  /// In en, this message translates to:
  /// **'Listening...'**
  String get listening;

  /// No description provided for @typeAMessage.
  ///
  /// In en, this message translates to:
  /// **'Type a message...'**
  String get typeAMessage;

  /// No description provided for @aiChat.
  ///
  /// In en, this message translates to:
  /// **'AI Chat'**
  String get aiChat;

  /// No description provided for @startAConversation.
  ///
  /// In en, this message translates to:
  /// **'Start a conversation'**
  String get startAConversation;

  /// No description provided for @typeYourMessage.
  ///
  /// In en, this message translates to:
  /// **'Type your message...'**
  String get typeYourMessage;

  /// No description provided for @asrReconnecting.
  ///
  /// In en, this message translates to:
  /// **'ASR reconnecting...'**
  String get asrReconnecting;

  /// No description provided for @write.
  ///
  /// In en, this message translates to:
  /// **'Write'**
  String get write;

  /// No description provided for @writeEntry.
  ///
  /// In en, this message translates to:
  /// **'Write Entry'**
  String get writeEntry;

  /// No description provided for @noMemoriesYet.
  ///
  /// In en, this message translates to:
  /// **'No memories yet'**
  String get noMemoriesYet;

  /// No description provided for @tapPlusToCapture.
  ///
  /// In en, this message translates to:
  /// **'Tap + to capture your thoughts'**
  String get tapPlusToCapture;

  /// No description provided for @tapPlusToCaptureYourThoughts.
  ///
  /// In en, this message translates to:
  /// **'Tap + to capture your thoughts'**
  String get tapPlusToCaptureYourThoughts;

  /// No description provided for @deleteMemory.
  ///
  /// In en, this message translates to:
  /// **'Delete Memory'**
  String get deleteMemory;

  /// No description provided for @deleteRecord.
  ///
  /// In en, this message translates to:
  /// **'Delete Record'**
  String get deleteRecord;

  /// No description provided for @thisEntryWillBeRemoved.
  ///
  /// In en, this message translates to:
  /// **'This entry will be removed from your timeline.'**
  String get thisEntryWillBeRemoved;

  /// No description provided for @thisRecordWillBeRemoved.
  ///
  /// In en, this message translates to:
  /// **'This record will be removed from your timeline.'**
  String get thisRecordWillBeRemoved;

  /// No description provided for @searchYourRecords.
  ///
  /// In en, this message translates to:
  /// **'Search your records...'**
  String get searchYourRecords;

  /// No description provided for @exactMatches.
  ///
  /// In en, this message translates to:
  /// **'Exact Matches'**
  String get exactMatches;

  /// No description provided for @noExactMatches.
  ///
  /// In en, this message translates to:
  /// **'No exact matches'**
  String get noExactMatches;

  /// No description provided for @exact.
  ///
  /// In en, this message translates to:
  /// **'Exact'**
  String get exact;

  /// No description provided for @exactMatch.
  ///
  /// In en, this message translates to:
  /// **'Exact Match'**
  String get exactMatch;

  /// No description provided for @fuzzyMatches.
  ///
  /// In en, this message translates to:
  /// **'Fuzzy Matches'**
  String get fuzzyMatches;

  /// No description provided for @noFuzzyMatches.
  ///
  /// In en, this message translates to:
  /// **'No fuzzy matches'**
  String get noFuzzyMatches;

  /// No description provided for @vectorMatch.
  ///
  /// In en, this message translates to:
  /// **'Vector Match'**
  String get vectorMatch;

  /// No description provided for @networkMatches.
  ///
  /// In en, this message translates to:
  /// **'Network Matches'**
  String get networkMatches;

  /// No description provided for @noNetworkMatches.
  ///
  /// In en, this message translates to:
  /// **'No network matches'**
  String get noNetworkMatches;

  /// No description provided for @networkSearchIsOff.
  ///
  /// In en, this message translates to:
  /// **'Network search is off. Enable it in Settings.'**
  String get networkSearchIsOff;

  /// No description provided for @network.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get network;

  /// No description provided for @networkMatch.
  ///
  /// In en, this message translates to:
  /// **'Network Match'**
  String get networkMatch;

  /// No description provided for @noSearchHistory.
  ///
  /// In en, this message translates to:
  /// **'No search history'**
  String get noSearchHistory;

  /// No description provided for @searchHistory.
  ///
  /// In en, this message translates to:
  /// **'Search History'**
  String get searchHistory;

  /// No description provided for @invalidLink.
  ///
  /// In en, this message translates to:
  /// **'Invalid link'**
  String get invalidLink;

  /// No description provided for @unableToOpenWebPage.
  ///
  /// In en, this message translates to:
  /// **'Unable to open web page'**
  String get unableToOpenWebPage;

  /// No description provided for @imageMemory.
  ///
  /// In en, this message translates to:
  /// **'[Image memory]'**
  String get imageMemory;

  /// No description provided for @tapToOpenWebPage.
  ///
  /// In en, this message translates to:
  /// **'Tap to open web page'**
  String get tapToOpenWebPage;

  /// No description provided for @editEntry.
  ///
  /// In en, this message translates to:
  /// **'Edit Entry'**
  String get editEntry;

  /// No description provided for @entryDetails.
  ///
  /// In en, this message translates to:
  /// **'Entry Details'**
  String get entryDetails;

  /// No description provided for @noContent.
  ///
  /// In en, this message translates to:
  /// **'No content'**
  String get noContent;

  /// No description provided for @diaryNotFound.
  ///
  /// In en, this message translates to:
  /// **'Diary not found'**
  String get diaryNotFound;

  /// No description provided for @diaryNotFoundShort.
  ///
  /// In en, this message translates to:
  /// **'Record not found'**
  String get diaryNotFoundShort;

  /// No description provided for @aiSummary.
  ///
  /// In en, this message translates to:
  /// **'AI Summary'**
  String get aiSummary;

  /// No description provided for @microphoneInterrupted.
  ///
  /// In en, this message translates to:
  /// **'Microphone interrupted, recording stopped.'**
  String get microphoneInterrupted;

  /// No description provided for @bold.
  ///
  /// In en, this message translates to:
  /// **'Bold'**
  String get bold;

  /// No description provided for @italic.
  ///
  /// In en, this message translates to:
  /// **'Italic'**
  String get italic;

  /// No description provided for @strikethrough.
  ///
  /// In en, this message translates to:
  /// **'Strikethrough'**
  String get strikethrough;

  /// No description provided for @image.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get image;

  /// No description provided for @asrUnavailableRecordingActive.
  ///
  /// In en, this message translates to:
  /// **'ASR unavailable. Recording is still active.'**
  String get asrUnavailableRecordingActive;

  /// No description provided for @writeYourEntry.
  ///
  /// In en, this message translates to:
  /// **'Write your entry...'**
  String get writeYourEntry;

  /// No description provided for @writeYourContent.
  ///
  /// In en, this message translates to:
  /// **'Write your content...'**
  String get writeYourContent;

  /// No description provided for @microphoneStartFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to start microphone: {error}'**
  String microphoneStartFailed(String error);

  /// No description provided for @microphoneInterruptedRecordingStopped.
  ///
  /// In en, this message translates to:
  /// **'Microphone interrupted, recording stopped.'**
  String get microphoneInterruptedRecordingStopped;

  /// No description provided for @asrReconnectingError.
  ///
  /// In en, this message translates to:
  /// **'ASR reconnecting: {error}'**
  String asrReconnectingError(String error);

  /// No description provided for @imageInserted.
  ///
  /// In en, this message translates to:
  /// **'Image inserted: {name}'**
  String imageInserted(String name);

  /// No description provided for @voiceError.
  ///
  /// In en, this message translates to:
  /// **'Voice error: {error}'**
  String voiceError(String error);

  /// No description provided for @aiServiceUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Sorry, AI service is currently unavailable: {error}'**
  String aiServiceUnavailable(String error);

  /// No description provided for @shareFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to share: {error}'**
  String shareFailed(String error);

  /// No description provided for @searchMatchHits.
  ///
  /// In en, this message translates to:
  /// **'{matchType} · {count} hits'**
  String searchMatchHits(String matchType, int count);

  /// No description provided for @matchCount.
  ///
  /// In en, this message translates to:
  /// **'Match: {count}'**
  String matchCount(int count);

  /// No description provided for @sourceFromNetwork.
  ///
  /// In en, this message translates to:
  /// **'Source: {source}'**
  String sourceFromNetwork(String source);

  /// No description provided for @createNew.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get createNew;

  /// No description provided for @micStartFailed.
  ///
  /// In en, this message translates to:
  /// **'Mic start failed: {error}'**
  String micStartFailed(String error);

  /// No description provided for @importResultAccounts.
  ///
  /// In en, this message translates to:
  /// **'Accounts: +{created} / updated {updated}'**
  String importResultAccounts(int created, int updated);

  /// No description provided for @importResultDiaries.
  ///
  /// In en, this message translates to:
  /// **'Diaries: +{created} / updated {updated}'**
  String importResultDiaries(int created, int updated);

  /// No description provided for @importResultReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders: +{created} / updated {updated}'**
  String importResultReminders(int created, int updated);

  /// No description provided for @importResultSkipped.
  ///
  /// In en, this message translates to:
  /// **'Skipped: {count}'**
  String importResultSkipped(int count);

  /// No description provided for @importResultTotal.
  ///
  /// In en, this message translates to:
  /// **'Total changed: {count}'**
  String importResultTotal(int count);

  /// No description provided for @settingsApplied.
  ///
  /// In en, this message translates to:
  /// **'Settings in backup were applied.'**
  String get settingsApplied;

  /// No description provided for @settingsNotApplied.
  ///
  /// In en, this message translates to:
  /// **'Settings in backup were not applied.'**
  String get settingsNotApplied;

  /// No description provided for @backupExported.
  ///
  /// In en, this message translates to:
  /// **'Backup exported: {path}'**
  String backupExported(String path);

  /// No description provided for @exportFailed.
  ///
  /// In en, this message translates to:
  /// **'Export failed: {error}'**
  String exportFailed(String error);

  /// No description provided for @importFailed.
  ///
  /// In en, this message translates to:
  /// **'Import failed: {error}'**
  String importFailed(String error);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hans':
            return AppLocalizationsZhHans();
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

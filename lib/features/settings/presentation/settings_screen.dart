import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../../core/objectbox/objectbox_providers.dart';
import '../../../core/ui/adaptive_navigation.dart';
import '../../../core/ui/keyboard.dart';
import '../../auth/presentation/controllers/auth_controller.dart';
import '../../diary/data/ai/qwen_gguf_local_llm.dart';
import '../../diary/presentation/controllers/timeline_controller.dart';
import '../../reminder/presentation/controllers/reminder_controller.dart';
import '../data/local_sync_service.dart';
import '../data/settings_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  AppLocalizations get l10n => AppLocalizations.of(context);

  Future<void> _editAvatar() async {
    final source = await _pickImageSource();
    if (source == null) return;

    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: source,
      maxWidth: 2048,
      maxHeight: 2048,
    );
    if (image == null) return;
    if (!mounted) return;

    final croppedPath = await Navigator.of(context).push<String?>(
      adaptivePageRoute<String?>(
        context,
        builder: (_) => _AvatarCropperScreen(file: File(image.path)),
      ),
    );
    if (croppedPath == null) return;

    await ref.read(authProvider.notifier).updateAvatar(croppedPath);
    if (mounted) {
      setState(() {});
    }
  }

  Future<ImageSource?> _pickImageSource() async {
    return showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: Text(l10n.takePhoto),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(l10n.chooseFromGallery),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: Text(l10n.cancel),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _editUsername(String currentName) async {
    final controller = TextEditingController(text: currentName);
    final focusNode = FocusNode();

    final nextName = await showDialog<String?>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.editNickname),
        content: TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: true,
          onTap: () => requestKeyboardFocus(context, focusNode),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: l10n.enterNickname,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, controller.text.trim()),
            child: Text(l10n.save),
          ),
        ],
      ),
    );

    controller.dispose();
    focusNode.dispose();

    if (nextName == null || nextName.isEmpty) return;
    final ok = await ref.read(authProvider.notifier).updateUsername(nextName);
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.nicknameAlreadyExistsOrInvalid)),
      );
      return;
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final language = settings.language;
    final currentUser = ref.watch(authProvider.notifier).getCurrentUser();
    final isCupertino =
        !kIsWeb && isCupertinoPlatform(Theme.of(context).platform);
    final rawName = (currentUser?.username ?? 'U').trim();
    final avatarInitial = rawName.isNotEmpty
        ? rawName.substring(0, 1).toUpperCase()
        : 'U';
    final defaultUsername = _i18n(zhHans: '用户', zhHant: '使用者', en: 'User');

    return Scaffold(
      appBar: AppBar(
        centerTitle: isCupertino,
        title: Text(_i18n(zhHans: '设置', zhHant: '設定', en: 'Settings')),
      ),
      body: ListView(
        children: [
          // 账号信息
          _buildSectionHeader(
            context,
            _i18n(zhHans: '账号', zhHant: '帳號', en: 'Account'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Column(
              children: [
                GestureDetector(
                  onTap: _editAvatar,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.primaryContainer,
                        backgroundImage: currentUser?.avatarPath == null
                            ? null
                            : FileImage(File(currentUser!.avatarPath!)),
                        child: currentUser?.avatarPath == null
                            ? Text(
                                avatarInitial,
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                ),
                              )
                            : null,
                      ),
                      Positioned(
                        right: -2,
                        bottom: -2,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(context).colorScheme.surface,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentUser?.username ?? defaultUsername,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 6),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(Icons.edit, size: 18),
                      onPressed: () => _editUsername(
                        currentUser?.username ?? defaultUsername,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),

          // 定时提醒
          _buildSectionHeader(
            context,
            _i18n(zhHans: '定时', zhHant: '定時', en: 'Reminders'),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: Text(_i18n(zhHans: '定时提醒', zhHant: '定時提醒', en: 'Reminders')),
            subtitle: Text(
              _i18n(
                zhHans: '管理日程提醒和闹钟',
                zhHant: '管理排程提醒與鬧鐘',
                en: 'Manage scheduled reminders and alarms',
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/reminders'),
          ),
          const Divider(),

          // 语言
          _buildSectionHeader(
            context,
            _i18n(zhHans: '语言', zhHant: '語言', en: 'Language'),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(
              _i18n(zhHans: '界面语言', zhHant: '介面語言', en: 'App Language'),
            ),
            subtitle: Text(
              settings.followSystemLanguage
                  ? '${_i18n(zhHans: '跟随系统', zhHant: '跟隨系統', en: 'Follow system language')} (${settings.language.displayName})'
                  : settings.language.displayName,
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showLanguageDialog(
              context,
              ref,
              settings.language,
              settings.followSystemLanguage,
            ),
          ),
          const Divider(),

          // 外观
          _buildSectionHeader(
            context,
            _i18n(zhHans: '外观', zhHant: '外觀', en: 'Appearance'),
          ),
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: Text(
              _i18n(zhHans: '主题模式', zhHant: '主題模式', en: 'Theme Mode'),
            ),
            subtitle: Text(
              _i18n(
                zhHans: '浅色 / 深色 / 跟随系统',
                zhHant: '淺色 / 深色 / 跟隨系統',
                en: 'Light / Dark / Follow System',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: SegmentedButton<AppThemeMode>(
              segments: [
                ButtonSegment<AppThemeMode>(
                  value: AppThemeMode.dark,
                  icon: const Icon(Icons.dark_mode_outlined),
                  label: Text(_i18n(zhHans: '深色', zhHant: '深色', en: 'Dark')),
                ),
                ButtonSegment<AppThemeMode>(
                  value: AppThemeMode.light,
                  icon: const Icon(Icons.light_mode_outlined),
                  label: Text(_i18n(zhHans: '浅色', zhHant: '淺色', en: 'Light')),
                ),
                ButtonSegment<AppThemeMode>(
                  value: AppThemeMode.system,
                  icon: const Icon(Icons.phone_android),
                  label: Text(_i18n(zhHans: '系统', zhHant: '系統', en: 'System')),
                ),
              ],
              selected: {settings.themeMode},
              onSelectionChanged: (selection) {
                if (selection.isNotEmpty) {
                  ref
                      .read(settingsProvider.notifier)
                      .setThemeMode(selection.first);
                }
              },
            ),
          ),
          const Divider(),
          _buildSectionHeader(
            context,
            _i18n(zhHans: 'AI 服务', zhHant: 'AI 服務', en: 'AI Service'),
          ),
          ListTile(
            leading: const Icon(Icons.chat_bubble_outline),
            title: Text(
              _i18n(
                zhHans: 'AI 对话模型来源',
                zhHant: 'AI 對話模型來源',
                en: 'AI Chat Provider',
              ),
            ),
            subtitle: Text(_chatProviderLabel(settings.chatModelProvider)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: DropdownButtonFormField<ChatModelProvider>(
              value: settings.chatModelProvider,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: _i18n(
                  zhHans: '聊天模型',
                  zhHant: '聊天模型',
                  en: 'Chat Model',
                ),
              ),
              items: ChatModelProvider.values
                  .map(
                    (provider) => DropdownMenuItem(
                      value: provider,
                      child: Text(_chatProviderLabel(provider)),
                    ),
                  )
                  .toList(growable: false),
              onChanged: (value) {
                if (value == null) return;
                ref.read(settingsProvider.notifier).setChatModelProvider(value);
              },
            ),
          ),
          if (settings.chatModelProvider == ChatModelProvider.local)
            ListTile(
              leading: const Icon(Icons.memory),
              title: Text(
                _i18n(zhHans: '本地模型', zhHant: '本地模型', en: 'Local Model'),
              ),
              subtitle: Text(
                Platform.isAndroid
                    ? _i18n(
                        zhHans: 'Android: ${QwenGgufLocalLLM.modelFileName}',
                        zhHant: 'Android: ${QwenGgufLocalLLM.modelFileName}',
                        en: 'Android: ${QwenGgufLocalLLM.modelFileName}',
                      )
                    : Platform.isIOS
                    ? _i18n(
                        zhHans: 'iOS: fllama 本地模型',
                        zhHant: 'iOS: fllama 本地模型',
                        en: 'iOS: fllama local model',
                      )
                    : _i18n(
                        zhHans: 'Desktop: 使用本地 Ollama Endpoint',
                        zhHant: 'Desktop: 使用本地 Ollama Endpoint',
                        en: 'Desktop: use local Ollama endpoint',
                      ),
              ),
            ),
          if (settings.chatModelProvider == ChatModelProvider.ollama) ...[
            ListTile(
              leading: const Icon(Icons.hub),
              title: Text(
                _i18n(
                  zhHans: 'Ollama 端点',
                  zhHant: 'Ollama 端點',
                  en: 'Ollama Endpoint',
                ),
              ),
              subtitle: Text(
                settings.llmEndpoint,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => _showEndpointDialog(
                context,
                ref,
                _i18n(
                  zhHans: 'Ollama 端点',
                  zhHant: 'Ollama 端點',
                  en: 'Ollama Endpoint',
                ),
                settings.llmEndpoint,
                (value) =>
                    ref.read(settingsProvider.notifier).setLlmEndpoint(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.token),
              title: Text(
                _i18n(
                  zhHans: 'Ollama 模型',
                  zhHant: 'Ollama 模型',
                  en: 'Ollama Model',
                ),
              ),
              subtitle: Text(
                settings.llmModel,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => _showTextDialog(
                context,
                title: _i18n(
                  zhHans: 'Ollama 模型',
                  zhHant: 'Ollama 模型',
                  en: 'Ollama Model',
                ),
                currentValue: settings.llmModel,
                hintText: AppSettings.defaultLlmModel,
                onSave: (value) =>
                    ref.read(settingsProvider.notifier).setLlmModel(value),
              ),
            ),
          ],
          if (settings.chatModelProvider == ChatModelProvider.openai) ...[
            ListTile(
              leading: const Icon(Icons.link),
              title: Text(
                _i18n(
                  zhHans: 'OpenAI 端点',
                  zhHant: 'OpenAI 端點',
                  en: 'OpenAI Endpoint',
                ),
              ),
              subtitle: Text(
                settings.openAiEndpoint,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => _showTextDialog(
                context,
                title: _i18n(
                  zhHans: 'OpenAI 端点',
                  zhHant: 'OpenAI 端點',
                  en: 'OpenAI Endpoint',
                ),
                currentValue: settings.openAiEndpoint,
                hintText: AppSettings.defaultOpenAiEndpoint,
                onSave: (value) => ref
                    .read(settingsProvider.notifier)
                    .setOpenAiEndpoint(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.vpn_key_outlined),
              title: Text(
                _i18n(
                  zhHans: 'OpenAI API Key',
                  zhHant: 'OpenAI API Key',
                  en: 'OpenAI API Key',
                ),
              ),
              subtitle: Text(_maskSecret(settings.openAiApiKey, language)),
              onTap: () => _showTextDialog(
                context,
                title: _i18n(
                  zhHans: 'OpenAI API Key',
                  zhHant: 'OpenAI API Key',
                  en: 'OpenAI API Key',
                ),
                currentValue: settings.openAiApiKey,
                hintText: 'sk-...',
                obscureText: true,
                onSave: (value) =>
                    ref.read(settingsProvider.notifier).setOpenAiApiKey(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.token),
              title: Text(
                _i18n(
                  zhHans: 'OpenAI 模型',
                  zhHant: 'OpenAI 模型',
                  en: 'OpenAI Model',
                ),
              ),
              subtitle: Text(settings.openAiModel),
              onTap: () => _showTextDialog(
                context,
                title: _i18n(
                  zhHans: 'OpenAI 模型',
                  zhHant: 'OpenAI 模型',
                  en: 'OpenAI Model',
                ),
                currentValue: settings.openAiModel,
                hintText: AppSettings.defaultOpenAiModel,
                onSave: (value) =>
                    ref.read(settingsProvider.notifier).setOpenAiModel(value),
              ),
            ),
          ],
          if (settings.chatModelProvider == ChatModelProvider.gemini) ...[
            ListTile(
              leading: const Icon(Icons.link),
              title: Text(
                _i18n(
                  zhHans: 'Gemini 端点',
                  zhHant: 'Gemini 端點',
                  en: 'Gemini Endpoint',
                ),
              ),
              subtitle: Text(
                settings.geminiEndpoint,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => _showTextDialog(
                context,
                title: _i18n(
                  zhHans: 'Gemini 端点',
                  zhHant: 'Gemini 端點',
                  en: 'Gemini Endpoint',
                ),
                currentValue: settings.geminiEndpoint,
                hintText: AppSettings.defaultGeminiEndpoint,
                onSave: (value) => ref
                    .read(settingsProvider.notifier)
                    .setGeminiEndpoint(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.vpn_key_outlined),
              title: Text(
                _i18n(
                  zhHans: 'Gemini API Key',
                  zhHant: 'Gemini API Key',
                  en: 'Gemini API Key',
                ),
              ),
              subtitle: Text(_maskSecret(settings.geminiApiKey, language)),
              onTap: () => _showTextDialog(
                context,
                title: _i18n(
                  zhHans: 'Gemini API Key',
                  zhHant: 'Gemini API Key',
                  en: 'Gemini API Key',
                ),
                currentValue: settings.geminiApiKey,
                hintText: 'AIza...',
                obscureText: true,
                onSave: (value) =>
                    ref.read(settingsProvider.notifier).setGeminiApiKey(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.token),
              title: Text(
                _i18n(
                  zhHans: 'Gemini 模型',
                  zhHant: 'Gemini 模型',
                  en: 'Gemini Model',
                ),
              ),
              subtitle: Text(settings.geminiModel),
              onTap: () => _showTextDialog(
                context,
                title: _i18n(
                  zhHans: 'Gemini 模型',
                  zhHant: 'Gemini 模型',
                  en: 'Gemini Model',
                ),
                currentValue: settings.geminiModel,
                hintText: AppSettings.defaultGeminiModel,
                onSave: (value) =>
                    ref.read(settingsProvider.notifier).setGeminiModel(value),
              ),
            ),
          ],
          if (settings.chatModelProvider == ChatModelProvider.anthropic) ...[
            ListTile(
              leading: const Icon(Icons.link),
              title: Text(
                _i18n(
                  zhHans: 'Anthropic 端点',
                  zhHant: 'Anthropic 端點',
                  en: 'Anthropic Endpoint',
                ),
              ),
              subtitle: Text(
                settings.anthropicEndpoint,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => _showTextDialog(
                context,
                title: _i18n(
                  zhHans: 'Anthropic 端点',
                  zhHant: 'Anthropic 端點',
                  en: 'Anthropic Endpoint',
                ),
                currentValue: settings.anthropicEndpoint,
                hintText: AppSettings.defaultAnthropicEndpoint,
                onSave: (value) => ref
                    .read(settingsProvider.notifier)
                    .setAnthropicEndpoint(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.vpn_key_outlined),
              title: Text(
                _i18n(
                  zhHans: 'Anthropic API Key',
                  zhHant: 'Anthropic API Key',
                  en: 'Anthropic API Key',
                ),
              ),
              subtitle: Text(_maskSecret(settings.anthropicApiKey, language)),
              onTap: () => _showTextDialog(
                context,
                title: _i18n(
                  zhHans: 'Anthropic API Key',
                  zhHant: 'Anthropic API Key',
                  en: 'Anthropic API Key',
                ),
                currentValue: settings.anthropicApiKey,
                hintText: 'sk-ant-...',
                obscureText: true,
                onSave: (value) => ref
                    .read(settingsProvider.notifier)
                    .setAnthropicApiKey(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.token),
              title: Text(
                _i18n(
                  zhHans: 'Anthropic 模型',
                  zhHant: 'Anthropic 模型',
                  en: 'Anthropic Model',
                ),
              ),
              subtitle: Text(settings.anthropicModel),
              onTap: () => _showTextDialog(
                context,
                title: _i18n(
                  zhHans: 'Anthropic 模型',
                  zhHant: 'Anthropic 模型',
                  en: 'Anthropic Model',
                ),
                currentValue: settings.anthropicModel,
                hintText: AppSettings.defaultAnthropicModel,
                onSave: (value) => ref
                    .read(settingsProvider.notifier)
                    .setAnthropicModel(value),
              ),
            ),
          ],
          if (settings.chatModelProvider == ChatModelProvider.custom) ...[
            ListTile(
              leading: const Icon(Icons.settings_suggest_outlined),
              title: Text(
                _i18n(zhHans: '自定义协议', zhHant: '自訂協議', en: 'Custom Protocol'),
              ),
              subtitle: Text(_customProtocolLabel(settings.customLlmProtocol)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: DropdownButtonFormField<CustomLlmProtocol>(
                value: settings.customLlmProtocol,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: _i18n(
                    zhHans: '协议类型',
                    zhHant: '協議類型',
                    en: 'Protocol',
                  ),
                ),
                items: CustomLlmProtocol.values
                    .map(
                      (protocol) => DropdownMenuItem(
                        value: protocol,
                        child: Text(_customProtocolLabel(protocol)),
                      ),
                    )
                    .toList(growable: false),
                onChanged: (value) {
                  if (value == null) return;
                  ref
                      .read(settingsProvider.notifier)
                      .setCustomLlmProtocol(value);
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.link),
              title: Text(
                _i18n(zhHans: '自定义端点', zhHant: '自訂端點', en: 'Custom Endpoint'),
              ),
              subtitle: Text(
                settings.customEndpoint,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => _showTextDialog(
                context,
                title: _i18n(
                  zhHans: '自定义端点',
                  zhHant: '自訂端點',
                  en: 'Custom Endpoint',
                ),
                currentValue: settings.customEndpoint,
                hintText: AppSettings.defaultCustomEndpoint,
                onSave: (value) => ref
                    .read(settingsProvider.notifier)
                    .setCustomEndpoint(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.vpn_key_outlined),
              title: Text(
                _i18n(
                  zhHans: '自定义 API Key',
                  zhHant: '自訂 API Key',
                  en: 'Custom API Key',
                ),
              ),
              subtitle: Text(_maskSecret(settings.customApiKey, language)),
              onTap: () => _showTextDialog(
                context,
                title: _i18n(
                  zhHans: '自定义 API Key',
                  zhHant: '自訂 API Key',
                  en: 'Custom API Key',
                ),
                currentValue: settings.customApiKey,
                hintText: _i18n(
                  zhHans: '本地/自定义服务可留空',
                  zhHant: '本地/自訂服務可留空',
                  en: 'Optional for local/custom servers',
                ),
                obscureText: true,
                onSave: (value) =>
                    ref.read(settingsProvider.notifier).setCustomApiKey(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.token),
              title: Text(
                _i18n(zhHans: '自定义模型', zhHant: '自訂模型', en: 'Custom Model'),
              ),
              subtitle: Text(settings.customModel),
              onTap: () => _showTextDialog(
                context,
                title: _i18n(
                  zhHans: '自定义模型',
                  zhHant: '自訂模型',
                  en: 'Custom Model',
                ),
                currentValue: settings.customModel,
                hintText: AppSettings.defaultCustomModel,
                helperText: _i18n(
                  zhHans: '模型 ID',
                  zhHant: '模型 ID',
                  en: 'Model ID',
                ),
                onSave: (value) =>
                    ref.read(settingsProvider.notifier).setCustomModel(value),
              ),
            ),
          ],
          const Divider(),
          ListTile(
            leading: const Icon(Icons.mic),
            title: Text(
              _i18n(
                zhHans: '语音识别引擎',
                zhHant: '語音辨識引擎',
                en: 'Speech Recognition Engine',
              ),
            ),
            subtitle: Text(_voiceEngineLabel(settings.voiceRecognitionEngine)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: SegmentedButton<VoiceRecognitionEngine>(
              segments: [
                ButtonSegment<VoiceRecognitionEngine>(
                  value: VoiceRecognitionEngine.localModel,
                  icon: const Icon(Icons.memory_outlined),
                  label: Text(
                    _i18n(zhHans: '本地模型', zhHant: '本地模型', en: 'Local'),
                  ),
                ),
                ButtonSegment<VoiceRecognitionEngine>(
                  value: VoiceRecognitionEngine.systemNative,
                  icon: const Icon(Icons.phone_android_outlined),
                  label: Text(
                    _i18n(zhHans: '系统识别', zhHant: '系統辨識', en: 'System'),
                  ),
                ),
                ButtonSegment<VoiceRecognitionEngine>(
                  value: VoiceRecognitionEngine.endpointCloud,
                  icon: const Icon(Icons.cloud_outlined),
                  label: Text(
                    _i18n(zhHans: '端点识别', zhHant: '端點辨識', en: 'Endpoint'),
                  ),
                ),
              ],
              selected: {settings.voiceRecognitionEngine},
              onSelectionChanged: (selection) {
                if (selection.isEmpty) return;
                ref
                    .read(settingsProvider.notifier)
                    .setVoiceRecognitionEngine(selection.first);
              },
            ),
          ),
          if (settings.voiceRecognitionEngine ==
              VoiceRecognitionEngine.localModel)
            ListTile(
              leading: const Icon(Icons.hub_outlined),
              title: Text(
                _i18n(
                  zhHans: '本地语音模型',
                  zhHant: '本地語音模型',
                  en: 'Local Speech Model',
                ),
              ),
              subtitle: Text(
                _i18n(
                  zhHans: 'SenseVoice ONNX（端侧）',
                  zhHant: 'SenseVoice ONNX（端側）',
                  en: 'SenseVoice ONNX (on-device)',
                ),
              ),
            ),
          if (settings.voiceRecognitionEngine ==
              VoiceRecognitionEngine.systemNative)
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(
                _i18n(
                  zhHans: '系统语音识别',
                  zhHant: '系統語音辨識',
                  en: 'System Speech Recognition',
                ),
              ),
              subtitle: Text(
                _i18n(
                  zhHans: '使用 Android / iOS 内置识别服务（可能走云端）',
                  zhHant: '使用 Android / iOS 內建辨識服務（可能走雲端）',
                  en: 'Use built-in Android / iOS recognizer (may use cloud)',
                ),
              ),
            ),
          if (settings.voiceRecognitionEngine ==
              VoiceRecognitionEngine.endpointCloud)
            ListTile(
              leading: const Icon(Icons.cloud_outlined),
              title: Text(
                _i18n(
                  zhHans: '语音识别端点',
                  zhHant: '語音辨識端點',
                  en: 'Voice AI Endpoint',
                ),
              ),
              subtitle: Text(
                settings.voiceAiEndpoint,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => _showEndpointDialog(
                context,
                ref,
                _i18n(
                  zhHans: '语音识别端点',
                  zhHant: '語音辨識端點',
                  en: 'Voice AI Endpoint',
                ),
                settings.voiceAiEndpoint,
                (value) => ref
                    .read(settingsProvider.notifier)
                    .setVoiceAiEndpoint(value),
              ),
            ),
          ListTile(
            leading: const Icon(Icons.hub),
            title: Text(
              _i18n(zhHans: '向量模型', zhHant: '向量模型', en: 'Embedding Model'),
            ),
            subtitle: Text(
              _i18n(
                zhHans:
                    '端侧 bge-small-zh-v1.5-ONNX (model.onnx + model.onnx_data)',
                zhHant:
                    '端側 bge-small-zh-v1.5-ONNX (model.onnx + model.onnx_data)',
                en: 'On-device bge-small-zh-v1.5-ONNX (model.onnx + model.onnx_data)',
              ),
            ),
          ),
          const Divider(),
          _buildSectionHeader(
            context,
            _i18n(zhHans: '多端同步', zhHant: '多端同步', en: 'Cross-Device Sync'),
          ),
          ListTile(
            leading: const Icon(Icons.sync_alt_outlined),
            title: Text(
              _i18n(
                zhHans: '发送到其他设备（LocalSend）',
                zhHant: '傳送到其他裝置（LocalSend）',
                en: 'Send to Other Devices (LocalSend)',
              ),
            ),
            subtitle: Text(
              _i18n(
                zhHans: '导出本地备份并通过分享面板发送',
                zhHant: '匯出本地備份並透過分享面板傳送',
                en: 'Export backup and send via share sheet',
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _shareBackupViaLocalSend(ref),
          ),
          ListTile(
            leading: const Icon(Icons.download_outlined),
            title: Text(
              _i18n(
                zhHans: '从 LocalSend 接收并导入',
                zhHant: '從 LocalSend 接收並匯入',
                en: 'Import from LocalSend',
              ),
            ),
            subtitle: Text(
              _i18n(
                zhHans: '选择接收到的备份 JSON，合并导入本地数据',
                zhHant: '選擇收到的備份 JSON，合併匯入本地資料',
                en: 'Select backup JSON and merge local data',
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _importBackupViaLocalSend(ref),
          ),
          const Divider(),
          _buildSectionHeader(
            context,
            _i18n(zhHans: '自动生成', zhHant: '自動生成', en: 'Auto Generation'),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.summarize),
            title: Text(
              _i18n(
                zhHans: '自动生成摘要',
                zhHant: '自動生成摘要',
                en: 'Auto Generate Summary',
              ),
            ),
            subtitle: Text(
              _i18n(
                zhHans: '为新内容自动生成 AI 摘要',
                zhHant: '為新內容自動生成 AI 摘要',
                en: 'Generate AI summary for new entries',
              ),
            ),
            value: settings.autoGenerateSummary,
            onChanged: (value) {
              ref.read(settingsProvider.notifier).setAutoGenerateSummary(value);
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.hub),
            title: Text(
              _i18n(
                zhHans: '自动生成向量',
                zhHant: '自動生成向量',
                en: 'Auto Generate Embedding',
              ),
            ),
            subtitle: Text(
              _i18n(
                zhHans: '为搜索自动生成向量嵌入',
                zhHant: '為搜尋自動生成向量嵌入',
                en: 'Generate vector embedding for search',
              ),
            ),
            value: settings.autoGenerateEmbedding,
            onChanged: (value) {
              ref
                  .read(settingsProvider.notifier)
                  .setAutoGenerateEmbedding(value);
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.public),
            title: Text(
              _i18n(
                zhHans: '启用网络搜索',
                zhHant: '啟用網路搜尋',
                en: 'Enable Network Search',
              ),
            ),
            subtitle: Text(
              _i18n(
                zhHans: '搜索页与 AI 对话可联网检索（默认关闭）',
                zhHant: '搜尋頁與 AI 對話可連網檢索（預設關閉）',
                en: 'Allow online retrieval for search and AI chat (off by default)',
              ),
            ),
            value: settings.enableNetworkSearch,
            onChanged: (value) {
              ref.read(settingsProvider.notifier).setEnableNetworkSearch(value);
            },
          ),
          const Divider(),
          _buildSectionHeader(
            context,
            _i18n(zhHans: '关于', zhHant: '關於', en: 'About'),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(_i18n(zhHans: '拾光', zhHant: '拾光', en: 'Shiguang')),
            subtitle: Text(
              _i18n(
                zhHans: '版本 1.0.0',
                zhHant: '版本 1.0.0',
                en: 'Version 1.0.0',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.storage),
            title: Text(_i18n(zhHans: '数据库', zhHant: '資料庫', en: 'Database')),
            subtitle: Text(
              _i18n(
                zhHans: 'ObjectBox + HNSW 向量索引',
                zhHant: 'ObjectBox + HNSW 向量索引',
                en: 'ObjectBox with HNSW index',
              ),
            ),
            onTap: () => _showDatabaseInfo(context),
          ),
          const SizedBox(height: 24),
          // 退出登录
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilledButton.tonal(
              onPressed: () => _showLogoutDialog(context, ref),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red.shade100,
                foregroundColor: Colors.red.shade700,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.logout),
                  const SizedBox(width: 8),
                  Text(_i18n(zhHans: '退出登录', zhHant: '登出', en: 'Log Out')),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String _i18n({required String zhHans, String? zhHant, required String en}) {
    final locale = l10n.localeName;
    if (locale.startsWith('zh_Hant') || locale == 'zh_HK') {
      return zhHant ?? zhHans;
    }
    if (locale.startsWith('zh')) {
      return zhHans;
    }
    return _localizeEn(en);
  }

  String _localizeEn(String en) {
    switch (en) {
      case 'User':
        return l10n.user;
      case 'Settings':
        return l10n.settings;
      case 'Account':
        return l10n.account;
      case 'Reminders':
        return l10n.reminders;
      case 'Manage scheduled reminders and alarms':
        return l10n.manageScheduledReminders;
      case 'Language':
        return l10n.language;
      case 'App Language':
        return l10n.appLanguage;
      case 'Appearance':
        return l10n.appearance;
      case 'Theme Mode':
        return l10n.themeMode;
      case 'Light / Dark / Follow System':
        return '${l10n.light} / ${l10n.dark} / ${l10n.system}';
      case 'Dark':
        return l10n.dark;
      case 'Light':
        return l10n.light;
      case 'System':
        return l10n.system;
      case 'AI Service':
        return l10n.aiService;
      case 'AI Chat Provider':
        return l10n.aiChatProvider;
      case 'Chat Model':
        return l10n.chatModel;
      case 'Local Model':
        return l10n.localModel;
      case 'Ollama Endpoint':
        return l10n.ollamaEndpoint;
      case 'Ollama Model':
        return l10n.ollamaModel;
      case 'OpenAI Endpoint':
        return l10n.openAiEndpoint;
      case 'OpenAI API Key':
        return l10n.openAiApiKey;
      case 'OpenAI Model':
        return l10n.openAiModel;
      case 'Gemini Endpoint':
        return l10n.geminiEndpoint;
      case 'Gemini API Key':
        return l10n.geminiApiKey;
      case 'Gemini Model':
        return l10n.geminiModel;
      case 'Anthropic Endpoint':
        return l10n.anthropicEndpoint;
      case 'Anthropic API Key':
        return l10n.anthropicApiKey;
      case 'Anthropic Model':
        return l10n.anthropicModel;
      case 'Custom Protocol':
        return l10n.customProtocol;
      case 'Protocol':
        return l10n.protocol;
      case 'Custom Endpoint':
        return l10n.customEndpoint;
      case 'Custom API Key':
        return l10n.customApiKey;
      case 'Optional for local/custom servers':
        return l10n.optionalForLocalServers;
      case 'Custom Model':
        return l10n.customModel;
      case 'Speech Recognition Engine':
        return l10n.speechRecognitionEngine;
      case 'Local':
        return l10n.local;
      case 'Endpoint':
        return l10n.endpoint;
      case 'Local Speech Model':
        return l10n.localSpeechModel;
      case 'SenseVoice ONNX (on-device)':
        return l10n.senseVoiceOnnx;
      case 'System Speech Recognition':
        return l10n.systemSpeechRecognition;
      case 'Use built-in Android / iOS recognizer (may use cloud)':
        return l10n.useBuiltInRecognizer;
      case 'Voice AI Endpoint':
        return l10n.voiceAiEndpoint;
      case 'Embedding Model':
        return l10n.embeddingModel;
      case 'Cross-Device Sync':
        return l10n.crossDeviceSync;
      case 'Send to Other Devices (LocalSend)':
        return l10n.sendToOtherDevices;
      case 'Export backup and send via share sheet':
        return l10n.exportBackupAndSend;
      case 'Import from LocalSend':
        return l10n.importFromLocalSend;
      case 'Select backup JSON and merge local data':
        return l10n.selectBackupJson;
      case 'Auto Generation':
        return l10n.autoGeneration;
      case 'Auto Generate Summary':
        return l10n.autoGenerateSummary;
      case 'Generate AI summary for new entries':
        return l10n.generateAiSummaryForNewEntries;
      case 'Auto Generate Embedding':
        return l10n.autoGenerateEmbedding;
      case 'Generate vector embedding for search':
        return l10n.generateVectorEmbedding;
      case 'Enable Network Search':
        return l10n.enableNetworkSearch;
      case 'Allow online retrieval for search and AI chat (off by default)':
        return l10n.allowOnlineRetrieval;
      case 'About':
        return l10n.about;
      case 'Shiguang':
        return l10n.appTitle;
      case 'Version 1.0.0':
        return l10n.version('1.0.0');
      case 'Database':
        return l10n.database;
      case 'ObjectBox with HNSW index':
        return l10n.objectBoxWithHnsw;
      case 'Log Out':
        return l10n.logOut;
      case 'Custom':
        return l10n.custom;
      case 'OpenAI Compatible':
        return l10n.openAiCompatible;
      case 'Local Model (Default)':
        return l10n.localModelDefault;
      case 'System Recognition (Android/iOS)':
        return l10n.systemRecognitionAndroidIos;
      case 'Endpoint Recognition (Cloud/WS)':
        return l10n.endpointRecognitionCloudWs;
      case 'Not set':
        return l10n.notSet;
      case 'ws://127.0.0.1:8008/... or http://127.0.0.1:11434':
        return l10n.ws1270018008OrHttp12700111434;
      case 'Supports local/LAN/public endpoints':
        return l10n.supportsLocalLanPublic;
      case 'Cancel':
        return l10n.cancel;
      case 'Save':
        return l10n.save;
      case 'Done':
        return l10n.ok;
      case 'Follow system language':
        return l10n.system;
      case 'Are you sure you want to log out?':
        return l10n.areYouSureYouWantToLogOut;
      case 'Set Language':
        return l10n.chooseLanguage;
      case 'Model ID':
        return l10n.chatModel;
      case 'On-device bge-small-zh-v1.5-ONNX (model.onnx + model.onnx_data)':
        return l10n.embeddingModelBge;
      case 'iOS: fllama local model':
        return 'iOS: ${l10n.localModel}';
      case 'Android: ${QwenGgufLocalLLM.modelFileName}':
        return 'Android: ${QwenGgufLocalLLM.modelFileName}';
      case 'Desktop: use local Ollama endpoint':
        return 'Desktop: ${l10n.ollamaEndpoint}';
      case 'Database Info':
        return l10n.databaseInfo;
      case 'Storage: ObjectBox':
        return l10n.storage;
      case 'Vector Index: HNSW':
        return l10n.vectorIndex;
      case 'Dimensions: 384':
        return l10n.dimensions;
      case 'Embedding Model: bge-small-zh-v1.5':
        return l10n.embeddingModelBge;
      case 'OK':
        return l10n.ok;
      default:
        return en;
    }
  }

  String _chatProviderLabel(ChatModelProvider provider) {
    switch (provider) {
      case ChatModelProvider.local:
        return _i18n(zhHans: '本地模型', zhHant: '本地模型', en: 'Local Model');
      case ChatModelProvider.openai:
        return 'OpenAI';
      case ChatModelProvider.gemini:
        return 'Gemini';
      case ChatModelProvider.anthropic:
        return 'Anthropic (Claude)';
      case ChatModelProvider.ollama:
        return 'Ollama';
      case ChatModelProvider.custom:
        return _i18n(zhHans: '自定义', zhHant: '自訂', en: 'Custom');
    }
  }

  String _customProtocolLabel(CustomLlmProtocol protocol) {
    switch (protocol) {
      case CustomLlmProtocol.openai:
        return _i18n(
          zhHans: 'OpenAI 兼容',
          zhHant: 'OpenAI 相容',
          en: 'OpenAI Compatible',
        );
      case CustomLlmProtocol.gemini:
        return 'Gemini';
      case CustomLlmProtocol.anthropic:
        return 'Anthropic';
      case CustomLlmProtocol.ollama:
        return 'Ollama';
    }
  }

  String _voiceEngineLabel(VoiceRecognitionEngine engine) {
    switch (engine) {
      case VoiceRecognitionEngine.localModel:
        return _i18n(
          zhHans: '本地模型（默认）',
          zhHant: '本地模型（預設）',
          en: 'Local Model (Default)',
        );
      case VoiceRecognitionEngine.systemNative:
        return _i18n(
          zhHans: '系统识别（Android/iOS）',
          zhHant: '系統辨識（Android/iOS）',
          en: 'System Recognition (Android/iOS)',
        );
      case VoiceRecognitionEngine.endpointCloud:
        return _i18n(
          zhHans: '端点识别（Cloud/WS）',
          zhHant: '端點辨識（Cloud/WS）',
          en: 'Endpoint Recognition (Cloud/WS)',
        );
    }
  }

  String _maskSecret(String value, AppLanguage language) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return _i18n(zhHans: '未设置', zhHant: '未設定', en: 'Not set');
    }
    if (trimmed.length <= 8) return '*' * trimmed.length;
    final suffix = trimmed.substring(trimmed.length - 4);
    return '********$suffix';
  }

  Future<void> _showEndpointDialog(
    BuildContext context,
    WidgetRef ref,
    String title,
    String currentValue,
    void Function(String) onSave,
  ) {
    final controller = TextEditingController(text: currentValue);
    final focusNode = FocusNode();

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: true,
          onTap: () => requestKeyboardFocus(context, focusNode),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: _i18n(
              zhHans: 'ws://127.0.0.1:8008/... 或 http://127.0.0.1:11434',
              zhHant: 'ws://127.0.0.1:8008/... 或 http://127.0.0.1:11434',
              en: 'ws://127.0.0.1:8008/... or http://127.0.0.1:11434',
            ),
            helperText: _i18n(
              zhHans: '支持本地 / 局域网 / 公网端点',
              zhHant: '支援本地 / 區域網 / 公網端點',
              en: 'Supports local/LAN/public endpoints',
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(_i18n(zhHans: '取消', zhHant: '取消', en: 'Cancel')),
          ),
          FilledButton(
            onPressed: () {
              onSave(controller.text.trim());
              Navigator.pop(context);
            },
            child: Text(_i18n(zhHans: '保存', zhHant: '保存', en: 'Save')),
          ),
        ],
      ),
    ).whenComplete(() {
      controller.dispose();
      focusNode.dispose();
    });
  }

  Future<void> _showTextDialog(
    BuildContext context, {
    required String title,
    required String currentValue,
    required void Function(String value) onSave,
    String? hintText,
    String? helperText,
    bool obscureText = false,
  }) {
    final controller = TextEditingController(text: currentValue);
    final focusNode = FocusNode();

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: true,
          onTap: () => requestKeyboardFocus(context, focusNode),
          obscureText: obscureText,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintText,
            helperText: helperText,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(_i18n(zhHans: '取消', zhHant: '取消', en: 'Cancel')),
          ),
          FilledButton(
            onPressed: () {
              onSave(controller.text.trim());
              Navigator.pop(context);
            },
            child: Text(_i18n(zhHans: '保存', zhHant: '保存', en: 'Save')),
          ),
        ],
      ),
    ).whenComplete(() {
      controller.dispose();
      focusNode.dispose();
    });
  }

  Future<void> _shareBackupViaLocalSend(WidgetRef ref) async {
    try {
      final objectBox = ref.read(objectBoxServiceProvider);
      final settings = ref.read(settingsProvider);
      final backupService = LocalSyncBackupService(objectBox);
      final file = await backupService.createBackupFile(settings: settings);

      await Share.shareXFiles(
        [XFile(file.path)],
        subject: l10n.shiguangLocalSendBackup,
        text: l10n.localBackupFromShiguang,
      );

      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.backupExported(file.path))));
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.exportFailed(error.toString())),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _importBackupViaLocalSend(WidgetRef ref) async {
    try {
      final picked = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: const ['json'],
        allowMultiple: false,
        withData: false,
        dialogTitle: l10n.selectBackupFileFromLocalSend,
      );
      if (picked == null || picked.files.isEmpty) return;

      final path = picked.files.single.path;
      if (path == null || path.trim().isEmpty) {
        throw Exception(l10n.failedToResolveFilePath);
      }

      if (!mounted) return;
      final applySettings = await _showImportSettingsOption();
      if (applySettings == null) return;

      final objectBox = ref.read(objectBoxServiceProvider);
      final backupService = LocalSyncBackupService(objectBox);
      final result = await backupService.importBackupFile(file: File(path));

      if (applySettings && result.importedSettings != null) {
        ref
            .read(settingsProvider.notifier)
            .applyBackupSettings(
              result.importedSettings!,
              includeApiKeys: false,
            );
      }

      ref.invalidate(timelineProvider);
      ref.invalidate(reminderProvider);
      ref.invalidate(reminderRepositoryProvider);

      if (!mounted) return;
      _showImportResultDialog(result, appliedSettings: applySettings);
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.importFailed(error.toString())),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<bool?> _showImportSettingsOption() {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.importOptions),
        content: Text(l10n.importSettingsAsWell),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.dataOnly),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.dataAndSettings),
          ),
        ],
      ),
    );
  }

  void _showImportResultDialog(
    LocalSyncImportResult result, {
    required bool appliedSettings,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.importCompleted),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.importResultAccounts(
                result.createdAccounts,
                result.updatedAccounts,
              ),
            ),
            Text(
              l10n.importResultDiaries(
                result.createdDiaries,
                result.updatedDiaries,
              ),
            ),
            Text(
              l10n.importResultReminders(
                result.createdReminders,
                result.updatedReminders,
              ),
            ),
            Text(l10n.importResultSkipped(result.skipped)),
            Text(l10n.importResultTotal(result.totalChanged)),
            const SizedBox(height: 8),
            Text(
              appliedSettings ? l10n.settingsApplied : l10n.settingsNotApplied,
            ),
          ],
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.ok),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(_i18n(zhHans: '退出登录', zhHant: '登出', en: 'Log Out')),
        content: Text(
          _i18n(
            zhHans: '确定要退出当前账号吗？',
            zhHant: '確定要登出目前帳號嗎？',
            en: 'Are you sure you want to log out?',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(_i18n(zhHans: '取消', zhHant: '取消', en: 'Cancel')),
          ),
          FilledButton(
            onPressed: () {
              ref.read(authProvider.notifier).logout();
              Navigator.pop(context);
              context.go('/');
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: Text(_i18n(zhHans: '退出', zhHant: '登出', en: 'Log Out')),
          ),
        ],
      ),
    );
  }

  String _normalizeLanguageTag(String input) {
    return input.trim().replaceAll('_', '-').toLowerCase();
  }

  String _localeToLanguageTag(Locale locale) {
    final parts = <String>[locale.languageCode];
    final script = locale.scriptCode;
    if (script != null && script.isNotEmpty) {
      parts.add(script);
    }
    final country = locale.countryCode;
    if (country != null && country.isNotEmpty) {
      parts.add(country);
    }
    return _normalizeLanguageTag(parts.join('-'));
  }

  List<AppLanguage> _supportedLanguagesForPicker() {
    // Keep the picker on production-ready languages to avoid showing
    // locales that still contain too much untranslated English text.
    const productionLocales = <AppLanguage>[
      AppLanguage.zhHans,
      AppLanguage.zhHant,
      AppLanguage.zhHk,
      AppLanguage.en,
      AppLanguage.ar,
      AppLanguage.bn,
      AppLanguage.de,
      AppLanguage.es,
      AppLanguage.fa,
      AppLanguage.fr,
      AppLanguage.gu,
      AppLanguage.he,
      AppLanguage.hi,
      AppLanguage.id,
      AppLanguage.it,
      AppLanguage.ja,
      AppLanguage.kn,
      AppLanguage.ko,
      AppLanguage.mr,
      AppLanguage.ms,
      AppLanguage.ne,
      AppLanguage.nl,
      AppLanguage.pa,
      AppLanguage.pl,
      AppLanguage.ptBr,
      AppLanguage.ptPt,
      AppLanguage.ru,
      AppLanguage.si,
      AppLanguage.ta,
      AppLanguage.te,
      AppLanguage.th,
      AppLanguage.tr,
      AppLanguage.uk,
      AppLanguage.ur,
      AppLanguage.vi,
    ];
    final supportedTags = AppLocalizations.supportedLocales
        .map(_localeToLanguageTag)
        .toSet();
    return productionLocales
        .where(
          (lang) => supportedTags.contains(_normalizeLanguageTag(lang.code)),
        )
        .toList(growable: false);
  }

  Future<void> _showLanguageDialog(
    BuildContext context,
    WidgetRef ref,
    AppLanguage currentLanguage,
    bool followSystemLanguage,
  ) async {
    final languages = _supportedLanguagesForPicker().toList(growable: true);
    if (!languages.contains(currentLanguage)) {
      languages.insert(0, currentLanguage);
    }
    final result = await Navigator.of(context).push<_LanguageSelectionResult>(
      MaterialPageRoute<_LanguageSelectionResult>(
        fullscreenDialog: true,
        builder: (context) => _LanguageSelectionPage(
          languages: languages,
          initialLanguage: currentLanguage,
          initialFollowSystemLanguage: followSystemLanguage,
          title: _i18n(zhHans: '设置语言', zhHant: '設定語言', en: 'Set Language'),
          cancelText: _i18n(zhHans: '取消', zhHant: '取消', en: 'Cancel'),
          doneText: _i18n(zhHans: '完成', zhHant: '完成', en: 'Done'),
          followSystemText: _i18n(
            zhHans: '同步系统语言设置',
            zhHant: '同步系統語言設定',
            en: 'Follow system language',
          ),
        ),
      ),
    );
    if (result == null) return;
    ref
        .read(settingsProvider.notifier)
        .setLanguagePreference(
          followSystemLanguage: result.followSystemLanguage,
          language: result.language,
        );
  }

  void _showDatabaseInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          _i18n(zhHans: '数据库信息', zhHant: '資料庫資訊', en: 'Database Info'),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _i18n(
                zhHans: '存储: ObjectBox',
                zhHant: '儲存: ObjectBox',
                en: 'Storage: ObjectBox',
              ),
            ),
            Text(
              _i18n(
                zhHans: '向量索引: HNSW',
                zhHant: '向量索引: HNSW',
                en: 'Vector Index: HNSW',
              ),
            ),
            Text(
              _i18n(
                zhHans: '向量维度: 384',
                zhHant: '向量維度: 384',
                en: 'Dimensions: 384',
              ),
            ),
            Text(
              _i18n(
                zhHans: '向量模型: bge-small-zh-v1.5',
                zhHant: '向量模型: bge-small-zh-v1.5',
                en: 'Embedding Model: bge-small-zh-v1.5',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(_i18n(zhHans: '确定', zhHant: '確定', en: 'OK')),
          ),
        ],
      ),
    );
  }
}

class _LanguageSelectionResult {
  final AppLanguage language;
  final bool followSystemLanguage;

  const _LanguageSelectionResult({
    required this.language,
    required this.followSystemLanguage,
  });
}

class _LanguageSelectionPage extends StatefulWidget {
  final List<AppLanguage> languages;
  final AppLanguage initialLanguage;
  final bool initialFollowSystemLanguage;
  final String title;
  final String cancelText;
  final String doneText;
  final String followSystemText;

  const _LanguageSelectionPage({
    required this.languages,
    required this.initialLanguage,
    required this.initialFollowSystemLanguage,
    required this.title,
    required this.cancelText,
    required this.doneText,
    required this.followSystemText,
  });

  @override
  State<_LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<_LanguageSelectionPage> {
  late AppLanguage _selectedLanguage;
  late bool _followSystemLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = widget.initialLanguage;
    _followSystemLanguage = widget.initialFollowSystemLanguage;
  }

  bool get _hasChanges {
    return _selectedLanguage != widget.initialLanguage ||
        _followSystemLanguage != widget.initialFollowSystemLanguage;
  }

  void _submitSelection() {
    Navigator.of(context).pop(
      _LanguageSelectionResult(
        language: _selectedLanguage,
        followSystemLanguage: _followSystemLanguage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final doneColor = Theme.of(context).colorScheme.primary;
    final dividerColor = Theme.of(context).dividerColor;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 86,
        leading: TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(widget.cancelText),
        ),
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _hasChanges ? _submitSelection : null,
            child: Text(
              widget.doneText,
              style: TextStyle(
                color: _hasChanges
                    ? doneColor
                    : Theme.of(context).disabledColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Divider(height: 1, thickness: 1, color: dividerColor),
          Expanded(
            child: ListView.separated(
              itemCount: widget.languages.length + 1,
              separatorBuilder: (_, index) =>
                  Divider(height: 1, thickness: 1, color: dividerColor),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ListTile(
                    title: Text(widget.followSystemText),
                    trailing: _followSystemLanguage
                        ? Icon(Icons.check, color: doneColor)
                        : null,
                    onTap: () {
                      setState(() {
                        _followSystemLanguage = true;
                      });
                      _submitSelection();
                    },
                  );
                }
                final lang = widget.languages[index - 1];
                final selected =
                    !_followSystemLanguage && lang == _selectedLanguage;
                return ListTile(
                  title: Text(lang.displayName),
                  trailing: selected
                      ? Icon(Icons.check, color: doneColor)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedLanguage = lang;
                      _followSystemLanguage = false;
                    });
                    _submitSelection();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AvatarCropperScreen extends StatefulWidget {
  final File file;

  const _AvatarCropperScreen({required this.file});

  @override
  State<_AvatarCropperScreen> createState() => _AvatarCropperScreenState();
}

class _AvatarCropperScreenState extends State<_AvatarCropperScreen> {
  final GlobalKey _viewerKey = GlobalKey();
  final TransformationController _controller = TransformationController();

  AppLocalizations get l10n => AppLocalizations.of(context);

  String _t({required String zhHans, String? zhHant, required String en}) {
    final locale = l10n.localeName;
    if (locale.startsWith('zh_Hant') || locale == 'zh_HK') {
      return zhHant ?? zhHans;
    }
    if (locale.startsWith('zh')) {
      return zhHans;
    }
    return _localizeEn(en);
  }

  String _localizeEn(String en) {
    switch (en) {
      case 'Crop Avatar':
        return l10n.cropAvatar;
      case 'Choose Again':
        return l10n.chooseAgain;
      case 'Rotate 90°':
        return l10n.rotate90;
      case 'Drag the frame to move, drag bottom-right to resize; pinch to zoom and move image.':
        return l10n.dragFrameToMove;
      case 'Image failed to load. Please choose again.':
        return l10n.imageFailedToLoad;
      case 'Image is still loading':
        return l10n.imageIsStillLoading;
      case 'Image area is not ready. Please try again.':
        return l10n.imageAreaNotReady;
      case 'Crop frame is not ready. Please try again.':
        return l10n.cropFrameNotReady;
      case 'Invalid crop area. Please try again.':
        return l10n.invalidCropArea;
      case 'Crop failed. Please try again.':
        return l10n.cropFailed;
      default:
        return en;
    }
  }

  static const double _cropMinSize = 140;
  static const double _cropMargin = 8;

  ui.Image? _decoded;
  String? _loadError;
  double _minScale = 1.0;
  double _maxScale = 8.0;
  bool _isSaving = false;
  Size? _lastViewportSize;
  Rect? _cropRect;
  int _rotationQuarterTurns = 0;

  void _showSnackMessage({
    required String zhHans,
    String? zhHant,
    required String en,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_t(zhHans: zhHans, zhHant: zhHant, en: en)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadImage() async {
    try {
      final bytes = await widget.file.readAsBytes();
      if (bytes.isEmpty) {
        throw const FormatException('empty-image');
      }
      final codec = await ui.instantiateImageCodec(bytes);
      final frame = await codec.getNextFrame();
      if (!mounted) return;
      setState(() {
        _decoded = frame.image;
        _loadError = null;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _decoded = null;
        _loadError = _t(
          zhHans: '图片加载失败，请重新选择',
          zhHant: '圖片載入失敗，請重新選擇',
          en: 'Image failed to load. Please choose again.',
        );
      });
    }
  }

  double _viewportImageWidth(ui.Image image) {
    return _rotationQuarterTurns.isOdd
        ? image.height.toDouble()
        : image.width.toDouble();
  }

  double _viewportImageHeight(ui.Image image) {
    return _rotationQuarterTurns.isOdd
        ? image.width.toDouble()
        : image.height.toDouble();
  }

  Rect _clampCropRect(Rect rect, Size viewport) {
    final maxSize = math.max(
      _cropMinSize,
      math.min(
        viewport.width - _cropMargin * 2,
        viewport.height - _cropMargin * 2,
      ),
    );
    final size = rect.width.clamp(_cropMinSize, maxSize).toDouble();
    final minCenterX = _cropMargin + size / 2;
    final maxCenterX = viewport.width - _cropMargin - size / 2;
    final minCenterY = _cropMargin + size / 2;
    final maxCenterY = viewport.height - _cropMargin - size / 2;
    final centerX = rect.center.dx.clamp(minCenterX, maxCenterX).toDouble();
    final centerY = rect.center.dy.clamp(minCenterY, maxCenterY).toDouble();
    return Rect.fromCenter(
      center: Offset(centerX, centerY),
      width: size,
      height: size,
    );
  }

  void _ensureCropRect(Size viewport) {
    if (_cropRect == null) {
      final size = math.max(
        _cropMinSize,
        math.min(viewport.width, viewport.height) * 0.62,
      );
      _cropRect = Rect.fromCenter(
        center: Offset(viewport.width / 2, viewport.height / 2),
        width: size,
        height: size,
      );
    } else {
      _cropRect = _clampCropRect(_cropRect!, viewport);
    }
  }

  void _initTransform(Size viewportSize) {
    final image = _decoded;
    if (image == null) return;
    if (_lastViewportSize != null &&
        (_lastViewportSize!.width - viewportSize.width).abs() < 1 &&
        (_lastViewportSize!.height - viewportSize.height).abs() < 1) {
      return;
    }

    final cropRect = _cropRect;
    if (cropRect == null) return;
    final imageWidth = _viewportImageWidth(image);
    final imageHeight = _viewportImageHeight(image);
    final scale = math.max(
      cropRect.width / imageWidth,
      cropRect.height / imageHeight,
    );
    _minScale = scale;
    _maxScale = scale * 8;

    final dx = (viewportSize.width - imageWidth * scale) / 2;
    final dy = (viewportSize.height - imageHeight * scale) / 2;
    _controller.value = Matrix4.identity()
      ..translate(dx, dy)
      ..scale(scale);
    _lastViewportSize = viewportSize;
  }

  void _ensureImageCanCoverCrop() {
    final image = _decoded;
    final cropRect = _cropRect;
    final viewport = _lastViewportSize;
    if (image == null || cropRect == null || viewport == null) return;

    final imageWidth = _viewportImageWidth(image);
    final imageHeight = _viewportImageHeight(image);
    final requiredScale = math.max(
      cropRect.width / imageWidth,
      cropRect.height / imageHeight,
    );
    if (requiredScale > _minScale) {
      _minScale = requiredScale;
      _maxScale = math.max(_maxScale, requiredScale * 8);
    }

    final currentScale = _controller.value.getMaxScaleOnAxis();
    if (currentScale >= requiredScale) return;

    final dx = (viewport.width - imageWidth * requiredScale) / 2;
    final dy = (viewport.height - imageHeight * requiredScale) / 2;
    _controller.value = Matrix4.identity()
      ..translate(dx, dy)
      ..scale(requiredScale);
  }

  void _rotateClockwise() {
    setState(() {
      _rotationQuarterTurns = (_rotationQuarterTurns + 1) % 4;
      _lastViewportSize = null;
    });
  }

  Future<void> _saveCropped(double pixelRatio) async {
    if (_isSaving) return;
    if (_decoded == null) {
      _showSnackMessage(
        zhHans: '图片尚未加载完成',
        zhHant: '圖片尚未載入完成',
        en: 'Image is still loading',
      );
      return;
    }
    setState(() => _isSaving = true);

    try {
      final boundary =
          _viewerKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;
      if (boundary == null) {
        _showSnackMessage(
          zhHans: '图片区域未就绪，请重试',
          zhHant: '圖片區域未就緒，請重試',
          en: 'Image area is not ready. Please try again.',
        );
        return;
      }
      final cropRect = _cropRect;
      if (cropRect == null) {
        _showSnackMessage(
          zhHans: '裁剪框未就绪，请重试',
          zhHant: '裁切框未就緒，請重試',
          en: 'Crop frame is not ready. Please try again.',
        );
        return;
      }

      final safePixelRatio = pixelRatio.clamp(1.0, 3.0).toDouble();
      final fullImage = await boundary.toImage(pixelRatio: safePixelRatio);
      final sourceRect =
          Rect.fromLTWH(
            cropRect.left * safePixelRatio,
            cropRect.top * safePixelRatio,
            cropRect.width * safePixelRatio,
            cropRect.height * safePixelRatio,
          ).intersect(
            Rect.fromLTWH(
              0,
              0,
              fullImage.width.toDouble(),
              fullImage.height.toDouble(),
            ),
          );
      if (sourceRect.width < 1 || sourceRect.height < 1) {
        _showSnackMessage(
          zhHans: '裁剪范围无效，请重试',
          zhHant: '裁切範圍無效，請重試',
          en: 'Invalid crop area. Please try again.',
        );
        return;
      }

      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);
      final targetRect = Rect.fromLTWH(
        0,
        0,
        sourceRect.width,
        sourceRect.height,
      );
      canvas.drawImageRect(fullImage, sourceRect, targetRect, Paint());
      final cropped = await recorder.endRecording().toImage(
        targetRect.width.round(),
        targetRect.height.round(),
      );
      final byteData = await cropped.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        if (!mounted) return;
        _showSnackMessage(
          zhHans: '裁剪失败，请重试',
          zhHant: '裁切失敗，請重試',
          en: 'Crop failed. Please try again.',
        );
        return;
      }

      final bytes = byteData.buffer.asUint8List();
      final dir = await getApplicationDocumentsDirectory();
      final targetDir = Directory('${dir.path}/avatars');
      if (!await targetDir.exists()) {
        await targetDir.create(recursive: true);
      }
      final file = File(
        '${targetDir.path}/avatar_${DateTime.now().millisecondsSinceEpoch}.png',
      );
      await file.writeAsBytes(bytes, flush: true);

      if (!mounted) return;
      Navigator.pop(context, file.path);
    } catch (_) {
      if (!mounted) return;
      _showSnackMessage(
        zhHans: '裁剪失败，请重试',
        zhHant: '裁切失敗，請重試',
        en: 'Crop failed. Please try again.',
      );
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceRatio = MediaQuery.of(context).devicePixelRatio;
    final canSave = !_isSaving && _decoded != null && _loadError == null;

    return Scaffold(
      appBar: AppBar(
        title: Text(_t(zhHans: '裁剪头像', zhHant: '裁切頭像', en: 'Crop Avatar')),
        actions: [
          TextButton(
            onPressed: canSave ? () => _saveCropped(deviceRatio) : null,
            child: _isSaving
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(_t(zhHans: '保存', zhHant: '保存', en: 'Save')),
          ),
        ],
      ),
      body: _loadError != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _loadError!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: _loadImage,
                      child: Text(
                        _t(zhHans: '重新选择', zhHant: '重新選擇', en: 'Choose Again'),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : _decoded == null
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                final viewport = Size(
                  constraints.maxWidth,
                  constraints.maxHeight,
                );
                _ensureCropRect(viewport);
                _initTransform(viewport);
                _ensureImageCanCoverCrop();
                final cropRect = _cropRect!;

                return Stack(
                  children: [
                    Positioned.fill(
                      child: RepaintBoundary(
                        key: _viewerKey,
                        child: ClipRect(
                          child: InteractiveViewer(
                            transformationController: _controller,
                            constrained: false,
                            minScale: _minScale,
                            maxScale: _maxScale,
                            boundaryMargin: const EdgeInsets.all(2400),
                            child: SizedBox(
                              width: _viewportImageWidth(_decoded!),
                              height: _viewportImageHeight(_decoded!),
                              child: Center(
                                child: Transform.rotate(
                                  angle: _rotationQuarterTurns * math.pi / 2,
                                  child: SizedBox(
                                    width: _decoded!.width.toDouble(),
                                    height: _decoded!.height.toDouble(),
                                    child: RawImage(
                                      image: _decoded,
                                      filterQuality: FilterQuality.high,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fromRect(
                      rect: cropRect,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onPanUpdate: (details) {
                          setState(() {
                            _cropRect = _clampCropRect(
                              _cropRect!.shift(details.delta),
                              viewport,
                            );
                          });
                        },
                      ),
                    ),
                    Positioned(
                      left: cropRect.right - 26,
                      top: cropRect.bottom - 26,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onPanUpdate: (details) {
                          final current = _cropRect!;
                          final delta =
                              (details.delta.dx + details.delta.dy) / 2;
                          final resized = Rect.fromCenter(
                            center: current.center,
                            width: current.width + delta * 2,
                            height: current.height + delta * 2,
                          );
                          setState(() {
                            _cropRect = _clampCropRect(resized, viewport);
                          });
                        },
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.35),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: const Icon(
                            Icons.open_in_full,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    IgnorePointer(
                      child: CustomPaint(
                        size: Size(constraints.maxWidth, constraints.maxHeight),
                        painter: _CropOverlayPainter(cropRect: cropRect),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.45),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: _rotateClockwise,
                                icon: const Icon(
                                  Icons.rotate_90_degrees_cw,
                                  color: Colors.white,
                                ),
                                tooltip: _t(
                                  zhHans: '旋转 90°',
                                  zhHant: '旋轉 90°',
                                  en: 'Rotate 90°',
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  _t(
                                    zhHans: '拖动框可移动选区；拖动右下角可缩放选区；图片支持双指缩放/移动',
                                    zhHant: '拖動框可移動選區；拖動右下角可縮放選區；圖片支援雙指縮放/移動',
                                    en: 'Drag the frame to move, drag bottom-right to resize; pinch to zoom and move image.',
                                  ),
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: Colors.white.withValues(
                                          alpha: 0.9,
                                        ),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}

class _CropOverlayPainter extends CustomPainter {
  final Rect cropRect;

  const _CropOverlayPainter({required this.cropRect});

  @override
  void paint(Canvas canvas, Size size) {
    final overlayPaint = Paint()..color = Colors.black.withValues(alpha: 0.45);
    final top = cropRect.top.clamp(0.0, size.height);
    final bottom = cropRect.bottom.clamp(0.0, size.height);
    final left = cropRect.left.clamp(0.0, size.width);
    final right = cropRect.right.clamp(0.0, size.width);

    if (top > 0) {
      canvas.drawRect(Rect.fromLTWH(0, 0, size.width, top), overlayPaint);
    }
    if (bottom < size.height) {
      canvas.drawRect(
        Rect.fromLTWH(0, bottom, size.width, size.height - bottom),
        overlayPaint,
      );
    }
    if (left > 0 && bottom > top) {
      canvas.drawRect(Rect.fromLTWH(0, top, left, bottom - top), overlayPaint);
    }
    if (right < size.width && bottom > top) {
      canvas.drawRect(
        Rect.fromLTWH(right, top, size.width - right, bottom - top),
        overlayPaint,
      );
    }

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRect(cropRect, borderPaint);

    final guidePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.45)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final stepX = cropRect.width / 3;
    final stepY = cropRect.height / 3;
    for (var i = 1; i <= 2; i++) {
      final x = cropRect.left + stepX * i;
      final y = cropRect.top + stepY * i;
      canvas.drawLine(
        Offset(x, cropRect.top),
        Offset(x, cropRect.bottom),
        guidePaint,
      );
      canvas.drawLine(
        Offset(cropRect.left, y),
        Offset(cropRect.right, y),
        guidePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _CropOverlayPainter oldDelegate) {
    return oldDelegate.cropRect != cropRect;
  }
}

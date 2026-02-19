import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/objectbox/objectbox_providers.dart';
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
      MaterialPageRoute(
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
              title: const Text('拍摄'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('从相册选取'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: const Text('取消'),
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
        title: const Text('修改昵称'),
        content: TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: true,
          onTap: () => requestKeyboardFocus(context, focusNode),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: '请输入昵称',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, controller.text.trim()),
            child: const Text('保存'),
          ),
        ],
      ),
    );

    controller.dispose();
    focusNode.dispose();

    if (nextName == null || nextName.isEmpty) return;
    final ok = await ref.read(authProvider.notifier).updateUsername(nextName);
    if (!ok && mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('昵称已存在或无效')));
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
    final rawName = (currentUser?.username ?? 'U').trim();
    final avatarInitial = rawName.isNotEmpty
        ? rawName.substring(0, 1).toUpperCase()
        : 'U';

    return Scaffold(
      appBar: AppBar(title: const Text('设置')),
      body: ListView(
        children: [
          // 账号信息
          _buildSectionHeader(context, '账号'),
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
                      currentUser?.username ?? 'User',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 6),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(Icons.edit, size: 18),
                      onPressed: () =>
                          _editUsername(currentUser?.username ?? 'User'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),

          // 定时提醒
          _buildSectionHeader(context, '定时'),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('定时提醒'),
            subtitle: const Text('管理日程提醒和闹钟'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/reminders'),
          ),
          const Divider(),

          // 语言
          _buildSectionHeader(context, '语言'),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('界面语言'),
            subtitle: Text(settings.language.displayName),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showLanguageDialog(context, ref, settings.language),
          ),
          const Divider(),

          // 外观
          _buildSectionHeader(context, '外观'),
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: Text(
              _i18n(
                language,
                zhHans: '主题模式',
                zhHant: '主題模式',
                en: 'Theme Mode',
              ),
            ),
            subtitle: Text(
              _i18n(
                language,
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
                  label: Text(
                    _i18n(
                      language,
                      zhHans: '深色',
                      zhHant: '深色',
                      en: 'Dark',
                    ),
                  ),
                ),
                ButtonSegment<AppThemeMode>(
                  value: AppThemeMode.light,
                  icon: const Icon(Icons.light_mode_outlined),
                  label: Text(
                    _i18n(
                      language,
                      zhHans: '浅色',
                      zhHant: '淺色',
                      en: 'Light',
                    ),
                  ),
                ),
                ButtonSegment<AppThemeMode>(
                  value: AppThemeMode.system,
                  icon: const Icon(Icons.phone_android),
                  label: Text(
                    _i18n(
                      language,
                      zhHans: '系统',
                      zhHant: '系統',
                      en: 'System',
                    ),
                  ),
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
            _i18n(
              language,
              zhHans: 'AI 服务',
              zhHant: 'AI 服務',
              en: 'AI Service',
            ),
          ),
          ListTile(
            leading: const Icon(Icons.chat_bubble_outline),
            title: const Text('AI 对话模型来源'),
            subtitle: Text(_chatProviderLabel(settings.chatModelProvider)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: DropdownButtonFormField<ChatModelProvider>(
              value: settings.chatModelProvider,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '聊天模型',
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
              title: const Text('本地模型'),
              subtitle: Text(
                Platform.isAndroid
                    ? 'Android: ${QwenGgufLocalLLM.modelFileName}'
                    : Platform.isIOS
                    ? 'iOS: fllama 本地模型'
                    : 'Desktop: 使用本地 Ollama Endpoint',
              ),
            ),
          if (settings.chatModelProvider == ChatModelProvider.ollama) ...[
            ListTile(
              leading: const Icon(Icons.hub),
              title: const Text('Ollama Endpoint'),
              subtitle: Text(
                settings.llmEndpoint,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => _showEndpointDialog(
                context,
                ref,
                'Ollama Endpoint',
                settings.llmEndpoint,
                (value) =>
                    ref.read(settingsProvider.notifier).setLlmEndpoint(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.token),
              title: const Text('Ollama Model'),
              subtitle: Text(
                settings.llmModel,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => _showTextDialog(
                context,
                title: 'Ollama Model',
                currentValue: settings.llmModel,
                hintText: 'qwen2.5:0.5b',
                onSave: (value) =>
                    ref.read(settingsProvider.notifier).setLlmModel(value),
              ),
            ),
          ],
          if (settings.chatModelProvider == ChatModelProvider.openai) ...[
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('OpenAI Endpoint'),
              subtitle: Text(
                settings.openAiEndpoint,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => _showTextDialog(
                context,
                title: 'OpenAI Endpoint',
                currentValue: settings.openAiEndpoint,
                hintText: 'https://api.openai.com/v1',
                onSave: (value) => ref
                    .read(settingsProvider.notifier)
                    .setOpenAiEndpoint(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.vpn_key_outlined),
              title: const Text('OpenAI API Key'),
              subtitle: Text(_maskSecret(settings.openAiApiKey)),
              onTap: () => _showTextDialog(
                context,
                title: 'OpenAI API Key',
                currentValue: settings.openAiApiKey,
                hintText: 'sk-...',
                obscureText: true,
                onSave: (value) =>
                    ref.read(settingsProvider.notifier).setOpenAiApiKey(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.token),
              title: const Text('OpenAI Model'),
              subtitle: Text(settings.openAiModel),
              onTap: () => _showTextDialog(
                context,
                title: 'OpenAI Model',
                currentValue: settings.openAiModel,
                hintText: 'gpt-4o-mini',
                onSave: (value) =>
                    ref.read(settingsProvider.notifier).setOpenAiModel(value),
              ),
            ),
          ],
          if (settings.chatModelProvider == ChatModelProvider.gemini) ...[
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('Gemini Endpoint'),
              subtitle: Text(
                settings.geminiEndpoint,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => _showTextDialog(
                context,
                title: 'Gemini Endpoint',
                currentValue: settings.geminiEndpoint,
                hintText: 'https://generativelanguage.googleapis.com/v1beta',
                onSave: (value) => ref
                    .read(settingsProvider.notifier)
                    .setGeminiEndpoint(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.vpn_key_outlined),
              title: const Text('Gemini API Key'),
              subtitle: Text(_maskSecret(settings.geminiApiKey)),
              onTap: () => _showTextDialog(
                context,
                title: 'Gemini API Key',
                currentValue: settings.geminiApiKey,
                hintText: 'AIza...',
                obscureText: true,
                onSave: (value) =>
                    ref.read(settingsProvider.notifier).setGeminiApiKey(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.token),
              title: const Text('Gemini Model'),
              subtitle: Text(settings.geminiModel),
              onTap: () => _showTextDialog(
                context,
                title: 'Gemini Model',
                currentValue: settings.geminiModel,
                hintText: 'gemini-1.5-flash',
                onSave: (value) =>
                    ref.read(settingsProvider.notifier).setGeminiModel(value),
              ),
            ),
          ],
          if (settings.chatModelProvider == ChatModelProvider.anthropic) ...[
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('Anthropic Endpoint'),
              subtitle: Text(
                settings.anthropicEndpoint,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => _showTextDialog(
                context,
                title: 'Anthropic Endpoint',
                currentValue: settings.anthropicEndpoint,
                hintText: 'https://api.anthropic.com/v1',
                onSave: (value) => ref
                    .read(settingsProvider.notifier)
                    .setAnthropicEndpoint(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.vpn_key_outlined),
              title: const Text('Anthropic API Key'),
              subtitle: Text(_maskSecret(settings.anthropicApiKey)),
              onTap: () => _showTextDialog(
                context,
                title: 'Anthropic API Key',
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
              title: const Text('Anthropic Model'),
              subtitle: Text(settings.anthropicModel),
              onTap: () => _showTextDialog(
                context,
                title: 'Anthropic Model',
                currentValue: settings.anthropicModel,
                hintText: 'claude-3-5-sonnet-latest',
                onSave: (value) => ref
                    .read(settingsProvider.notifier)
                    .setAnthropicModel(value),
              ),
            ),
          ],
          if (settings.chatModelProvider == ChatModelProvider.custom) ...[
            ListTile(
              leading: const Icon(Icons.settings_suggest_outlined),
              title: const Text('Custom 协议'),
              subtitle: Text(_customProtocolLabel(settings.customLlmProtocol)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: DropdownButtonFormField<CustomLlmProtocol>(
                value: settings.customLlmProtocol,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '协议类型',
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
              title: const Text('Custom Endpoint'),
              subtitle: Text(
                settings.customEndpoint,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => _showTextDialog(
                context,
                title: 'Custom Endpoint',
                currentValue: settings.customEndpoint,
                hintText: 'https://your-model-endpoint/v1',
                onSave: (value) => ref
                    .read(settingsProvider.notifier)
                    .setCustomEndpoint(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.vpn_key_outlined),
              title: const Text('Custom API Key'),
              subtitle: Text(_maskSecret(settings.customApiKey)),
              onTap: () => _showTextDialog(
                context,
                title: 'Custom API Key',
                currentValue: settings.customApiKey,
                hintText: 'Optional for local/custom servers',
                obscureText: true,
                onSave: (value) =>
                    ref.read(settingsProvider.notifier).setCustomApiKey(value),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.token),
              title: const Text('Custom Model'),
              subtitle: Text(settings.customModel),
              onTap: () => _showTextDialog(
                context,
                title: 'Custom Model',
                currentValue: settings.customModel,
                hintText: 'Model ID',
                onSave: (value) =>
                    ref.read(settingsProvider.notifier).setCustomModel(value),
              ),
            ),
          ],
          const Divider(),
          ListTile(
            leading: const Icon(Icons.mic),
            title: const Text('语音识别引擎'),
            subtitle: Text(_voiceEngineLabel(settings.voiceRecognitionEngine)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: SegmentedButton<VoiceRecognitionEngine>(
              segments: const [
                ButtonSegment(
                  value: VoiceRecognitionEngine.localModel,
                  icon: Icon(Icons.memory_outlined),
                  label: Text('本地模型'),
                ),
                ButtonSegment(
                  value: VoiceRecognitionEngine.systemNative,
                  icon: Icon(Icons.phone_android_outlined),
                  label: Text('系统识别'),
                ),
                ButtonSegment(
                  value: VoiceRecognitionEngine.endpointCloud,
                  icon: Icon(Icons.cloud_outlined),
                  label: Text('端点识别'),
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
            const ListTile(
              leading: Icon(Icons.hub_outlined),
              title: Text('本地语音模型'),
              subtitle: Text('SenseVoice ONNX（端侧）'),
            ),
          if (settings.voiceRecognitionEngine ==
              VoiceRecognitionEngine.systemNative)
            const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('系统语音识别'),
              subtitle: Text('使用 Android / iOS 内置识别服务（可能走云端）'),
            ),
          if (settings.voiceRecognitionEngine ==
              VoiceRecognitionEngine.endpointCloud)
            ListTile(
              leading: const Icon(Icons.cloud_outlined),
              title: const Text('Voice AI Endpoint'),
              subtitle: Text(
                settings.voiceAiEndpoint,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => _showEndpointDialog(
                context,
                ref,
                'Voice AI Endpoint',
                settings.voiceAiEndpoint,
                (value) => ref
                    .read(settingsProvider.notifier)
                    .setVoiceAiEndpoint(value),
              ),
            ),
          const ListTile(
            leading: Icon(Icons.hub),
            title: Text('Embedding Model'),
            subtitle: Text(
              'On-device bge-small-zh-v1.5-ONNX (model.onnx + model.onnx_data)',
            ),
          ),
          const Divider(),
          _buildSectionHeader(context, '多端同步'),
          ListTile(
            leading: const Icon(Icons.sync_alt_outlined),
            title: const Text('发送到其他设备（LocalSend）'),
            subtitle: const Text('导出本地备份并通过分享面板发送'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _shareBackupViaLocalSend(ref),
          ),
          ListTile(
            leading: const Icon(Icons.download_outlined),
            title: const Text('从 LocalSend 接收并导入'),
            subtitle: const Text('选择接收到的备份 JSON，合并导入本地数据'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _importBackupViaLocalSend(ref),
          ),
          const Divider(),
          _buildSectionHeader(
            context,
            _i18n(
              language,
              zhHans: '自动生成',
              zhHant: '自動生成',
              en: 'Auto Generation',
            ),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.summarize),
            title: Text(
              _i18n(
                language,
                zhHans: '自动生成摘要',
                zhHant: '自動生成摘要',
                en: 'Auto Generate Summary',
              ),
            ),
            subtitle: Text(
              _i18n(
                language,
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
                language,
                zhHans: '自动生成向量',
                zhHant: '自動生成向量',
                en: 'Auto Generate Embedding',
              ),
            ),
            subtitle: Text(
              _i18n(
                language,
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
          const Divider(),
          _buildSectionHeader(
            context,
            _i18n(
              language,
              zhHans: '关于',
              zhHant: '關於',
              en: 'About',
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: const Text('拾光'),
            subtitle: Text(
              _i18n(
                language,
                zhHans: '版本 1.0.0',
                zhHant: '版本 1.0.0',
                en: 'Version 1.0.0',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.storage),
            title: Text(
              _i18n(
                language,
                zhHans: '数据库',
                zhHant: '資料庫',
                en: 'Database',
              ),
            ),
            subtitle: Text(
              _i18n(
                language,
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 8),
                  Text('退出登录'),
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

  String _i18n(
    AppLanguage language, {
    required String zhHans,
    String? zhHant,
    required String en,
  }) {
    switch (language) {
      case AppLanguage.zhHans:
        return zhHans;
      case AppLanguage.zhHant:
        return zhHant ?? zhHans;
      case AppLanguage.en:
        return en;
    }
  }

  String _chatProviderLabel(ChatModelProvider provider) {
    switch (provider) {
      case ChatModelProvider.local:
        return '本地模型';
      case ChatModelProvider.openai:
        return 'OpenAI';
      case ChatModelProvider.gemini:
        return 'Gemini';
      case ChatModelProvider.anthropic:
        return 'Anthropic (Claude)';
      case ChatModelProvider.ollama:
        return 'Ollama';
      case ChatModelProvider.custom:
        return '自定义';
    }
  }

  String _customProtocolLabel(CustomLlmProtocol protocol) {
    switch (protocol) {
      case CustomLlmProtocol.openai:
        return 'OpenAI Compatible';
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
        return '本地模型（默认）';
      case VoiceRecognitionEngine.systemNative:
        return '系统识别（Android/iOS）';
      case VoiceRecognitionEngine.endpointCloud:
        return '端点识别（Cloud/WS）';
    }
  }

  String _maskSecret(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return '未设置';
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
    final language = ref.read(settingsProvider).language;
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
            hintText: 'ws://127.0.0.1:8008/... or http://127.0.0.1:11434',
            helperText: _i18n(
              language,
              zhHans: '支持本地 / 局域网 / 公网端点',
              zhHant: '支援本地 / 區域網 / 公網端點',
              en: 'Supports local/LAN/public endpoints',
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              _i18n(
                language,
                zhHans: '取消',
                zhHant: '取消',
                en: 'Cancel',
              ),
            ),
          ),
          FilledButton(
            onPressed: () {
              onSave(controller.text.trim());
              Navigator.pop(context);
            },
            child: Text(
              _i18n(language, zhHans: '保存', zhHant: '保存', en: 'Save'),
            ),
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
    final language = ref.read(settingsProvider).language;
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
            child: Text(
              _i18n(
                language,
                zhHans: '取消',
                zhHant: '取消',
                en: 'Cancel',
              ),
            ),
          ),
          FilledButton(
            onPressed: () {
              onSave(controller.text.trim());
              Navigator.pop(context);
            },
            child: Text(
              _i18n(language, zhHans: '保存', zhHant: '保存', en: 'Save'),
            ),
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
        subject: 'Shiguang LocalSend Backup',
        text: '拾光本地备份（建议在接收端通过 LocalSend 接收）',
      );

      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('备份已导出: ${file.path}')));
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('导出失败: $error'), backgroundColor: Colors.red),
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
        dialogTitle: '选择 LocalSend 接收的备份文件',
      );
      if (picked == null || picked.files.isEmpty) return;

      final path = picked.files.single.path;
      if (path == null || path.trim().isEmpty) {
        throw Exception('未获取到文件路径');
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
        SnackBar(content: Text('导入失败: $error'), backgroundColor: Colors.red),
      );
    }
  }

  Future<bool?> _showImportSettingsOption() {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('导入选项'),
        content: const Text('是否同时导入设置项？\n（不会覆盖 API Key）'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('仅导入数据'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('数据+设置'),
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
        title: const Text('导入完成'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '账号: +${result.createdAccounts} / 更新 ${result.updatedAccounts}',
            ),
            Text('日记: +${result.createdDiaries} / 更新 ${result.updatedDiaries}'),
            Text(
              '提醒: +${result.createdReminders} / 更新 ${result.updatedReminders}',
            ),
            Text('跳过: ${result.skipped}'),
            Text('总变更: ${result.totalChanged}'),
            const SizedBox(height: 8),
            Text(appliedSettings ? '已应用备份中的设置项。' : '未应用备份中的设置项。'),
          ],
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('退出登录'),
        content: const Text('确定要退出当前账号吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () {
              ref.read(authProvider.notifier).logout();
              Navigator.pop(context);
              context.go('/');
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('退出'),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(
    BuildContext context,
    WidgetRef ref,
    AppLanguage currentLanguage,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择语言'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: AppLanguage.values.map((lang) {
            final isSelected = lang == currentLanguage;
            return ListTile(
              title: Text(lang.displayName),
              subtitle: Text(lang.shortName),
              trailing: isSelected
                  ? const Icon(Icons.check, color: Colors.green)
                  : null,
              onTap: () {
                ref.read(settingsProvider.notifier).setLanguage(lang);
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showDatabaseInfo(BuildContext context) {
    final language = ref.read(settingsProvider).language;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          _i18n(
            language,
            zhHans: '数据库信息',
            zhHant: '資料庫資訊',
            en: 'Database Info',
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _i18n(
                language,
                zhHans: '存储: ObjectBox',
                zhHant: '儲存: ObjectBox',
                en: 'Storage: ObjectBox',
              ),
            ),
            Text(
              _i18n(
                language,
                zhHans: '向量索引: HNSW',
                zhHant: '向量索引: HNSW',
                en: 'Vector Index: HNSW',
              ),
            ),
            Text(
              _i18n(
                language,
                zhHans: '向量维度: 384',
                zhHant: '向量維度: 384',
                en: 'Dimensions: 384',
              ),
            ),
            Text(
              _i18n(
                language,
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
            child: Text(_i18n(language, zhHans: '确定', zhHant: '確定', en: 'OK')),
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
        _loadError = '图片加载失败，请重新选择';
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
    final scale = math.max(cropRect.width / imageWidth, cropRect.height / imageHeight);
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
    final requiredScale =
        math.max(cropRect.width / imageWidth, cropRect.height / imageHeight);
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('图片尚未加载完成')));
      return;
    }
    setState(() => _isSaving = true);

    try {
      final boundary =
          _viewerKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;
      if (boundary == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('图片区域未就绪，请重试')));
        return;
      }
      final cropRect = _cropRect;
      if (cropRect == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('裁剪框未就绪，请重试')));
        return;
      }

      final safePixelRatio = pixelRatio.clamp(1.0, 3.0).toDouble();
      final fullImage = await boundary.toImage(pixelRatio: safePixelRatio);
      final sourceRect = Rect.fromLTWH(
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
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('裁剪范围无效，请重试')));
        return;
      }

      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);
      final targetRect = Rect.fromLTWH(0, 0, sourceRect.width, sourceRect.height);
      canvas.drawImageRect(fullImage, sourceRect, targetRect, Paint());
      final cropped = await recorder.endRecording().toImage(
        targetRect.width.round(),
        targetRect.height.round(),
      );
      final byteData = await cropped.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('裁剪失败，请重试')));
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('裁剪失败，请重试')));
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
        title: const Text('裁剪头像'),
        actions: [
          TextButton(
            onPressed: canSave ? () => _saveCropped(deviceRatio) : null,
            child: _isSaving
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('保存'),
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
                      child: const Text('重新选择'),
                    ),
                  ],
                ),
              ),
            )
          : _decoded == null
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                final viewport = Size(constraints.maxWidth, constraints.maxHeight);
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
                          final delta = (details.delta.dx + details.delta.dy) / 2;
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
                                tooltip: '旋转 90°',
                              ),
                              Expanded(
                                child: Text(
                                  '拖动框可移动选区；拖动右下角可缩放选区；图片支持双指缩放/移动',
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: Colors.white.withValues(alpha: 0.9),
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
      canvas.drawLine(Offset(x, cropRect.top), Offset(x, cropRect.bottom), guidePaint);
      canvas.drawLine(Offset(cropRect.left, y), Offset(cropRect.right, y), guidePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _CropOverlayPainter oldDelegate) {
    return oldDelegate.cropRect != cropRect;
  }
}

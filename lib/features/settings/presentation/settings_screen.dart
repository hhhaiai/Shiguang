import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/ui/keyboard.dart';
import '../../auth/presentation/controllers/auth_controller.dart';
import '../../diary/data/ai/qwen_gguf_local_llm.dart';
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
            title: const Text('Theme Mode'),
            subtitle: const Text('Light / Dark / Follow System'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: SegmentedButton<AppThemeMode>(
              segments: const [
                ButtonSegment<AppThemeMode>(
                  value: AppThemeMode.dark,
                  icon: Icon(Icons.dark_mode_outlined),
                  label: Text('Dark'),
                ),
                ButtonSegment<AppThemeMode>(
                  value: AppThemeMode.light,
                  icon: Icon(Icons.light_mode_outlined),
                  label: Text('Light'),
                ),
                ButtonSegment<AppThemeMode>(
                  value: AppThemeMode.system,
                  icon: Icon(Icons.phone_android),
                  label: Text('System'),
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
          _buildSectionHeader(context, 'AI Service'),
          ListTile(
            leading: const Icon(Icons.shield),
            title: const Text('Local-Only Policy'),
            subtitle: Text(
              Platform.isAndroid
                  ? 'Android: only loopback endpoints are allowed'
                  : 'iOS: loopback and private LAN endpoints are allowed',
            ),
          ),
          ListTile(
            leading: const Icon(Icons.smart_toy_outlined),
            title: const Text('Qwen GGUF Runtime'),
            subtitle: Text(
              Platform.isAndroid
                  ? 'Android local model: ${QwenGgufLocalLLM.modelFileName}'
                  : 'Current platform falls back to endpoint mode',
            ),
          ),
          ListTile(
            leading: const Icon(Icons.mic),
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
              (value) =>
                  ref.read(settingsProvider.notifier).setVoiceAiEndpoint(value),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.hub),
            title: const Text('Embedding Model'),
            subtitle: Text(
              'On-device bge-small-zh-v1.5-ONNX (model.onnx + model.onnx_data)',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          if (!settings.preferLocalAi || !Platform.isAndroid)
            ListTile(
              leading: const Icon(Icons.chat_bubble_outline),
              title: const Text('LLM Endpoint'),
              subtitle: Text(
                settings.llmEndpoint,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => _showEndpointDialog(
                context,
                ref,
                'LLM Endpoint',
                settings.llmEndpoint,
                (value) =>
                    ref.read(settingsProvider.notifier).setLlmEndpoint(value),
              ),
            ),
          SwitchListTile(
            secondary: const Icon(Icons.memory),
            title: const Text('Prefer Local AI'),
            subtitle: Text(
              Platform.isAndroid
                  ? 'Use on-device ASR + Embedding + Qwen GGUF'
                  : 'Use local endpoint ASR + endpoint LLM + local embedding',
            ),
            value: settings.preferLocalAi,
            onChanged: (value) {
              ref.read(settingsProvider.notifier).setPreferLocalAi(value);
            },
          ),
          const Divider(),
          _buildSectionHeader(context, 'Auto Generation'),
          SwitchListTile(
            secondary: const Icon(Icons.summarize),
            title: const Text('Auto Generate Summary'),
            subtitle: const Text('Generate AI summary for new entries'),
            value: settings.autoGenerateSummary,
            onChanged: (value) {
              ref.read(settingsProvider.notifier).setAutoGenerateSummary(value);
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.hub),
            title: const Text('Auto Generate Embedding'),
            subtitle: const Text('Generate vector embedding for search'),
            value: settings.autoGenerateEmbedding,
            onChanged: (value) {
              ref
                  .read(settingsProvider.notifier)
                  .setAutoGenerateEmbedding(value);
            },
          ),
          const Divider(),
          _buildSectionHeader(context, 'About'),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('拾光'),
            subtitle: Text('Version 1.0.0'),
          ),
          ListTile(
            leading: const Icon(Icons.storage),
            title: const Text('Database'),
            subtitle: const Text('ObjectBox with HNSW index'),
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
            hintText: 'ws://127.0.0.1:8008/... or http://127.0.0.1:11434',
            helperText: Platform.isAndroid
                ? 'Allowed on Android: 127.0.0.1 / localhost'
                : 'Allowed on iOS: 127.0.0.1 / localhost / private LAN IP',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              onSave(controller.text.trim());
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    ).whenComplete(() {
      controller.dispose();
      focusNode.dispose();
    });
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
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Database Info'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Storage: ObjectBox'),
            Text('Vector Index: HNSW'),
            Text('Dimensions: 384'),
            Text('Embedding Model: bge-small-zh-v1.5'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
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
  final GlobalKey _repaintKey = GlobalKey();
  final TransformationController _controller = TransformationController();
  ui.Image? _decoded;
  Uint8List? _imageBytes;
  double _minScale = 1.0;
  double _maxScale = 4.0;
  bool _isSaving = false;
  bool _hasInitTransform = false;

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
    final bytes = await widget.file.readAsBytes();
    final codec = await ui.instantiateImageCodec(bytes);
    final frame = await codec.getNextFrame();
    if (!mounted) return;
    setState(() {
      _decoded = frame.image;
      _imageBytes = bytes;
    });
  }

  void _initTransform(double cropSize) {
    final image = _decoded;
    if (image == null) return;
    if (_hasInitTransform) return;

    final scale = math.max(cropSize / image.width, cropSize / image.height);
    _minScale = scale;
    _maxScale = scale * 4;

    final dx = (cropSize - image.width * scale) / 2;
    final dy = (cropSize - image.height * scale) / 2;
    _controller.value = Matrix4.identity()
      ..translate(dx, dy)
      ..scale(scale);
    _hasInitTransform = true;
  }

  Future<void> _saveCropped(double pixelRatio) async {
    if (_isSaving) return;
    setState(() => _isSaving = true);

    try {
      final boundary =
          _repaintKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;
      if (boundary == null) return;

      final image = await boundary.toImage(pixelRatio: pixelRatio);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return;

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('裁剪头像'),
        actions: [
          TextButton(
            onPressed: _isSaving ? null : () => _saveCropped(deviceRatio),
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
      body: _decoded == null || _imageBytes == null
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                final size = math.min(
                  constraints.maxWidth - 32,
                  constraints.maxHeight - 120,
                );
                _initTransform(size);
                final cropRect = Rect.fromCenter(
                  center: Offset(
                    constraints.maxWidth / 2,
                    constraints.maxHeight / 2,
                  ),
                  width: size,
                  height: size,
                );

                return Stack(
                  children: [
                    Positioned.fill(child: Container(color: Colors.black)),
                    Center(
                      child: RepaintBoundary(
                        key: _repaintKey,
                        child: ClipRect(
                          child: SizedBox(
                            width: size,
                            height: size,
                            child: InteractiveViewer(
                              transformationController: _controller,
                              minScale: _minScale,
                              maxScale: _maxScale,
                              boundaryMargin: EdgeInsets.zero,
                              child: Image.memory(
                                _imageBytes!,
                                fit: BoxFit.cover,
                              ),
                            ),
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
    final overlayPaint = Paint()..color = Colors.black.withValues(alpha: 0.6);
    final clearPaint = Paint()..blendMode = BlendMode.clear;

    canvas.saveLayer(Offset.zero & size, Paint());
    canvas.drawRect(Offset.zero & size, overlayPaint);
    canvas.drawRect(cropRect, clearPaint);
    canvas.restore();

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRect(cropRect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _CropOverlayPainter oldDelegate) {
    return oldDelegate.cropRect != cropRect;
  }
}

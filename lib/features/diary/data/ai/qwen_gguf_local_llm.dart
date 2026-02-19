import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:llama_flutter_android/llama_flutter_android.dart' as llama;
import 'package:path_provider/path_provider.dart';

import '../../domain/interfaces/i_local_llm.dart';

/// Qwen 2.5 0.5B local GGUF runtime (Android).
///
/// Model resolution order:
/// 1) App private support directory
/// 2) App private external directory (Android/data/.../files)
/// 3) Download directory (/storage/emulated/0/Download)
/// 4) Bundled Flutter asset (optional)
class QwenGgufLocalLLM implements ILocalLLM {
  static const String modelFileName = 'qwen2.5-0.5b-instruct-q4_0.gguf';
  static const String _assetModelPath = 'assets/models/llm/$modelFileName';
  static const Duration _loadTimeout = Duration(minutes: 2);
  static const Duration _chatTimeout = Duration(minutes: 2);

  final llama.LlamaController _controller;
  final int _contextSize;
  final int _threads;

  Future<void>? _loadTask;
  Future<void> _serial = Future<void>.value();
  bool _disposed = false;
  String? _loadedModelPath;

  QwenGgufLocalLLM({
    llama.LlamaController? controller,
    int contextSize = 2048,
    int? threads,
  }) : _controller = controller ?? llama.LlamaController(),
       _contextSize = contextSize,
       _threads = threads ?? _recommendedThreads();

  static int _recommendedThreads() {
    final cores = Platform.numberOfProcessors;
    if (cores <= 2) return 1;
    if (cores <= 4) return 2;
    if (cores <= 6) return 3;
    return 4;
  }

  @override
  Future<String> summarize(String text) {
    final prompt = '请用一句中文总结下面内容：\n\n$text\n\n总结：';
    return chat(message: prompt, context: const []);
  }

  @override
  Future<List<String>> extractTags(String text) async {
    final prompt = '从下面内容提取 3 到 5 个中文标签，仅返回逗号分隔结果：\n\n$text\n\n标签：';
    final result = await chat(message: prompt, context: const []);
    return result
        .split(RegExp(r'[,，、\n]'))
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .take(5)
        .toList(growable: false);
  }

  @override
  Future<Float32List> generateEmbedding(String text) {
    throw UnsupportedError(
      'QwenGgufLocalLLM.generateEmbedding is disabled. Use EmbeddingService.',
    );
  }

  @override
  Future<String> chat({
    required String message,
    List<ChatMessage> context = const [],
  }) async {
    return _runExclusive(() async {
      await _ensureReady();
      await _controller.clearContext();

      final messages = <ChatMessage>[
        ChatMessage(role: 'system', content: '你是一个本地离线助手，请使用简洁、准确的中文回答。'),
        ...context,
        ChatMessage(role: 'user', content: message),
      ];

      final stream = _controller.generateChat(
        messages: messages
            .map((m) => llama.ChatMessage(role: m.role, content: m.content))
            .toList(growable: false),
        template: 'chatml',
        maxTokens: 384,
        temperature: 0.6,
        topP: 0.9,
        topK: 40,
        repeatPenalty: 1.08,
      );

      final buffer = StringBuffer();
      final completer = Completer<String>();
      late final StreamSubscription<String> sub;

      sub = stream.listen(
        (token) => buffer.write(token),
        onError: (error, stackTrace) {
          if (!completer.isCompleted) {
            completer.completeError(error, stackTrace);
          }
        },
        onDone: () {
          if (!completer.isCompleted) {
            completer.complete(buffer.toString());
          }
        },
        cancelOnError: true,
      );

      try {
        final text = await completer.future.timeout(
          _chatTimeout,
          onTimeout: () async {
            await _controller.stop();
            throw TimeoutException('Qwen local chat timeout');
          },
        );
        return text.trim();
      } finally {
        await sub.cancel();
      }
    });
  }

  Future<T> _runExclusive<T>(Future<T> Function() action) {
    final completer = Completer<T>();
    _serial = _serial
        .catchError((_) {})
        .then((_) async {
          if (_disposed) {
            throw StateError('Qwen local runtime already disposed');
          }
          final value = await action();
          if (!completer.isCompleted) {
            completer.complete(value);
          }
        })
        .catchError((error, stackTrace) {
          if (!completer.isCompleted) {
            completer.completeError(error, stackTrace);
          }
        });
    return completer.future;
  }

  Future<void> _ensureReady() async {
    if (!Platform.isAndroid) {
      throw UnsupportedError('GGUF local LLM currently supports Android only');
    }

    final task = _loadTask ??= _createLoadTask();
    await task;
  }

  Future<void> _createLoadTask() async {
    try {
      await _loadModel();
    } catch (_) {
      // Allow next request to retry loading after a transient failure.
      _loadTask = null;
      rethrow;
    }
  }

  Future<void> _loadModel() async {
    if (_disposed) return;
    final alreadyLoaded = await _controller.isModelLoaded();
    if (alreadyLoaded) return;

    final modelPath = await _resolveModelPath();
    await _controller
        .loadModel(
          modelPath: modelPath,
          threads: _threads,
          contextSize: _contextSize,
          gpuLayers: 0,
        )
        .timeout(_loadTimeout);

    _loadedModelPath = modelPath;
    if (kDebugMode) {
      debugPrint(
        '[LLM] Qwen GGUF loaded path=$_loadedModelPath threads=$_threads ctx=$_contextSize',
      );
    }
  }

  Future<String> _resolveModelPath() async {
    final supportDir = await getApplicationSupportDirectory();
    final supportPath = '${supportDir.path}/models/llm/$modelFileName';
    if (await _fileExistsWithContent(supportPath)) {
      return supportPath;
    }

    final externalDir = await getExternalStorageDirectory();
    if (externalDir != null) {
      final externalPath = '${externalDir.path}/models/llm/$modelFileName';
      if (await _fileExistsWithContent(externalPath)) {
        return externalPath;
      }
    }

    const downloadCandidates = [
      '/storage/emulated/0/Download/$modelFileName',
      '/sdcard/Download/$modelFileName',
    ];
    for (final path in downloadCandidates) {
      if (await _fileExistsWithContent(path)) {
        return path;
      }
    }

    final copied = await _tryCopyAssetModel(supportPath);
    if (copied != null) {
      return copied;
    }

    throw StateError(
      'Qwen GGUF model not found. Place $modelFileName in one of:\n'
      '- $supportPath\n'
      '- ${externalDir?.path ?? '[external storage]'}/models/llm/\n'
      '- /storage/emulated/0/Download/\n'
      'or bundle asset $_assetModelPath.',
    );
  }

  Future<bool> _fileExistsWithContent(String path) async {
    final file = File(path);
    if (!await file.exists()) return false;
    return await file.length() > 0;
  }

  Future<String?> _tryCopyAssetModel(String targetPath) async {
    try {
      final bytes = await rootBundle.load(_assetModelPath);
      final target = File(targetPath);
      await target.parent.create(recursive: true);
      await target.writeAsBytes(
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes),
        flush: true,
      );
      return target.path;
    } catch (_) {
      return null;
    }
  }

  @override
  void dispose() {
    if (_disposed) return;
    _disposed = true;
    unawaited(_controller.dispose());
  }
}

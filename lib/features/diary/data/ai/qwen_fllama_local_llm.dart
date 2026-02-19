import 'dart:async';
import 'dart:io';

import 'package:fllama/fllama.dart';
import 'package:fllama/fllama_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/utils/flutter_asset_file.dart';
import '../../domain/interfaces/i_local_llm.dart';

/// Qwen local GGUF runtime for iOS via fllama (llama.cpp).
class QwenFllamaLocalLLM implements ILocalLLM {
  static const String modelFileName = 'qwen2.5-0.5b-instruct-q4_0.gguf';
  static const String _assetModelPath = 'assets/models/llm/$modelFileName';
  static const Duration _loadTimeout = Duration(minutes: 2);
  static const Duration _chatTimeout = Duration(minutes: 2);

  final int _contextSize;
  final int _batchSize;
  final int _threads;

  Future<void>? _initTask;
  Future<void> _serial = Future<void>.value();
  bool _disposed = false;
  double? _contextId;
  String? _loadedModelPath;

  QwenFllamaLocalLLM({int contextSize = 512, int? threads})
    : _contextSize = contextSize,
      _batchSize = contextSize.clamp(32, 128).toInt(),
      _threads = threads ?? (_recommendedThreads() > 2 ? 2 : _recommendedThreads());

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
      'QwenFllamaLocalLLM.generateEmbedding is disabled. Use EmbeddingService.',
    );
  }

  @override
  Future<String> chat({
    required String message,
    List<ChatMessage> context = const [],
  }) async {
    return _runExclusive(() async {
      await _ensureReady();
      final contextId = _contextId;
      if (contextId == null || contextId <= 0) {
        throw StateError('Fllama context is unavailable');
      }

      final runtime = Fllama.instance();
      if (runtime == null) {
        throw StateError('Fllama runtime is unavailable');
      }

      final prompt = await _buildChatPrompt(
        runtime: runtime,
        contextId: contextId,
        message: message,
        context: context,
      );
      final response = await runtime
          .completion(
            contextId,
            prompt: prompt,
            nPredict: 384,
            temperature: 0.6,
            topP: 0.9,
            topK: 40,
            penaltyRepeat: 1.08,
            stop: const ['<|im_end|>'],
          )
          .timeout(_chatTimeout);

      final text = _normalizeReply((response?['text'] ?? '').toString());
      if (text.isEmpty) {
        throw StateError('Fllama returned empty response: $response');
      }
      return text;
    });
  }

  Future<String> _buildChatPrompt({
    required Fllama runtime,
    required double contextId,
    required String message,
    required List<ChatMessage> context,
  }) async {
    final messages = <RoleContent>[
      RoleContent(role: 'system', content: '你是一个本地离线助手，请使用简洁、准确的中文回答。'),
      ...context.map(
        (item) => RoleContent(
          role: item.role == 'assistant' ? 'assistant' : 'user',
          content: item.content.trim(),
        ),
      ),
      RoleContent(role: 'user', content: message.trim()),
    ];

    final formatted = await runtime.getFormattedChat(
      contextId,
      messages: messages,
    );
    if (formatted != null && formatted.trim().isNotEmpty) {
      return formatted;
    }

    final sb = StringBuffer();
    for (final item in messages) {
      sb.writeln('<|im_start|>${item.role}');
      sb.writeln(item.content);
      sb.writeln('<|im_end|>');
    }
    sb.writeln('<|im_start|>assistant');
    return sb.toString();
  }

  String _normalizeReply(String raw) {
    return raw
        .replaceAll('<|im_end|>', '')
        .replaceAll('<|im_start|>', '')
        .replaceAll(RegExp(r'^\s*assistant\s*'), '')
        .trim();
  }

  Future<T> _runExclusive<T>(Future<T> Function() action) {
    final completer = Completer<T>();
    _serial = _serial
        .catchError((_) {})
        .then((_) async {
          if (_disposed) {
            throw StateError('Qwen fllama runtime already disposed');
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
    if (!Platform.isIOS) {
      throw UnsupportedError('Fllama local LLM currently supports iOS only');
    }
    final task = _initTask ??= _createInitTask();
    await task;
  }

  Future<void> _createInitTask() async {
    try {
      await _initModel();
    } catch (_) {
      _initTask = null;
      rethrow;
    }
  }

  Future<void> _initModel() async {
    if (_disposed) return;
    if (_contextId != null && _contextId! > 0) return;

    final runtime = Fllama.instance();
    if (runtime == null) {
      throw StateError('Fllama runtime is unavailable');
    }

    final modelPath = await _resolveModelPath();
    final result = await runtime
        .initContext(
          modelPath,
          nCtx: _contextSize,
          nBatch: _batchSize,
          nThreads: _threads,
          nGpuLayers: 0, // iOS simulator does not support Metal in this plugin.
          useMmap: true,
          useMlock: false,
          emitLoadProgress: false,
        )
        .timeout(_loadTimeout);

    final idRaw = result?['contextId'];
    final id = idRaw is num ? idRaw.toDouble() : double.tryParse('$idRaw');
    if (id == null || id <= 0) {
      throw StateError('Failed to initialize Fllama context: $result');
    }

    _contextId = id;
    _loadedModelPath = modelPath;
    if (kDebugMode) {
      debugPrint(
        '[LLM] Qwen fllama loaded path=$_loadedModelPath threads=$_threads ctx=$_contextSize',
      );
    }
  }

  Future<String> _resolveModelPath() async {
    final supportDir = await getApplicationSupportDirectory();
    final supportPath = '${supportDir.path}/models/llm/$modelFileName';
    if (await _fileExistsWithContent(supportPath)) {
      return supportPath;
    }

    final bundledPath = resolveBundledAssetFilePath(_assetModelPath);
    if (bundledPath != null && await _fileExistsWithContent(bundledPath)) {
      return bundledPath;
    }

    final copied = await _tryCopyAssetModel(supportPath);
    if (copied != null) {
      return copied;
    }

    throw StateError(
      'Qwen GGUF model not found. Expected at $supportPath or bundled asset $_assetModelPath.',
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
    final contextId = _contextId;
    _contextId = null;
    if (contextId != null && contextId > 0) {
      final runtime = Fllama.instance();
      if (runtime != null) {
        unawaited(runtime.releaseContext(contextId));
      }
    }
  }
}

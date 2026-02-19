import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shiguang/features/diary/data/ai/embedding_service.dart';
import 'package:shiguang/features/diary/data/ai/qwen_fllama_local_llm.dart';
import 'package:shiguang/features/diary/data/ai/qwen_gguf_local_llm.dart';
import 'package:shiguang/features/diary/data/ai/sensevoice_onnx_local_voice_ai.dart';
import 'package:shiguang/features/diary/domain/interfaces/i_local_llm.dart';
import 'package:shiguang/features/diary/domain/interfaces/i_local_voice_ai.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const _SmokeApp());
}

class _SmokeApp extends StatefulWidget {
  const _SmokeApp();

  @override
  State<_SmokeApp> createState() => _SmokeAppState();
}

class _SmokeAppState extends State<_SmokeApp> {
  String _text = 'Running local AI smoke checks...';

  @override
  void initState() {
    super.initState();
    unawaited(_run());
  }

  Future<void> _run() async {
    final lines = <String>[];

    Future<void> runItem(String name, Future<String> Function() fn) async {
      final sw = Stopwatch()..start();
      try {
        final detail = await fn();
        sw.stop();
        lines.add('[PASS] $name (${sw.elapsedMilliseconds} ms) -> $detail');
        debugPrint('[SMOKE][PASS] $name -> $detail');
      } catch (error, stackTrace) {
        sw.stop();
        lines.add('[FAIL] $name (${sw.elapsedMilliseconds} ms) -> $error');
        lines.add(stackTrace.toString().split('\n').take(3).join('\n'));
        debugPrint('[SMOKE][FAIL] $name -> $error');
        debugPrint(stackTrace.toString());
      }
      if (!mounted) return;
      setState(() {
        _text = lines.join('\n\n');
      });
    }

    await runItem('LLM', _checkLlm);
    await runItem('Embedding', _checkEmbedding);
    await runItem('ASR', _checkAsr);

    if (!mounted) return;
    setState(() {
      _text = '${lines.join('\n\n')}\n\nDONE';
    });
  }

  Future<String> _checkLlm() async {
    final ILocalLLM llm = Platform.isIOS
        ? QwenFllamaLocalLLM()
        : QwenGgufLocalLLM();
    try {
      final response = await llm
          .chat(message: '请只回复两个字母：OK', context: const [])
          .timeout(const Duration(minutes: 2));
      return 'reply="$response"';
    } finally {
      llm.dispose();
    }
  }

  Future<String> _checkEmbedding() async {
    final service = EmbeddingService();
    try {
      final vector = await service
          .generateEmbedding('今天测试本地向量化是否正常')
          .timeout(const Duration(seconds: 30));
      final preview = vector
          .take(6)
          .map((v) => v.toStringAsFixed(4))
          .join(', ');
      return 'dim=${vector.length} first=[$preview]';
    } finally {
      service.dispose();
    }
  }

  Future<String> _checkAsr() async {
    final asr = SenseVoiceOnnxLocalVoiceAI();
    StreamSubscription<VoiceResult>? sub;
    final results = <VoiceResult>[];
    try {
      await asr.prepare().timeout(const Duration(seconds: 30));
      sub = asr.listen().listen(results.add);
      asr.sendAudio(Uint8List(16000 * 2)); // 1s silence PCM16
      asr.sendEnd();
      await Future<void>.delayed(const Duration(seconds: 3));
      await sub.cancel();
      asr.stop();

      final finals = results
          .where((r) => r.type == VoiceResultType.final_)
          .map((r) => r.text)
          .toList(growable: false);
      return 'events=${results.length} finals=${finals.length}';
    } finally {
      await sub?.cancel();
      asr.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Local AI Smoke')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SelectableText(_text),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:record/record.dart';

import '../../../../core/i18n/app_i18n.dart';
import '../../../../core/ui/edge_swipe_back.dart';
import '../../../../core/ui/keyboard.dart';
import '../../../settings/data/settings_provider.dart';
import '../../data/ai/llm_providers.dart';
import '../../data/network/web_search_service.dart';
import '../../data/ai/sensevoice_local_voice_ai.dart';
import '../../data/ai/sensevoice_onnx_local_voice_ai.dart';
import '../../data/ai/system_speech_voice_ai.dart';
import '../../domain/interfaces/i_local_llm.dart';
import '../../domain/interfaces/i_local_voice_ai.dart';
import '../widgets/live_waveform_bars.dart';

class AiChatScreen extends ConsumerStatefulWidget {
  const AiChatScreen({super.key});

  @override
  ConsumerState<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends ConsumerState<AiChatScreen> {
  static const Duration _asrFlushTimeout = Duration(seconds: 4);

  final List<_ChatMessage> _messages = [];
  final _textController = TextEditingController();
  final _inputFocusNode = FocusNode();
  final _scrollController = ScrollController();
  final _audioRecorder = AudioRecorder();
  final _webSearchService = WebSearchService();

  ILocalVoiceAI? _voiceAI;
  StreamSubscription<VoiceResult>? _voiceSubscription;
  StreamSubscription<double>? _levelSubscription;
  StreamSubscription<Uint8List>? _audioSubscription;
  StreamSubscription<Amplitude>? _amplitudeSubscription;
  StreamSubscription<RecordState>? _recorderStateSubscription;

  bool _isRecording = false;
  bool _isSpeaking = false;
  bool _isStoppingRecording = false;
  bool _asrReady = true;
  String _recordingBaseText = '';
  DateTime? _lastWaveformUpdateAt;

  final List<double> _waveform = List<double>.filled(24, 0.02, growable: true);

  @override
  void dispose() {
    unawaited(_audioSubscription?.cancel() ?? Future.value());
    unawaited(_amplitudeSubscription?.cancel() ?? Future.value());
    unawaited(_recorderStateSubscription?.cancel() ?? Future.value());
    unawaited(_voiceSubscription?.cancel() ?? Future.value());
    unawaited(_levelSubscription?.cancel() ?? Future.value());
    _voiceAI?.dispose();
    unawaited(_audioRecorder.dispose());
    _textController.dispose();
    _inputFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _toggleRecording() async {
    if (_isStoppingRecording) return;
    if (_isRecording) {
      await _stopRecording();
    } else {
      await _startRecording();
    }
  }

  Future<void> _startRecording() async {
    if (_isRecording) return;

    final hasPermission = await _audioRecorder.hasPermission(request: true);
    if (!hasPermission) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.t(
              zhHans: '需要麦克风权限',
              zhHant: '需要麥克風權限',
              en: 'Microphone permission required',
            ),
          ),
        ),
      );
      return;
    }
    if (!mounted) return;

    requestKeyboardFocus(context, _inputFocusNode);
    _recordingBaseText = _textController.text.trimRight();

    _voiceAI = _createVoiceAi();
    final activeVoiceAi = _voiceAI;
    if (activeVoiceAi is SenseVoiceOnnxLocalVoiceAI) {
      unawaited(activeVoiceAi.prepare());
    }
    _bindVoiceStream();
    _bindVoiceLevelStream();

    if (activeVoiceAi != null && !activeVoiceAi.requiresPcmStream) {
      if (!mounted) return;
      setState(() {
        _isRecording = true;
        _asrReady = true;
      });
      requestKeyboardFocus(context, _inputFocusNode);
      return;
    }

    try {
      _recorderStateSubscription = _audioRecorder.onStateChanged().listen((
        state,
      ) async {
        if (!_isRecording || _isStoppingRecording) return;
        if (state == RecordState.pause) {
          try {
            await _audioRecorder.resume();
          } catch (_) {}
          return;
        }
        if (state == RecordState.stop) {
          unawaited(_stopRecording(resetText: false));
        }
      });

      final audioStream = await _audioRecorder.startStream(
        const RecordConfig(
          encoder: AudioEncoder.pcm16bits,
          sampleRate: 16000,
          numChannels: 1,
          autoGain: true,
          echoCancel: true,
          noiseSuppress: true,
          audioInterruption: AudioInterruptionMode.none,
          streamBufferSize: 1600,
        ),
      );

      _audioSubscription = audioStream.listen(
        (data) {
          _voiceAI?.sendAudio(data);
          _pushWaveformFromPcm(data);
        },
        onError: (_) {
          unawaited(_stopRecording(resetText: false));
        },
      );

      _startAmplitudeMonitor();

      if (!mounted) return;
      setState(() {
        _isRecording = true;
        _asrReady = true;
      });
      requestKeyboardFocus(context, _inputFocusNode);
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              context.t(
                zhHans: '麦克风启动失败: $error',
                zhHant: '麥克風啟動失敗: $error',
                en: 'Failed to start microphone: $error',
              ),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
      await _stopRecording(resetText: true);
    }
  }

  ILocalVoiceAI _createVoiceAi() {
    final settings = ref.read(settingsProvider);
    switch (settings.voiceRecognitionEngine) {
      case VoiceRecognitionEngine.localModel:
        return SenseVoiceOnnxLocalVoiceAI();
      case VoiceRecognitionEngine.systemNative:
        return SystemSpeechVoiceAI();
      case VoiceRecognitionEngine.endpointCloud:
        return SenseVoiceLocalVoiceAI(
          endpoint: settings.voiceAiEndpoint,
          enforceLocalEndpoint: false,
        );
    }
  }

  void _bindVoiceStream() {
    final voiceAI = _voiceAI;
    if (voiceAI == null) return;
    unawaited(_voiceSubscription?.cancel() ?? Future.value());

    _voiceSubscription = voiceAI.listen().listen(
      (result) {
        if (!mounted) return;
        setState(() {
          _asrReady = true;
          _applyRecognizedText(result.text);
        });
        requestKeyboardFocus(context, _inputFocusNode);
      },
      onError: (error) {
        if (!mounted) return;
        setState(() => _asrReady = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              context.t(
                zhHans: '语音识别重连中: $error',
                zhHant: '語音辨識重連中: $error',
                en: 'ASR reconnecting: $error',
              ),
            ),
            backgroundColor: Colors.orange,
          ),
        );
        if (_isRecording) {
          unawaited(_stopRecording(resetText: false));
        }
      },
      onDone: () {
        if (_isRecording && !_isStoppingRecording) {
          unawaited(_stopRecording(resetText: false));
        }
      },
    );
  }

  void _bindVoiceLevelStream() {
    final voiceAI = _voiceAI;
    if (voiceAI == null) return;
    unawaited(_levelSubscription?.cancel() ?? Future.value());

    _levelSubscription = voiceAI.levelStream.listen((level) {
      if (!mounted || !_isRecording) return;
      final normalized = level.clamp(0.0, 1.0).toDouble();
      setState(() {
        _waveform.removeAt(0);
        _waveform.add(math.max(0.03, normalized));
      });
    }, onError: (_) {});
  }

  void _applyRecognizedText(String recognizedText) {
    final mergedText = _mergeBaseAndSpeechText(recognizedText);
    _textController.text = mergedText;
    _textController.selection = TextSelection.collapsed(
      offset: _textController.text.length,
    );
  }

  String _mergeBaseAndSpeechText(String speechText) {
    final spoken = speechText.trim();
    final base = _recordingBaseText.trimRight();

    if (spoken.isEmpty) return base;
    if (base.isEmpty) return spoken;

    final separator = (base.endsWith(' ') || base.endsWith('\n')) ? '' : '\n';
    return '$base$separator$spoken';
  }

  void _startAmplitudeMonitor() {
    _amplitudeSubscription?.cancel();
    _amplitudeSubscription = _audioRecorder
        .onAmplitudeChanged(const Duration(milliseconds: 80))
        .listen((amp) {
          if (!mounted || !_isRecording) return;
          final normalized = ((amp.current + 48.0) / 48.0).clamp(0.0, 1.0);
          final emphasized = math.pow(normalized.toDouble(), 1.1).toDouble();
          setState(() {
            _waveform.removeAt(0);
            _waveform.add(math.max(0.03, emphasized));
          });
        });
  }

  void _pushWaveformFromPcm(Uint8List pcmBytes) {
    if (!mounted || !_isRecording || pcmBytes.isEmpty) return;
    final now = DateTime.now();
    final last = _lastWaveformUpdateAt;
    if (last != null && now.difference(last).inMilliseconds < 60) {
      return;
    }
    _lastWaveformUpdateAt = now;

    final normalized = _estimateAudioLevelFromPcm16(pcmBytes);
    setState(() {
      _waveform.removeAt(0);
      _waveform.add(math.max(0.03, normalized));
    });
  }

  double _estimateAudioLevelFromPcm16(Uint8List pcmBytes) {
    final sampleCount = pcmBytes.lengthInBytes ~/ 2;
    if (sampleCount == 0) {
      return 0.02;
    }

    final byteData = ByteData.sublistView(pcmBytes);
    var sumSquares = 0.0;
    for (var i = 0; i < sampleCount; i++) {
      final sample = byteData.getInt16(i * 2, Endian.little) / 32768.0;
      sumSquares += sample * sample;
    }
    final rms = math.sqrt(sumSquares / sampleCount);
    return (rms * 4.0).clamp(0.0, 1.0);
  }

  Future<void> _stopRecording({bool resetText = false}) async {
    if (_isStoppingRecording) return;
    _isStoppingRecording = true;
    try {
      await _audioSubscription?.cancel();
      _audioSubscription = null;
      await _amplitudeSubscription?.cancel();
      _amplitudeSubscription = null;
      await _recorderStateSubscription?.cancel();
      _recorderStateSubscription = null;
      await _levelSubscription?.cancel();
      _levelSubscription = null;

      if (await _audioRecorder.isRecording()) {
        await _audioRecorder.stop();
      }

      _voiceAI?.stop();
      final voiceSubscription = _voiceSubscription;
      if (voiceSubscription != null) {
        try {
          await voiceSubscription.asFuture<void>().timeout(
            _asrFlushTimeout,
            onTimeout: () {},
          );
        } catch (_) {}
      }
      await _voiceSubscription?.cancel();
      _voiceSubscription = null;
      _voiceAI?.dispose();
      _voiceAI = null;

      if (!mounted) return;
      setState(() {
        _isRecording = false;
        _lastWaveformUpdateAt = null;
        if (resetText) {
          _recordingBaseText = '';
        }
        _waveform
          ..clear()
          ..addAll(List<double>.filled(24, 0.02));
      });
      requestKeyboardFocus(context, _inputFocusNode);
    } finally {
      _isStoppingRecording = false;
    }
  }

  void _sendMessage() {
    if (_isSpeaking) return;
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(_ChatMessage(text: text, isUser: true));
      _textController.clear();
    });
    _scrollToBottom();
    _requestAiResponse(text);
  }

  void _requestAiResponse(String userText) async {
    final llm = ref.read(localLlmProvider);
    final networkSearchEnabled = ref.read(settingsProvider).enableNetworkSearch;
    final Future<List<WebSearchResultItem>>? networkSearchFuture =
        networkSearchEnabled
        ? _webSearchService.search(userText, limit: 6)
        : null;

    final history = List<_ChatMessage>.from(_messages);
    if (history.isNotEmpty &&
        history.last.isUser &&
        history.last.text.trim() == userText.trim()) {
      history.removeLast();
    }

    final chatContext = history
        .map(
          (m) => ChatMessage(
            role: m.isUser ? 'user' : 'assistant',
            content: m.text,
          ),
        )
        .toList();

    setState(() => _isSpeaking = true);

    try {
      final networkItems = networkSearchFuture == null
          ? const <WebSearchResultItem>[]
          : await networkSearchFuture;
      String? preprocessedNetworkContext;
      if (networkItems.isNotEmpty) {
        final preprocessPrompt = _buildNetworkPreprocessPrompt(
          userText: userText,
          items: networkItems,
        );
        try {
          preprocessedNetworkContext = await llm.chat(
            message: preprocessPrompt,
            context: const [],
          );
        } catch (error) {
          if (kDebugMode) {
            debugPrint('[AI Chat] network preprocess failed: $error');
          }
        }
      }

      final finalMessage = _buildFinalUserPrompt(
        userText: userText,
        networkItems: networkItems,
        preprocessedNetworkContext: preprocessedNetworkContext,
      );

      final response = await llm.chat(
        message: finalMessage,
        context: chatContext,
      );
      if (!mounted) return;
      setState(() {
        _messages.add(_ChatMessage(text: response, isUser: false));
        _isSpeaking = false;
      });
      _scrollToBottom();
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _messages.add(
          _ChatMessage(
            text: context.t(
              zhHans: '抱歉，AI 服务暂时不可用: $error',
              zhHant: '抱歉，AI 服務暫時不可用: $error',
              en: 'Sorry, AI service is currently unavailable: $error',
            ),
            isUser: false,
          ),
        );
        _isSpeaking = false;
      });
      _scrollToBottom();
    }
  }

  String _serializeNetworkItems(List<WebSearchResultItem> items) {
    if (items.isEmpty) return '[]';
    final lines = <String>[];
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      lines.add(
        '- #${i + 1}\n'
        '  title: ${item.title.replaceAll('\n', ' ').trim()}\n'
        '  snippet: ${item.snippet.replaceAll('\n', ' ').trim()}\n'
        '  url: ${item.url}\n'
        '  source: ${item.source}',
      );
    }
    return lines.join('\n');
  }

  String _buildNetworkPreprocessPrompt({
    required String userText,
    required List<WebSearchResultItem> items,
  }) {
    final serialized = _serializeNetworkItems(items);
    return '''
你是检索信息预处理助手。请基于用户问题和网络检索结果，输出结构化预处理结果，供后续主回答模型使用。

用户问题:
$userText

网络检索结果:
$serialized

输出要求：
1. 使用简体中文输出。
2. 只输出 3 个部分，按以下固定标题：
   [事实要点]
   [可能冲突或不确定点]
   [可引用来源]
3. 每部分最多 5 条，精炼、客观，不要写总结性套话。
4. 在 [可引用来源] 中保留可用 URL。
''';
  }

  String _buildFinalUserPrompt({
    required String userText,
    required List<WebSearchResultItem> networkItems,
    String? preprocessedNetworkContext,
  }) {
    if (networkItems.isEmpty ||
        preprocessedNetworkContext == null ||
        preprocessedNetworkContext.trim().isEmpty) {
      return userText;
    }

    return '''
请基于用户问题回答，并优先参考下面的“网络预处理结果”。
如果网络信息和常识冲突，请明确标注不确定性。
如引用网络信息，请在回答末尾附上“参考来源”并给出 URL。

用户问题:
$userText

网络预处理结果:
${preprocessedNetworkContext.trim()}
''';
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    final keyboardVisible = bottomInset > 0;
    final overlayHeight = _isRecording ? 56.0 : 0.0;

    return EdgeSwipeBack(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const BackButton(),
          title: Text(
            context.t(zhHans: 'AI 对话', zhHant: 'AI 對話', en: 'AI Chat'),
          ),
          actions: [
            if (_isSpeaking)
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: _messages.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.smart_toy,
                                size: 48,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                context.t(
                                  zhHans: '开始一段对话',
                                  zhHant: '開始一段對話',
                                  en: 'Start a conversation',
                                ),
                                style: TextStyle(color: Colors.grey[500]),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.all(16),
                          itemCount: _messages.length,
                          itemBuilder: (context, index) {
                            final msg = _messages[index];
                            return Align(
                              alignment: msg.isUser
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: msg.isUser
                                      ? theme.colorScheme.primaryContainer
                                      : theme.colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.7,
                                ),
                                child: Text(msg.text),
                              ),
                            );
                          },
                        ),
                ),
                AnimatedPadding(
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOut,
                  padding: EdgeInsets.only(
                    bottom:
                        bottomInset +
                        (keyboardVisible && _isRecording ? overlayHeight : 0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      border: Border(
                        top: BorderSide(
                          color: theme.colorScheme.outline.withValues(
                            alpha: 0.2,
                          ),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            _isRecording
                                ? Icons.stop_circle_outlined
                                : Icons.mic,
                            color: _isRecording ? Colors.red.shade600 : null,
                          ),
                          onPressed: _toggleRecording,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            focusNode: _inputFocusNode,
                            onTap: () =>
                                requestKeyboardFocus(context, _inputFocusNode),
                            scrollPadding: EdgeInsets.only(
                              bottom: bottomInset + overlayHeight + 24,
                            ),
                            decoration: InputDecoration(
                              hintText: context.t(
                                zhHans: '输入内容...',
                                zhHant: '輸入內容...',
                                en: 'Type your message...',
                              ),
                              border: InputBorder.none,
                              isDense: true,
                            ),
                            onSubmitted: (_) {
                              if (_isSpeaking) return;
                              _sendMessage();
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: _isSpeaking ? null : _sendMessage,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (_isRecording)
              Positioned(
                left: 12,
                right: 12,
                bottom: keyboardVisible ? bottomInset : 70,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _asrReady
                                  ? context.t(
                                      zhHans: '正在聆听...',
                                      zhHant: '正在聆聽...',
                                      en: 'Listening...',
                                    )
                                  : context.t(
                                      zhHans: '语音识别重连中...',
                                      zhHant: '語音辨識重連中...',
                                      en: 'ASR reconnecting...',
                                    ),
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: _asrReady
                                    ? theme.colorScheme.primary
                                    : Colors.orange.shade700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            LiveWaveformBars(samples: _waveform, compact: true),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isUser;
  _ChatMessage({required this.text, required this.isUser});
}

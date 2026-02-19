import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:record/record.dart';

import '../../../../core/ui/edge_swipe_back.dart';
import '../../../../core/ui/keyboard.dart';
import '../../../settings/data/settings_provider.dart';
import '../../data/ai/llm_providers.dart';
import '../../data/ai/sensevoice_local_voice_ai.dart';
import '../../data/ai/sensevoice_onnx_local_voice_ai.dart';
import '../../domain/interfaces/i_local_llm.dart';
import '../../domain/interfaces/i_local_voice_ai.dart';

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

  ILocalVoiceAI? _voiceAI;
  StreamSubscription<VoiceResult>? _voiceSubscription;
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
        const SnackBar(content: Text('Microphone permission required')),
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
          echoCancel: false,
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
            content: Text('Failed to start microphone: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
      await _stopRecording(resetText: true);
    }
  }

  ILocalVoiceAI _createVoiceAi() {
    final settings = ref.read(settingsProvider);
    final useOnDevice = settings.preferLocalAi;
    return useOnDevice
        ? SenseVoiceOnnxLocalVoiceAI()
        : SenseVoiceLocalVoiceAI(endpoint: settings.voiceAiEndpoint);
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
            content: Text('ASR reconnecting: $error'),
            backgroundColor: Colors.orange,
          ),
        );
        if (_isRecording) {
          unawaited(_stopRecording(resetText: false));
        }
      },
    );
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

    final history = List<_ChatMessage>.from(_messages);
    if (history.isNotEmpty &&
        history.last.isUser &&
        history.last.text.trim() == userText.trim()) {
      history.removeLast();
    }

    final context = history
        .map(
          (m) => ChatMessage(
            role: m.isUser ? 'user' : 'assistant',
            content: m.text,
          ),
        )
        .toList();

    setState(() => _isSpeaking = true);

    try {
      final response = await llm.chat(message: userText, context: context);
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
          _ChatMessage(text: '抱歉，AI服务暂时不可用: $error', isUser: false),
        );
        _isSpeaking = false;
      });
      _scrollToBottom();
    }
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
          title: const Text('AI对话'),
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
                                'Start a conversation',
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
                        (keyboardVisible && _isRecording
                            ? overlayHeight + 12
                            : 0),
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
                            Icons.mic,
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
                            decoration: const InputDecoration(
                              hintText: '输入内容...',
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
                bottom: keyboardVisible ? bottomInset + 6 : 70,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: theme.colorScheme.outline.withValues(alpha: 0.2),
                    ),
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
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        iconSize: 18,
                        onPressed: _toggleRecording,
                        icon: Icon(Icons.mic, color: Colors.red.shade600),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 28,
                          child: Row(
                            children: _waveform
                                .map(
                                  (level) => Expanded(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: SizedBox(
                                        width: 2,
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 1,
                                          ),
                                          height: 6 + (22 * level),
                                          decoration: BoxDecoration(
                                            color: theme.colorScheme.primary
                                                .withValues(alpha: 0.9),
                                            borderRadius: BorderRadius.circular(
                                              2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(growable: false),
                          ),
                        ),
                      ),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        iconSize: 18,
                        onPressed: _toggleRecording,
                        icon: const Icon(Icons.stop),
                      ),
                    ],
                  ),
                ),
              ),
            if (_isRecording && !_asrReady)
              Positioned(
                left: 16,
                right: 16,
                bottom: keyboardVisible
                    ? bottomInset + overlayHeight + 10
                    : overlayHeight + 76,
                child: Text(
                  'ASR unavailable. Recording is still active.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.orange.shade700),
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

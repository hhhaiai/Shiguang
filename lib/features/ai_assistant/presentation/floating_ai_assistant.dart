import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:record/record.dart';
import '../../../core/ui/keyboard.dart';
import '../../settings/data/settings_provider.dart';
import '../../diary/data/ai/sensevoice_onnx_local_voice_ai.dart';
import '../../diary/data/ai/sensevoice_local_voice_ai.dart';
import '../../diary/data/ai/system_speech_voice_ai.dart';
import '../../diary/data/ai/llm_providers.dart';
import '../../diary/domain/interfaces/i_local_voice_ai.dart';
import '../../diary/domain/interfaces/i_local_llm.dart';

/// Floating AI Assistant - a robot that can listen and respond
class FloatingAiAssistant extends ConsumerStatefulWidget {
  const FloatingAiAssistant({super.key});

  @override
  ConsumerState<FloatingAiAssistant> createState() =>
      _FloatingAiAssistantState();
}

class _FloatingAiAssistantState extends ConsumerState<FloatingAiAssistant>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  bool _isListening = false;
  bool _isSpeaking = false;
  String _listeningText = '';
  bool _speechSubmitted = false;
  final List<_ChatMessage> _messages = [];
  final _textController = TextEditingController();
  final _inputFocusNode = FocusNode();
  final _audioRecorder = AudioRecorder();
  ILocalVoiceAI? _voiceAI;
  StreamSubscription<VoiceResult>? _voiceSubscription;
  StreamSubscription<Uint8List>? _audioSubscription;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    unawaited(_audioSubscription?.cancel() ?? Future.value());
    unawaited(_voiceSubscription?.cancel() ?? Future.value());
    _voiceAI?.dispose();
    unawaited(_audioRecorder.dispose());
    _pulseController.dispose();
    _textController.dispose();
    _inputFocusNode.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() => _isExpanded = !_isExpanded);
  }

  Future<void> _startListening() async {
    if (_isListening) return;

    final hasPermission = await _audioRecorder.hasPermission(request: true);
    if (!hasPermission) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Microphone permission required')),
      );
      return;
    }

    setState(() {
      _isListening = true;
      _listeningText = '';
      _speechSubmitted = false;
    });

    final settings = ref.read(settingsProvider);
    switch (settings.voiceRecognitionEngine) {
      case VoiceRecognitionEngine.localModel:
        _voiceAI = SenseVoiceOnnxLocalVoiceAI();
        break;
      case VoiceRecognitionEngine.systemNative:
        _voiceAI = SystemSpeechVoiceAI();
        break;
      case VoiceRecognitionEngine.endpointCloud:
        _voiceAI = SenseVoiceLocalVoiceAI(
          endpoint: settings.voiceAiEndpoint,
          enforceLocalEndpoint: false,
        );
        break;
    }
    if (_voiceAI is SenseVoiceOnnxLocalVoiceAI) {
      unawaited((_voiceAI! as SenseVoiceOnnxLocalVoiceAI).prepare());
    }
    final stream = _voiceAI!.listen();

    _voiceSubscription = stream.listen(
      (result) {
        if (!mounted) return;
        setState(() {
          if (result.type == VoiceResultType.partial) {
            _listeningText = result.text;
          } else {
            _listeningText = result.text;
            _submitSpeechResult(result.text);
          }
        });
      },
      onError: (error) {
        if (!mounted) return;
        setState(() {
          _isListening = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Voice error: $error')));
        unawaited(_stopListening(submitFallback: false));
      },
    );

    if (_voiceAI != null && !_voiceAI!.requiresPcmStream) {
      return;
    }

    try {
      final audioStream = await _audioRecorder.startStream(
        const RecordConfig(
          encoder: AudioEncoder.pcm16bits,
          sampleRate: 16000,
          numChannels: 1,
          autoGain: true,
          echoCancel: true,
          noiseSuppress: true,
          audioInterruption: AudioInterruptionMode.none,
          streamBufferSize: 3200,
        ),
      );

      _audioSubscription = audioStream.listen(
        (data) {
          _voiceAI?.sendAudio(data);
        },
        onError: (_) {
          unawaited(_stopListening(submitFallback: true));
        },
      );
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _isListening = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Mic start failed: $error')));
      await _voiceSubscription?.cancel();
      _voiceSubscription = null;
      _voiceAI?.dispose();
      _voiceAI = null;
    }
  }

  Future<void> _stopListening({bool submitFallback = true}) async {
    await _audioSubscription?.cancel();
    _audioSubscription = null;

    if (await _audioRecorder.isRecording()) {
      await _audioRecorder.stop();
    }

    _voiceAI?.stop();
    await Future<void>.delayed(const Duration(milliseconds: 650));
    await _voiceSubscription?.cancel();
    _voiceSubscription = null;
    _voiceAI?.dispose();
    _voiceAI = null;

    if (submitFallback &&
        !_speechSubmitted &&
        _listeningText.trim().isNotEmpty) {
      _submitSpeechResult(_listeningText.trim());
    }

    if (!mounted) return;
    setState(() => _isListening = false);
  }

  void _submitSpeechResult(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty || _speechSubmitted) {
      return;
    }
    _speechSubmitted = true;
    _messages.add(_ChatMessage(text: trimmed, isUser: true));
    _requestAiResponse(trimmed);
  }

  void _sendMessage() {
    if (_isSpeaking) return;
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(_ChatMessage(text: text, isUser: true));
      _textController.clear();
    });

    _requestAiResponse(text);
  }

  void _requestAiResponse(String userText) async {
    final llm = ref.read(localLlmProvider);

    // Build context from previous messages, excluding current user turn
    // because `llm.chat` appends the current user message itself.
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

    setState(() {
      _isSpeaking = true;
    });

    try {
      final response = await llm.chat(message: userText, context: context);
      if (!mounted) return;
      setState(() {
        _messages.add(_ChatMessage(text: response, isUser: false));
        _isSpeaking = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _messages.add(
          _ChatMessage(text: '抱歉，AI服务暂时不可用: $error', isUser: false),
        );
        _isSpeaking = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Positioned(
      right: 16,
      bottom: 16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Chat expanded
          if (_isExpanded) ...[
            Container(
              width: 300,
              height: 400,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 16,
                          child: Icon(Icons.smart_toy, size: 20),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'AI Assistant',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.close, size: 20),
                          onPressed: _toggleExpanded,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ),
                  // Messages
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final msg = _messages[index];
                        return _ChatBubble(message: msg);
                      },
                    ),
                  ),
                  // Input
                  AnimatedPadding(
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOut,
                    padding: EdgeInsets.only(bottom: bottomInset),
                    child: _isListening
                        ? Container(
                            padding: const EdgeInsets.all(12),
                            color: Colors.red.shade50,
                            child: Row(
                              children: [
                                Icon(Icons.mic, color: Colors.red.shade700),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _listeningText.isEmpty
                                        ? 'Listening...'
                                        : _listeningText,
                                    style: TextStyle(
                                      color: Colors.red.shade700,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.stop,
                                    color: Colors.red.shade700,
                                  ),
                                  onPressed: () {
                                    unawaited(
                                      _stopListening(submitFallback: true),
                                    );
                                  },
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.mic),
                                  onPressed: _startListening,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _textController,
                                    focusNode: _inputFocusNode,
                                    onTap: () => requestKeyboardFocus(
                                      context,
                                      _inputFocusNode,
                                    ),
                                    scrollPadding: EdgeInsets.only(
                                      bottom: bottomInset + 24,
                                    ),
                                    decoration: const InputDecoration(
                                      hintText: 'Type a message...',
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
            ),
          ],
          // Floating button
          AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Transform.scale(
                scale: 1.0 + (_pulseController.value * 0.1),
                child: child,
              );
            },
            child: FloatingActionButton(
              heroTag: 'floating_ai_assistant_fab',
              onPressed: _toggleExpanded,
              backgroundColor: _isListening
                  ? Colors.red
                  : Theme.of(context).colorScheme.primary,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: _isListening
                    ? const Icon(Icons.stop, key: ValueKey('stop'))
                    : _isSpeaking
                    ? const Icon(Icons.smart_toy, key: ValueKey('robot'))
                    : const Icon(Icons.smart_toy, key: ValueKey('robot2')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isUser;

  _ChatMessage({required this.text, required this.isUser});
}

class _ChatBubble extends StatelessWidget {
  final _ChatMessage message;

  const _ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: message.isUser
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(message.text),
      ),
    );
  }
}

import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:record/record.dart';
import '../../../core/i18n/app_i18n.dart';
import '../../../core/ui/keyboard.dart';
import '../../settings/data/settings_provider.dart';
import '../../diary/data/ai/sensevoice_onnx_local_voice_ai.dart';
import '../../diary/data/ai/sensevoice_local_voice_ai.dart';
import '../../diary/data/ai/system_speech_voice_ai.dart';
import '../../diary/data/ai/llm_providers.dart';
import '../../diary/data/network/web_search_service.dart';
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
  bool _isStoppingListening = false;
  bool _isSpeaking = false;
  String _listeningText = '';
  bool _speechSubmitted = false;
  final List<_ChatMessage> _messages = [];
  final _textController = TextEditingController();
  final _inputFocusNode = FocusNode();
  final _audioRecorder = AudioRecorder();
  final _webSearchService = WebSearchService();
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
    if (_isListening || _isStoppingListening) return;

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              context.t(
                zhHans: '语音错误: $error',
                zhHant: '語音錯誤: $error',
                en: 'Voice error: $error',
              ),
            ),
          ),
        );
        unawaited(_stopListening(submitFallback: false));
      },
      onDone: () {
        if (_isListening && !_isStoppingListening) {
          unawaited(_stopListening(submitFallback: true));
        }
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.t(
              zhHans: '麦克风启动失败: $error',
              zhHant: '麥克風啟動失敗: $error',
              en: 'Mic start failed: $error',
            ),
          ),
        ),
      );
      await _voiceSubscription?.cancel();
      _voiceSubscription = null;
      _voiceAI?.dispose();
      _voiceAI = null;
    }
  }

  Future<void> _stopListening({bool submitFallback = true}) async {
    if (_isStoppingListening) return;
    _isStoppingListening = true;
    try {
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
    } finally {
      _isStoppingListening = false;
    }
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
    final networkSearchEnabled = ref.read(settingsProvider).enableNetworkSearch;
    final Future<List<WebSearchResultItem>>? networkSearchFuture =
        networkSearchEnabled
        ? _webSearchService.search(userText, limit: 6)
        : null;

    // Build context from previous messages, excluding current user turn
    // because `llm.chat` appends the current user message itself.
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

    setState(() {
      _isSpeaking = true;
    });

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
            debugPrint('[Floating AI] network preprocess failed: $error');
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
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _messages.add(
          _ChatMessage(
            text: context.t(
              zhHans: '抱歉，AI服务暂时不可用: $error',
              zhHant: '抱歉，AI 服務暫時不可用: $error',
              en: 'Sorry, AI service is temporarily unavailable: $error',
            ),
            isUser: false,
          ),
        );
        _isSpeaking = false;
      });
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
                        Text(
                          context.t(
                            zhHans: 'AI 助手',
                            zhHant: 'AI 助手',
                            en: 'AI Assistant',
                          ),
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
                                        ? context.t(
                                            zhHans: '正在聆听...',
                                            zhHant: '正在聆聽...',
                                            en: 'Listening...',
                                          )
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
                                    decoration: InputDecoration(
                                      hintText: context.t(
                                        zhHans: '输入消息...',
                                        zhHant: '輸入訊息...',
                                        en: 'Type a message...',
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

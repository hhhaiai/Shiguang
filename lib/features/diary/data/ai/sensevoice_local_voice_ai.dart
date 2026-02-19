import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../../core/utils/local_endpoint_policy.dart';
import '../../domain/interfaces/i_local_voice_ai.dart';

/// SenseVoice local voice recognition via WebSocket
class SenseVoiceLocalVoiceAI implements ILocalVoiceAI {
  static const String _defaultEndpoint = 'ws://127.0.0.1:8008/stream';
  static const int _maxBufferedFrames = 128;

  final String _endpoint;
  final bool _enforceLocalEndpoint;
  WebSocketChannel? _channel;
  StreamController<VoiceResult>? _controller;
  StreamSubscription? _subscription;
  final List<Uint8List> _pendingAudio = [];
  bool _isListening = false;
  bool get _allowPrivateNetwork => !Platform.isAndroid;
  String get _endpointPolicyLabel =>
      _allowPrivateNetwork ? 'local loopback/private LAN' : 'local loopback';

  SenseVoiceLocalVoiceAI({String? endpoint, bool enforceLocalEndpoint = true})
    : _endpoint = endpoint ?? _defaultEndpoint,
      _enforceLocalEndpoint = enforceLocalEndpoint;

  @override
  Stream<VoiceResult> listen() {
    _controller = StreamController<VoiceResult>.broadcast();
    _connect();
    return _controller!.stream;
  }

  void _connect() async {
    try {
      final uri = Uri.parse(_endpoint);
      if (_enforceLocalEndpoint &&
          !LocalEndpointPolicy.isAllowedUri(
            uri,
            allowPrivateNetwork: _allowPrivateNetwork,
          )) {
        throw ArgumentError(
          'SenseVoice endpoint must be $_endpointPolicyLabel (current: $_endpoint)',
        );
      }

      _channel = WebSocketChannel.connect(uri);

      await _channel!.ready;

      // Send start event
      final startEvent = jsonEncode({
        'event': 'start',
        'format': 'pcm16',
        'sample_rate': 16000,
        'channels': 1,
        'use_itn': true,
      });
      _channel!.sink.add(startEvent);

      _isListening = true;
      _flushPendingAudio();

      // Listen for responses
      _subscription = _channel!.stream.listen(
        (data) {
          _handleMessage(data);
        },
        onError: (error) {
          _controller?.addError(error);
        },
        onDone: () {
          _isListening = false;
          _controller?.close();
        },
      );
    } catch (e) {
      _controller?.addError(e);
      _controller?.close();
    }
  }

  void _handleMessage(dynamic data) {
    try {
      final json = jsonDecode(data as String) as Map<String, dynamic>;
      final event = json['event'] as String?;
      final text = json['text'] as String? ?? '';
      final seq = json['seq'] as int?;

      if (event == 'partial') {
        _controller?.add(
          VoiceResult(type: VoiceResultType.partial, text: text, seq: seq),
        );
      } else if (event == 'final') {
        _controller?.add(
          VoiceResult(type: VoiceResultType.final_, text: text, seq: seq),
        );
      }
    } catch (e) {
      // Ignore parsing errors
    }
  }

  void _flushPendingAudio() {
    if (!_isListening || _channel == null || _pendingAudio.isEmpty) {
      return;
    }

    for (final frame in _pendingAudio) {
      _channel!.sink.add(frame);
    }
    _pendingAudio.clear();
  }

  /// Send audio data to the server
  @override
  void sendAudio(Uint8List audioData) {
    if (_isListening && _channel != null) {
      _channel!.sink.add(audioData);
      return;
    }

    // Buffer a small amount of audio while websocket handshakes.
    if (_pendingAudio.length >= _maxBufferedFrames) {
      _pendingAudio.removeAt(0);
    }
    _pendingAudio.add(Uint8List.fromList(audioData));
  }

  /// Send end event to signal end of audio
  @override
  void sendEnd() {
    if (_isListening && _channel != null) {
      final endEvent = jsonEncode({'event': 'end'});
      _channel!.sink.add(endEvent);
    }
  }

  @override
  void stop() {
    sendEnd();
    _subscription?.cancel();
    _channel?.sink.close();
    _pendingAudio.clear();
    _isListening = false;
  }

  @override
  bool get isListening => _isListening;

  @override
  bool get requiresPcmStream => true;

  @override
  Stream<double> get levelStream => const Stream<double>.empty();

  @override
  void dispose() {
    stop();
    _controller?.close();
    _channel?.sink.close();
  }
}

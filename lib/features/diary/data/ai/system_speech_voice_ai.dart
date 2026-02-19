import 'dart:async';
import 'dart:typed_data';

import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../domain/interfaces/i_local_voice_ai.dart';

/// Uses Android/iOS system speech recognition (may rely on cloud service).
class SystemSpeechVoiceAI implements ILocalVoiceAI {
  final stt.SpeechToText _speech = stt.SpeechToText();

  StreamController<VoiceResult>? _controller;
  bool _isListening = false;
  int _seq = 0;

  @override
  bool get requiresPcmStream => false;

  @override
  bool get isListening => _isListening;

  @override
  Stream<VoiceResult> listen() {
    _controller ??= StreamController<VoiceResult>.broadcast();
    unawaited(_startSystemListening());
    return _controller!.stream;
  }

  Future<void> _startSystemListening() async {
    try {
      if (_speech.isListening) {
        return;
      }

      final available = await _speech.initialize(
        onError: _onSpeechError,
        onStatus: _onSpeechStatus,
      );

      if (!available) {
        throw Exception('System speech recognition not available');
      }

      _isListening = true;
      _seq = 0;

      await _speech.listen(
        onResult: _onSpeechResult,
        listenOptions: stt.SpeechListenOptions(
          listenMode: stt.ListenMode.dictation,
          partialResults: true,
          cancelOnError: true,
        ),
      );
    } catch (error, stackTrace) {
      _isListening = false;
      _controller?.addError(error, stackTrace);
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    final text = result.recognizedWords.trim();
    if (text.isEmpty) {
      return;
    }

    final type = result.finalResult
        ? VoiceResultType.final_
        : VoiceResultType.partial;

    _controller?.add(VoiceResult(type: type, text: text, seq: ++_seq));
  }

  void _onSpeechError(SpeechRecognitionError error) {
    _isListening = false;
    _controller?.addError(Exception(error.errorMsg));
  }

  void _onSpeechStatus(String status) {
    final normalized = status.toLowerCase();
    if (normalized.contains('done') || normalized.contains('not listening')) {
      _isListening = false;
      _controller?.close();
      _controller = null;
    }
  }

  @override
  void sendAudio(Uint8List audioData) {
    // Not used by system recognizer.
  }

  @override
  void sendEnd() {
    stop();
  }

  @override
  void stop() {
    unawaited(_stopInternal());
  }

  Future<void> _stopInternal() async {
    if (_speech.isListening) {
      await _speech.stop();
    }
    _isListening = false;
  }

  @override
  void dispose() {
    stop();
    unawaited(_controller?.close() ?? Future<void>.value());
    _controller = null;
  }
}

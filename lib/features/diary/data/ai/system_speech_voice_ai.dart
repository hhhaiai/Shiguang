import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../domain/interfaces/i_local_voice_ai.dart';

/// Uses Android/iOS system speech recognition (may rely on cloud service).
class SystemSpeechVoiceAI implements ILocalVoiceAI {
  final stt.SpeechToText _speech = stt.SpeechToText();

  StreamController<VoiceResult>? _controller;
  StreamController<double>? _levelController;
  bool _isListening = false;
  bool _initialized = false;
  bool _keepListening = false;
  bool _isStopping = false;
  bool _isDisposed = false;
  int _seq = 0;
  double _minSoundLevel = 0;
  double _maxSoundLevel = 0;
  Timer? _restartTimer;
  Timer? _closeFallbackTimer;

  @override
  bool get requiresPcmStream => false;

  @override
  bool get isListening => _isListening;

  @override
  Stream<double> get levelStream =>
      _levelController?.stream ?? const Stream<double>.empty();

  @override
  Stream<VoiceResult> listen() {
    if (_isDisposed) {
      throw StateError('System speech recognizer is disposed');
    }

    _controller ??= StreamController<VoiceResult>.broadcast();
    _levelController ??= StreamController<double>.broadcast();
    _keepListening = true;
    _seq = 0;
    _minSoundLevel = 0;
    _maxSoundLevel = 0;
    _closeFallbackTimer?.cancel();
    if (!_speech.isListening && !_isStopping) {
      unawaited(_startSystemListening());
    }
    return _controller!.stream;
  }

  Future<void> _startSystemListening() async {
    try {
      if (_isDisposed ||
          _isStopping ||
          _speech.isListening ||
          !_keepListening) {
        return;
      }

      if (!_initialized) {
        final available = await _speech.initialize(
          onError: _onSpeechError,
          onStatus: _onSpeechStatus,
        );

        if (!available) {
          throw Exception('System speech recognition not available');
        }
        _initialized = true;
      }

      if (_isDisposed ||
          _isStopping ||
          _speech.isListening ||
          !_keepListening) {
        return;
      }

      _isListening = true;

      await _speech.listen(
        onResult: _onSpeechResult,
        onSoundLevelChange: _onSoundLevel,
        listenFor: const Duration(minutes: 5),
        pauseFor: const Duration(seconds: 3),
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
    if (_isDisposed) return;
    _controller?.addError(Exception(error.errorMsg));
  }

  void _onSoundLevel(double level) {
    if (_isDisposed || !_keepListening) return;

    if (_minSoundLevel == 0 || level < _minSoundLevel) {
      _minSoundLevel = level;
    }
    if (_maxSoundLevel == 0 || level > _maxSoundLevel) {
      _maxSoundLevel = level;
    }

    final range = math.max(4.0, _maxSoundLevel - _minSoundLevel);
    final normalized = ((level - _minSoundLevel) / range).clamp(0.0, 1.0);
    final emphasized = math.pow(normalized, 1.2).toDouble();
    _levelController?.add(math.max(0.03, emphasized));
  }

  void _onSpeechStatus(String status) {
    final normalized = status.toLowerCase();
    if (normalized.contains('listening')) {
      _isListening = true;
      _closeFallbackTimer?.cancel();
      return;
    }

    if (normalized.contains('done') || normalized.contains('not listening')) {
      _isListening = false;
      if (_isDisposed) {
        _closeStreams();
        return;
      }

      if (_keepListening && !_isStopping) {
        _restartTimer?.cancel();
        _restartTimer = Timer(const Duration(milliseconds: 120), () {
          unawaited(_startSystemListening());
        });
        return;
      }

      _closeStreams();
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
    _keepListening = false;
    _isStopping = true;
    _restartTimer?.cancel();
    _closeFallbackTimer?.cancel();

    try {
      if (_speech.isListening) {
        await _speech.stop();
      }
    } finally {
      _isStopping = false;
      _isListening = false;
      _scheduleFallbackClose();
    }
  }

  void _scheduleFallbackClose() {
    _closeFallbackTimer?.cancel();
    _closeFallbackTimer = Timer(const Duration(milliseconds: 450), () {
      if (!_keepListening) {
        _closeStreams();
      }
    });
  }

  void _closeStreams() {
    final controller = _controller;
    if (controller != null) {
      unawaited(controller.close());
    }
    _controller = null;

    final levelController = _levelController;
    if (levelController != null) {
      unawaited(levelController.close());
    }
    _levelController = null;
  }

  @override
  void dispose() {
    _isDisposed = true;
    _keepListening = false;
    _restartTimer?.cancel();
    _closeFallbackTimer?.cancel();
    unawaited(_speech.cancel());
    _closeStreams();
    _isListening = false;
  }
}

import 'dart:typed_data';

/// Voice AI interface for local speech recognition
abstract class ILocalVoiceAI {
  /// Start listening and streaming audio
  Stream<VoiceResult> listen();

  /// Send PCM audio bytes to the local ASR service
  void sendAudio(Uint8List audioData);

  /// Signal the ASR service that audio input ended
  void sendEnd();

  /// Stop current listening session
  void stop();

  /// Check if currently listening
  bool get isListening;

  /// Whether this engine needs external PCM frames through [sendAudio].
  /// System speech services can return `false`.
  bool get requiresPcmStream => true;

  /// Optional normalized speech level stream in [0.0, 1.0].
  /// Engines that cannot provide live levels can use the default empty stream.
  Stream<double> get levelStream => const Stream<double>.empty();

  /// Dispose resources
  void dispose();
}

/// Voice recognition result
class VoiceResult {
  final VoiceResultType type;
  final String text;
  final int? seq;

  VoiceResult({required this.type, required this.text, this.seq});
}

enum VoiceResultType { partial, final_ }

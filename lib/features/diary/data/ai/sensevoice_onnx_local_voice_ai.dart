import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:fftea/fftea.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:ort/ort.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/utils/flutter_asset_file.dart';
import '../../domain/interfaces/i_local_voice_ai.dart';

/// Runtime tuning knobs for on-device SenseVoice ASR.
class SenseVoiceAsrTuning {
  final bool enableRealtimePartial;
  final Duration partialInterval;
  final int minSpeechBeforePartialMs;
  final int minIncrementalDecodeMs;
  final double voiceActivityDbThreshold;
  final int silenceToFinalizeMs;
  final int maxSegmentMs;
  final bool keepTrailingSilence;

  const SenseVoiceAsrTuning({
    required this.enableRealtimePartial,
    required this.partialInterval,
    required this.minSpeechBeforePartialMs,
    required this.minIncrementalDecodeMs,
    required this.voiceActivityDbThreshold,
    required this.silenceToFinalizeMs,
    required this.maxSegmentMs,
    required this.keepTrailingSilence,
  });

  /// Lower latency, higher CPU usage.
  factory SenseVoiceAsrTuning.lowLatency() => const SenseVoiceAsrTuning(
    enableRealtimePartial: true,
    partialInterval: Duration(milliseconds: 650),
    minSpeechBeforePartialMs: 500,
    minIncrementalDecodeMs: 250,
    voiceActivityDbThreshold: -47.0,
    silenceToFinalizeMs: 480,
    maxSegmentMs: 5000,
    keepTrailingSilence: true,
  );

  /// Balanced preset for most phones.
  factory SenseVoiceAsrTuning.balanced() => const SenseVoiceAsrTuning(
    enableRealtimePartial: false,
    partialInterval: Duration(milliseconds: 350),
    minSpeechBeforePartialMs: 260,
    minIncrementalDecodeMs: 160,
    voiceActivityDbThreshold: -50.0,
    silenceToFinalizeMs: 260,
    maxSegmentMs: 5200,
    keepTrailingSilence: true,
  );

  /// Better stability/accuracy, lower responsiveness.
  factory SenseVoiceAsrTuning.accurate() => const SenseVoiceAsrTuning(
    enableRealtimePartial: false,
    partialInterval: Duration(milliseconds: 1100),
    minSpeechBeforePartialMs: 900,
    minIncrementalDecodeMs: 500,
    voiceActivityDbThreshold: -41.0,
    silenceToFinalizeMs: 850,
    maxSegmentMs: 12000,
    keepTrailingSilence: true,
  );
}

/// On-device SenseVoice ASR backed by ONNX Runtime.
///
/// The underlying model is an offline CTC graph. This class emulates streaming
/// by segmenting audio with simple VAD, periodically decoding for partials,
/// then finalizing a segment once silence is stable.
class SenseVoiceOnnxLocalVoiceAI implements ILocalVoiceAI {
  static const int _sampleRate = 16000;
  static const int _bytesPerSample = 2;
  static const Duration _autoFinalizeInterval = Duration(seconds: 5);
  static const double _adaptivePauseActivationDb = -42.0;
  static const double _adaptivePauseDropDeltaDb = 6.0;
  static final _SenseVoiceOnnxEngine _sharedEngine = _SenseVoiceOnnxEngine();
  static Future<void>? _sharedPrepareFuture;

  final String _language;
  final String _textNorm;
  final SenseVoiceAsrTuning _tuning;

  final _SenseVoiceOnnxEngine _engine = _sharedEngine;
  final BytesBuilder _segmentBuffer = BytesBuilder(copy: false);
  final Queue<Uint8List> _pendingFinalSegments = Queue<Uint8List>();

  StreamController<VoiceResult>? _controller;
  Timer? _partialTimer;
  Timer? _finalizeTimer;

  bool _isListening = false;
  bool _isFinalizing = false;
  bool _inferenceInFlight = false;
  bool _partialRequested = false;
  bool _finalRequested = false;
  bool _inSpeech = false;
  DateTime? _adaptiveLowSince;
  double? _speechLevelEmaDb;

  int _seq = 0;
  int _lastDecodedBytes = 0;
  String _committedText = '';
  String _lastEmittedText = '';
  Future<void>? _prepareFuture;
  bool _prepared = false;

  SenseVoiceOnnxLocalVoiceAI({
    String language = 'auto',
    String textNorm = 'withitn',
    SenseVoiceAsrTuning? tuning,
  }) : _language = language,
       _textNorm = textNorm,
       _tuning = tuning ?? SenseVoiceAsrTuning.balanced();

  Future<void> prepare() async {
    _prepareFuture ??= _prepareInternal();
    await _prepareFuture;
  }

  Future<void> _prepareInternal() async {
    if (_prepared) return;

    _sharedPrepareFuture ??= _warmupSharedEngine(
      language: _language,
      textNorm: _textNorm,
    );
    try {
      await _sharedPrepareFuture;
    } catch (_) {
      _sharedPrepareFuture = null;
      return;
    }
    _prepared = true;
  }

  static Future<void> _warmupSharedEngine({
    required String language,
    required String textNorm,
  }) async {
    await _sharedEngine.ensureInitialized();
    try {
      // Warm-up to reduce first real decode latency.
      final warmup = Uint8List(_sampleRate * _bytesPerSample);
      await _sharedEngine.transcribePcm16(
        warmup,
        language: language,
        textNorm: textNorm,
      );
    } catch (_) {
      // Warm-up failure should not block runtime ASR.
    }
  }

  @override
  Stream<VoiceResult> listen() {
    if (_controller != null && !(_controller?.isClosed ?? true)) {
      return _controller!.stream;
    }

    _controller = StreamController<VoiceResult>.broadcast();

    _isListening = true;
    _isFinalizing = false;
    _inferenceInFlight = false;
    _partialRequested = false;
    _finalRequested = false;
    _inSpeech = false;
    _adaptiveLowSince = null;
    _speechLevelEmaDb = null;

    _seq = 0;
    _lastDecodedBytes = 0;
    _committedText = '';
    _lastEmittedText = '';
    _segmentBuffer.clear();
    _pendingFinalSegments.clear();

    _startPartialLoop();
    _startAutoFinalizeLoop();
    unawaited(_initializeEngine());

    return _controller!.stream;
  }

  Future<void> _initializeEngine() async {
    try {
      await _engine.ensureInitialized();
    } catch (error, stackTrace) {
      _controller?.addError(error, stackTrace);
    }
  }

  void _startPartialLoop() {
    _partialTimer?.cancel();
    _partialTimer = null;

    if (!_tuning.enableRealtimePartial) {
      return;
    }
    _partialTimer = Timer.periodic(_tuning.partialInterval, (_) {
      if (!_isListening || _isFinalizing || !_inSpeech) {
        return;
      }

      final segmentBytes = _segmentBuffer.length;
      if (segmentBytes < _bytesForMs(_tuning.minSpeechBeforePartialMs)) {
        return;
      }

      if (segmentBytes - _lastDecodedBytes <
          _bytesForMs(_tuning.minIncrementalDecodeMs)) {
        return;
      }

      _requestPartialDecode();
    });
  }

  void _startAutoFinalizeLoop() {
    _finalizeTimer?.cancel();
    _finalizeTimer = Timer.periodic(_autoFinalizeInterval, (_) {
      if (!_isListening || _isFinalizing) {
        return;
      }
      if (_segmentBuffer.length < _bytesForMs(900)) {
        return;
      }
      _requestFinalFlush();
    });
  }

  @override
  void sendAudio(Uint8List audioData) {
    if (!_isListening || _isFinalizing || audioData.isEmpty) {
      return;
    }

    // Always keep raw stream so final decode works even if VAD misses speech.
    _appendAudio(audioData);
    _inSpeech = true;
    _maybeForceSegmentCut();

    final now = DateTime.now();
    final frameDb = _estimateRmsDb(audioData);
    _updateSpeechLevelEma(frameDb);

    if (_isAdaptivePauseFrame(frameDb)) {
      _adaptiveLowSince ??= now;
      final lowMs = now.difference(_adaptiveLowSince!).inMilliseconds;
      if (lowMs >= _tuning.silenceToFinalizeMs) {
        _requestFinalFlush();
        return;
      }
    } else {
      _adaptiveLowSince = null;
    }

    // Optional realtime partial (disabled in balanced mode).
    if (_tuning.enableRealtimePartial &&
        _inSpeech &&
        _segmentBuffer.length >=
            _bytesForMs(_tuning.minSpeechBeforePartialMs) &&
        !_inferenceInFlight &&
        !_partialRequested &&
        _pendingFinalSegments.isEmpty) {
      _requestPartialDecode();
    }
  }

  @override
  void sendEnd() {
    if (!_isListening) {
      return;
    }
    unawaited(_finalizeSession());
  }

  @override
  void stop() {
    if (!_isListening && (_controller?.isClosed ?? true)) {
      return;
    }
    unawaited(_finalizeSession());
  }

  Future<void> _finalizeSession() async {
    if (_isFinalizing) {
      return;
    }
    _isFinalizing = true;

    _partialTimer?.cancel();
    _partialTimer = null;
    _finalizeTimer?.cancel();
    _finalizeTimer = null;

    _requestFinalFlush(force: true);

    while (_inferenceInFlight || _partialRequested || _finalRequested) {
      await Future<void>.delayed(const Duration(milliseconds: 30));
    }

    _isListening = false;

    final controller = _controller;
    _controller = null;
    if (controller != null && !controller.isClosed) {
      await controller.close();
    }
  }

  void _appendAudio(Uint8List frameBytes) {
    _segmentBuffer.add(Uint8List.fromList(frameBytes));
  }

  void _maybeForceSegmentCut() {
    final segmentMs = _segmentDurationMs(_segmentBuffer.length);
    if (segmentMs >= _tuning.maxSegmentMs) {
      _requestFinalFlush(force: true);
    }
  }

  void _requestPartialDecode() {
    _partialRequested = true;
    _scheduleDecode();
  }

  void _requestFinalFlush({bool force = false}) {
    _inSpeech = false;
    _adaptiveLowSince = null;
    _speechLevelEmaDb = null;

    if (_segmentBuffer.length == 0) {
      return;
    }

    final segmentMs = _segmentDurationMs(_segmentBuffer.length);
    final minFinalMs = _tuning.enableRealtimePartial ? 600 : 700;
    if (!force && segmentMs < minFinalMs) {
      return;
    }

    final snapshot = _segmentBuffer.toBytes();
    _segmentBuffer.clear();
    _lastDecodedBytes = 0;
    _enqueueFinalSegment(snapshot);

    if (kDebugMode) {
      debugPrint(
        '[ASR] request final flush bytes=${snapshot.length} ms=${_segmentDurationMs(snapshot.length)} queue=${_pendingFinalSegments.length}',
      );
    }

    _finalRequested = true;
    _partialRequested = false;
    _scheduleDecode();
  }

  void _enqueueFinalSegment(Uint8List snapshot) {
    if (snapshot.isEmpty) return;

    if (_pendingFinalSegments.isEmpty) {
      _pendingFinalSegments.add(snapshot);
      return;
    }

    final tail = _pendingFinalSegments.removeLast();
    _pendingFinalSegments.add(_concatPcm16(tail, snapshot));
  }

  Uint8List _concatPcm16(Uint8List a, Uint8List b) {
    final merged = Uint8List(a.length + b.length);
    merged.setRange(0, a.length, a);
    merged.setRange(a.length, merged.length, b);
    return merged;
  }

  void _scheduleDecode() {
    if (_inferenceInFlight) {
      return;
    }
    unawaited(_drainDecodeQueue());
  }

  Future<void> _drainDecodeQueue() async {
    while (true) {
      final runFinal = _pendingFinalSegments.isNotEmpty;
      final runPartial = _partialRequested && !runFinal;

      if (!runFinal && !runPartial) {
        _finalRequested = false;
        return;
      }

      Uint8List pcmBytes;
      if (runFinal) {
        pcmBytes = _pendingFinalSegments.removeFirst();
        _finalRequested = _pendingFinalSegments.isNotEmpty;
        _partialRequested = false;
      } else {
        _partialRequested = false;
        pcmBytes = _segmentBuffer.toBytes();
      }

      if (pcmBytes.isEmpty) {
        continue;
      }

      if (runFinal) {
        pcmBytes = _trimSilencePcm16(pcmBytes);
        if (pcmBytes.length < _bytesForMs(250)) {
          continue;
        }
      }

      _inferenceInFlight = true;
      final sw = Stopwatch()..start();
      String decodedText = '';

      try {
        if (kDebugMode) {
          debugPrint(
            '[ASR] decode start mode=${runFinal ? 'final' : 'partial'} bytes=${pcmBytes.length} ms=${_segmentDurationMs(pcmBytes.length)}',
          );
        }
        decodedText = await _engine.transcribePcm16(
          pcmBytes,
          language: _language,
          textNorm: _textNorm,
        );
        if (kDebugMode) {
          debugPrint(
            '[ASR] decode done mode=${runFinal ? 'final' : 'partial'} textLen=${decodedText.length}',
          );
        }
      } catch (error, stackTrace) {
        if (kDebugMode) {
          debugPrint('[ASR] decode error: $error');
        }
        _controller?.addError(error, stackTrace);
      } finally {
        sw.stop();
        _inferenceInFlight = false;
      }

      if (runFinal) {
        _handleFinalDecode(
          decodedText,
          decodeMs: sw.elapsedMilliseconds,
          segmentMs: _segmentDurationMs(pcmBytes.length),
        );
      } else {
        _handlePartialDecode(decodedText, segmentBytes: pcmBytes.length);
      }
    }
  }

  void _handlePartialDecode(String decodedText, {required int segmentBytes}) {
    if (decodedText.isEmpty) {
      return;
    }

    decodedText = _suppressFillerTokens(decodedText);
    if (decodedText.isEmpty) {
      return;
    }

    _lastDecodedBytes = segmentBytes;
    final merged = _mergeCommitted(decodedText);
    if (merged.isEmpty || merged == _lastEmittedText) {
      return;
    }

    _lastEmittedText = merged;
    _emit(VoiceResultType.partial, merged);
  }

  void _handleFinalDecode(
    String decodedText, {
    required int decodeMs,
    required int segmentMs,
  }) {
    decodedText = _suppressFillerTokens(decodedText);
    if (_isFillerOnly(decodedText)) {
      if (kDebugMode) {
        debugPrint('[ASR] final ignored filler-only="$decodedText"');
      }
      return;
    }

    if (decodedText.isNotEmpty) {
      if (_committedText.isEmpty) {
        _committedText = decodedText;
      } else {
        _committedText = '$_committedText $decodedText';
      }
      _committedText = _normalizeText(_committedText);
    }

    final finalText = _committedText.trim();
    if (finalText.isNotEmpty && finalText != _lastEmittedText) {
      _lastEmittedText = finalText;
      _emit(VoiceResultType.final_, finalText);
    }

    if (kDebugMode) {
      debugPrint(
        '[ASR] final segment=${segmentMs}ms decode=${decodeMs}ms textLen=${decodedText.length} committedLen=${finalText.length}',
      );
    }
  }

  int _bytesForMs(int durationMs) {
    return (durationMs * _sampleRate * _bytesPerSample) ~/ 1000;
  }

  int _segmentDurationMs(int bytesLength) {
    return (bytesLength * 1000) ~/ (_sampleRate * _bytesPerSample);
  }

  void _updateSpeechLevelEma(double frameDb) {
    if (frameDb <= -80.0) return;
    const alpha = 0.16;
    final current = _speechLevelEmaDb;
    if (current == null) {
      _speechLevelEmaDb = frameDb;
      return;
    }
    _speechLevelEmaDb = (current * (1 - alpha)) + (frameDb * alpha);
  }

  bool _isAdaptivePauseFrame(double frameDb) {
    final baselineDb = _speechLevelEmaDb;
    if (baselineDb == null) return false;
    if (baselineDb <= _adaptivePauseActivationDb) {
      // If the user speaks softly overall, don't endpoint by drop;
      // rely on periodic 5s split.
      return false;
    }
    return frameDb <= (baselineDb - _adaptivePauseDropDeltaDb);
  }

  double _estimateRmsDb(Uint8List pcmBytes) {
    final sampleCount = pcmBytes.lengthInBytes ~/ 2;
    if (sampleCount == 0) {
      return -120.0;
    }

    final byteData = ByteData.sublistView(pcmBytes);
    var sumSquares = 0.0;

    for (var i = 0; i < sampleCount; i++) {
      final sample = byteData.getInt16(i * 2, Endian.little) / 32768.0;
      sumSquares += sample * sample;
    }

    final rms = math.sqrt(sumSquares / sampleCount);
    final safeRms = rms < 1e-8 ? 1e-8 : rms;
    return 20.0 * (math.log(safeRms) / math.ln10);
  }

  String _mergeCommitted(String partialSegment) {
    final normalizedSegment = _normalizeText(partialSegment);
    if (_committedText.isEmpty) {
      return normalizedSegment;
    }
    if (normalizedSegment.isEmpty) {
      return _committedText;
    }
    return _normalizeText('$_committedText $normalizedSegment');
  }

  String _normalizeText(String text) {
    var normalized = text.replaceAll(RegExp(r'\s+'), ' ').trim();

    normalized = normalized.replaceAllMapped(
      RegExp(r'\s+([,.;:!?])'),
      (m) => m.group(1)!,
    );
    normalized = normalized.replaceAllMapped(
      RegExp(r'([\(\[\{])\s+'),
      (m) => m.group(1)!,
    );
    normalized = normalized.replaceAllMapped(
      RegExp(r'\s+([\)\]\}])'),
      (m) => m.group(1)!,
    );

    return normalized.trim();
  }

  String _suppressFillerTokens(String text) {
    var normalized = _normalizeText(text);
    if (normalized.isEmpty) {
      return '';
    }

    normalized = normalized.replaceAll(
      RegExp(r'(^|[\s,，。！？!?、])(?:嗯+|呃+|啊+|唔+)(?=$|[\s,，。！？!?、])'),
      ' ',
    );
    normalized = normalized.replaceAll(RegExp(r'\s+'), ' ').trim();
    return normalized;
  }

  bool _isFillerOnly(String text) {
    if (text.trim().isEmpty) {
      return true;
    }
    final compact = text.replaceAll(RegExp(r'[\s,，。！？!?、…~]'), '');
    return RegExp(r'^(?:嗯+|呃+|啊+|唔+)+$').hasMatch(compact);
  }

  Uint8List _trimSilencePcm16(Uint8List pcmBytes) {
    if (pcmBytes.lengthInBytes < _bytesForMs(280)) {
      return pcmBytes;
    }

    final sampleCount = pcmBytes.lengthInBytes ~/ 2;
    final data = ByteData.sublistView(pcmBytes);
    const minAbsAmplitude = 520; // ~ -36 dBFS
    final keepPadSamples = (_sampleRate * 0.08).toInt(); // 80ms padding

    var startSample = 0;
    while (startSample < sampleCount) {
      final v = data.getInt16(startSample * 2, Endian.little).abs();
      if (v >= minAbsAmplitude) break;
      startSample++;
    }

    var endSample = sampleCount - 1;
    while (endSample > startSample) {
      final v = data.getInt16(endSample * 2, Endian.little).abs();
      if (v >= minAbsAmplitude) break;
      endSample--;
    }

    if (startSample == 0 && endSample == sampleCount - 1) {
      return pcmBytes;
    }

    final trimStart = math.max(0, startSample - keepPadSamples);
    final trimEnd = math.min(sampleCount - 1, endSample + keepPadSamples);
    if (trimEnd <= trimStart) {
      return pcmBytes;
    }

    final startByte = trimStart * 2;
    final endByte = (trimEnd + 1) * 2;
    return Uint8List.fromList(pcmBytes.sublist(startByte, endByte));
  }

  void _emit(VoiceResultType type, String text) {
    final controller = _controller;
    if (controller == null || controller.isClosed) {
      return;
    }

    _seq += 1;
    controller.add(VoiceResult(type: type, text: text, seq: _seq));
  }

  @override
  bool get isListening => _isListening;

  @override
  bool get requiresPcmStream => true;

  @override
  Stream<double> get levelStream => const Stream<double>.empty();

  @override
  void dispose() {
    _partialTimer?.cancel();
    _partialTimer = null;
    _finalizeTimer?.cancel();
    _finalizeTimer = null;

    final controller = _controller;
    _controller = null;
    if (controller != null && !controller.isClosed) {
      unawaited(controller.close());
    }

    // Shared engine stays resident for fast re-entry into capture.
    _segmentBuffer.clear();
    _pendingFinalSegments.clear();

    _isListening = false;
    _isFinalizing = false;
    _inferenceInFlight = false;
    _partialRequested = false;
    _finalRequested = false;
    _inSpeech = false;
    _adaptiveLowSince = null;
    _speechLevelEmaDb = null;
    _prepareFuture = null;
    _prepared = false;
  }
}

class _SenseVoiceOnnxEngine {
  static const String _modelAssetPath =
      'assets/models/sensevoice-onnx/model_quant.onnx';
  static const String _tokensAssetPath =
      'assets/models/sensevoice-onnx/tokens.json';
  static const String _cmvnAssetPath = 'assets/models/sensevoice-onnx/am.mvn';

  static const int _featureDim = 560;
  static const int _blankId = 0;

  static const Map<String, int> _languageMap = {
    'auto': 0,
    'zh': 3,
    'en': 4,
    'yue': 7,
    'ja': 11,
    'ko': 12,
    'nospeech': 13,
  };

  static const Map<String, int> _textNormMap = {'withitn': 14, 'woitn': 15};

  Session? _session;
  List<String>? _tokens;
  _FbankFrontend? _frontend;
  Set<String> _inputNames = const {};

  bool _initialized = false;
  Future<void>? _initializationFuture;

  Future<void> ensureInitialized() async {
    if (_initialized &&
        _session != null &&
        _tokens != null &&
        _frontend != null) {
      return;
    }

    _initializationFuture ??= _initialize();
    await _initializationFuture;
  }

  Future<void> _initialize() async {
    // Skip ONNX initialization on macOS (not supported yet)
    if (Platform.isMacOS) {
      _initialized = false;
      if (kDebugMode) {
        debugPrint('[SenseVoice] Skipped on macOS (ONNX not supported)');
      }
      return;
    }

    try {
      await Ort.ensureInitialized(throwOnFail: true);
      final modelPath = await _ensureModelFileOnDisk();

      final executionProviders = _buildExecutionProviders();

      var builder = Session.builder()
          .withOptimizationLevel(GraphOptimizationLevel.level3)
          .withMemoryPattern(true)
          .withInterThreads(1);

      if (executionProviders.isNotEmpty) {
        builder = builder.withExecutionProviders(executionProviders);
      }

      builder = builder.withIntraThreads(4);

      final session = await builder.commitFromFile(modelPath);

      final tokensJson = await rootBundle.loadString(_tokensAssetPath);
      final tokenArray = jsonDecode(tokensJson) as List<dynamic>;
      final tokens = tokenArray.map((token) => token.toString()).toList();

      final cmvnText = await rootBundle.loadString(_cmvnAssetPath);
      final cmvn = _parseCmvn(cmvnText);

      _session = session;
      _tokens = tokens;
      _frontend = _FbankFrontend(cmvn: cmvn);
      _inputNames = session.inputNames.toSet();
      _initialized = true;
    } catch (_) {
      _initialized = false;
      rethrow;
    } finally {
      _initializationFuture = null;
    }
  }

  Future<String> _ensureModelFileOnDisk() async {
    final bundledPath = resolveBundledAssetFilePath(_modelAssetPath);
    if (bundledPath != null) {
      final bundled = File(bundledPath);
      if (bundled.existsSync() && bundled.lengthSync() > 0) {
        return bundled.path;
      }
    }

    final supportDir = await getApplicationSupportDirectory();
    final modelDir = Directory('${supportDir.path}/models/sensevoice-onnx');
    if (!modelDir.existsSync()) {
      await modelDir.create(recursive: true);
    }

    final modelFile = File('${modelDir.path}/model_quant.onnx');
    if (!modelFile.existsSync() || modelFile.lengthSync() <= 0) {
      final modelData = await rootBundle.load(_modelAssetPath);
      await modelFile.writeAsBytes(modelData.buffer.asUint8List(), flush: true);
    }

    return modelFile.path;
  }

  List<ExecutionProvider> _buildExecutionProviders() {
    // Keep CPU EP for stability.
    // XNNPACK EP currently triggers intermittent tensor clone panics
    // on the current flutter-ort path.
    return <ExecutionProvider>[CPUExecutionProvider()];
  }

  _CmvnParams _parseCmvn(String cmvnText) {
    final lines = const LineSplitter().convert(cmvnText);

    List<double>? means;
    List<double>? vars;

    for (var i = 0; i < lines.length - 1; i++) {
      final line = lines[i].trim();
      if (line.startsWith('<AddShift>')) {
        means = _parseLearnRateValues(lines[i + 1]);
      } else if (line.startsWith('<Rescale>')) {
        vars = _parseLearnRateValues(lines[i + 1]);
      }
    }

    if (means == null || vars == null) {
      throw StateError('Failed to parse CMVN from $_cmvnAssetPath');
    }

    if (means.length < _featureDim || vars.length < _featureDim) {
      throw StateError(
        'Invalid CMVN dimensions means=${means.length} vars=${vars.length}',
      );
    }

    return _CmvnParams(
      means: means.sublist(0, _featureDim),
      vars: vars.sublist(0, _featureDim),
    );
  }

  List<double> _parseLearnRateValues(String line) {
    final open = line.indexOf('[');
    final close = line.lastIndexOf(']');
    if (open == -1 || close == -1 || close <= open) {
      return const [];
    }

    final payload = line.substring(open + 1, close).trim();
    if (payload.isEmpty) {
      return const [];
    }

    return payload
        .split(RegExp(r'\s+'))
        .where((token) => token.isNotEmpty)
        .map(double.parse)
        .toList(growable: false);
  }

  Future<String> transcribePcm16(
    Uint8List pcmBytes, {
    required String language,
    required String textNorm,
  }) async {
    if (pcmBytes.lengthInBytes < 2) {
      return '';
    }

    await ensureInitialized();

    final session = _session;
    final frontend = _frontend;
    final tokens = _tokens;
    if (session == null || frontend == null || tokens == null) {
      throw StateError('SenseVoice ONNX runtime not initialized');
    }

    final waveform = _pcm16ToFloatWaveform(pcmBytes);
    final features = frontend.extract(waveform);
    if (features.isEmpty) {
      return '';
    }

    final frameCount = features.length;
    final speechInput = List<double>.filled(frameCount * _featureDim, 0.0);

    var offset = 0;
    for (final frame in features) {
      for (var i = 0; i < _featureDim; i++) {
        speechInput[offset++] = frame[i];
      }
    }

    final languageId = _languageMap[language] ?? _languageMap['zh']!;
    final textNormId = _textNormMap[textNorm] ?? _textNormMap['withitn']!;

    final speechName = _resolveInputName('speech');
    final speechLenName = _resolveInputName('speech_lengths');
    final languageName = _resolveInputName('language');
    final textNormName = _resolveInputName('textnorm');

    if (speechName == null ||
        speechLenName == null ||
        languageName == null ||
        textNormName == null) {
      throw StateError('SenseVoice ONNX required inputs not found');
    }

    final inputs = <String, Tensor>{
      speechName: Tensor.fromArrayF32(
        shape: [1, frameCount, _featureDim],
        data: speechInput,
      ),
      speechLenName: Tensor.fromArrayI32(shape: const [1], data: [frameCount]),
      languageName: Tensor.fromArrayI32(shape: const [1], data: [languageId]),
      textNormName: Tensor.fromArrayI32(shape: const [1], data: [textNormId]),
    };

    Map<String, Tensor>? outputs;
    try {
      outputs = await session.run(inputValues: inputs);
      final tokenIds = _decodeCtc(outputs);
      if (tokenIds.isEmpty) {
        return '';
      }
      return _decodeTokens(tokenIds, tokens);
    } finally {
      for (final input in inputs.values) {
        input.dispose();
      }
      if (outputs != null) {
        for (final output in outputs.values) {
          output.dispose();
        }
      }
    }
  }

  List<double> _pcm16ToFloatWaveform(Uint8List pcmBytes) {
    final sampleCount = pcmBytes.lengthInBytes ~/ 2;
    final byteData = ByteData.sublistView(pcmBytes);
    final waveform = List<double>.filled(sampleCount, 0.0);

    for (var i = 0; i < sampleCount; i++) {
      final sample = byteData.getInt16(i * 2, Endian.little);
      waveform[i] = sample / 32768.0;
    }

    return waveform;
  }

  String? _resolveInputName(String canonicalName) {
    if (_inputNames.contains(canonicalName)) {
      return canonicalName;
    }

    final expected = canonicalName.toLowerCase();
    for (final name in _inputNames) {
      final lower = name.toLowerCase();
      if (lower == expected || lower.contains(expected)) {
        return name;
      }
    }

    return null;
  }

  List<int> _decodeCtc(Map<String, Tensor> outputs) {
    Tensor? logitsTensor = outputs['ctc_logits'];
    logitsTensor ??= outputs.values.firstWhere(
      (tensor) => tensor.shape.length == 3,
      orElse: () => throw StateError('CTC logits output is missing'),
    );

    Tensor? lengthTensor = outputs['encoder_out_lens'];
    lengthTensor ??= outputs.values.firstWhere(
      (tensor) => tensor.shape.length == 1,
      orElse: () => throw StateError('Encoder length output is missing'),
    );

    final shape = logitsTensor.shape;
    if (shape.length != 3) {
      throw StateError('Unexpected CTC logits shape: $shape');
    }

    final timeSteps = shape[1];
    final vocabSize = shape[2];

    final lengthData = lengthTensor.data;
    final outputLength = lengthData.isEmpty
        ? 0
        : (lengthData.first as num).toInt();
    final effectiveLength = outputLength.clamp(0, timeSteps);

    final logits = logitsTensor.data;
    final tokenIds = <int>[];

    var previousId = -1;
    for (var t = 0; t < effectiveLength; t++) {
      final base = t * vocabSize;
      var bestId = 0;
      var bestScore = -double.infinity;

      for (var v = 0; v < vocabSize; v++) {
        final score = (logits[base + v] as num).toDouble();
        if (score > bestScore) {
          bestScore = score;
          bestId = v;
        }
      }

      if (bestId != _blankId && bestId != previousId) {
        tokenIds.add(bestId);
      }
      previousId = bestId;
    }

    return tokenIds;
  }

  String _decodeTokens(List<int> tokenIds, List<String> tokens) {
    final sb = StringBuffer();

    for (final id in tokenIds) {
      if (id < 0 || id >= tokens.length) {
        continue;
      }

      final token = tokens[id];
      if (_isSpecialToken(token)) {
        continue;
      }

      if (token.startsWith('▁')) {
        final piece = token.substring(1);
        if (piece.isEmpty) {
          continue;
        }
        if (sb.isNotEmpty) {
          sb.write(' ');
        }
        sb.write(piece);
      } else {
        sb.write(token);
      }
    }

    var text = sb.toString();
    text = text.replaceAll('The.', ' ');
    text = text.replaceAll(RegExp(r'\s+'), ' ').trim();
    text = text.replaceAllMapped(RegExp(r'\s+([,.;:!?])'), (m) => m.group(1)!);
    return text.trim();
  }

  bool _isSpecialToken(String token) {
    if (token.isEmpty) {
      return true;
    }
    if (token == '<unk>' ||
        token == '<s>' ||
        token == '</s>' ||
        token == '<OOV>') {
      return true;
    }
    return token.startsWith('<|') && token.endsWith('|>');
  }

  void dispose() {
    _session?.dispose();
    _session = null;
    _tokens = null;
    _frontend = null;
    _inputNames = const {};
    _initialized = false;
  }
}

class _CmvnParams {
  final List<double> means;
  final List<double> vars;

  const _CmvnParams({required this.means, required this.vars});
}

class _FbankFrontend {
  static const int _sampleRate = 16000;
  static const int _numMels = 80;
  static const int _frameLength = 400; // 25 ms
  static const int _frameShift = 160; // 10 ms
  static const int _fftSize = 512;
  static const int _fftBins = (_fftSize ~/ 2) + 1;

  static const int _lfrM = 7;
  static const int _lfrN = 6;
  static const int _featureDim = _lfrM * _numMels;

  static const double _preEmphasis = 0.97;

  final _CmvnParams _cmvn;
  final FFT _fft = FFT(_fftSize);
  final List<double> _window = List<double>.filled(_frameLength, 0.0);
  final List<List<double>> _melFilters = List<List<double>>.generate(
    _numMels,
    (_) => List<double>.filled(_fftBins, 0.0),
  );

  _FbankFrontend({required _CmvnParams cmvn}) : _cmvn = cmvn {
    _initWindow();
    _initMelFilters();
  }

  List<List<double>> extract(List<double> waveform) {
    final fbank = _computeLogMelFbank(waveform);
    if (fbank.isEmpty) {
      return const [];
    }

    final lfr = _applyLfr(fbank);
    if (lfr.isEmpty) {
      return const [];
    }

    return _applyCmvn(lfr);
  }

  void _initWindow() {
    for (var n = 0; n < _frameLength; n++) {
      _window[n] =
          0.54 - 0.46 * math.cos((2 * math.pi * n) / (_frameLength - 1));
    }
  }

  void _initMelFilters() {
    final lowMel = _hzToMel(20.0);
    final highMel = _hzToMel(_sampleRate / 2.0);

    final melPoints = List<double>.generate(
      _numMels + 2,
      (i) => lowMel + (highMel - lowMel) * i / (_numMels + 1),
    );

    final hzPoints = melPoints.map(_melToHz).toList(growable: false);
    final bins = hzPoints
        .map(
          (hz) => (((_fftSize + 1) * hz / _sampleRate).floor()).clamp(
            0,
            _fftBins - 1,
          ),
        )
        .toList(growable: false);

    for (var m = 1; m <= _numMels; m++) {
      final left = bins[m - 1];
      final center = bins[m];
      final right = bins[m + 1];

      if (center > left) {
        final denom = (center - left).toDouble();
        for (var k = left; k < center; k++) {
          _melFilters[m - 1][k] = (k - left) / denom;
        }
      }

      if (right > center) {
        final denom = (right - center).toDouble();
        for (var k = center; k < right; k++) {
          _melFilters[m - 1][k] = (right - k) / denom;
        }
      }
    }
  }

  List<List<double>> _computeLogMelFbank(List<double> waveform) {
    if (waveform.length < _frameLength) {
      return const [];
    }

    final frameCount = ((waveform.length - _frameLength) ~/ _frameShift) + 1;
    final features = <List<double>>[];

    final fftInput = List<double>.filled(_fftSize, 0.0);
    final centered = List<double>.filled(_frameLength, 0.0);

    for (var frameIndex = 0; frameIndex < frameCount; frameIndex++) {
      final start = frameIndex * _frameShift;

      var mean = 0.0;
      for (var i = 0; i < _frameLength; i++) {
        final sample = waveform[start + i] * 32768.0;
        centered[i] = sample;
        mean += sample;
      }
      mean /= _frameLength;

      for (var i = 0; i < _frameLength; i++) {
        centered[i] -= mean;
      }

      for (var i = 0; i < _frameLength; i++) {
        final emphasized = i == 0
            ? centered[i]
            : centered[i] - (_preEmphasis * centered[i - 1]);
        fftInput[i] = emphasized * _window[i];
      }
      for (var i = _frameLength; i < _fftSize; i++) {
        fftInput[i] = 0.0;
      }

      final spectrum = _fft.realFft(fftInput);
      final powerSpectrum = List<double>.filled(_fftBins, 0.0);
      for (var k = 0; k < _fftBins; k++) {
        final z = spectrum[k];
        powerSpectrum[k] = z.x * z.x + z.y * z.y;
      }

      final mel = List<double>.filled(_numMels, 0.0);
      for (var m = 0; m < _numMels; m++) {
        var energy = 1e-10;
        final filter = _melFilters[m];
        for (var k = 0; k < _fftBins; k++) {
          final w = filter[k];
          if (w == 0) continue;
          energy += powerSpectrum[k] * w;
        }
        mel[m] = math.log(energy);
      }

      features.add(mel);
    }

    return features;
  }

  List<List<double>> _applyLfr(List<List<double>> inputs) {
    final time = inputs.length;
    if (time == 0) {
      return const [];
    }

    final leftPaddingCount = (_lfrM - 1) ~/ 2;
    final padded = <List<double>>[];
    for (var i = 0; i < leftPaddingCount; i++) {
      padded.add(inputs.first);
    }
    padded.addAll(inputs);

    final paddedLength = padded.length;
    final lfrLength = (time / _lfrN).ceil();

    final outputs = <List<double>>[];
    for (var i = 0; i < lfrLength; i++) {
      final frame = List<double>.filled(_featureDim, 0.0);
      final start = i * _lfrN;

      for (var m = 0; m < _lfrM; m++) {
        final sourceIndex = start + m;
        final source = sourceIndex < paddedLength
            ? padded[sourceIndex]
            : padded.last;
        final offset = m * _numMels;
        for (var d = 0; d < _numMels; d++) {
          frame[offset + d] = source[d];
        }
      }

      outputs.add(frame);
    }

    return outputs;
  }

  List<List<double>> _applyCmvn(List<List<double>> inputs) {
    final outputs = <List<double>>[];

    for (final frame in inputs) {
      final normalized = List<double>.filled(_featureDim, 0.0);
      for (var i = 0; i < _featureDim; i++) {
        normalized[i] = (frame[i] + _cmvn.means[i]) * _cmvn.vars[i];
      }
      outputs.add(normalized);
    }

    return outputs;
  }

  double _hzToMel(double hz) => 1127.0 * math.log(1.0 + hz / 700.0);

  double _melToHz(double mel) => 700.0 * (math.exp(mel / 1127.0) - 1.0);
}

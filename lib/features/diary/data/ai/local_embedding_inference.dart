import 'dart:async';
import 'dart:convert';
import 'dart:ffi' as ffi;
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:ort/ort.dart';
// ignore: implementation_imports
import 'package:ort/src/rust/api/tensor.dart' show TensorImpl;
import 'package:path_provider/path_provider.dart';

import '../../../../core/utils/flutter_asset_file.dart';

/// Local embedding inference using ONNX Runtime.
///
/// Notes:
/// - This model ships with external weights (`model.onnx_data`), so we must
///   materialize files to local disk and load via `commitFromFile`.
/// - Tokenization follows BERT WordPiece from bundled `tokenizer.json`.
class LocalEmbeddingInference {
  static const String _modelAssetPath =
      'assets/models/embedding/bge-small-zh-v1.5-ONNX/onnx/model.onnx';
  static const String _modelDataAssetPath =
      'assets/models/embedding/bge-small-zh-v1.5-ONNX/onnx/model.onnx_data';
  static const String _tokenizerAssetPath =
      'assets/models/embedding/bge-small-zh-v1.5-ONNX/tokenizer.json';

  static const String _modelName = 'bge-small-zh-v1.5-ONNX';
  static const int _minModelDataBytes = 1024 * 1024;
  static const int _maxSequenceLength = 512;
  static const int _embeddingDimensions = 384;

  Session? _session;
  _BertWordPieceTokenizer? _tokenizer;
  Set<String> _inputNames = const {};
  bool _initialized = false;
  Future<void>? _initializationFuture;

  Future<void> ensureInitialized() async {
    if (_initialized && _session != null && _tokenizer != null) return;
    _initializationFuture ??= _initialize();
    await _initializationFuture;
  }

  Future<void> _initialize() async {
    // Skip ONNX initialization on macOS (not supported yet)
    if (Platform.isMacOS) {
      _initialized = false;
      if (kDebugMode) {
        debugPrint('[Embedding] Skipped on macOS (ONNX not supported)');
      }
      return;
    }

    try {
      await Ort.ensureInitialized(throwOnFail: true);
      final modelDisk = await _ensureModelFilesOnDisk();
      final tokenizer = await _loadTokenizer();

      final session = await Session.builder()
          .withIntraThreads(2)
          .withInterThreads(1)
          .commitFromFile(modelDisk.modelPath);

      _session = session;
      _tokenizer = tokenizer;
      _inputNames = session.inputNames.toSet();
      _initialized = true;
      if (kDebugMode) {
        debugPrint(
          '[Embedding] Initialized $_modelName '
          'model=${modelDisk.modelPath} data=${modelDisk.modelDataPath}',
        );
      }
    } catch (e) {
      _initialized = false;
      rethrow;
    } finally {
      _initializationFuture = null;
    }
  }

  Future<_LocalModelDiskPaths> _ensureModelFilesOnDisk() async {
    final bundledModelPath = resolveBundledAssetFilePath(_modelAssetPath);
    if (bundledModelPath != null) {
      final bundledModel = File(bundledModelPath);
      final bundledData = File('${bundledModel.parent.path}/model.onnx_data');
      if (bundledModel.existsSync() &&
          bundledModel.lengthSync() > 0 &&
          bundledData.existsSync() &&
          bundledData.lengthSync() >= _minModelDataBytes) {
        return _LocalModelDiskPaths(
          modelPath: bundledModel.path,
          modelDataPath: bundledData.path,
        );
      }
    }

    final supportDir = await getApplicationSupportDirectory();
    final modelDir = Directory(
      '${supportDir.path}/models/embedding/bge-small-zh-v1.5-ONNX/onnx',
    );
    if (!modelDir.existsSync()) {
      await modelDir.create(recursive: true);
    }

    final modelFile = File('${modelDir.path}/model.onnx');
    final modelDataFile = File('${modelDir.path}/model.onnx_data');

    await _copyAssetIfMissing(
      _modelAssetPath,
      modelFile,
      minExpectedBytes: 1024,
    );
    await _copyAssetIfMissing(
      _modelDataAssetPath,
      modelDataFile,
      minExpectedBytes: _minModelDataBytes,
    );

    if (!modelDataFile.existsSync() ||
        modelDataFile.lengthSync() < _minModelDataBytes) {
      throw StateError(
        'BGE model external weights missing/invalid: ${modelDataFile.path}',
      );
    }

    return _LocalModelDiskPaths(
      modelPath: modelFile.path,
      modelDataPath: modelDataFile.path,
    );
  }

  Future<void> _copyAssetIfMissing(
    String assetPath,
    File outputFile, {
    required int minExpectedBytes,
  }) async {
    if (outputFile.existsSync() &&
        outputFile.lengthSync() >= minExpectedBytes) {
      return;
    }

    final assetData = await rootBundle.load(assetPath);
    final bytes = assetData.buffer.asUint8List();
    await outputFile.writeAsBytes(bytes, flush: true);
  }

  Future<_BertWordPieceTokenizer> _loadTokenizer() async {
    final jsonText = await rootBundle.loadString(_tokenizerAssetPath);
    final payload = jsonDecode(jsonText) as Map<String, dynamic>;
    return _BertWordPieceTokenizer.fromTokenizerJson(payload);
  }

  Future<Float32List> generateEmbedding(String text) async {
    final normalized = text.trim();
    if (normalized.isEmpty) {
      return Float32List(_embeddingDimensions);
    }

    await ensureInitialized();
    final session = _session;
    final tokenizer = _tokenizer;
    if (session == null || tokenizer == null) {
      throw StateError('ONNX embedding runtime is not initialized.');
    }

    final encoded = tokenizer.encode(
      normalized,
      maxSequenceLength: _maxSequenceLength,
    );
    final inputIdsName = _resolveInputName('input_ids');
    final attentionMaskName = _resolveInputName('attention_mask');
    if (inputIdsName == null || attentionMaskName == null) {
      throw StateError(
        'Missing required model inputs: input_ids/attention_mask',
      );
    }

    final inputs = <String, Tensor>{
      inputIdsName: Tensor.fromArrayI64(
        shape: const [1, _maxSequenceLength],
        data: encoded.inputIds,
      ),
      attentionMaskName: Tensor.fromArrayI64(
        shape: const [1, _maxSequenceLength],
        data: encoded.attentionMask,
      ),
    };

    final tokenTypeIdsName = _resolveInputName('token_type_ids');
    if (tokenTypeIdsName != null) {
      inputs[tokenTypeIdsName] = Tensor.fromArrayI64(
        shape: const [1, _maxSequenceLength],
        data: encoded.tokenTypeIds,
      );
    }

    Map<String, Tensor>? outputs;
    try {
      outputs = await session.run(inputValues: inputs);
      return _extractEmbedding(outputs);
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

  String? _resolveInputName(String canonicalName) {
    if (_inputNames.contains(canonicalName)) return canonicalName;

    final expected = canonicalName.toLowerCase();
    for (final name in _inputNames) {
      final lower = name.toLowerCase();
      if (lower == expected || lower.contains(expected)) {
        return name;
      }
    }
    return null;
  }

  Float32List _extractEmbedding(Map<String, Tensor> outputs) {
    Tensor? hidden = _pickNamedFloatTensor(outputs, const [
      'last_hidden_state',
      'hidden_state',
      'token_embeddings',
    ]);
    hidden ??= _firstWhereOrNull(
      outputs.values,
      (t) =>
          _isSupportedFloatTensor(t) &&
          t.shape.length == 3 &&
          t.shape.last >= _embeddingDimensions,
    );
    if (hidden != null && hidden.shape.length == 3) {
      return _normalize(_readClsFromHidden(hidden));
    }

    Tensor? direct = _pickNamedFloatTensor(outputs, const [
      'sentence_embedding',
      'embedding',
      'pooler_output',
    ]);
    direct ??= _firstWhereOrNull(
      outputs.values,
      (t) =>
          _isSupportedFloatTensor(t) &&
          t.shape.length == 2 &&
          t.shape.last >= _embeddingDimensions,
    );
    if (direct != null && direct.shape.length == 2) {
      return _normalize(_readVector(_extractFloatTensorData(direct)));
    }

    throw StateError(
      'Unable to parse embedding output tensor: ${_describeOutputs(outputs)}',
    );
  }

  Float32List _extractFloatTensorData(Tensor tensor) {
    if (!_isSupportedFloatTensor(tensor)) {
      throw StateError(
        'Expected float tensor, got dtype=${tensor.dtype} shape=${tensor.shape}',
      );
    }

    final direct = _tryReadF32Pointer(tensor.rawTensor);
    if (direct != null) {
      return direct;
    }

    // Some ORT outputs are not directly CPU-readable in this binding. Clone and retry.
    final clonedRaw = tensor.rawTensor.clone();
    try {
      final clonedData = _tryReadF32Pointer(clonedRaw);
      if (clonedData != null) {
        return clonedData;
      }
    } finally {
      clonedRaw.dispose();
    }

    throw StateError(
      'Invalid ORT float pointer dtype=${tensor.dtype} shape=${tensor.shape}',
    );
  }

  Float32List? _tryReadF32Pointer(TensorImpl rawTensor) {
    final pointerInfo = rawTensor.getDataF32Pointer();
    final ptr = pointerInfo.ptr;
    final len = pointerInfo.len;
    const invalidSentinelPtr = 0x7fffffffffffffff;
    const maxFloatElements = 32 * 1024 * 1024;
    final pointerLooksValid =
        ptr != 0 &&
        ptr != invalidSentinelPtr &&
        len > 0 &&
        len <= maxFloatElements;
    if (!pointerLooksValid) {
      return null;
    }

    try {
      // Some outputs can return an unaligned float pointer. Read bytes first,
      // then reconstruct float32 values safely.
      final byteView = ffi.Pointer<ffi.Uint8>.fromAddress(
        ptr,
      ).asTypedList(len * 4);
      final bytes = Uint8List.fromList(byteView);
      final byteData = ByteData.sublistView(bytes);
      final values = Float32List(len);
      for (var i = 0; i < len; i++) {
        values[i] = byteData.getFloat32(i * 4, Endian.little);
      }
      return values;
    } on Object {
      return null;
    } finally {
      TensorImpl.freeF32Pointer(arr: pointerInfo);
    }
  }

  Float32List _readVector(Float32List data) {
    if (data.length < _embeddingDimensions) {
      throw StateError(
        'Unexpected embedding length: ${data.length}, need $_embeddingDimensions',
      );
    }

    final vector = Float32List(_embeddingDimensions);
    for (var i = 0; i < _embeddingDimensions; i++) {
      vector[i] = data[i];
    }
    return vector;
  }

  Float32List _readClsFromHidden(Tensor hiddenTensor) {
    final shape = hiddenTensor.shape;
    if (shape.length != 3) {
      throw StateError('Expected 3D hidden state output, got shape $shape');
    }

    final seqLen = shape[1];
    final hiddenSize = shape[2];
    if (hiddenSize < _embeddingDimensions) {
      throw StateError(
        'Hidden size $hiddenSize is smaller than expected $_embeddingDimensions',
      );
    }

    final data = _extractFloatTensorData(hiddenTensor);
    final clsOffset = 0 * seqLen * hiddenSize;
    final vector = Float32List(_embeddingDimensions);
    for (var i = 0; i < _embeddingDimensions; i++) {
      vector[i] = data[clsOffset + i];
    }
    return vector;
  }

  bool _isSupportedFloatTensor(Tensor tensor) {
    return tensor.dtype == TensorElementType.float32 ||
        tensor.dtype == TensorElementType.float16;
  }

  Tensor? _pickNamedFloatTensor(
    Map<String, Tensor> outputs,
    List<String> names,
  ) {
    for (final name in names) {
      for (final entry in outputs.entries) {
        final key = entry.key.toLowerCase();
        if ((key == name || key.contains(name)) &&
            _isSupportedFloatTensor(entry.value)) {
          return entry.value;
        }
      }
    }
    return null;
  }

  Tensor? _firstWhereOrNull(
    Iterable<Tensor> tensors,
    bool Function(Tensor) predicate,
  ) {
    for (final tensor in tensors) {
      if (predicate(tensor)) {
        return tensor;
      }
    }
    return null;
  }

  String _describeOutputs(Map<String, Tensor> outputs) {
    return outputs.entries
        .map((entry) {
          final t = entry.value;
          return '${entry.key}:${t.dtype}:${t.shape.join("x")}';
        })
        .join(', ');
  }

  Float32List _normalize(Float32List embedding) {
    var sumSquares = 0.0;
    for (final value in embedding) {
      sumSquares += value * value;
    }
    final norm = sumSquares > 0 ? math.sqrt(sumSquares) : 1.0;

    final normalized = Float32List(embedding.length);
    for (var i = 0; i < embedding.length; i++) {
      normalized[i] = embedding[i] / norm;
    }
    return normalized;
  }

  bool get isInitialized => _initialized;

  void dispose() {
    _session?.dispose();
    _session = null;
    _tokenizer = null;
    _inputNames = const {};
    _initialized = false;
  }
}

class _LocalModelDiskPaths {
  final String modelPath;
  final String modelDataPath;

  const _LocalModelDiskPaths({
    required this.modelPath,
    required this.modelDataPath,
  });
}

class _TokenizedText {
  final List<int> inputIds;
  final List<int> attentionMask;
  final List<int> tokenTypeIds;

  const _TokenizedText({
    required this.inputIds,
    required this.attentionMask,
    required this.tokenTypeIds,
  });
}

class _BertWordPieceTokenizer {
  static const int _maxInputCharsPerWord = 100;

  final Map<String, int> _vocab;
  final int _padTokenId;
  final int _unkTokenId;
  final int _clsTokenId;
  final int _sepTokenId;
  final bool _cleanText;
  final bool _handleChineseChars;
  final bool _lowercase;

  _BertWordPieceTokenizer({
    required Map<String, int> vocab,
    required int padTokenId,
    required int unkTokenId,
    required int clsTokenId,
    required int sepTokenId,
    required bool cleanText,
    required bool handleChineseChars,
    required bool lowercase,
  }) : _vocab = vocab,
       _padTokenId = padTokenId,
       _unkTokenId = unkTokenId,
       _clsTokenId = clsTokenId,
       _sepTokenId = sepTokenId,
       _cleanText = cleanText,
       _handleChineseChars = handleChineseChars,
       _lowercase = lowercase;

  factory _BertWordPieceTokenizer.fromTokenizerJson(
    Map<String, dynamic> tokenizerJson,
  ) {
    final model = tokenizerJson['model'] as Map<String, dynamic>? ?? const {};
    final rawVocab = model['vocab'] as Map<String, dynamic>? ?? const {};
    final vocab = <String, int>{};
    for (final entry in rawVocab.entries) {
      vocab[entry.key] = (entry.value as num).toInt();
    }

    final normalizer =
        tokenizerJson['normalizer'] as Map<String, dynamic>? ?? const {};
    final cleanText = normalizer['clean_text'] as bool? ?? true;
    final handleChineseChars =
        normalizer['handle_chinese_chars'] as bool? ?? true;
    final lowercase = normalizer['lowercase'] as bool? ?? false;
    final unkToken = model['unk_token'] as String? ?? '[UNK]';

    return _BertWordPieceTokenizer(
      vocab: vocab,
      padTokenId: vocab['[PAD]'] ?? 0,
      unkTokenId: vocab[unkToken] ?? 100,
      clsTokenId: vocab['[CLS]'] ?? 101,
      sepTokenId: vocab['[SEP]'] ?? 102,
      cleanText: cleanText,
      handleChineseChars: handleChineseChars,
      lowercase: lowercase,
    );
  }

  _TokenizedText encode(String text, {required int maxSequenceLength}) {
    final normalizedText = _normalize(text);
    final basicTokens = _basicTokenize(normalizedText);

    final wordPieceIds = <int>[];
    for (final token in basicTokens) {
      wordPieceIds.addAll(_wordPieceTokenize(token));
    }

    final payloadCapacity = maxSequenceLength - 2; // [CLS] + [SEP]
    final contentIds = wordPieceIds.length > payloadCapacity
        ? wordPieceIds.sublist(0, payloadCapacity)
        : wordPieceIds;
    final ids = <int>[_clsTokenId, ...contentIds, _sepTokenId];

    final inputIds = List<int>.filled(maxSequenceLength, _padTokenId);
    final attentionMask = List<int>.filled(maxSequenceLength, 0);
    final tokenTypeIds = List<int>.filled(maxSequenceLength, 0);

    for (var i = 0; i < ids.length; i++) {
      inputIds[i] = ids[i];
      attentionMask[i] = 1;
    }

    return _TokenizedText(
      inputIds: inputIds,
      attentionMask: attentionMask,
      tokenTypeIds: tokenTypeIds,
    );
  }

  String _normalize(String text) {
    final buffer = StringBuffer();
    for (final rune in text.runes) {
      if (_cleanText && _isControl(rune)) continue;

      if (_isWhitespace(rune)) {
        buffer.write(' ');
        continue;
      }

      if (_handleChineseChars && _isChineseChar(rune)) {
        buffer.write(' ');
        buffer.writeCharCode(rune);
        buffer.write(' ');
      } else {
        buffer.writeCharCode(rune);
      }
    }

    var normalized = buffer.toString();
    if (_lowercase) {
      normalized = normalized.toLowerCase();
    }
    return normalized.trim();
  }

  List<String> _basicTokenize(String text) {
    if (text.isEmpty) return const [];

    final tokens = <String>[];
    for (final part in text.split(RegExp(r'\s+'))) {
      if (part.isEmpty) continue;
      tokens.addAll(_splitOnPunctuation(part));
    }
    return tokens;
  }

  List<String> _splitOnPunctuation(String token) {
    final output = <String>[];
    final current = <int>[];

    for (final rune in token.runes) {
      if (_isPunctuation(rune)) {
        if (current.isNotEmpty) {
          output.add(String.fromCharCodes(current));
          current.clear();
        }
        output.add(String.fromCharCode(rune));
      } else {
        current.add(rune);
      }
    }

    if (current.isNotEmpty) {
      output.add(String.fromCharCodes(current));
    }
    return output;
  }

  List<int> _wordPieceTokenize(String token) {
    final runes = token.runes.toList(growable: false);
    if (runes.length > _maxInputCharsPerWord) {
      return <int>[_unkTokenId];
    }

    final result = <int>[];
    var start = 0;
    while (start < runes.length) {
      var end = runes.length;
      int? matchedId;

      while (start < end) {
        var piece = String.fromCharCodes(runes.sublist(start, end));
        if (start > 0) {
          piece = '##$piece';
        }

        final tokenId = _vocab[piece];
        if (tokenId != null) {
          matchedId = tokenId;
          break;
        }
        end -= 1;
      }

      if (matchedId == null) {
        return <int>[_unkTokenId];
      }

      result.add(matchedId);
      start = end;
    }

    return result;
  }

  bool _isWhitespace(int rune) =>
      rune == 0x20 ||
      rune == 0x09 ||
      rune == 0x0A ||
      rune == 0x0D ||
      rune == 0x00A0;

  bool _isControl(int rune) {
    if (rune == 0x09 || rune == 0x0A || rune == 0x0D) {
      return false;
    }
    return (rune < 0x20) || (rune >= 0x7F && rune <= 0x9F);
  }

  bool _isPunctuation(int rune) {
    final isAsciiPunctuation =
        (rune >= 33 && rune <= 47) ||
        (rune >= 58 && rune <= 64) ||
        (rune >= 91 && rune <= 96) ||
        (rune >= 123 && rune <= 126);
    if (isAsciiPunctuation) return true;

    return (rune >= 0x2000 && rune <= 0x206F) ||
        (rune >= 0x2E00 && rune <= 0x2E7F);
  }

  bool _isChineseChar(int rune) {
    return (rune >= 0x4E00 && rune <= 0x9FFF) ||
        (rune >= 0x3400 && rune <= 0x4DBF) ||
        (rune >= 0x20000 && rune <= 0x2A6DF) ||
        (rune >= 0x2A700 && rune <= 0x2B73F) ||
        (rune >= 0x2B740 && rune <= 0x2B81F) ||
        (rune >= 0x2B820 && rune <= 0x2CEAF) ||
        (rune >= 0xF900 && rune <= 0xFAFF) ||
        (rune >= 0x2F800 && rune <= 0x2FA1F);
  }
}

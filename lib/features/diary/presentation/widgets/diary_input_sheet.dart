import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

import '../../../../core/i18n/app_i18n.dart';
import '../../../../core/ui/adaptive_navigation.dart';
import '../../../../core/ui/edge_swipe_back.dart';
import '../../../../core/ui/keyboard.dart';
import '../../../settings/data/settings_provider.dart';
import '../../data/ai/sensevoice_local_voice_ai.dart';
import '../../data/ai/sensevoice_onnx_local_voice_ai.dart';
import '../../data/ai/system_speech_voice_ai.dart';
import '../../domain/interfaces/i_local_voice_ai.dart';
import 'live_waveform_bars.dart';

class DiaryInputSheet extends ConsumerStatefulWidget {
  final Function(String text) onSubmit;
  final String? initialRawText;
  final String? title;

  const DiaryInputSheet({
    super.key,
    required this.onSubmit,
    this.initialRawText,
    this.title,
  });

  @override
  ConsumerState<DiaryInputSheet> createState() => _DiaryInputSheetState();
}

class _DiaryInputSheetState extends ConsumerState<DiaryInputSheet> {
  static const Duration _asrFlushTimeout = Duration(seconds: 4);

  final _editorScrollController = ScrollController();
  final _audioRecorder = AudioRecorder();
  final _imagePicker = ImagePicker();
  final List<_EditorBlock> _blocks = <_EditorBlock>[];
  int _nextBlockId = 0;
  String? _activeTextBlockId;
  String? _recordingTargetBlockId;

  ILocalVoiceAI? _voiceAI;
  StreamSubscription<VoiceResult>? _voiceSubscription;
  StreamSubscription<double>? _levelSubscription;
  StreamSubscription<Uint8List>? _audioSubscription;
  StreamSubscription<Amplitude>? _amplitudeSubscription;
  StreamSubscription<RecordState>? _recorderStateSubscription;

  bool _isRecording = false;
  bool _hasPermission = false;
  bool _asrReady = true;
  bool _isRecoveringAsr = false;
  bool _isStoppingRecording = false;
  String _recordingBaseText = '';
  double _scrollProgress = 0;
  bool _showScrollProgress = false;

  final List<double> _waveform = List<double>.filled(24, 0.02, growable: true);

  @override
  void initState() {
    super.initState();
    _editorScrollController.addListener(_handleEditorScroll);
    _checkPermission();
    unawaited(_preloadVoiceAi());
    _scheduleScrollProgressUpdate();
    _initializeBlocks(widget.initialRawText);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_editorScrollController.hasClients) return;
      _editorScrollController.jumpTo(0);
    });
  }

  void _initializeBlocks(String? raw) {
    _disposeBlocks();
    _blocks.clear();

    final source = raw ?? '';
    if (source.trim().isEmpty) {
      final bodyBlock = _newTextBlock('');
      _blocks.add(bodyBlock);
      _activeTextBlockId = bodyBlock.id;
      return;
    }

    final parts = _BlockEditorCodec.parseRaw(source);
    for (final part in parts) {
      if (part.text != null) {
        _blocks.add(_newTextBlock(part.text!));
        continue;
      }
      final imagePath = part.imagePath;
      if (imagePath != null && imagePath.isNotEmpty) {
        _blocks.add(_newImageBlock(imagePath));
      }
    }
    _ensureTextBoundaries();
    _activeTextBlockId = _firstTextBlock?.id;
  }

  String _nextId() => 'block_${_nextBlockId++}';

  _TextEditorBlock _newTextBlock(String text) =>
      _TextEditorBlock(id: _nextId(), initialText: text);

  _ImageEditorBlock _newImageBlock(String path) =>
      _ImageEditorBlock(id: _nextId(), path: path);

  _TextEditorBlock? get _firstTextBlock {
    for (final block in _blocks) {
      if (block is _TextEditorBlock) return block;
    }
    return null;
  }

  _TextEditorBlock? get _lastTextBlock {
    for (final block in _blocks.reversed) {
      if (block is _TextEditorBlock) return block;
    }
    return null;
  }

  _TextEditorBlock? _findTextBlockById(String? id) {
    if (id == null) return null;
    for (final block in _blocks) {
      if (block is _TextEditorBlock && block.id == id) {
        return block;
      }
    }
    return null;
  }

  _TextEditorBlock _ensureTrailingTextBlock() {
    final tail = _lastTextBlock;
    if (tail != null) return tail;
    final block = _newTextBlock('');
    _blocks.add(block);
    return block;
  }

  _TextEditorBlock _ensureActiveTextBlock({bool moveCursorToEnd = false}) {
    final existing = _findTextBlockById(_activeTextBlockId);
    if (existing != null) {
      if (moveCursorToEnd) {
        final end = existing.controller.text.length;
        existing.controller.selection = TextSelection.collapsed(offset: end);
      }
      return existing;
    }
    final fallback = _lastTextBlock ?? _ensureTrailingTextBlock();
    _activeTextBlockId = fallback.id;
    if (moveCursorToEnd) {
      final end = fallback.controller.text.length;
      fallback.controller.selection = TextSelection.collapsed(offset: end);
    }
    return fallback;
  }

  bool get _hasVisibleText {
    for (final block in _blocks) {
      if (block is _TextEditorBlock &&
          block.controller.text.trim().isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  bool get _hasImages {
    for (final block in _blocks) {
      if (block is _ImageEditorBlock) return true;
    }
    return false;
  }

  void _ensureTextBoundaries() {
    if (_blocks.isEmpty) {
      final block = _newTextBlock('');
      _blocks.add(block);
      _activeTextBlockId = block.id;
      return;
    }
    if (_blocks.first is _ImageEditorBlock) {
      _blocks.insert(0, _newTextBlock(''));
    }
    var index = 0;
    while (index < _blocks.length - 1) {
      final current = _blocks[index];
      final next = _blocks[index + 1];
      if (current is _ImageEditorBlock && next is _ImageEditorBlock) {
        _blocks.insert(index + 1, _newTextBlock(''));
      }
      index += 1;
    }
    if (_blocks.last is _ImageEditorBlock) {
      _blocks.add(_newTextBlock(''));
    }
    if (_findTextBlockById(_activeTextBlockId) == null) {
      _activeTextBlockId = _firstTextBlock?.id;
    }
  }

  void _focusTextBlock(
    _TextEditorBlock block, {
    int? offset,
    bool requestFocus = true,
  }) {
    final textLength = block.controller.text.length;
    final clamped = (offset ?? textLength).clamp(0, textLength);
    block.controller.selection = TextSelection.collapsed(offset: clamped);
    _activeTextBlockId = block.id;
    if (requestFocus) {
      requestKeyboardFocus(context, block.focusNode);
    }
  }

  int _indexOfBlock(String blockId) {
    for (var index = 0; index < _blocks.length; index++) {
      if (_blocks[index].id == blockId) return index;
    }
    return -1;
  }

  void _focusAfterImage(String imageId) {
    var imageIndex = _indexOfBlock(imageId);
    if (imageIndex < 0) return;
    if (imageIndex == _blocks.length - 1 ||
        _blocks[imageIndex + 1] is! _TextEditorBlock) {
      _blocks.insert(imageIndex + 1, _newTextBlock(''));
    }
    final block = _blocks[imageIndex + 1] as _TextEditorBlock;
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _focusTextBlock(block, offset: 0);
    });
  }

  void _removeImageBlock(String imageId) {
    final imageIndex = _indexOfBlock(imageId);
    if (imageIndex < 0) return;
    final previous = imageIndex > 0 ? _blocks[imageIndex - 1] : null;
    final next = imageIndex + 1 < _blocks.length
        ? _blocks[imageIndex + 1]
        : null;

    _blocks.removeAt(imageIndex);

    if (previous is _TextEditorBlock && next is _TextEditorBlock) {
      final previousText = previous.controller.text;
      previous.controller.value = TextEditingValue(
        text: '$previousText${next.controller.text}',
        selection: TextSelection.collapsed(offset: previousText.length),
      );
      _disposeBlock(next);
      _blocks.remove(next);
      _activeTextBlockId = previous.id;
      setState(() {});
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _focusTextBlock(previous, offset: previousText.length);
      });
      _scheduleScrollProgressUpdate();
      return;
    }

    _ensureTextBoundaries();
    final target = (previous is _TextEditorBlock)
        ? previous
        : (next is _TextEditorBlock ? next : _ensureTrailingTextBlock());
    _activeTextBlockId = target.id;
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final offset = previous is _TextEditorBlock
          ? target.controller.text.length
          : 0;
      _focusTextBlock(target, offset: offset);
    });
    _scheduleScrollProgressUpdate();
  }

  void _disposeBlock(_EditorBlock block) {
    if (block is _TextEditorBlock) {
      block.dispose();
    }
  }

  void _disposeBlocks() {
    for (final block in _blocks) {
      _disposeBlock(block);
    }
  }

  String _serializeBlocks() {
    final buffer = StringBuffer();
    var endsWithNewline = true;
    var previousWasText = false;

    void writeChunk(String value) {
      if (value.isEmpty) return;
      buffer.write(value);
      endsWithNewline = value.endsWith('\n');
    }

    for (var index = 0; index < _blocks.length; index++) {
      final block = _blocks[index];
      if (block is _TextEditorBlock) {
        if (previousWasText &&
            block.controller.text.isNotEmpty &&
            !block.controller.text.startsWith('\n') &&
            !endsWithNewline) {
          writeChunk('\n');
        }
        writeChunk(block.controller.text);
        previousWasText = true;
        continue;
      }
      if (block is _ImageEditorBlock) {
        previousWasText = false;
        if (!endsWithNewline) {
          writeChunk('\n');
        }
        writeChunk(_BlockEditorCodec.buildToken(block.path));
        final next = index + 1 < _blocks.length ? _blocks[index + 1] : null;
        if (next is _TextEditorBlock &&
            next.controller.text.isNotEmpty &&
            !next.controller.text.startsWith('\n')) {
          writeChunk('\n');
        }
      }
    }
    return buffer.toString();
  }

  Future<void> _preloadVoiceAi() async {
    if (!mounted) return;
    final settings = ref.read(settingsProvider);
    if (settings.voiceRecognitionEngine != VoiceRecognitionEngine.localModel) {
      return;
    }

    _voiceAI ??= _createVoiceAi();
    final ai = _voiceAI;
    if (ai is SenseVoiceOnnxLocalVoiceAI) {
      unawaited(ai.prepare());
    }
  }

  void _handleEditorScroll() {
    if (!_editorScrollController.hasClients) return;

    final position = _editorScrollController.position;
    final maxExtent = position.maxScrollExtent;
    final nextShow = maxExtent > 24;
    final nextProgress = maxExtent <= 0
        ? 0.0
        : (position.pixels / maxExtent).clamp(0.0, 1.0);

    if (nextShow == _showScrollProgress &&
        (nextProgress - _scrollProgress).abs() < 0.001) {
      return;
    }

    if (!mounted) return;
    setState(() {
      _showScrollProgress = nextShow;
      _scrollProgress = nextProgress;
    });
  }

  void _scheduleScrollProgressUpdate() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _handleEditorScroll();
    });
  }

  Future<void> _checkPermission() async {
    final status = await Permission.microphone.status;
    if (status.isGranted) {
      setState(() => _hasPermission = true);
    }
  }

  Future<void> _requestPermission() async {
    final status = await Permission.microphone.request();
    setState(() => _hasPermission = status.isGranted);
  }

  Future<void> _toggleRecording() async {
    if (_isStoppingRecording) return;

    if (!_hasPermission) {
      await _requestPermission();
      if (!_hasPermission) return;
    }

    if (_isRecording) {
      await _stopRecording();
    } else {
      await _startRecording();
    }
  }

  Future<void> _startRecording() async {
    if (_isRecording) return;
    final target = _ensureActiveTextBlock(moveCursorToEnd: true);
    _recordingTargetBlockId = target.id;
    _recordingBaseText = target.controller.text.trimRight();
    requestKeyboardFocus(context, target.focusNode);

    _voiceAI ??= _createVoiceAi();
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
      requestKeyboardFocus(context, target.focusNode);
      return;
    }

    try {
      _recorderStateSubscription = _audioRecorder.onStateChanged().listen((
        state,
      ) async {
        if (!_isRecording || _isStoppingRecording) return;
        debugPrint('[ASR] recorder state=$state');

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

      _attachAudioStream(audioStream);
      _startAmplitudeMonitor();

      if (!mounted) return;
      setState(() {
        _isRecording = true;
        _asrReady = true;
      });
      requestKeyboardFocus(context, target.focusNode);
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

  void _attachAudioStream(Stream<Uint8List> audioStream) {
    _audioSubscription = audioStream.listen(
      (data) => _voiceAI?.sendAudio(data),
      onError: (error) async {
        if (!_isRecording || _isStoppingRecording) return;
        debugPrint('[ASR] mic stream error: $error');
        await _stopRecording(resetText: false);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.t(
                  zhHans: '麦克风中断，录音已停止',
                  zhHant: '麥克風中斷，錄音已停止',
                  en: 'Microphone interrupted, recording stopped.',
                ),
              ),
              backgroundColor: Colors.orange,
            ),
          );
        }
      },
    );
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
        debugPrint(
          '[ASR] result type=${result.type} len=${result.text.length}',
        );
        setState(() {
          _asrReady = true;
          _applyRecognizedText(result.text);
        });
        final active = _findTextBlockById(_activeTextBlockId);
        if (active != null) {
          requestKeyboardFocus(context, active.focusNode);
        }
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
          unawaited(_recoverAsr());
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

  Future<void> _recoverAsr() async {
    if (_isRecoveringAsr || !_isRecording) return;
    _isRecoveringAsr = true;

    try {
      await _voiceSubscription?.cancel();
      _voiceSubscription = null;
      await _levelSubscription?.cancel();
      _levelSubscription = null;
      _voiceAI?.dispose();

      _voiceAI = _createVoiceAi();
      _bindVoiceStream();
      _bindVoiceLevelStream();
      if (mounted) {
        setState(() => _asrReady = true);
      }
    } catch (_) {
      if (mounted) {
        setState(() => _asrReady = false);
      }
    } finally {
      _isRecoveringAsr = false;
    }
  }

  void _applyRecognizedText(String recognizedText) {
    final target =
        _findTextBlockById(_recordingTargetBlockId) ??
        _ensureActiveTextBlock(moveCursorToEnd: true);
    final mergedText = _mergeBaseAndSpeechText(recognizedText);
    target.controller.value = TextEditingValue(
      text: mergedText,
      selection: TextSelection.collapsed(offset: mergedText.length),
    );
    _activeTextBlockId = target.id;
    _scheduleScrollProgressUpdate();
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
      // Local ONNX final decode can take >1s on first run; wait for stream close.
      final voiceSubscription = _voiceSubscription;
      if (voiceSubscription != null) {
        try {
          await voiceSubscription.asFuture<void>().timeout(
            _asrFlushTimeout,
            onTimeout: () {},
          );
        } catch (_) {
          // Ignore, stream errors are already surfaced in the listener.
        }
      }
      await _voiceSubscription?.cancel();
      _voiceSubscription = null;

      if (!mounted) return;
      setState(() {
        _isRecording = false;
        if (resetText) {
          _recordingBaseText = '';
          _recordingTargetBlockId = null;
        }
        _waveform
          ..clear()
          ..addAll(List<double>.filled(24, 0.02));
      });
      final active = _findTextBlockById(_activeTextBlockId);
      if (active != null) {
        requestKeyboardFocus(context, active.focusNode);
      }
    } finally {
      _isStoppingRecording = false;
    }
  }

  void _applyInlineStyle(String left, String right) {
    final block = _ensureActiveTextBlock(moveCursorToEnd: false);
    final text = block.controller.text;
    final selection = block.controller.selection;

    final safeStart = selection.isValid
        ? math.min(selection.start, selection.end).clamp(0, text.length)
        : text.length;
    final safeEnd = selection.isValid
        ? math.max(selection.start, selection.end).clamp(0, text.length)
        : text.length;

    final selected = text.substring(safeStart, safeEnd);
    final replacement = '$left$selected$right';
    final updated = text.replaceRange(safeStart, safeEnd, replacement);
    final cursor = selected.isEmpty
        ? safeStart + left.length
        : safeStart + replacement.length;

    block.controller.value = TextEditingValue(
      text: updated,
      selection: TextSelection.collapsed(offset: cursor),
    );
    _activeTextBlockId = block.id;
    requestKeyboardFocus(context, block.focusNode);
    setState(() {});
  }

  Future<void> _insertImageToken() async {
    final source = await _pickImageSource();
    if (source == null) return;

    final picked = await _imagePicker.pickImage(source: source);
    if (picked == null) return;

    final persistedPath = await _persistPickedImage(picked) ?? picked.path;
    _insertInlineImageToken(persistedPath);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.t(
              zhHans: '已插入图片: ${picked.name}',
              zhHant: '已插入圖片: ${picked.name}',
              en: 'Image inserted: ${picked.name}',
            ),
          ),
        ),
      );
      _scheduleScrollProgressUpdate();
    }
  }

  Future<ImageSource?> _pickImageSource() async {
    return showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: Text(
                context.t(zhHans: '拍摄', zhHant: '拍攝', en: 'Take Photo'),
              ),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(
                context.t(
                  zhHans: '从相册选取',
                  zhHant: '從相簿選取',
                  en: 'Choose from Gallery',
                ),
              ),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: Text(context.t(zhHans: '取消', zhHant: '取消', en: 'Cancel')),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  void _insertInlineImageToken(String path) {
    final target = _ensureActiveTextBlock(moveCursorToEnd: true);
    final text = target.controller.text;
    final selection = target.controller.selection;
    final safeStart = selection.isValid
        ? math.min(selection.start, selection.end).clamp(0, text.length)
        : text.length;
    final safeEnd = selection.isValid
        ? math.max(selection.start, selection.end).clamp(0, text.length)
        : text.length;

    final before = text
        .substring(0, safeStart)
        .replaceFirst(RegExp(r'\n+$'), '');
    final after = text.substring(safeEnd).replaceFirst(RegExp(r'^\n+'), '');
    final blockIndex = _indexOfBlock(target.id);
    if (blockIndex < 0) return;

    target.controller.value = TextEditingValue(
      text: before,
      selection: TextSelection.collapsed(offset: before.length),
    );

    final imageBlock = _newImageBlock(path);
    final tailTextBlock = _newTextBlock(after);
    _blocks.insertAll(blockIndex + 1, [imageBlock, tailTextBlock]);
    _ensureTextBoundaries();
    _activeTextBlockId = tailTextBlock.id;

    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _focusTextBlock(tailTextBlock, offset: 0);
    });
    _scheduleScrollProgressUpdate();
  }

  Future<String?> _persistPickedImage(XFile picked) async {
    try {
      final docs = await getApplicationDocumentsDirectory();
      final imageDir = Directory('${docs.path}/diary_images');
      if (!await imageDir.exists()) {
        await imageDir.create(recursive: true);
      }

      final extIndex = picked.name.lastIndexOf('.');
      final ext = extIndex > 0 ? picked.name.substring(extIndex) : '.jpg';
      final targetPath =
          '${imageDir.path}/img_${DateTime.now().microsecondsSinceEpoch}$ext';
      final copied = await File(picked.path).copy(targetPath);
      return copied.path;
    } catch (_) {
      return null;
    }
  }

  Future<void> _submit() async {
    if (_isRecording) {
      await _stopRecording();
    }

    if (mounted) {
      FocusManager.instance.primaryFocus?.unfocus();
      await SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
      await Future<void>.delayed(const Duration(milliseconds: 120));
    }

    final rawText = _serializeBlocks().trim();
    if (rawText.isNotEmpty) {
      widget.onSubmit(rawText);
    }
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    unawaited(_audioSubscription?.cancel() ?? Future.value());
    unawaited(_amplitudeSubscription?.cancel() ?? Future.value());
    unawaited(_recorderStateSubscription?.cancel() ?? Future.value());
    unawaited(_audioRecorder.dispose());
    unawaited(_voiceSubscription?.cancel() ?? Future.value());
    unawaited(_levelSubscription?.cancel() ?? Future.value());
    _voiceAI?.dispose();
    _editorScrollController.dispose();
    _disposeBlocks();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final canSubmit = _hasVisibleText || _hasImages;
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    final keyboardVisible = bottomInset > 0;
    final recordingOverlayHeight = keyboardVisible && _isRecording ? 64.0 : 0.0;
    const editorBottomDockHeight = 0.0;

    return EdgeSwipeBack(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          leading: const BackButton(),
          title: Text(
            widget.title ??
                context.t(zhHans: '写文章', zhHant: '寫文章', en: 'Write Entry'),
          ),
          actions: [
            TextButton(
              onPressed: canSubmit ? () => unawaited(_submit()) : null,
              child: Text(context.t(zhHans: '保存', zhHant: '保存', en: 'Save')),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Row(
                  children: [
                    IconButton(
                      tooltip: context.t(
                        zhHans: '加粗',
                        zhHant: '粗體',
                        en: 'Bold',
                      ),
                      onPressed: () => _applyInlineStyle('**', '**'),
                      icon: const Icon(Icons.format_bold),
                    ),
                    IconButton(
                      tooltip: context.t(
                        zhHans: '斜体',
                        zhHant: '斜體',
                        en: 'Italic',
                      ),
                      onPressed: () => _applyInlineStyle('*', '*'),
                      icon: const Icon(Icons.format_italic),
                    ),
                    IconButton(
                      tooltip: context.t(
                        zhHans: '删除线',
                        zhHant: '刪除線',
                        en: 'Strikethrough',
                      ),
                      onPressed: () => _applyInlineStyle('~~', '~~'),
                      icon: const Icon(Icons.strikethrough_s),
                    ),
                    IconButton(
                      tooltip: context.t(
                        zhHans: '图片',
                        zhHant: '圖片',
                        en: 'Image',
                      ),
                      onPressed: () => unawaited(_insertImageToken()),
                      icon: const Icon(Icons.image_outlined),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOut,
                  padding: EdgeInsets.only(bottom: bottomInset),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Column(
                      children: [
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainerHighest
                                  .withValues(alpha: 0.14),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  bottom: editorBottomDockHeight,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      2,
                                      8,
                                      2,
                                      0,
                                    ),
                                    child: Stack(
                                      children: [
                                        _buildBlockEditor(
                                          bottomInset: bottomInset,
                                          recordingOverlayHeight:
                                              recordingOverlayHeight,
                                        ),
                                        if (_showScrollProgress)
                                          Positioned(
                                            right: 2,
                                            top: 8,
                                            bottom: 8,
                                            child: LayoutBuilder(
                                              builder: (context, constraints) {
                                                const thumbHeight = 56.0;
                                                final travel =
                                                    constraints.maxHeight -
                                                    thumbHeight;
                                                final top = travel <= 0
                                                    ? 0.0
                                                    : travel * _scrollProgress;
                                                return SizedBox(
                                                  width: 4,
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: 4,
                                                        decoration: BoxDecoration(
                                                          color: theme
                                                              .colorScheme
                                                              .outline
                                                              .withValues(
                                                                alpha: 0.22,
                                                              ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                999,
                                                              ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: top,
                                                        left: 0,
                                                        right: 0,
                                                        child: Container(
                                                          height: thumbHeight,
                                                          decoration: BoxDecoration(
                                                            color: theme
                                                                .colorScheme
                                                                .primary
                                                                .withValues(
                                                                  alpha: 0.9,
                                                                ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  999,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (!keyboardVisible)
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    height: editorBottomDockHeight,
                                    child: IgnorePointer(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              theme.scaffoldBackgroundColor
                                                  .withValues(alpha: 0),
                                              theme.scaffoldBackgroundColor
                                                  .withValues(alpha: 0.55),
                                              theme.scaffoldBackgroundColor
                                                  .withValues(alpha: 0.92),
                                            ],
                                          ),
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                bottom: Radius.circular(16),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (!keyboardVisible)
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: _asrReady ? 12 : 28,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        AnimatedSwitcher(
                                          duration: const Duration(
                                            milliseconds: 180,
                                          ),
                                          child: _isRecording
                                              ? Padding(
                                                  key: const ValueKey(
                                                    'waveform-on',
                                                  ),
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                        16,
                                                        0,
                                                        16,
                                                        10,
                                                      ),
                                                  child: LiveWaveformBars(
                                                    samples: _waveform,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  key: ValueKey('waveform-off'),
                                                  height: 82,
                                                ),
                                        ),
                                        Center(
                                          child: SizedBox(
                                            width: 78,
                                            height: 78,
                                            child: FilledButton(
                                              onPressed: _toggleRecording,
                                              style: FilledButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                                shape: const CircleBorder(),
                                                backgroundColor: _isRecording
                                                    ? Colors.red.shade500
                                                    : theme.colorScheme.primary,
                                              ),
                                              child: const Icon(
                                                Icons.mic,
                                                size: 36,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (!keyboardVisible && !_asrReady)
                                  Positioned(
                                    left: 16,
                                    right: 16,
                                    bottom: 8,
                                    child: Text(
                                      context.t(
                                        zhHans: '语音识别暂不可用，录音仍在继续。',
                                        zhHant: '語音辨識暫不可用，錄音仍在繼續。',
                                        en: 'ASR unavailable. Recording is still active.',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.orange.shade700,
                                      ),
                                    ),
                                  ),
                                if (keyboardVisible && _isRecording)
                                  Positioned(
                                    left: 12,
                                    right: 12,
                                    bottom: 8,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: theme.colorScheme.surface,
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          color: theme.colorScheme.outline
                                              .withValues(alpha: 0.2),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withValues(
                                              alpha: 0.08,
                                            ),
                                            blurRadius: 10,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: LiveWaveformBars(
                                              samples: _waveform,
                                              compact: true,
                                            ),
                                          ),
                                          IconButton(
                                            visualDensity:
                                                VisualDensity.compact,
                                            iconSize: 18,
                                            onPressed: _toggleRecording,
                                            icon: const Icon(Icons.stop),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBlockEditor({
    required double bottomInset,
    required double recordingOverlayHeight,
  }) {
    final showHint = !_hasVisibleText && !_hasImages;
    final firstTextId = _firstTextBlock?.id;
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            final target = _ensureActiveTextBlock(moveCursorToEnd: true);
            _focusTextBlock(target, offset: target.controller.text.length);
          },
          child: SingleChildScrollView(
            controller: _editorScrollController,
            padding: EdgeInsets.only(
              right: 2,
              bottom: bottomInset + recordingOverlayHeight + 24,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _blocks
                    .map((block) {
                      if (block is _TextEditorBlock) {
                        final showStarterHint =
                            showHint && block.id == firstTextId;
                        return Padding(
                          key: ValueKey(block.id),
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: TextField(
                            controller: block.controller,
                            focusNode: block.focusNode,
                            autofocus: false,
                            maxLines: null,
                            minLines: 1,
                            textAlignVertical: TextAlignVertical.top,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.7,
                              fontWeight: FontWeight.w400,
                            ),
                            scrollPadding: EdgeInsets.only(
                              bottom: bottomInset + recordingOverlayHeight + 24,
                            ),
                            onTap: () {
                              _activeTextBlockId = block.id;
                              requestKeyboardFocus(context, block.focusNode);
                            },
                            onChanged: (_) {
                              _activeTextBlockId = block.id;
                              setState(() {});
                              _scheduleScrollProgressUpdate();
                            },
                            decoration: InputDecoration(
                              hintText: showStarterHint
                                  ? context.t(
                                      zhHans: '写下正文...',
                                      zhHant: '寫下正文...',
                                      en: 'Write your entry...',
                                    )
                                  : null,
                              border: InputBorder.none,
                              filled: false,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        );
                      }
                      final image = block as _ImageEditorBlock;
                      return Padding(
                        key: ValueKey(image.id),
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: _EditorImageBlock(
                          path: image.path,
                          onRemove: () => _removeImageBlock(image.id),
                          onTapImage: () => _focusAfterImage(image.id),
                        ),
                      );
                    })
                    .toList(growable: false),
              ),
            ),
          ),
        );
      },
    );
  }
}

abstract class _EditorBlock {
  final String id;

  const _EditorBlock({required this.id});
}

class _TextEditorBlock extends _EditorBlock {
  final TextEditingController controller;
  final FocusNode focusNode;

  _TextEditorBlock({required super.id, required String initialText})
    : controller = TextEditingController(text: initialText),
      focusNode = FocusNode();

  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }
}

class _ImageEditorBlock extends _EditorBlock {
  final String path;

  const _ImageEditorBlock({required super.id, required this.path});
}

class _BlockEditorPart {
  final String? text;
  final String? imagePath;

  const _BlockEditorPart.text(this.text) : imagePath = null;
  const _BlockEditorPart.image(this.imagePath) : text = null;
}

class _BlockEditorCodec {
  static final RegExp _richImagePattern = RegExp(
    r'!\[[^\]]*\]\(([^)]+)\)|\[\[(?:img|mg):([^\]]+)\]\]',
  );

  static String buildToken(String path) =>
      '[[img:${Uri.encodeComponent(path)}]]';

  static String _safeDecodePath(String raw) {
    if (raw.isEmpty) return raw;
    try {
      return Uri.decodeComponent(raw);
    } catch (_) {
      return raw;
    }
  }

  static List<_BlockEditorPart> parseRaw(String raw) {
    if (raw.isEmpty) {
      return const [_BlockEditorPart.text('')];
    }

    final result = <_BlockEditorPart>[];
    var cursor = 0;
    for (final match in _richImagePattern.allMatches(raw)) {
      if (match.start > cursor) {
        result.add(_BlockEditorPart.text(raw.substring(cursor, match.start)));
      }

      final markdownPath = match.group(1)?.trim();
      final tokenPath = match.group(2)?.trim();
      final resolved = markdownPath?.isNotEmpty == true
          ? markdownPath!
          : _safeDecodePath(tokenPath ?? '');
      if (resolved.isNotEmpty) {
        result.add(_BlockEditorPart.image(resolved));
      }
      cursor = match.end;
    }

    if (cursor < raw.length) {
      result.add(_BlockEditorPart.text(raw.substring(cursor)));
    }

    if (result.isEmpty) {
      result.add(const _BlockEditorPart.text(''));
    }
    return result;
  }
}

class _EditorImageBlock extends StatelessWidget {
  static const double _minImageHeight = 180;
  static const double _maxImageHeight = 420;

  final String path;
  final VoidCallback onRemove;
  final VoidCallback onTapImage;

  const _EditorImageBlock({
    required this.path,
    required this.onRemove,
    required this.onTapImage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Material(
            color: theme.colorScheme.surfaceContainerHighest.withValues(
              alpha: 0.1,
            ),
            child: InkWell(
              onTap: onTapImage,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: _minImageHeight,
                  maxHeight: _maxImageHeight,
                ),
                child: Center(
                  child: Image.file(
                    File(path),
                    width: double.infinity,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      constraints: const BoxConstraints(minHeight: 120),
                      alignment: Alignment.center,
                      child: const Icon(Icons.broken_image_outlined, size: 26),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Material(
              color: Colors.black54,
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onRemove,
                child: const SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(Icons.close, size: 14, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showDiaryInputSheet(
  BuildContext context, {
  required Function(String) onSubmit,
  String? initialRawText,
  String? title,
}) {
  Navigator.of(context).push(
    adaptivePageRoute<void>(
      context,
      builder: (context) => DiaryInputSheet(
        onSubmit: onSubmit,
        initialRawText: initialRawText,
        title: title,
      ),
    ),
  );
}

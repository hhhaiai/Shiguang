import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/ui/adaptive_navigation.dart';
import '../../../../core/ui/edge_swipe_back.dart';
import '../../../../core/ui/keyboard.dart';
import '../../../settings/data/settings_provider.dart';
import '../../data/ai/sensevoice_local_voice_ai.dart';
import '../../data/ai/sensevoice_onnx_local_voice_ai.dart';
import '../../data/ai/system_speech_voice_ai.dart';
import '../../domain/diary_style_markers.dart';
import '../../domain/interfaces/i_local_voice_ai.dart';
import 'live_waveform_bars.dart';

class DiaryInputSheet extends ConsumerStatefulWidget {
  final Function(String text) onSubmit;
  final String? initialRawText;
  final String? title;
  final bool startInVoiceMode;

  const DiaryInputSheet({
    super.key,
    required this.onSubmit,
    this.initialRawText,
    this.title,
    this.startInVoiceMode = false,
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
  final Map<String, TextSelection> _lastKnownSelectionByBlockId =
      <String, TextSelection>{};
  _TextInsertionAnchor? _lastInsertionAnchor;
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
  bool _voiceMode = false;
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
      if (widget.startInVoiceMode) {
        unawaited(_toggleVoiceMode());
      }
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

  _TextEditorBlock _newTextBlock(String text) {
    final block = _TextEditorBlock(id: _nextId(), initialText: text);
    block.bind(
      onControllerChanged: () {
        final selection = block.controller.selection;
        if (selection.isValid && block.focusNode.hasFocus) {
          _rememberSelectionForBlock(block);
        } else if (selection.isValid) {
          _lastKnownSelectionByBlockId[block.id] = selection;
        }
        if (block.focusNode.hasFocus) {
          _activeTextBlockId = block.id;
        }
      },
      onFocusChanged: () {
        final selection = block.controller.selection;
        if (block.focusNode.hasFocus) {
          _rememberSelectionForBlock(block);
          return;
        }
        if (selection.isValid) {
          _lastKnownSelectionByBlockId[block.id] = selection;
        }
      },
    );
    return block;
  }

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

  _TextEditorBlock? get _focusedTextBlock {
    for (final block in _blocks) {
      if (block is _TextEditorBlock && block.focusNode.hasFocus) {
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
    _rememberSelectionForBlock(
      block,
      selection: block.controller.selection,
      updateActiveBlock: true,
    );
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
      _lastKnownSelectionByBlockId.remove(block.id);
      block.dispose();
    }
  }

  void _disposeBlocks() {
    for (final block in _blocks) {
      _disposeBlock(block);
    }
    _lastKnownSelectionByBlockId.clear();
    _lastInsertionAnchor = null;
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

  Future<void> _toggleVoiceMode() async {
    if (_isStoppingRecording) return;
    if (_isRecording) {
      await _stopRecording();
      if (!mounted) return;
      setState(() => _voiceMode = false);
      final target = _ensureActiveTextBlock(moveCursorToEnd: true);
      requestKeyboardFocus(context, target.focusNode);
      return;
    }

    if (!_hasPermission) {
      await _requestPermission();
      if (!_hasPermission) return;
    }

    FocusManager.instance.primaryFocus?.unfocus();
    await SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
    if (!mounted) return;
    setState(() => _voiceMode = true);
    await _startRecording();
    if (!mounted || !_isRecording) {
      setState(() => _voiceMode = false);
    }
  }

  Future<void> _startRecording() async {
    if (_isRecording) return;
    final target = _ensureActiveTextBlock(moveCursorToEnd: true);
    _recordingTargetBlockId = target.id;
    _recordingBaseText = target.controller.text.trimRight();

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
    } catch (error) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.microphoneStartFailed(error.toString())),
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
          final l10n = AppLocalizations.of(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.microphoneInterrupted),
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
        final l10n = AppLocalizations.of(context);
        setState(() => _asrReady = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.asrReconnectingError(error.toString())),
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
    final insertionAnchor = _captureTextInsertionAnchor();
    final source = await _pickImageSource();
    if (source == null) return;

    final picked = await _imagePicker.pickImage(source: source);
    if (picked == null) return;

    final persistedPath = await _persistPickedImage(picked) ?? picked.path;
    _insertInlineImageToken(persistedPath, anchor: insertionAnchor);

    if (mounted) {
      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.imageInserted(picked.name))));
      _scheduleScrollProgressUpdate();
    }
  }

  Future<ImageSource?> _pickImageSource() async {
    final l10n = AppLocalizations.of(context);
    return showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: Text(l10n.takePhoto),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(l10n.chooseFromGallery),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: Text(l10n.cancel),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  _TextInsertionAnchor? _captureTextInsertionAnchor() {
    final focused = _focusedTextBlock;
    if (focused != null) {
      final focusedText = focused.controller.text;
      final selection = focused.controller.selection.isValid
          ? focused.controller.selection
          : (_lastKnownSelectionByBlockId[focused.id] ??
                TextSelection.collapsed(offset: focusedText.length));
      final anchor = _selectionToAnchor(
        blockId: focused.id,
        selection: selection,
        textLength: focusedText.length,
      );
      _activeTextBlockId = focused.id;
      _lastKnownSelectionByBlockId[focused.id] = selection;
      _lastInsertionAnchor = anchor;
      return anchor;
    }

    final recent = _lastInsertionAnchor;
    if (recent != null) {
      final block = _findTextBlockById(recent.blockId);
      if (block != null) {
        final length = block.controller.text.length;
        final anchored = _TextInsertionAnchor(
          blockId: block.id,
          start: recent.start.clamp(0, length),
          end: recent.end.clamp(0, length),
        );
        _activeTextBlockId = block.id;
        return anchored;
      }
    }

    final active = _findTextBlockById(_activeTextBlockId);
    if (active != null) {
      final text = active.controller.text;
      final currentSelection = active.controller.selection;
      final cachedSelection = _lastKnownSelectionByBlockId[active.id];
      final selection = active.focusNode.hasFocus && currentSelection.isValid
          ? currentSelection
          : ((cachedSelection != null && cachedSelection.isValid)
                ? cachedSelection
                : (currentSelection.isValid
                      ? currentSelection
                      : TextSelection.collapsed(offset: text.length)));
      final anchor = _selectionToAnchor(
        blockId: active.id,
        selection: selection,
        textLength: text.length,
      );
      _lastKnownSelectionByBlockId[active.id] = selection;
      _lastInsertionAnchor = anchor;
      return anchor;
    }

    final last = _lastTextBlock;
    if (last == null) return null;
    _activeTextBlockId = last.id;
    final text = last.controller.text;
    final currentSelection = last.controller.selection;
    final selection = currentSelection.isValid
        ? currentSelection
        : (_lastKnownSelectionByBlockId[last.id] ??
              TextSelection.collapsed(offset: text.length));
    final anchor = _selectionToAnchor(
      blockId: last.id,
      selection: selection,
      textLength: text.length,
    );
    _lastInsertionAnchor = anchor;
    return anchor;
  }

  _TextInsertionAnchor _selectionToAnchor({
    required String blockId,
    required TextSelection selection,
    required int textLength,
  }) {
    final start = math.min(selection.start, selection.end).clamp(0, textLength);
    final end = math.max(selection.start, selection.end).clamp(0, textLength);
    return _TextInsertionAnchor(blockId: blockId, start: start, end: end);
  }

  void _rememberSelectionForBlock(
    _TextEditorBlock block, {
    TextSelection? selection,
    bool updateActiveBlock = true,
  }) {
    final resolvedSelection = selection ?? block.controller.selection;
    if (!resolvedSelection.isValid) return;
    _lastKnownSelectionByBlockId[block.id] = resolvedSelection;
    _lastInsertionAnchor = _selectionToAnchor(
      blockId: block.id,
      selection: resolvedSelection,
      textLength: block.controller.text.length,
    );
    if (updateActiveBlock) {
      _activeTextBlockId = block.id;
    }
  }

  void _insertInlineImageToken(String path, {_TextInsertionAnchor? anchor}) {
    final target = (anchor == null)
        ? _ensureActiveTextBlock(moveCursorToEnd: false)
        : (_findTextBlockById(anchor.blockId) ??
              _ensureActiveTextBlock(moveCursorToEnd: false));
    final text = target.controller.text;
    final selection = target.controller.selection;
    final safeStart = anchor != null
        ? anchor.start.clamp(0, text.length)
        : (selection.isValid
              ? math.min(selection.start, selection.end).clamp(0, text.length)
              : text.length);
    final safeEnd = anchor != null
        ? anchor.end.clamp(0, text.length)
        : (selection.isValid
              ? math.max(selection.start, selection.end).clamp(0, text.length)
              : text.length);

    final before = text.substring(0, safeStart);
    final after = text.substring(safeEnd);
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
    final l10n = AppLocalizations.of(context);
    final canSubmit = _hasVisibleText || _hasImages;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    final keyboardVisible = bottomInset > 0;
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final now = DateTime.now();
    final locale = Localizations.localeOf(context).toLanguageTag();
    final dateLabel = DateFormat('M月d日', locale).format(now);
    final weekLabel = DateFormat('EEEE', locale).format(now);
    final subtleTextColor = isDark
        ? const Color(0xFFC7D0DD)
        : scheme.onSurfaceVariant;
    final toolbarBottom = keyboardVisible ? bottomInset : 0.0;
    final recordingOverlayHeight = _voiceMode ? 118.0 : 72.0;

    return EdgeSwipeBack(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: isDark
            ? const Color(0xFF121316)
            : const Color(0xFFF8F8F8),
        appBar: AppBar(
          leading: const BackButton(),
          backgroundColor: isDark
              ? const Color(0xFF121316)
              : const Color(0xFFF8F8F8),
          foregroundColor: scheme.onSurface,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: Column(
            children: [
              Text(
                dateLabel,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: scheme.onSurface,
                ),
              ),
              Text(
                weekLabel,
                style: TextStyle(fontSize: 12, color: subtleTextColor),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: canSubmit ? () => unawaited(_submit()) : null,
              child: Text(
                l10n.save,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: _buildBlockEditor(
                    bottomInset: keyboardVisible ? bottomInset : 0,
                    recordingOverlayHeight: recordingOverlayHeight,
                  ),
                ),
              ),
            ),
            if (_voiceMode)
              Positioned(
                left: 12,
                right: 12,
                bottom: toolbarBottom + 56,
                child: _buildVoicePanel(),
              ),
            Positioned(
              left: 0,
              right: 0,
              bottom: toolbarBottom,
              child: _buildEditorToolbar(),
            ),
            if (_voiceMode && !_asrReady)
              Positioned(
                left: 16,
                right: 16,
                bottom: toolbarBottom + 64,
                child: Text(
                  l10n.asrUnavailableRecordingActive,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: scheme.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditorToolbar() {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final toolbarIconColor = scheme.onSurfaceVariant;
    return Material(
      color: isDark ? scheme.surfaceContainerLow : scheme.surface,
      elevation: 10,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 56,
          child: Row(
            children: [
              IconButton(
                tooltip: l10n.bold,
                onPressed: () => _applyInlineStyle(
                  DiaryStyleMarkers.boldOpen,
                  DiaryStyleMarkers.boldClose,
                ),
                icon: Icon(Icons.format_bold, color: toolbarIconColor),
              ),
              IconButton(
                tooltip: l10n.italic,
                onPressed: () => _applyInlineStyle(
                  DiaryStyleMarkers.italicOpen,
                  DiaryStyleMarkers.italicClose,
                ),
                icon: Icon(Icons.format_italic, color: toolbarIconColor),
              ),
              IconButton(
                tooltip: l10n.strikethrough,
                onPressed: () => _applyInlineStyle(
                  DiaryStyleMarkers.strikeOpen,
                  DiaryStyleMarkers.strikeClose,
                ),
                icon: Icon(Icons.strikethrough_s, color: toolbarIconColor),
              ),
              IconButton(
                tooltip: l10n.image,
                onPressed: () => unawaited(_insertImageToken()),
                icon: Icon(Icons.image_outlined, color: toolbarIconColor),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(999),
                  onTap: () => unawaited(_toggleVoiceMode()),
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: _voiceMode ? scheme.error : scheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.mic, size: 18, color: scheme.onPrimary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVoicePanel() {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 8, 8),
      decoration: BoxDecoration(
        color: isDark ? scheme.surfaceContainerLow : scheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: scheme.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                _isRecording
                    ? Icons.graphic_eq_rounded
                    : Icons.mic_none_rounded,
                size: 16,
                color: _isRecording ? scheme.primary : scheme.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Text(
                _isRecording ? l10n.voiceListening : l10n.tapToStartVoice,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: scheme.onSurface,
                ),
              ),
              const Spacer(),
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () => unawaited(_toggleVoiceMode()),
                icon: Icon(
                  _isRecording ? Icons.stop_rounded : Icons.mic,
                  color: _isRecording ? scheme.error : scheme.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: _isRecording ? 8 : 4),
          if (_isRecording) LiveWaveformBars(samples: _waveform, compact: true),
        ],
      ),
    );
  }

  Widget _buildBlockEditor({
    required double bottomInset,
    required double recordingOverlayHeight,
  }) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final subtleTextColor = theme.brightness == Brightness.dark
        ? const Color(0xFFC7D0DD)
        : scheme.onSurfaceVariant;
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
                            onTapAlwaysCalled: true,
                            maxLines: null,
                            minLines: 1,
                            textAlignVertical: TextAlignVertical.top,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.7,
                              fontWeight: FontWeight.w400,
                            ).copyWith(color: scheme.onSurface),
                            scrollPadding: EdgeInsets.only(
                              bottom: bottomInset + recordingOverlayHeight + 24,
                            ),
                            onTap: () {
                              _activeTextBlockId = block.id;
                              _rememberSelectionForBlock(block);
                              requestKeyboardFocus(context, block.focusNode);
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (!mounted) return;
                                _rememberSelectionForBlock(block);
                              });
                            },
                            onChanged: (_) {
                              _activeTextBlockId = block.id;
                              _rememberSelectionForBlock(block);
                              setState(() {});
                              _scheduleScrollProgressUpdate();
                            },
                            decoration: InputDecoration(
                              hintText: showStarterHint
                                  ? l10n.writeYourEntry
                                  : null,
                              border: InputBorder.none,
                              filled: false,
                              isDense: true,
                              hintStyle: TextStyle(color: subtleTextColor),
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
  VoidCallback? _controllerListener;
  VoidCallback? _focusListener;

  _TextEditorBlock({required super.id, required String initialText})
    : controller = _MarkdownStyledTextController(text: initialText),
      focusNode = FocusNode();

  void bind({
    required VoidCallback onControllerChanged,
    required VoidCallback onFocusChanged,
  }) {
    if (_controllerListener != null) {
      controller.removeListener(_controllerListener!);
    }
    if (_focusListener != null) {
      focusNode.removeListener(_focusListener!);
    }
    _controllerListener = onControllerChanged;
    _focusListener = onFocusChanged;
    controller.addListener(onControllerChanged);
    focusNode.addListener(onFocusChanged);
  }

  void dispose() {
    if (_controllerListener != null) {
      controller.removeListener(_controllerListener!);
      _controllerListener = null;
    }
    if (_focusListener != null) {
      focusNode.removeListener(_focusListener!);
      _focusListener = null;
    }
    controller.dispose();
    focusNode.dispose();
  }
}

class _MarkdownStyledTextController extends TextEditingController {
  static final RegExp _headingPattern = RegExp(r'^(#{1,3})\s+');
  static final RegExp _tokenPattern = RegExp(
    r'(\uE000[^\uE001\n]+?\uE001|\uE002[^\uE003\n]+?\uE003|\uE004[^\uE005\n]+?\uE005|\uE006[^\uE007\n]+?\uE007|<(?:strong|b)>[^<\n]+?</(?:strong|b)>|<(?:em|i)>[^<\n]+?</(?:em|i)>|<(?:del|strike|s)>[^<\n]+?</(?:del|strike|s)>|<code>[^<\n]+?</code>|\*\*[^*\n]+?\*\*|__[^_\n]+?__|~~[^~\n]+?~~|`[^`\n]+?`|\*(?!\s)[^*\n]+?\*(?<!\s)|_(?!\s)[^_\n]+?_(?<!\s))',
    caseSensitive: false,
  );

  _MarkdownStyledTextController({super.text});

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final source = text;
    final base = style ?? const TextStyle();
    final hiddenMarkerStyle = base.copyWith(
      color: Colors.transparent,
      fontSize: 0.1,
      height: 0.01,
      letterSpacing: -0.1,
    );
    final codeBackground = Theme.of(context).brightness == Brightness.dark
        ? const Color(0x26FFFFFF)
        : const Color(0x14000000);

    final spans = <InlineSpan>[];
    final lines = source.split('\n');
    for (var index = 0; index < lines.length; index++) {
      final line = lines[index];
      spans.addAll(
        _buildLineSpans(
          line: line,
          base: base,
          hiddenMarkerStyle: hiddenMarkerStyle,
          codeBackground: codeBackground,
        ),
      );
      if (index < lines.length - 1) {
        spans.add(TextSpan(text: '\n', style: base));
      }
    }
    return TextSpan(style: base, children: spans);
  }

  List<InlineSpan> _buildLineSpans({
    required String line,
    required TextStyle base,
    required TextStyle hiddenMarkerStyle,
    required Color codeBackground,
  }) {
    final spans = <InlineSpan>[];
    var remaining = line;
    var contentStyle = base;

    final headingMatch = _headingPattern.firstMatch(line);
    if (headingMatch != null) {
      final marker = headingMatch.group(0) ?? '';
      if (marker.isNotEmpty) {
        spans.add(TextSpan(text: marker, style: hiddenMarkerStyle));
      }
      remaining = line.substring(headingMatch.end);

      final level = headingMatch.group(1)?.length ?? 1;
      final baseSize = base.fontSize ?? 16;
      if (level <= 1) {
        contentStyle = base.copyWith(
          fontSize: baseSize + 8,
          height: 1.25,
          fontWeight: FontWeight.w800,
        );
      } else if (level == 2) {
        contentStyle = base.copyWith(
          fontSize: baseSize + 5,
          height: 1.3,
          fontWeight: FontWeight.w700,
        );
      } else {
        contentStyle = base.copyWith(
          fontSize: baseSize + 2,
          height: 1.35,
          fontWeight: FontWeight.w700,
        );
      }
    }

    spans.addAll(
      _buildInlineSpans(
        source: remaining,
        base: contentStyle,
        hiddenMarkerStyle: hiddenMarkerStyle,
        codeBackground: codeBackground,
      ),
    );
    return spans;
  }

  List<InlineSpan> _buildInlineSpans({
    required String source,
    required TextStyle base,
    required TextStyle hiddenMarkerStyle,
    required Color codeBackground,
  }) {
    if (source.isEmpty) {
      return const <InlineSpan>[];
    }

    final spans = <InlineSpan>[];
    var cursor = 0;
    for (final match in _tokenPattern.allMatches(source)) {
      if (match.start > cursor) {
        spans.add(
          TextSpan(text: source.substring(cursor, match.start), style: base),
        );
      }

      final token = match.group(0)!;
      final lower = token.toLowerCase();
      final isBold =
          (token.startsWith(DiaryStyleMarkers.boldOpen) &&
              token.endsWith(DiaryStyleMarkers.boldClose) &&
              token.length > 2) ||
          (token.startsWith('**') &&
              token.endsWith('**') &&
              token.length > 4) ||
          (token.startsWith('__') &&
              token.endsWith('__') &&
              token.length > 4) ||
          (lower.startsWith('<b>') &&
              lower.endsWith('</b>') &&
              token.length > 7) ||
          (lower.startsWith('<strong>') &&
              lower.endsWith('</strong>') &&
              token.length > 17);
      final isItalic =
          (token.startsWith(DiaryStyleMarkers.italicOpen) &&
              token.endsWith(DiaryStyleMarkers.italicClose) &&
              token.length > 2) ||
          (token.startsWith('*') && token.endsWith('*') && token.length > 2) ||
          (token.startsWith('_') && token.endsWith('_') && token.length > 2) ||
          (lower.startsWith('<i>') &&
              lower.endsWith('</i>') &&
              token.length > 7) ||
          (lower.startsWith('<em>') &&
              lower.endsWith('</em>') &&
              token.length > 9);
      final isStrike =
          (token.startsWith(DiaryStyleMarkers.strikeOpen) &&
              token.endsWith(DiaryStyleMarkers.strikeClose) &&
              token.length > 2) ||
          (token.startsWith('~~') &&
              token.endsWith('~~') &&
              token.length > 4) ||
          (lower.startsWith('<s>') &&
              lower.endsWith('</s>') &&
              token.length > 7) ||
          (lower.startsWith('<del>') &&
              lower.endsWith('</del>') &&
              token.length > 11) ||
          (lower.startsWith('<strike>') &&
              lower.endsWith('</strike>') &&
              token.length > 17);
      final isCode =
          (token.startsWith(DiaryStyleMarkers.codeOpen) &&
              token.endsWith(DiaryStyleMarkers.codeClose) &&
              token.length > 2) ||
          (token.startsWith('`') && token.endsWith('`') && token.length > 2) ||
          (lower.startsWith('<code>') &&
              lower.endsWith('</code>') &&
              token.length > 13);

      if (isBold) {
        _appendStyledToken(
          spans: spans,
          token: token,
          lower: lower,
          hiddenMarkerStyle: hiddenMarkerStyle,
          normalStyle: base.copyWith(fontWeight: FontWeight.w700),
        );
      } else if (isStrike) {
        _appendStyledToken(
          spans: spans,
          token: token,
          lower: lower,
          hiddenMarkerStyle: hiddenMarkerStyle,
          normalStyle: base.copyWith(decoration: TextDecoration.lineThrough),
        );
      } else if (isCode) {
        _appendStyledToken(
          spans: spans,
          token: token,
          lower: lower,
          hiddenMarkerStyle: hiddenMarkerStyle,
          normalStyle: base.copyWith(
            fontFamily: 'monospace',
            backgroundColor: codeBackground,
          ),
        );
      } else if (isItalic) {
        _appendStyledToken(
          spans: spans,
          token: token,
          lower: lower,
          hiddenMarkerStyle: hiddenMarkerStyle,
          normalStyle: base.copyWith(fontStyle: FontStyle.italic),
        );
      } else {
        spans.add(TextSpan(text: token, style: base));
      }

      cursor = match.end;
    }

    if (cursor < source.length) {
      spans.add(TextSpan(text: source.substring(cursor), style: base));
    }
    return spans;
  }

  String _unbox(String token) {
    final lower = token.toLowerCase();
    if (token.startsWith(DiaryStyleMarkers.boldOpen) &&
        token.endsWith(DiaryStyleMarkers.boldClose) &&
        token.length > 2) {
      return token.substring(1, token.length - 1);
    }
    if (token.startsWith(DiaryStyleMarkers.italicOpen) &&
        token.endsWith(DiaryStyleMarkers.italicClose) &&
        token.length > 2) {
      return token.substring(1, token.length - 1);
    }
    if (token.startsWith(DiaryStyleMarkers.strikeOpen) &&
        token.endsWith(DiaryStyleMarkers.strikeClose) &&
        token.length > 2) {
      return token.substring(1, token.length - 1);
    }
    if (token.startsWith(DiaryStyleMarkers.codeOpen) &&
        token.endsWith(DiaryStyleMarkers.codeClose) &&
        token.length > 2) {
      return token.substring(1, token.length - 1);
    }
    if (token.startsWith('**') && token.endsWith('**') && token.length > 4) {
      return token.substring(2, token.length - 2);
    }
    if (token.startsWith('__') && token.endsWith('__') && token.length > 4) {
      return token.substring(2, token.length - 2);
    }
    if (token.startsWith('~~') && token.endsWith('~~') && token.length > 4) {
      return token.substring(2, token.length - 2);
    }
    if (token.startsWith('*') && token.endsWith('*') && token.length > 2) {
      return token.substring(1, token.length - 1);
    }
    if (token.startsWith('_') && token.endsWith('_') && token.length > 2) {
      return token.substring(1, token.length - 1);
    }
    if (token.startsWith('`') && token.endsWith('`') && token.length > 2) {
      return token.substring(1, token.length - 1);
    }
    if (lower.startsWith('<b>') && lower.endsWith('</b>') && token.length > 7) {
      return token.substring(3, token.length - 4);
    }
    if (lower.startsWith('<strong>') &&
        lower.endsWith('</strong>') &&
        token.length > 17) {
      return token.substring(8, token.length - 9);
    }
    if (lower.startsWith('<i>') && lower.endsWith('</i>') && token.length > 7) {
      return token.substring(3, token.length - 4);
    }
    if (lower.startsWith('<em>') &&
        lower.endsWith('</em>') &&
        token.length > 9) {
      return token.substring(4, token.length - 5);
    }
    if (lower.startsWith('<s>') && lower.endsWith('</s>') && token.length > 7) {
      return token.substring(3, token.length - 4);
    }
    if (lower.startsWith('<del>') &&
        lower.endsWith('</del>') &&
        token.length > 11) {
      return token.substring(5, token.length - 6);
    }
    if (lower.startsWith('<strike>') &&
        lower.endsWith('</strike>') &&
        token.length > 17) {
      return token.substring(8, token.length - 9);
    }
    if (lower.startsWith('<code>') &&
        lower.endsWith('</code>') &&
        token.length > 13) {
      return token.substring(6, token.length - 7);
    }
    return token;
  }

  void _appendStyledToken({
    required List<InlineSpan> spans,
    required String token,
    required String lower,
    required TextStyle hiddenMarkerStyle,
    required TextStyle normalStyle,
  }) {
    final content = _unbox(token);
    if (token.startsWith(DiaryStyleMarkers.boldOpen) ||
        token.startsWith(DiaryStyleMarkers.italicOpen) ||
        token.startsWith(DiaryStyleMarkers.strikeOpen) ||
        token.startsWith(DiaryStyleMarkers.codeOpen)) {
      final open = token.substring(0, 1);
      final close = token.substring(token.length - 1);
      spans.add(TextSpan(text: open, style: hiddenMarkerStyle));
      spans.add(TextSpan(text: content, style: normalStyle));
      spans.add(TextSpan(text: close, style: hiddenMarkerStyle));
      return;
    }
    if (lower.startsWith('<')) {
      final openTagEnd = token.indexOf('>') + 1;
      final closeTagStart = token.lastIndexOf('</');
      spans.add(
        TextSpan(
          text: token.substring(0, openTagEnd),
          style: hiddenMarkerStyle,
        ),
      );
      spans.add(TextSpan(text: content, style: normalStyle));
      spans.add(
        TextSpan(
          text: token.substring(closeTagStart),
          style: hiddenMarkerStyle,
        ),
      );
      return;
    }
    if ((token.startsWith('**') && token.endsWith('**')) ||
        (token.startsWith('__') && token.endsWith('__')) ||
        (token.startsWith('~~') && token.endsWith('~~'))) {
      final marker = token.substring(0, 2);
      spans.add(TextSpan(text: marker, style: hiddenMarkerStyle));
      spans.add(TextSpan(text: content, style: normalStyle));
      spans.add(TextSpan(text: marker, style: hiddenMarkerStyle));
      return;
    }
    final marker = token.substring(0, 1);
    spans.add(TextSpan(text: marker, style: hiddenMarkerStyle));
    spans.add(TextSpan(text: content, style: normalStyle));
    spans.add(TextSpan(text: marker, style: hiddenMarkerStyle));
  }
}

class _ImageEditorBlock extends _EditorBlock {
  final String path;

  const _ImageEditorBlock({required super.id, required this.path});
}

class _TextInsertionAnchor {
  final String blockId;
  final int start;
  final int end;

  const _TextInsertionAnchor({
    required this.blockId,
    required this.start,
    required this.end,
  });
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
  bool startInVoiceMode = false,
}) {
  Navigator.of(context).push(
    adaptivePageRoute<void>(
      context,
      builder: (context) => DiaryInputSheet(
        onSubmit: onSubmit,
        initialRawText: initialRawText,
        title: title,
        startInVoiceMode: startInVoiceMode,
      ),
    ),
  );
}

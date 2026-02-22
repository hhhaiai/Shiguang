import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gal/gal.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/i18n/app_i18n.dart';
import '../../../../core/ui/edge_swipe_back.dart';
import '../../data/entities/vector_diary.dart';
import '../../domain/diary_content_codec.dart';
import '../controllers/timeline_controller.dart';
import '../widgets/diary_input_sheet.dart';
import '../widgets/diary_rich_text.dart';

class DiaryDetailScreen extends ConsumerStatefulWidget {
  final int diaryId;
  final String? highlightQuery;
  final String? matchType;

  const DiaryDetailScreen({
    super.key,
    required this.diaryId,
    this.highlightQuery,
    this.matchType,
  });

  @override
  ConsumerState<DiaryDetailScreen> createState() => _DiaryDetailScreenState();
}

class _DiaryDetailScreenState extends ConsumerState<DiaryDetailScreen>
    with SingleTickerProviderStateMixin {
  final _screenshotController = ScreenshotController();
  final _contentScrollController = ScrollController();
  late final AnimationController _pulseController;
  OverlayEntry? _shareStatusOverlay;
  int _shareStatusOverlaySeq = 0;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 760),
    );
    if ((widget.highlightQuery ?? '').trim().isNotEmpty) {
      _pulseController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _shareStatusOverlay?.remove();
    _shareStatusOverlay = null;
    _contentScrollController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _shareDiary() async {
    final diary = ref.read(timelineProvider.notifier).getDiary(widget.diaryId);
    if (diary == null) return;
    final content = DiaryContentCodec.decode(diary.rawText);
    final traceId = _newShareTraceId(diary.id);
    _shareTrace(traceId, 'share entry tapped');
    await _showSharePosterSheet(diary, content, traceId: traceId);
  }

  void _editDiary() {
    final diary = ref.read(timelineProvider.notifier).getDiary(widget.diaryId);
    if (diary == null) return;
    final l10n = AppLocalizations.of(context);
    showDiaryInputSheet(
      context,
      title: l10n.editEntry,
      initialRawText: diary.rawText,
      onSubmit: (text) {
        ref
            .read(timelineProvider.notifier)
            .updateDiary(diary.id, rawText: text);
      },
    );
  }

  String _posterI18n({
    required String zhHans,
    String? zhHant,
    required String en,
  }) {
    final localeKind = resolveAppLocaleKind(Localizations.localeOf(context));
    if (localeKind == AppLocaleKind.zhHant) {
      return zhHant ?? zhHans;
    }
    if (localeKind == AppLocaleKind.zhHans) return zhHans;
    return en;
  }

  String _newShareTraceId(int diaryId) =>
      '$diaryId-${DateTime.now().millisecondsSinceEpoch}';

  void _shareTrace(String traceId, String message) {
    debugPrint('[SharePoster][$traceId] $message');
  }

  Future<void> _showSharePosterSheet(
    VectorDiary diary,
    DiaryContent content, {
    required String traceId,
  }) async {
    const sheetHeightRatio = 0.8;
    const sheetHorizontalPadding = 12.0;
    const sheetTopPadding = 4.0;
    const sheetBottomPadding = 14.0;
    const actionsTopPadding = 10.0;
    const actionsBottomPadding = 12.0;
    const previewToActionsGap = 5.0;
    const actionButtonHeight = 52.0;
    const actionsHorizontalPadding = 10.0;
    final l10n = AppLocalizations.of(context);
    final isSaving = ValueNotifier<bool>(false);
    final previewScrollController = ScrollController();
    final previewRenderWidth =
        (MediaQuery.of(context).size.width - sheetHorizontalPadding * 2)
            .clamp(260.0, 1200.0)
            .toDouble();
    _shareTrace(traceId, 'open share sheet and start pre-render');
    final renderFuture =
        _renderSharePosterPng(
              diary,
              content,
              traceId: traceId,
              stage: 'sheet_preview_render',
              posterWidth: previewRenderWidth,
            )
            .then((bytes) {
              _shareTrace(traceId, 'pre-render done, bytes=${bytes.length}');
              return bytes;
            })
            .catchError((error, stackTrace) {
              _shareTrace(traceId, 'pre-render failed: $error');
              throw error;
            });
    try {
      return await showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: const Color(0xFFECECF2),
        builder: (sheetContext) {
          final media = MediaQuery.of(sheetContext);
          final sheetHeight = media.size.height * sheetHeightRatio;
          final contentHeight =
              sheetHeight - sheetTopPadding - sheetBottomPadding;
          final actionSectionHeight =
              actionsTopPadding + actionButtonHeight + actionsBottomPadding;
          final previewHeight =
              (contentHeight - actionSectionHeight - previewToActionsGap)
                  .clamp(160.0, contentHeight)
                  .toDouble();
          return SafeArea(
            child: SizedBox(
              height: sheetHeight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  sheetHorizontalPadding,
                  sheetTopPadding,
                  sheetHorizontalPadding,
                  sheetBottomPadding,
                ),
                child: FutureBuilder<Uint8List>(
                  future: renderFuture,
                  builder: (context, snapshot) {
                    final hasImage =
                        snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData;
                    final imageBytes = snapshot.data;
                    final hasError = snapshot.hasError;
                    return ValueListenableBuilder<bool>(
                      valueListenable: isSaving,
                      builder: (context, saving, _) {
                        return Column(
                          children: [
                            SizedBox(
                              height: previewHeight,
                              width: double.infinity,
                              child: hasImage && imageBytes != null
                                  ? Scrollbar(
                                      controller: previewScrollController,
                                      thumbVisibility: true,
                                      thickness: 4,
                                      radius: const Radius.circular(2),
                                      child: SingleChildScrollView(
                                        controller: previewScrollController,
                                        physics: const BouncingScrollPhysics(
                                          parent:
                                              AlwaysScrollableScrollPhysics(),
                                        ),
                                        child: LayoutBuilder(
                                          builder: (context, constraints) {
                                            return Image.memory(
                                              imageBytes,
                                              width: constraints.maxWidth,
                                              fit: BoxFit.fitWidth,
                                              alignment: Alignment.topCenter,
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  : _buildShareLoadingView(
                                      hasError: hasError,
                                      errorText: hasError
                                          ? l10n.shareFailed(
                                              snapshot.error.toString(),
                                            )
                                          : null,
                                    ),
                            ),
                            const SizedBox(height: previewToActionsGap),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                actionsHorizontalPadding,
                                actionsTopPadding,
                                actionsHorizontalPadding,
                                actionsBottomPadding,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: _buildSheetActionButton(
                                      icon: saving
                                          ? Icons.hourglass_top_rounded
                                          : Icons.download_outlined,
                                      label: saving
                                          ? _posterI18n(
                                              zhHans: '保存中...',
                                              zhHant: '保存中...',
                                              en: 'Saving...',
                                            )
                                          : l10n.save,
                                      onPressed:
                                          hasImage &&
                                              imageBytes != null &&
                                              !saving
                                          ? () {
                                              _shareTrace(
                                                traceId,
                                                'save button tapped, bytes=${imageBytes.length}',
                                              );
                                              isSaving.value = true;
                                              unawaited(
                                                _saveRenderedPoster(
                                                  imageBytes,
                                                  diaryId: diary.id,
                                                  traceId: traceId,
                                                ).whenComplete(() {
                                                  isSaving.value = false;
                                                }),
                                              );
                                            }
                                          : null,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: _buildSheetActionButton(
                                      icon: Icons.ios_share_outlined,
                                      label: l10n.shareAction,
                                      onPressed:
                                          hasImage &&
                                              imageBytes != null &&
                                              !saving
                                          ? () {
                                              _shareTrace(
                                                traceId,
                                                'share button tapped, bytes=${imageBytes.length}',
                                              );
                                              Navigator.pop(sheetContext);
                                              unawaited(
                                                _exportRenderedPoster(
                                                  imageBytes,
                                                  diaryId: diary.id,
                                                  shareText: content.text,
                                                  traceId: traceId,
                                                ),
                                              );
                                            }
                                          : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      );
    } finally {
      previewScrollController.dispose();
      isSaving.dispose();
    }
  }

  Widget _buildShareLoadingView({bool hasError = false, String? errorText}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!hasError) ...[
              const SizedBox(
                width: 34,
                height: 34,
                child: CircularProgressIndicator(strokeWidth: 2.8),
              ),
              const SizedBox(height: 14),
              Text(
                _posterI18n(
                  zhHans: '正在生成分享图片...',
                  zhHant: '正在生成分享圖片...',
                  en: 'Rendering share image...',
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666B76),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ] else ...[
              const Icon(
                Icons.error_outline,
                size: 32,
                color: Colors.redAccent,
              ),
              const SizedBox(height: 10),
              Text(
                errorText ??
                    _posterI18n(
                      zhHans: '分享图片生成失败',
                      zhHant: '分享圖片生成失敗',
                      en: 'Failed to render share image',
                    ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF666B76),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSheetActionButton({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
  }) {
    return SizedBox(
      height: 52,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xFFFFFFFF),
          foregroundColor: const Color(0xFF222833),
          disabledBackgroundColor: const Color(0xFFF0F1F4),
          disabledForegroundColor: const Color(0xFFB8BDC8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFFD6DAE3), width: 1.2),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 17,
            letterSpacing: 0.2,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14),
        ),
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(label),
      ),
    );
  }

  Future<void> _exportRenderedPoster(
    Uint8List imageBytes, {
    required int diaryId,
    required String shareText,
    required String traceId,
  }) async {
    final l10n = AppLocalizations.of(context);
    final totalStopwatch = Stopwatch()..start();
    _shareTrace(traceId, 'export start');
    try {
      final file = await _writeSharePosterFile(
        imageBytes,
        diaryId: diaryId,
        traceId: traceId,
        stage: 'export_write_file',
      );
      _shareTrace(traceId, 'export invoke Share.shareXFiles');
      await Share.shareXFiles([
        XFile(file.path, mimeType: 'image/png'),
      ], text: shareText);
      totalStopwatch.stop();
      _shareTrace(
        traceId,
        'export done, total=${totalStopwatch.elapsedMilliseconds}ms',
      );
    } catch (e) {
      totalStopwatch.stop();
      _shareTrace(
        traceId,
        'export failed after ${totalStopwatch.elapsedMilliseconds}ms: $e',
      );
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.shareFailed(e.toString()))));
    }
  }

  Future<void> _saveRenderedPoster(
    Uint8List imageBytes, {
    required int diaryId,
    required String traceId,
  }) async {
    final totalStopwatch = Stopwatch()..start();
    try {
      _shareTrace(traceId, 'save start');
      _showShareStatusToast(
        message: _posterI18n(
          zhHans: '正在保存到系统相册...',
          zhHant: '正在保存到系統相簿...',
          en: 'Saving to system gallery...',
        ),
      );

      _shareTrace(
        traceId,
        'permission pre-check skipped; save via Gal.putImage',
      );

      final putImageStopwatch = Stopwatch()..start();
      final saveName =
          'shiguang_share_${DateTime.now().millisecondsSinceEpoch}';
      _shareTrace(
        traceId,
        'gal.putImageBytes start: album=Shiguang, name=$saveName',
      );
      await Gal.putImageBytes(imageBytes, album: 'Shiguang', name: saveName);
      putImageStopwatch.stop();
      _shareTrace(
        traceId,
        'gal.putImageBytes done in ${putImageStopwatch.elapsedMilliseconds}ms',
      );
      totalStopwatch.stop();
      _shareTrace(
        traceId,
        'save done, total=${totalStopwatch.elapsedMilliseconds}ms',
      );
      _showShareStatusToast(
        message: _posterI18n(
          zhHans: '保存成功，已写入系统相册（Shiguang）',
          zhHant: '儲存成功，已寫入系統相簿（Shiguang）',
          en: 'Saved successfully to gallery (Shiguang)',
        ),
      );
    } catch (e) {
      totalStopwatch.stop();
      _shareTrace(
        traceId,
        'save failed after ${totalStopwatch.elapsedMilliseconds}ms: $e',
      );
      if (!mounted) return;
      final looksPermissionDenied = _looksLikePermissionDenied(e);
      if (looksPermissionDenied) {
        _showShareStatusToast(
          message: _posterI18n(
            zhHans: '保存失败：请允许“照片和视频”权限后重试',
            zhHant: '保存失敗：請允許「照片和影片」權限後重試',
            en: 'Save failed: allow Photos & Videos permission and retry',
          ),
          isError: true,
        );
        return;
      }
      final l10n = AppLocalizations.of(context);
      _showShareStatusToast(
        message: l10n.shareFailed(e.toString()),
        isError: true,
      );
    }
  }

  void _showShareStatusToast({required String message, bool isError = false}) {
    if (!mounted) return;
    final overlay = Overlay.of(context, rootOverlay: true);
    _shareStatusOverlay?.remove();
    _shareStatusOverlay = null;
    final seq = ++_shareStatusOverlaySeq;
    final entry = OverlayEntry(
      builder: (overlayContext) {
        return Positioned.fill(
          child: IgnorePointer(
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 11,
                      ),
                      decoration: BoxDecoration(
                        color: isError
                            ? const Color(0xFFD04444)
                            : const Color(0xFF1E7A46),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x33000000),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isError
                                ? Icons.error_outline_rounded
                                : Icons.check_circle_outline_rounded,
                            size: 18,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              message,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                height: 1.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    _shareStatusOverlay = entry;
    overlay.insert(entry);

    unawaited(
      Future<void>.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;
        if (_shareStatusOverlaySeq != seq) return;
        _shareStatusOverlay?.remove();
        _shareStatusOverlay = null;
      }),
    );
  }

  bool _looksLikePermissionDenied(Object error) {
    final message = error.toString().toLowerCase();
    return message.contains('permission') ||
        message.contains('denied') ||
        message.contains('not allowed') ||
        message.contains('unauthorized');
  }

  Future<Uint8List> _renderSharePosterPng(
    VectorDiary diary,
    DiaryContent content, {
    String? traceId,
    String stage = 'render',
    double posterWidth = 392,
  }) async {
    final stopwatch = Stopwatch()..start();
    if (traceId != null) {
      _shareTrace(
        traceId,
        '$stage start (pixelRatio=3, posterWidth=${posterWidth.toStringAsFixed(1)})',
      );
    }
    try {
      final bytes = await _screenshotController.captureFromLongWidget(
        InheritedTheme.captureAll(
          context,
          Material(
            color: const Color(0xFFFFFFFF),
            child: _buildSharePoster(diary, content, width: posterWidth),
          ),
        ),
        context: context,
        delay: const Duration(milliseconds: 20),
        pixelRatio: 3,
      );
      stopwatch.stop();
      if (traceId != null) {
        _shareTrace(
          traceId,
          '$stage done in ${stopwatch.elapsedMilliseconds}ms, bytes=${bytes.length}',
        );
      }
      return bytes;
    } catch (e) {
      stopwatch.stop();
      if (traceId != null) {
        _shareTrace(
          traceId,
          '$stage failed after ${stopwatch.elapsedMilliseconds}ms: $e',
        );
      }
      rethrow;
    }
  }

  Future<File> _writeSharePosterFile(
    Uint8List imageBytes, {
    required int diaryId,
    String? traceId,
    String stage = 'write_file',
  }) async {
    final stopwatch = Stopwatch()..start();
    if (traceId != null) {
      _shareTrace(traceId, '$stage start, bytes=${imageBytes.length}');
    }
    final rootDir = await getTemporaryDirectory();
    final file = File(
      '${rootDir.path}/shiguang_share_${diaryId}_${DateTime.now().millisecondsSinceEpoch}.png',
    );
    await file.writeAsBytes(imageBytes, flush: true);
    stopwatch.stop();
    if (traceId != null) {
      _shareTrace(
        traceId,
        '$stage done in ${stopwatch.elapsedMilliseconds}ms: ${file.path}',
      );
    }
    return file;
  }

  Widget _buildSharePoster(
    VectorDiary diary,
    DiaryContent content, {
    double width = 392,
  }) {
    final date = DateTime.fromMillisecondsSinceEpoch(diary.updatedAt);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final localeKind = resolveAppLocaleKind(Localizations.localeOf(context));
    final dayLabel = DateFormat('dd').format(date);
    final yearLabel = DateFormat('yyyy').format(date);
    final monthLabel = localeKind == AppLocaleKind.en
        ? DateFormat('MMM').format(date)
        : '${date.month}月';
    final weekLabel = DateFormat.EEEE(locale).format(date);
    const cardSurface = Colors.white;
    const primaryText = Color(0xFF111214);
    const secondaryText = Color(0xFF3A404A);
    const bodyText = Color(0xFF252B34);

    return Container(
      width: width,
      padding: const EdgeInsets.fromLTRB(30, 26, 30, 26),
      decoration: BoxDecoration(
        color: cardSurface,
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dayLabel,
                style: TextStyle(
                  fontSize: 90,
                  height: 0.9,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -2.8,
                  color: primaryText,
                ),
              ),
              const SizedBox(width: 12),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      yearLabel,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: primaryText,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 0),
                    Text(
                      monthLabel,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: primaryText,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      weekLabel,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.1,
                        color: secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          ..._buildShareContentWidgets(content, bodyText, secondaryText),
          const SizedBox(height: 28),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    'assets/branding/shiguang_app_x.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  _posterI18n(
                    zhHans: 'Shiguang',
                    zhHant: 'Shiguang',
                    en: 'Shiguang',
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFB19A79),
                    letterSpacing: 0.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<int> _findMatchOffsets(String source, String query) {
    if (query.isEmpty) return const [];
    final lowerSource = source.toLowerCase();
    final lowerQuery = query.toLowerCase();
    final offsets = <int>[];
    var start = 0;
    while (true) {
      final index = lowerSource.indexOf(lowerQuery, start);
      if (index < 0) break;
      offsets.add(index);
      start = index + lowerQuery.length;
    }
    return offsets;
  }

  List<InlineSpan> _highlightSpans({
    required String source,
    required String query,
    required TextStyle baseStyle,
    required ColorScheme scheme,
  }) {
    if (query.isEmpty) {
      return [TextSpan(text: source, style: baseStyle)];
    }

    final spans = <InlineSpan>[];
    final lowerSource = source.toLowerCase();
    final lowerQuery = query.toLowerCase();

    var cursor = 0;
    while (true) {
      final index = lowerSource.indexOf(lowerQuery, cursor);
      if (index < 0) {
        spans.add(TextSpan(text: source.substring(cursor), style: baseStyle));
        break;
      }

      if (index > cursor) {
        spans.add(
          TextSpan(text: source.substring(cursor, index), style: baseStyle),
        );
      }

      spans.add(
        TextSpan(
          text: source.substring(index, index + query.length),
          style: baseStyle.copyWith(
            fontWeight: FontWeight.w700,
            color: scheme.onPrimaryContainer,
            backgroundColor: scheme.primaryContainer.withValues(alpha: 0.9),
          ),
        ),
      );

      cursor = index + query.length;
    }

    return spans;
  }

  List<Widget> _buildShareContentWidgets(
    DiaryContent content,
    Color bodyTextColor,
    Color secondaryTextColor,
  ) {
    final widgets = <Widget>[];
    String? previousBlockType; // 'text' or 'image'

    for (var i = 0; i < content.blocks.length; i++) {
      final block = content.blocks[i];
      final text = block.text;
      if (text != null) {
        final raw = text.trim();
        if (raw.isEmpty) continue;
        final plain = DiaryRichText.toPlainText(raw).trim();
        if (plain.isEmpty) continue;

        // Add spacing based on previous block type
        if (previousBlockType != null) {
          widgets.add(const SizedBox(height: 22));
        }

        widgets.add(
          RichText(
            text: DiaryRichText.buildTextSpan(
              context: context,
              source: raw,
              baseStyle: TextStyle(
                fontSize: 17.6,
                height: 1.78,
                letterSpacing: 0.1,
                color: bodyTextColor,
              ),
            ),
          ),
        );
        previousBlockType = 'text';
        continue;
      }

      final path = block.imagePath;
      if (path == null || path.isEmpty) continue;

      // Add spacing based on previous block type
      if (previousBlockType != null) {
        if (previousBlockType == 'image') {
          // Image following another image: use 14 spacing
          widgets.add(const SizedBox(height: 14));
        } else {
          // Image following text: use 22 spacing
          widgets.add(const SizedBox(height: 22));
        }
      }

      widgets.add(
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxHeight: 420),
            child: Image.file(
              File(path),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => SizedBox(
                height: 140,
                child: Center(
                  child: Icon(
                    Icons.broken_image_outlined,
                    color: secondaryTextColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      previousBlockType = 'image';
    }

    if (widgets.isEmpty) {
      final l10n = AppLocalizations.of(context);
      widgets.add(
        Text(
          l10n.imageMemoryPlain,
          style: TextStyle(fontSize: 17.6, height: 1.78, color: bodyTextColor),
        ),
      );
    }
    return widgets;
  }

  List<Widget> _buildOrderedContentWidgets({
    required List<DiaryContentBlock> blocks,
    required String query,
    required ColorScheme scheme,
    required Color bodyTextColor,
    required Color imageFallbackColor,
  }) {
    final widgets = <Widget>[];

    for (var i = 0; i < blocks.length; i++) {
      final block = blocks[i];
      final text = block.text;
      if (text != null) {
        final raw = text.trim();
        if (raw.isEmpty) continue;
        final plain = DiaryRichText.toPlainText(raw).trim();
        if (plain.isEmpty) continue;
        final textStyle = TextStyle(
          fontSize: 16,
          height: 1.7,
          fontWeight: FontWeight.w400,
          color: bodyTextColor,
        );
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: query.isEmpty
                ? RichText(
                    text: DiaryRichText.buildTextSpan(
                      context: context,
                      source: raw,
                      baseStyle: textStyle,
                    ),
                  )
                : RichText(
                    text: TextSpan(
                      children: _highlightSpans(
                        source: plain,
                        query: query,
                        baseStyle: textStyle,
                        scheme: scheme,
                      ),
                    ),
                  ),
          ),
        );
        continue;
      }

      final path = block.imagePath;
      if (path == null || path.isEmpty) continue;
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxHeight: 420),
              alignment: Alignment.topCenter,
              child: Image.file(
                File(path),
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 180,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.broken_image_outlined,
                    color: bodyTextColor.withValues(alpha: 0.75),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    if (widgets.isEmpty) {
      final l10n = AppLocalizations.of(context);
      widgets.add(
        Text(
          l10n.noContent,
          style: TextStyle(fontSize: 16, height: 1.6, color: bodyTextColor),
        ),
      );
    }
    return widgets;
  }

  String _buildSubtitle(DateTime date, VectorDiary diary) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final weekLabel = DateFormat.EEEE(locale).format(date);
    // TODO: Add location and weather when available
    final location = ''; // diary.location?
    final weather = ''; // diary.weather?

    final parts = [weekLabel];
    if (location.isNotEmpty) parts.add(location);
    if (weather.isNotEmpty) parts.add(weather);

    return parts.join(' · ');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final diaries = ref.watch(timelineProvider);
    final diary = diaries.where((d) => d.id == widget.diaryId).firstOrNull;

    if (diary == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
        ),
        body: Center(child: Text(l10n.diaryNotFound)),
      );
    }

    final date = DateTime.fromMillisecondsSinceEpoch(diary.createdAt);
    final content = DiaryContentCodec.decode(diary.rawText);
    final visibleText = content.text;
    final query = (widget.highlightQuery ?? '').trim();
    final showHighlight = query.isNotEmpty;
    final offsets = _findMatchOffsets(visibleText, query);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final pageColor = isDark
        ? const Color(0xFF0F1115)
        : const Color(0xFFF6F7F9);
    final cardColor = isDark ? const Color(0xFF1A1D23) : Colors.white;
    final borderColor = isDark
        ? const Color(0xFF2D3440)
        : const Color(0xFFD9E0EA);
    final bodyTextColor = isDark
        ? const Color(0xFFF2F6FB)
        : const Color(0xFF151B24);
    final secondaryTextColor = isDark
        ? const Color(0xFFCBD3DF)
        : const Color(0xFF556173);
    final imageFallbackColor = isDark
        ? const Color(0xFF242B36)
        : const Color(0xFFE9EDF3);
    final orderedContentWidgets = _buildOrderedContentWidgets(
      blocks: content.blocks,
      query: query,
      scheme: scheme,
      bodyTextColor: bodyTextColor,
      imageFallbackColor: imageFallbackColor,
    );
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return EdgeSwipeBack(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: pageColor,
        appBar: AppBar(
          backgroundColor: pageColor,
          foregroundColor: scheme.onSurface,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                DateFormat('MM月dd日').format(date),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                _buildSubtitle(date, diary),
                style: TextStyle(
                  fontSize: 12,
                  color: scheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              tooltip: l10n.editEntry,
              icon: const Icon(Icons.edit_outlined),
              onPressed: _editDiary,
            ),
            IconButton(
              tooltip: l10n.shareAction,
              icon: const Icon(Icons.ios_share_outlined),
              onPressed: _shareDiary,
            ),
          ],
        ),
        body: SingleChildScrollView(
          controller: _contentScrollController,
          padding: EdgeInsets.fromLTRB(16, 20, 16, 26 + bottomInset),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatDateTimeLong(context, date),
                      style: TextStyle(
                        color: secondaryTextColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (showHighlight)
                      ScaleTransition(
                        scale: Tween<double>(begin: 1.0, end: 1.04).animate(
                          CurvedAnimation(
                            parent: _pulseController,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .primaryContainer
                                .withValues(alpha: 0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            l10n.searchMatchHits(
                              widget.matchType ?? l10n.exactMatch,
                              offsets.length,
                            ),
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ...orderedContentWidgets,
                    if (diary.aiSummary != null) ...[
                      const SizedBox(height: 26),
                      Text(
                        l10n.aiSummary,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: bodyTextColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        diary.aiSummary!,
                        style: TextStyle(
                          height: 1.6,
                          fontSize: 15,
                          color: secondaryTextColor,
                        ),
                      ),
                    ],
                    if (diary.aiTags != null &&
                        diary.aiTags!.trim().isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: diary.aiTags!
                            .split(',')
                            .map(
                              (tag) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? const Color(0xFF2A313D)
                                      : const Color(0xFFE6EBF3),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text(
                                  tag.trim(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: bodyTextColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                            .toList(growable: false),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

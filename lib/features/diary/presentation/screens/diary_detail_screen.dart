import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gal/gal.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/i18n/app_i18n.dart';
import '../../../../core/ui/edge_swipe_back.dart';
import '../../data/entities/vector_diary.dart';
import '../../domain/diary_content_codec.dart';
import '../controllers/timeline_controller.dart';
import '../widgets/markdown_html_embed_parser.dart';
import '../widgets/markdown_diagram_resolver.dart';
import '../widgets/markdown_math_support.dart';
import '../widgets/html_media_player.dart';
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

class _MarkdownHeading {
  final int level;
  final String title;

  const _MarkdownHeading({required this.level, required this.title});
}

class _DiaryDetailScreenState extends ConsumerState<DiaryDetailScreen>
    with SingleTickerProviderStateMixin {
  final _screenshotController = ScreenshotController();
  final _contentScrollController = ScrollController();
  late final AnimationController _pulseController;
  OverlayEntry? _shareStatusOverlay;
  int _shareStatusOverlaySeq = 0;
  static final RegExp _linkTitleAttrPattern = RegExp(
    r'\[([^\]]+)\]\(([^)\s]+)\)\{\s*:title="([^"]+)"\s*\}',
  );
  static final RegExp _linkTitleAttrPatternSingleQuote = RegExp(
    r"\[([^\]]+)\]\(([^)\s]+)\)\{\s*:title='([^']+)'\s*\}",
  );
  static final RegExp _fenceStartPattern = RegExp(r'^\s*(```+|~~~+)');
  static final RegExp _topicDirectivePattern = RegExp(
    r'^\s*\[(?:topic|toc|目录)\]\s*$',
    caseSensitive: false,
  );
  static final RegExp _headingLinePattern = RegExp(
    r'^\s{0,3}(#{1,6})\s+(.+?)\s*$',
  );
  static final RegExp _headingTrailingHashesPattern = RegExp(r'\s+#+\s*$');
  static final RegExp _blockquoteNoSpacePattern = RegExp(r'^(\s*>+)([^\s>])');
  static final RegExp _blockquoteNoSpaceFullwidthPattern = RegExp(
    r'^(\s*＞+)([^\s＞])',
  );

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

  void _shareTraceError(
    String traceId,
    String stage,
    Object error,
    StackTrace stackTrace, {
    Duration? elapsed,
  }) {
    final elapsedText = elapsed == null
        ? ''
        : ' after ${elapsed.inMilliseconds}ms';
    _shareTrace(traceId, '$stage failed$elapsedText: $error');
    _shareTrace(traceId, '$stage stack:\n$stackTrace');
  }

  String _debugContentSummary(DiaryContent content) {
    var textBlocks = 0;
    var imageBlocks = 0;
    var textChars = 0;
    var imagePaths = 0;
    for (final block in content.blocks) {
      final text = block.text;
      if (text != null) {
        textBlocks++;
        textChars += text.length;
        continue;
      }
      final path = block.imagePath;
      if (path != null && path.trim().isNotEmpty) {
        imageBlocks++;
        imagePaths++;
      }
    }
    return 'blocks=${content.blocks.length}, textBlocks=$textBlocks, imageBlocks=$imageBlocks, textChars=$textChars, imagePaths=$imagePaths';
  }

  String _normalizeExtendedMarkdownSource(String source) {
    if (source.isEmpty) return source;
    final lines = source.split('\n');
    final buffer = StringBuffer();
    var inFence = false;
    String? activeFence;
    for (var i = 0; i < lines.length; i++) {
      var line = lines[i];
      final trimmed = line.trimLeft();
      final fenceMatch = _fenceStartPattern.firstMatch(trimmed);
      if (fenceMatch != null) {
        final token = fenceMatch.group(1)!;
        if (!inFence) {
          inFence = true;
          activeFence = token;
        } else {
          final sameType = activeFence != null && activeFence[0] == token[0];
          final enoughLength =
              activeFence != null && token.length >= activeFence.length;
          if (sameType && enoughLength) {
            inFence = false;
            activeFence = null;
          }
        }
      } else if (!inFence) {
        line = line
            .replaceAllMapped(
              _linkTitleAttrPattern,
              (m) => '[${m.group(1)}](${m.group(2)} "${m.group(3)}")',
            )
            .replaceAllMapped(
              _linkTitleAttrPatternSingleQuote,
              (m) => '[${m.group(1)}](${m.group(2)} "${m.group(3)}")',
            )
            .replaceFirstMapped(
              _blockquoteNoSpacePattern,
              (m) => '${m.group(1)} ${m.group(2)}',
            )
            .replaceFirstMapped(_blockquoteNoSpaceFullwidthPattern, (m) {
              final prefix = (m.group(1) ?? '').replaceAll('＞', '>');
              return '$prefix ${m.group(2)}';
            });
      }
      buffer.write(line);
      if (i < lines.length - 1) buffer.write('\n');
    }
    return buffer.toString();
  }

  int? _detectTopicDirectiveBlockIndex(List<DiaryContentBlock> blocks) {
    for (var i = 0; i < blocks.length; i++) {
      final raw = blocks[i].text?.trim() ?? '';
      if (raw.isEmpty) continue;
      final markdown = DiaryRichText.toMarkdownSource(raw).trim();
      if (markdown.isEmpty) continue;
      if (_hasTopicDirectiveInLeadingLines(markdown)) {
        return i;
      }
      break;
    }
    return null;
  }

  bool _hasTopicDirectiveInLeadingLines(String source) {
    if (source.isEmpty) return false;
    var nonEmptyCount = 0;
    for (final line in source.split('\n')) {
      final value = line.trim();
      if (value.isEmpty) continue;
      nonEmptyCount++;
      if (_topicDirectivePattern.hasMatch(value)) return true;
      if (nonEmptyCount >= 12) break;
    }
    return false;
  }

  List<_MarkdownHeading> _extractTopicHeadingsFromBlocks(
    List<DiaryContentBlock> blocks, {
    int? topicDirectiveBlockIndex,
  }) {
    final markdownParts = <String>[];
    for (var i = 0; i < blocks.length; i++) {
      final raw = blocks[i].text?.trim() ?? '';
      if (raw.isEmpty) continue;
      var markdown = DiaryRichText.toMarkdownSource(raw).trim();
      if (markdown.isEmpty) continue;
      if (i == topicDirectiveBlockIndex) {
        markdown = _consumeTopicDirective(markdown).markdown.trim();
        if (markdown.isEmpty) continue;
      }
      markdownParts.add(markdown);
    }
    if (markdownParts.isEmpty) return const <_MarkdownHeading>[];
    return _extractMarkdownHeadings(markdownParts.join('\n\n'));
  }

  ({bool showTopic, String markdown}) _consumeTopicDirective(String source) {
    if (source.isEmpty) return (showTopic: false, markdown: source);
    final lines = source.split('\n');
    var directiveIndex = -1;
    var nonEmptyCount = 0;
    for (var i = 0; i < lines.length; i++) {
      final trimmed = lines[i].trim();
      if (trimmed.isEmpty) continue;
      nonEmptyCount++;
      if (_topicDirectivePattern.hasMatch(trimmed)) {
        directiveIndex = i;
        break;
      }
      if (nonEmptyCount >= 12) break;
    }
    if (directiveIndex < 0) {
      return (showTopic: false, markdown: source);
    }
    lines.removeAt(directiveIndex);
    if (directiveIndex < lines.length && lines[directiveIndex].trim().isEmpty) {
      lines.removeAt(directiveIndex);
    }
    return (showTopic: true, markdown: lines.join('\n'));
  }

  List<_MarkdownHeading> _extractMarkdownHeadings(String source) {
    if (source.isEmpty) return const <_MarkdownHeading>[];
    final lines = source.split('\n');
    final headings = <_MarkdownHeading>[];
    var inFence = false;
    String? activeFence;
    for (final line in lines) {
      final trimmed = line.trimLeft();
      final fenceMatch = _fenceStartPattern.firstMatch(trimmed);
      if (fenceMatch != null) {
        final token = fenceMatch.group(1)!;
        if (!inFence) {
          inFence = true;
          activeFence = token;
        } else {
          final sameType = activeFence != null && activeFence[0] == token[0];
          final enoughLength =
              activeFence != null && token.length >= activeFence.length;
          if (sameType && enoughLength) {
            inFence = false;
            activeFence = null;
          }
        }
        continue;
      }
      if (inFence) continue;
      final headingMatch = _headingLinePattern.firstMatch(line);
      if (headingMatch == null) continue;
      final level = headingMatch.group(1)?.length ?? 1;
      final title = (headingMatch.group(2) ?? '')
          .replaceFirst(_headingTrailingHashesPattern, '')
          .trim();
      if (title.isEmpty) continue;
      headings.add(_MarkdownHeading(level: level, title: title));
    }
    return headings;
  }

  Widget _buildTopicWidget({
    required List<_MarkdownHeading> headings,
    required Color bodyTextColor,
    required Color secondaryTextColor,
  }) {
    if (headings.isEmpty) return const SizedBox.shrink();
    final title = _posterI18n(zhHans: '目录', zhHant: '目錄', en: 'Topics');
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: secondaryTextColor.withValues(alpha: 0.08),
        border: Border.all(color: secondaryTextColor.withValues(alpha: 0.26)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.topic_outlined, size: 16, color: bodyTextColor),
              const SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                  color: bodyTextColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          for (final heading in headings)
            Padding(
              padding: EdgeInsets.only(
                left: (heading.level - 1).clamp(0, 5) * 10.0,
                top: 2,
                bottom: 2,
              ),
              child: Text(
                '• ${heading.title}',
                style: TextStyle(
                  color: secondaryTextColor,
                  height: 1.45,
                  fontSize: 13,
                  fontWeight: heading.level <= 2
                      ? FontWeight.w700
                      : FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<DiaryContent> _resolveShareContentDiagrams(
    DiaryContent content, {
    required String traceId,
  }) async {
    final stopwatch = Stopwatch()..start();
    _shareTrace(
      traceId,
      'resolve diagrams start: ${_debugContentSummary(content)}',
    );
    var hasChange = false;
    final resolvedBlocks = <DiaryContentBlock>[];
    final imagePaths = <String>{};
    final plainTextParts = <String>[];

    for (var i = 0; i < content.blocks.length; i++) {
      final block = content.blocks[i];
      final rawText = block.text;
      if (rawText != null) {
        final markdownSource = DiaryRichText.toMarkdownSource(rawText);
        final hasDiagramFence = MarkdownDiagramResolver.hasDiagramFence(
          markdownSource,
        );
        final lines = markdownSource.split('\n');
        final lineCount = lines.length;
        final maxLineLength = lines.fold<int>(
          0,
          (max, line) => line.length > max ? line.length : max,
        );
        _shareTrace(
          traceId,
          'resolve block[$i] text chars=${rawText.length}, lines=$lineCount, maxLine=$maxLineLength, hasDiagramFence=$hasDiagramFence',
        );
        final resolvedMarkdown = await (() async {
          try {
            return await MarkdownDiagramResolver.resolveMarkdown(
              markdownSource,
              logger: (message) => _shareTrace(traceId, message),
            );
          } catch (error, stackTrace) {
            _shareTraceError(
              traceId,
              'resolve block[$i] diagrams',
              error,
              stackTrace,
            );
            rethrow;
          }
        })();
        if (resolvedMarkdown != markdownSource) {
          hasChange = true;
          _shareTrace(
            traceId,
            'resolve block[$i] changed: before=${markdownSource.length}, after=${resolvedMarkdown.length}',
          );
        }
        resolvedBlocks.add(DiaryContentBlock.text(resolvedMarkdown));
        final plain = DiaryRichText.toPlainText(resolvedMarkdown).trim();
        if (plain.isNotEmpty) {
          plainTextParts.add(plain);
        }
        continue;
      }

      final path = block.imagePath;
      if (path == null || path.trim().isEmpty) continue;
      final normalizedPath = path.trim();
      _shareTrace(traceId, 'resolve block[$i] image path=$normalizedPath');
      resolvedBlocks.add(DiaryContentBlock.image(normalizedPath));
      imagePaths.add(normalizedPath);
    }

    stopwatch.stop();
    if (!hasChange) {
      _shareTrace(
        traceId,
        'resolve diagrams done(no change) in ${stopwatch.elapsedMilliseconds}ms',
      );
      return content;
    }
    final resolved = DiaryContent(
      text: plainTextParts.join('\n'),
      imagePaths: imagePaths.toList(growable: false),
      blocks: resolvedBlocks,
    );
    _shareTrace(
      traceId,
      'resolve diagrams done(changed) in ${stopwatch.elapsedMilliseconds}ms: ${_debugContentSummary(resolved)}',
    );
    return resolved;
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
    final media = MediaQuery.of(context);
    final targetPhysicalWidth = media.size.width * media.devicePixelRatio;
    final renderPixelRatio = (targetPhysicalWidth / previewRenderWidth).clamp(
      1.0,
      4.0,
    );
    _shareTrace(
      traceId,
      'open share sheet and start pre-render, previewRenderWidth=${previewRenderWidth.toStringAsFixed(1)}, renderPixelRatio=${renderPixelRatio.toStringAsFixed(3)}, content=${_debugContentSummary(content)}',
    );
    final renderFuture = _resolveShareContentDiagrams(content, traceId: traceId)
        .then(
          (resolvedContent) => _renderSharePosterPng(
            diary,
            resolvedContent,
            traceId: traceId,
            stage: 'sheet_preview_render',
            posterWidth: previewRenderWidth,
            pixelRatio: renderPixelRatio,
          ),
        )
        .then((bytes) {
          _shareTrace(traceId, 'pre-render done, bytes=${bytes.length}');
          return bytes;
        })
        .catchError((error, stackTrace) {
          _shareTraceError(traceId, 'pre-render', error, stackTrace);
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
                                          ? l10n.shareSaving
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
    final l10n = AppLocalizations.of(context);
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
                l10n.shareRenderingImage,
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
                errorText ?? l10n.shareRenderImageFailed,
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
          foregroundColor: const Color(0xFF0F1B31),
          disabledBackgroundColor: const Color(0xFFF0F1F4),
          disabledForegroundColor: const Color(0xFFB8BDC8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFFD6DAE3), width: 1.2),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w800,
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
    final l10n = AppLocalizations.of(context);
    final totalStopwatch = Stopwatch()..start();
    try {
      _shareTrace(traceId, 'save start');
      _showShareStatusToast(message: l10n.shareSavingToGallery);

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
      _showShareStatusToast(message: l10n.shareSavedToGallery);
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
          message: l10n.shareSavePermissionRequired,
          isError: true,
        );
        return;
      }
      _showShareStatusToast(
        message: l10n.shareFailed(e.toString()),
        isError: true,
      );
    }
  }

  void _showShareStatusToast({
    required String message,
    bool isError = false,
    Color? backgroundColor,
    IconData? icon,
    Duration duration = const Duration(seconds: 2),
  }) {
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
                        color:
                            backgroundColor ??
                            (isError
                                ? const Color(0xFFD04444)
                                : const Color(0xFF1E7A46)),
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
                            icon ??
                                (isError
                                    ? Icons.error_outline_rounded
                                    : Icons.check_circle_outline_rounded),
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
      Future<void>.delayed(duration, () {
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
    double pixelRatio = 2.0,
  }) async {
    final stopwatch = Stopwatch()..start();
    if (traceId != null) {
      _shareTrace(
        traceId,
        '$stage start (pixelRatio=${pixelRatio.toStringAsFixed(3)}, posterWidth=${posterWidth.toStringAsFixed(1)}), ${_debugContentSummary(content)}',
      );
    }
    try {
      Future<(Uint8List bytes, (int width, int height)? dims)> captureAttempt({
        required double attemptWidth,
        required double attemptPixelRatio,
        required String label,
      }) async {
        final buildStopwatch = Stopwatch()..start();
        final posterWidget = _buildSharePoster(
          diary,
          content,
          width: attemptWidth,
        );
        buildStopwatch.stop();
        if (traceId != null) {
          _shareTrace(
            traceId,
            '$stage[$label] poster widget built in ${buildStopwatch.elapsedMilliseconds}ms (width=${attemptWidth.toStringAsFixed(1)}, pixelRatio=${attemptPixelRatio.toStringAsFixed(3)})',
          );
        }
        final bytes = await _screenshotController.captureFromLongWidget(
          InheritedTheme.captureAll(
            context,
            Material(color: const Color(0xFFFFFFFF), child: posterWidget),
          ),
          context: context,
          delay: const Duration(milliseconds: 20),
          pixelRatio: attemptPixelRatio,
        );
        return (bytes, _parsePngDimensions(bytes));
      }

      var result = await captureAttempt(
        attemptWidth: posterWidth,
        attemptPixelRatio: pixelRatio,
        label: 'base',
      );
      var bytes = result.$1;
      var dims = result.$2;
      final maxPngHeight = 65000;
      final hitHeightLimit = dims != null && dims.$2 >= maxPngHeight;
      if (hitHeightLimit) {
        final fallbackFactors = <double>[1.8, 2.4];
        for (final factor in fallbackFactors) {
          final fallbackWidth = posterWidth * factor;
          final fallbackPixelRatio = (pixelRatio / factor).clamp(
            1.0,
            pixelRatio,
          );
          if (traceId != null) {
            _shareTrace(
              traceId,
              '$stage base hit png-height-limit (${dims!.$1}x${dims.$2}), retry factor=$factor',
            );
          }
          result = await captureAttempt(
            attemptWidth: fallbackWidth,
            attemptPixelRatio: fallbackPixelRatio,
            label: 'fallback_x${factor.toStringAsFixed(1)}',
          );
          bytes = result.$1;
          dims = result.$2;
          final fallbackStillBad = dims != null && dims.$2 >= maxPngHeight;
          if (!fallbackStillBad) break;
        }
      }

      stopwatch.stop();
      if (traceId != null) {
        _shareTrace(
          traceId,
          '$stage done in ${stopwatch.elapsedMilliseconds}ms, bytes=${bytes.length}${dims == null ? '' : ', png=${dims.$1}x${dims.$2}'}',
        );
      }
      return bytes;
    } catch (e, stackTrace) {
      stopwatch.stop();
      if (traceId != null) {
        _shareTraceError(
          traceId,
          stage,
          e,
          stackTrace,
          elapsed: stopwatch.elapsed,
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

  (int width, int height)? _parsePngDimensions(Uint8List bytes) {
    if (bytes.length < 24) return null;
    if (!(bytes[0] == 0x89 &&
        bytes[1] == 0x50 &&
        bytes[2] == 0x4E &&
        bytes[3] == 0x47)) {
      return null;
    }
    final width =
        (bytes[16] << 24) | (bytes[17] << 16) | (bytes[18] << 8) | bytes[19];
    final height =
        (bytes[20] << 24) | (bytes[21] << 16) | (bytes[22] << 8) | bytes[23];
    if (width <= 0 || height <= 0) return null;
    return (width, height);
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

  MarkdownStyleSheet _buildMarkdownStyleSheet({
    required TextStyle baseStyle,
    required Color bodyTextColor,
    required Color secondaryTextColor,
    required bool isDark,
  }) {
    final baseSize = baseStyle.fontSize ?? 16;
    final codeBackground = isDark
        ? const Color(0x2BFFFFFF)
        : const Color(0x120F172A);
    final codeBorder = isDark
        ? const Color(0xFF38414F)
        : const Color(0xFFDCE3EE);
    final quoteBackground = isDark
        ? const Color(0x1FFFFFFF)
        : const Color(0x0F172A0A);
    final tableBorder = isDark
        ? const Color(0xFF38414F)
        : const Color(0xFFD8DFEA);
    return MarkdownStyleSheet(
      p: baseStyle.copyWith(color: bodyTextColor),
      pPadding: EdgeInsets.zero,
      blockSpacing: 12,
      h1: baseStyle.copyWith(
        color: bodyTextColor,
        fontSize: baseSize + 10,
        height: 1.28,
        fontWeight: FontWeight.w800,
      ),
      h2: baseStyle.copyWith(
        color: bodyTextColor,
        fontSize: baseSize + 7,
        height: 1.3,
        fontWeight: FontWeight.w800,
      ),
      h3: baseStyle.copyWith(
        color: bodyTextColor,
        fontSize: baseSize + 4,
        height: 1.34,
        fontWeight: FontWeight.w700,
      ),
      h4: baseStyle.copyWith(
        color: bodyTextColor,
        fontSize: baseSize + 2,
        height: 1.38,
        fontWeight: FontWeight.w700,
      ),
      h5: baseStyle.copyWith(
        color: bodyTextColor,
        fontSize: baseSize + 1,
        height: 1.4,
        fontWeight: FontWeight.w700,
      ),
      h6: baseStyle.copyWith(
        color: bodyTextColor,
        fontSize: baseSize,
        height: 1.42,
        fontWeight: FontWeight.w700,
      ),
      strong: baseStyle.copyWith(
        color: bodyTextColor,
        fontWeight: FontWeight.w800,
      ),
      em: baseStyle.copyWith(color: bodyTextColor, fontStyle: FontStyle.italic),
      del: baseStyle.copyWith(
        color: bodyTextColor,
        decoration: TextDecoration.lineThrough,
        decorationThickness: 2,
      ),
      code: baseStyle.copyWith(
        color: bodyTextColor,
        fontFamily: 'monospace',
        fontSize: baseSize * 0.92,
      ),
      codeblockPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      codeblockDecoration: BoxDecoration(
        color: codeBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: codeBorder, width: 1),
      ),
      blockquote: baseStyle.copyWith(color: secondaryTextColor, height: 1.68),
      blockquotePadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      blockquoteDecoration: BoxDecoration(
        color: quoteBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(
            color: secondaryTextColor.withValues(alpha: 0.45),
            width: 3,
          ),
        ),
      ),
      listBullet: baseStyle.copyWith(
        color: bodyTextColor,
        fontWeight: FontWeight.w700,
      ),
      listBulletPadding: const EdgeInsets.only(right: 6),
      tableHead: baseStyle.copyWith(
        color: bodyTextColor,
        fontWeight: FontWeight.w700,
      ),
      tableBody: baseStyle.copyWith(color: bodyTextColor, height: 1.62),
      tableHeadAlign: TextAlign.left,
      tableBorder: TableBorder.all(color: tableBorder, width: 0.8),
      tableCellsPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      tableScrollbarThumbVisibility: true,
      horizontalRuleDecoration: BoxDecoration(
        border: Border(top: BorderSide(color: tableBorder, width: 1)),
      ),
      a: baseStyle.copyWith(
        color: isDark ? const Color(0xFF9EC0FF) : const Color(0xFF2353A3),
        decoration: TextDecoration.underline,
      ),
    );
  }

  Widget _buildImageFallback(Color color, {double height = 140}) {
    return Container(
      width: double.infinity,
      height: height,
      alignment: Alignment.center,
      child: Icon(Icons.broken_image_outlined, color: color, size: 20),
    );
  }

  Widget _buildSmartImage({
    required String source,
    required BoxFit fit,
    required Color fallbackColor,
    required BorderRadius borderRadius,
    double maxHeight = 420,
    double? width,
    double? height,
  }) {
    final trimmed = source.trim();
    if (trimmed.isEmpty) return _buildImageFallback(fallbackColor);

    final uri = Uri.tryParse(trimmed);
    final hasScheme = uri != null && uri.scheme.isNotEmpty;
    final isRemote =
        uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
    final isFileUri = uri != null && uri.scheme == 'file';
    final lower = trimmed.toLowerCase();
    final isSvgByPath = lower.endsWith('.svg');
    final isSvgDataUri = lower.startsWith('data:image/svg+xml');
    final isSvg = isSvgByPath || isSvgDataUri;

    final localPath = isFileUri
        ? uri.toFilePath()
        : (hasScheme ? uri.path : trimmed);
    Widget imageWidget;
    if (isSvg) {
      if (isSvgDataUri) {
        try {
          final data = UriData.parse(trimmed);
          final bytes = data.contentAsBytes();
          imageWidget = SvgPicture.memory(
            bytes,
            width: width ?? double.infinity,
            height: height,
            fit: fit,
            placeholderBuilder: (_) => _buildImageFallback(fallbackColor),
          );
        } catch (_) {
          imageWidget = _buildImageFallback(fallbackColor);
        }
      } else if (isRemote) {
        imageWidget = SvgPicture.network(
          trimmed,
          width: width ?? double.infinity,
          height: height,
          fit: fit,
          placeholderBuilder: (_) => _buildImageFallback(fallbackColor),
        );
      } else {
        imageWidget = SvgPicture.file(
          File(localPath),
          width: width ?? double.infinity,
          height: height,
          fit: fit,
          placeholderBuilder: (_) => _buildImageFallback(fallbackColor),
        );
      }
    } else {
      imageWidget = isRemote
          ? Image.network(
              trimmed,
              width: width ?? double.infinity,
              height: height,
              fit: fit,
              errorBuilder: (context, error, stackTrace) =>
                  _buildImageFallback(fallbackColor),
            )
          : Image.file(
              File(localPath),
              width: width ?? double.infinity,
              height: height,
              fit: fit,
              errorBuilder: (context, error, stackTrace) =>
                  _buildImageFallback(fallbackColor),
            );
    }

    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxHeight),
          child: Container(
            width: width ?? double.infinity,
            color: Colors.transparent,
            alignment: Alignment.topCenter,
            child: imageWidget,
          ),
        ),
      ),
    );
  }

  Widget _buildMarkdownTextBlock({
    required String markdownSource,
    required TextStyle baseStyle,
    required Color bodyTextColor,
    required Color secondaryTextColor,
    required bool selectable,
    required bool openLinkExternally,
    bool resolveDiagramsAsync = true,
    bool enableInteractiveMedia = true,
    bool enableExpandableDetails = true,
  }) {
    final normalizedMarkdown = MarkdownMathSupport.normalizeMathSource(
      _normalizeExtendedMarkdownSource(markdownSource),
    ).trim();
    if (normalizedMarkdown.isEmpty) {
      return const SizedBox.shrink();
    }
    final topicDirective = _consumeTopicDirective(normalizedMarkdown);
    final markdownForRender = topicDirective.markdown.trim();
    if (markdownForRender.isEmpty) return const SizedBox.shrink();
    final topicHeadings = topicDirective.showTopic
        ? _extractMarkdownHeadings(markdownForRender)
        : const <_MarkdownHeading>[];
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final markdownStyle = _buildMarkdownStyleSheet(
      baseStyle: baseStyle,
      bodyTextColor: bodyTextColor,
      secondaryTextColor: secondaryTextColor,
      isDark: isDark,
    );
    final markdownBuilders = MarkdownMathSupport.builders(
      baseStyle: baseStyle,
      bodyTextColor: bodyTextColor,
      secondaryTextColor: secondaryTextColor,
    );
    Widget buildBody(String value) {
      final chunks = MarkdownHtmlEmbedParser.parse(value);
      if (chunks.isEmpty) {
        return const SizedBox.shrink();
      }

      Widget buildMarkdownChunk(String chunkSource) {
        return MarkdownBody(
          data: chunkSource,
          selectable: selectable,
          softLineBreak: true,
          styleSheet: markdownStyle,
          inlineSyntaxes: MarkdownMathSupport.inlineSyntaxes,
          builders: markdownBuilders,
          onTapLink: openLinkExternally
              ? (text, href, title) {
                  final hint = title.trim();
                  if (hint.isNotEmpty) {
                    _showShareStatusToast(
                      message: hint,
                      icon: Icons.info_outline_rounded,
                      backgroundColor: const Color(0xFF2D3544),
                    );
                  }
                  final link = href?.trim() ?? '';
                  if (link.isEmpty) return;
                  final uri = Uri.tryParse(link);
                  if (uri == null) return;
                  unawaited(
                    launchUrl(uri, mode: LaunchMode.externalApplication),
                  );
                }
              : null,
          sizedImageBuilder: (config) => _buildSmartImage(
            source: config.uri.toString(),
            fit: BoxFit.contain,
            fallbackColor: secondaryTextColor,
            borderRadius: BorderRadius.circular(8),
            maxHeight: 420,
            width: config.width,
            height: config.height,
          ),
        );
      }

      final widgets = <Widget>[];
      if (topicDirective.showTopic && topicHeadings.isNotEmpty) {
        widgets.add(
          _buildTopicWidget(
            headings: topicHeadings,
            bodyTextColor: bodyTextColor,
            secondaryTextColor: secondaryTextColor,
          ),
        );
      }
      for (final chunk in chunks) {
        if (chunk.isMarkdown) {
          final text = chunk.content.trim();
          if (text.isEmpty) continue;
          widgets.add(buildMarkdownChunk(text));
          continue;
        }
        if (chunk.isDetails) {
          widgets.add(
            _buildDetailsChunk(
              summary: chunk.title ?? 'Details',
              body: chunk.content,
              bodyTextColor: bodyTextColor,
              secondaryTextColor: secondaryTextColor,
              baseStyle: baseStyle,
              selectable: selectable,
              openLinkExternally: openLinkExternally,
              enableInteractiveMedia: enableInteractiveMedia,
              enableExpandableDetails: enableExpandableDetails,
            ),
          );
          continue;
        }
        if (chunk.isVideo || chunk.isAudio) {
          widgets.add(
            enableInteractiveMedia
                ? _buildMediaChunk(
                    source: chunk.content,
                    isVideo: chunk.isVideo,
                    bodyTextColor: bodyTextColor,
                    secondaryTextColor: secondaryTextColor,
                  )
                : _buildStaticMediaChunk(
                    source: chunk.content,
                    isVideo: chunk.isVideo,
                    bodyTextColor: bodyTextColor,
                    secondaryTextColor: secondaryTextColor,
                  ),
          );
          continue;
        }
      }
      if (widgets.isEmpty) return const SizedBox.shrink();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < widgets.length; i++) ...[
            widgets[i],
            if (i < widgets.length - 1) const SizedBox(height: 10),
          ],
        ],
      );
    }

    if (!resolveDiagramsAsync ||
        !MarkdownDiagramResolver.hasDiagramFence(markdownForRender)) {
      return buildBody(markdownForRender);
    }

    return FutureBuilder<String>(
      future: MarkdownDiagramResolver.resolveMarkdown(
        markdownForRender,
        logger: (message) => debugPrint('[MarkdownDiagram] $message'),
      ),
      initialData: markdownForRender,
      builder: (context, snapshot) {
        final resolved = snapshot.data?.trim();
        if (resolved == null || resolved.isEmpty) {
          return buildBody(markdownForRender);
        }
        return buildBody(resolved);
      },
    );
  }

  Widget _buildMediaChunk({
    required String source,
    required bool isVideo,
    required Color bodyTextColor,
    required Color secondaryTextColor,
  }) {
    final l10n = AppLocalizations.of(context);
    final title = isVideo ? l10n.htmlVideo : l10n.htmlAudio;
    return HtmlMediaPlayer(
      source: source,
      isVideo: isVideo,
      title: title,
      openLabel: l10n.htmlOpen,
      bodyTextColor: bodyTextColor,
      secondaryTextColor: secondaryTextColor,
    );
  }

  Widget _buildStaticMediaChunk({
    required String source,
    required bool isVideo,
    required Color bodyTextColor,
    required Color secondaryTextColor,
  }) {
    final l10n = AppLocalizations.of(context);
    final title = isVideo ? l10n.htmlVideo : l10n.htmlAudio;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: secondaryTextColor.withValues(alpha: 0.08),
        border: Border.all(color: secondaryTextColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(
            isVideo ? Icons.ondemand_video_rounded : Icons.headphones_rounded,
            color: bodyTextColor,
            size: 19,
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: bodyTextColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                Text(
                  source,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 12,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsChunk({
    required String summary,
    required String body,
    required Color bodyTextColor,
    required Color secondaryTextColor,
    required TextStyle baseStyle,
    required bool selectable,
    required bool openLinkExternally,
    required bool enableInteractiveMedia,
    required bool enableExpandableDetails,
  }) {
    final l10n = AppLocalizations.of(context);
    final title = summary.trim().isEmpty ? l10n.htmlDetails : summary.trim();
    if (!enableExpandableDetails) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: secondaryTextColor.withValues(alpha: 0.07),
          border: Border.all(color: secondaryTextColor.withValues(alpha: 0.26)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: bodyTextColor,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            _buildMarkdownTextBlock(
              markdownSource: body,
              baseStyle: baseStyle,
              bodyTextColor: bodyTextColor,
              secondaryTextColor: secondaryTextColor,
              selectable: selectable,
              openLinkExternally: openLinkExternally,
              enableInteractiveMedia: enableInteractiveMedia,
              enableExpandableDetails: false,
            ),
          ],
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: secondaryTextColor.withValues(alpha: 0.07),
        border: Border.all(color: secondaryTextColor.withValues(alpha: 0.26)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 10),
          childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          collapsedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          title: Text(
            title,
            style: TextStyle(
              color: bodyTextColor,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          children: [
            _buildMarkdownTextBlock(
              markdownSource: body,
              baseStyle: baseStyle,
              bodyTextColor: bodyTextColor,
              secondaryTextColor: secondaryTextColor,
              selectable: selectable,
              openLinkExternally: openLinkExternally,
              enableInteractiveMedia: enableInteractiveMedia,
              enableExpandableDetails: true,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildShareContentWidgets(
    DiaryContent content,
    Color bodyTextColor,
    Color secondaryTextColor,
  ) {
    final widgets = <Widget>[];
    String? previousBlockType;
    final topicDirectiveBlockIndex = _detectTopicDirectiveBlockIndex(
      content.blocks,
    );
    final topicHeadings = topicDirectiveBlockIndex == null
        ? const <_MarkdownHeading>[]
        : _extractTopicHeadingsFromBlocks(
            content.blocks,
            topicDirectiveBlockIndex: topicDirectiveBlockIndex,
          );
    if (topicDirectiveBlockIndex != null && topicHeadings.isNotEmpty) {
      widgets.add(
        _buildTopicWidget(
          headings: topicHeadings,
          bodyTextColor: bodyTextColor,
          secondaryTextColor: secondaryTextColor,
        ),
      );
      previousBlockType = 'text';
    }

    for (var index = 0; index < content.blocks.length; index++) {
      final block = content.blocks[index];
      final text = block.text;
      if (text != null) {
        final raw = text.trim();
        if (raw.isEmpty) continue;
        var markdownSource = DiaryRichText.toMarkdownSource(raw).trim();
        if (index == topicDirectiveBlockIndex) {
          markdownSource = _consumeTopicDirective(
            markdownSource,
          ).markdown.trim();
        }
        if (markdownSource.isEmpty) continue;

        if (previousBlockType != null) {
          widgets.add(const SizedBox(height: 22));
        }

        widgets.add(
          _buildMarkdownTextBlock(
            markdownSource: markdownSource,
            baseStyle: TextStyle(
              fontSize: 17.6,
              height: 1.78,
              letterSpacing: 0.1,
              color: bodyTextColor,
            ),
            bodyTextColor: bodyTextColor,
            secondaryTextColor: secondaryTextColor,
            selectable: false,
            openLinkExternally: false,
            resolveDiagramsAsync: false,
            enableInteractiveMedia: false,
            enableExpandableDetails: false,
          ),
        );
        previousBlockType = 'text';
        continue;
      }

      final path = block.imagePath;
      if (path == null || path.trim().isEmpty) continue;

      if (previousBlockType != null) {
        widgets.add(SizedBox(height: previousBlockType == 'image' ? 14 : 22));
      }

      widgets.add(
        _buildSmartImage(
          source: path,
          fit: BoxFit.contain,
          fallbackColor: secondaryTextColor,
          borderRadius: BorderRadius.circular(8),
          maxHeight: 420,
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
    final topicDirectiveBlockIndex = _detectTopicDirectiveBlockIndex(blocks);
    final topicHeadings = topicDirectiveBlockIndex == null
        ? const <_MarkdownHeading>[]
        : _extractTopicHeadingsFromBlocks(
            blocks,
            topicDirectiveBlockIndex: topicDirectiveBlockIndex,
          );
    if (query.isEmpty &&
        topicDirectiveBlockIndex != null &&
        topicHeadings.isNotEmpty) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildTopicWidget(
            headings: topicHeadings,
            bodyTextColor: bodyTextColor,
            secondaryTextColor: bodyTextColor.withValues(alpha: 0.8),
          ),
        ),
      );
    }

    for (var index = 0; index < blocks.length; index++) {
      final block = blocks[index];
      final text = block.text;
      if (text != null) {
        final raw = text.trim();
        if (raw.isEmpty) continue;
        var markdownSource = DiaryRichText.toMarkdownSource(raw).trim();
        if (index == topicDirectiveBlockIndex) {
          markdownSource = _consumeTopicDirective(
            markdownSource,
          ).markdown.trim();
        }
        if (markdownSource.isEmpty) continue;
        final plain = DiaryRichText.toPlainText(markdownSource).trim();
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
                ? _buildMarkdownTextBlock(
                    markdownSource: markdownSource,
                    baseStyle: textStyle,
                    bodyTextColor: bodyTextColor,
                    secondaryTextColor: bodyTextColor.withValues(alpha: 0.8),
                    selectable: true,
                    openLinkExternally: true,
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
      if (path == null || path.trim().isEmpty) continue;
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: _buildSmartImage(
            source: path,
            fit: BoxFit.contain,
            fallbackColor: imageFallbackColor,
            borderRadius: BorderRadius.circular(14),
            maxHeight: 420,
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
    final viewportWidth = MediaQuery.sizeOf(context).width;
    final isCompactWidth = viewportWidth < 900;
    final pageHorizontalPadding = isCompactWidth ? 3.0 : 16.0;
    final cardHorizontalPadding = isCompactWidth ? 12.0 : 18.0;
    final cardVerticalPadding = isCompactWidth ? 14.0 : 18.0;

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
        body: Scrollbar(
          controller: _contentScrollController,
          thumbVisibility: true,
          interactive: true,
          thickness: 4,
          radius: const Radius.circular(4),
          child: SingleChildScrollView(
            controller: _contentScrollController,
            padding: EdgeInsets.fromLTRB(
              pageHorizontalPadding,
              12,
              pageHorizontalPadding,
              22 + bottomInset,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isCompactWidth ? viewportWidth : 860,
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(
                    cardHorizontalPadding,
                    cardVerticalPadding,
                    cardHorizontalPadding,
                    cardVerticalPadding,
                  ),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(14),
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
      ),
    );
  }
}

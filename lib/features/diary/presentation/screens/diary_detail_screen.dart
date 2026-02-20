import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/i18n/app_i18n.dart';
import '../../../../core/ui/edge_swipe_back.dart';
import '../../data/entities/vector_diary.dart';
import '../../domain/diary_content_codec.dart';
import '../controllers/timeline_controller.dart';
import '../widgets/diary_input_sheet.dart';

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
  double _scrollProgress = 0;
  bool _showScrollProgress = false;
  bool _isDraggingScrollThumb = false;

  @override
  void initState() {
    super.initState();
    _contentScrollController.addListener(_handleContentScroll);
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 760),
    );
    if ((widget.highlightQuery ?? '').trim().isNotEmpty) {
      _pulseController.repeat(reverse: true);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _handleContentScroll();
    });
  }

  @override
  void dispose() {
    _contentScrollController.removeListener(_handleContentScroll);
    _contentScrollController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _handleContentScroll() {
    if (!_contentScrollController.hasClients) return;
    final position = _contentScrollController.position;
    final maxExtent = position.maxScrollExtent;
    final nextShow = maxExtent > 8;
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

  void _jumpToProgress(double progress) {
    if (!_contentScrollController.hasClients) return;
    final clamped = progress.clamp(0.0, 1.0);
    final position = _contentScrollController.position;
    final targetOffset = position.maxScrollExtent * clamped;
    _contentScrollController.jumpTo(
      targetOffset.clamp(position.minScrollExtent, position.maxScrollExtent),
    );
  }

  Future<void> _shareDiary() async {
    final l10n = AppLocalizations.of(context);
    final diary = ref.read(timelineProvider.notifier).getDiary(widget.diaryId);
    if (diary == null) return;
    final content = DiaryContentCodec.decode(diary.rawText);

    try {
      final image = await _screenshotController.capture();
      if (image != null) {
        await Share.shareXFiles([
          XFile.fromData(image, name: 'diary_${diary.id}.png'),
        ], text: content.text);
      } else {
        await Share.share(content.text);
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.shareFailed(e.toString()))),
      );
    }
  }

  void _editDiary(VectorDiary diary) {
    final l10n = AppLocalizations.of(context);
    showDiaryInputSheet(
      context,
      title: l10n.editEntry,
      initialRawText: diary.rawText,
      onSubmit: (text) {
        ref
            .read(timelineProvider.notifier)
            .updateDiary(widget.diaryId, rawText: text);
      },
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

  List<Widget> _buildOrderedContentWidgets({
    required List<DiaryContentBlock> blocks,
    required String query,
    required ColorScheme scheme,
  }) {
    final widgets = <Widget>[];

    for (var i = 0; i < blocks.length; i++) {
      final block = blocks[i];
      final text = block.text;
      if (text != null) {
        final normalized = text.trim();
        if (normalized.isEmpty) continue;
        final textStyle = TextStyle(
          fontSize: 16,
          height: 1.7,
          fontWeight: FontWeight.w400,
          color: scheme.onSurface,
        );
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: RichText(
              text: TextSpan(
                children: _highlightSpans(
                  source: normalized,
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
              color: scheme.surfaceContainerHighest.withValues(alpha: 0.2),
              alignment: Alignment.center,
              child: Image.file(
                File(path),
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 180,
                  alignment: Alignment.center,
                  child: const Icon(Icons.broken_image_outlined),
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
          style: TextStyle(fontSize: 16, height: 1.6, color: scheme.onSurface),
        ),
      );
    }
    return widgets;
  }

  Widget _buildScrollRail(ColorScheme scheme) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const railWidth = 28.0;
        const trackWidth = 4.0;
        const thumbWidth = 8.0;
        const thumbHeight = 60.0;
        const trackRightInset = 3.0;
        const thumbRightInset = 1.0;
        final travel = math.max(0.0, constraints.maxHeight - thumbHeight);
        final thumbTop = travel * _scrollProgress;
        final displayProgress = (_scrollProgress * 100).clamp(0.0, 100.0);

        return SizedBox(
          width: railWidth,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTapDown: (details) {
              final next = travel <= 0
                  ? 0.0
                  : ((details.localPosition.dy - (thumbHeight / 2)) / travel)
                        .clamp(0.0, 1.0);
              _jumpToProgress(next);
              setState(() {
                _isDraggingScrollThumb = true;
              });
            },
            onTapUp: (_) {
              if (!_isDraggingScrollThumb) return;
              setState(() {
                _isDraggingScrollThumb = false;
              });
            },
            onTapCancel: () {
              if (!_isDraggingScrollThumb) return;
              setState(() {
                _isDraggingScrollThumb = false;
              });
            },
            onVerticalDragStart: (_) {
              if (_isDraggingScrollThumb) return;
              setState(() {
                _isDraggingScrollThumb = true;
              });
            },
            onVerticalDragUpdate: (details) {
              final next = travel <= 0
                  ? 0.0
                  : ((details.localPosition.dy - (thumbHeight / 2)) / travel)
                        .clamp(0.0, 1.0);
              _jumpToProgress(next);
            },
            onVerticalDragEnd: (_) {
              if (!_isDraggingScrollThumb) return;
              setState(() {
                _isDraggingScrollThumb = false;
              });
            },
            onVerticalDragCancel: () {
              if (!_isDraggingScrollThumb) return;
              setState(() {
                _isDraggingScrollThumb = false;
              });
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: trackRightInset,
                  child: Container(
                    width: trackWidth,
                    decoration: BoxDecoration(
                      color: scheme.outline.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
                Positioned(
                  top: thumbTop,
                  right: thumbRightInset,
                  child: Container(
                    width: thumbWidth,
                    height: thumbHeight,
                    decoration: BoxDecoration(
                      color: scheme.primary.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
                if (_isDraggingScrollThumb)
                  Positioned(
                    top: (thumbTop - 4).clamp(0.0, travel),
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: scheme.surface,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: scheme.outline.withValues(alpha: 0.25),
                        ),
                      ),
                      child: Text(
                        '${displayProgress.toStringAsFixed(1)}%',
                        style: TextStyle(
                          fontSize: 11,
                          color: scheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
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
    final orderedContentWidgets = _buildOrderedContentWidgets(
      blocks: content.blocks,
      query: query,
      scheme: Theme.of(context).colorScheme,
    );
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return EdgeSwipeBack(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          title: Text(l10n.entryDetails),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => _editDiary(diary),
            ),
            IconButton(icon: const Icon(Icons.share), onPressed: _shareDiary),
          ],
        ),
        body: Screenshot(
          controller: _screenshotController,
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: _contentScrollController,
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + bottomInset),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        formatDateTimeLong(context, date),
                        style: TextStyle(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSecondaryContainer,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (showHighlight)
                      ScaleTransition(
                        scale: Tween<double>(begin: 1.0, end: 1.06).animate(
                          CurvedAnimation(
                            parent: _pulseController,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
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
                            l10n.searchMatchHits(widget.matchType ?? l10n.exactMatch, offsets.length),
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ...orderedContentWidgets,
                    if (diary.aiSummary != null) ...[
                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            l10n.aiSummary,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primaryContainer.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          diary.aiSummary!,
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                    if (diary.aiTags != null) ...[
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: diary.aiTags!
                            .split(',')
                            .map(
                              (tag) => Chip(
                                label: Text(tag.trim()),
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerHighest,
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ],
                ),
              ),
              if (_showScrollProgress)
                Positioned(
                  right: 0,
                  top: 12,
                  bottom: 12 + bottomInset,
                  child: _buildScrollRail(Theme.of(context).colorScheme),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

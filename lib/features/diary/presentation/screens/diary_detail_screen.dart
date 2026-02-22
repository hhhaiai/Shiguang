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
    _contentScrollController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _shareDiary() async {
    final diary = ref.read(timelineProvider.notifier).getDiary(widget.diaryId);
    if (diary == null) return;
    final content = DiaryContentCodec.decode(diary.rawText);
    await _showSharePosterSheet(diary, content);
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

  Future<void> _showSharePosterSheet(
    VectorDiary diary,
    DiaryContent content,
  ) async {
    final l10n = AppLocalizations.of(context);
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: const Color(0xFFECECF2),
      builder: (sheetContext) {
        final media = MediaQuery.of(sheetContext);
        final previewHeight = media.size.height * (2 / 3);
        final previewWidth = (media.size.width - 42).clamp(260.0, 390.0);
        return SafeArea(
          child: SizedBox(
            height: media.size.height * 0.9,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 14),
              child: Column(
                children: [
                  SizedBox(
                    height: previewHeight,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: previewWidth.toDouble(),
                          maxHeight: previewHeight,
                        ),
                        child: SingleChildScrollView(
                          child: _buildSharePoster(
                            diary,
                            content,
                            width: previewWidth.toDouble(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildSheetActionButton(
                            icon: Icons.download_outlined,
                            label: l10n.save,
                            onPressed: () => _saveSharePoster(diary, content),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildSheetActionButton(
                            icon: Icons.ios_share_outlined,
                            label: l10n.shareAction,
                            onPressed: () {
                              Navigator.pop(sheetContext);
                              _exportSharePoster(diary, content);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSheetActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 52,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xFFF6F6F8),
          foregroundColor: const Color(0xFF7A808C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFFE3E5EC)),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label),
      ),
    );
  }

  Future<void> _exportSharePoster(
    VectorDiary diary,
    DiaryContent content,
  ) async {
    final l10n = AppLocalizations.of(context);

    try {
      final image = await _renderSharePosterPng(diary, content);
      final file = await _writeSharePosterFile(image, diaryId: diary.id);
      await Share.shareXFiles([
        XFile(file.path, mimeType: 'image/png'),
      ], text: content.text);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.shareFailed(e.toString()))));
    }
  }

  Future<void> _saveSharePoster(VectorDiary diary, DiaryContent content) async {
    try {
      final image = await _renderSharePosterPng(diary, content);
      final file = await _writeSharePosterFile(image, diaryId: diary.id);
      await Gal.putImage(file.path);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _posterI18n(
              zhHans: '已保存到系统相册',
              zhHant: '已保存到系統相簿',
              en: 'Saved to system gallery',
            ),
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.shareFailed(e.toString()))));
    }
  }

  Future<Uint8List> _renderSharePosterPng(
    VectorDiary diary,
    DiaryContent content,
  ) {
    return _screenshotController.captureFromLongWidget(
      InheritedTheme.captureAll(
        context,
        Material(
          color: const Color(0xFFFFFFFF),
          child: _buildSharePoster(diary, content),
        ),
      ),
      context: context,
      delay: const Duration(milliseconds: 20),
      pixelRatio: 3,
    );
  }

  Future<File> _writeSharePosterFile(
    Uint8List imageBytes, {
    required int diaryId,
  }) async {
    final rootDir = await getTemporaryDirectory();
    final file = File(
      '${rootDir.path}/shiguang_share_${diaryId}_${DateTime.now().millisecondsSinceEpoch}.png',
    );
    await file.writeAsBytes(imageBytes, flush: true);
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
    final text = content.text.trim();
    final safeText = text.isEmpty
        ? AppLocalizations.of(context).imageMemoryPlain
        : text;
    const cardSurface = Colors.white;
    const primaryText = Color(0xFF111214);
    const secondaryText = Color(0xFF3A404A);
    const bodyText = Color(0xFF252B34);
    const imageSurface = Colors.white;

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
          Text(
            safeText,
            style: TextStyle(
              fontSize: 17.6,
              height: 1.78,
              letterSpacing: 0.1,
              color: bodyText,
            ),
          ),
          if (content.imagePaths.isNotEmpty) ...[
            const SizedBox(height: 22),
            for (final path in content.imagePaths) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxHeight: 420),
                  color: imageSurface,
                  child: Image.file(
                    File(path),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => SizedBox(
                      height: 140,
                      child: Center(
                        child: Icon(
                          Icons.broken_image_outlined,
                          color: secondaryText,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (path != content.imagePaths.last) const SizedBox(height: 14),
            ],
          ],
          const SizedBox(height: 28),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image.asset(
                    'assets/branding/shiguang_app_x.png',
                    width: 14,
                    height: 14,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 6),
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
              color: imageFallbackColor,
              alignment: Alignment.center,
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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          title: Text(l10n.entryDetails),
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

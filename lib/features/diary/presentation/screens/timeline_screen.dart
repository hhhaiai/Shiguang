import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/i18n/app_i18n.dart';
import '../../../../core/ui/adaptive_navigation.dart';
import '../../../../core/ui/edge_swipe_back.dart';
import '../../../../core/ui/keyboard.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../../settings/data/settings_provider.dart';
import './ai_chat_screen.dart';
import '../controllers/timeline_controller.dart';
import '../../data/entities/vector_diary.dart';
import '../../data/ai/sensevoice_onnx_local_voice_ai.dart';
import '../../domain/diary_content_codec.dart';
import '../widgets/diary_input_sheet.dart';
import '../widgets/diary_rich_text.dart';

class TimelineScreen extends ConsumerStatefulWidget {
  const TimelineScreen({super.key});

  @override
  ConsumerState<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends ConsumerState<TimelineScreen> {
  static const Color _paperColor = Color(0xFFF8F8F8);
  static const Color _darkPaperColor = Color(0xFF151A22);

  bool _isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  Color _pageBackgroundColor(BuildContext context) =>
      _isDarkMode(context) ? _darkPaperColor : _paperColor;

  @override
  void initState() {
    super.initState();
    unawaited(_preloadLocalAsr());
  }

  Future<void> _preloadLocalAsr() async {
    final settings = ref.read(settingsProvider);
    if (settings.voiceRecognitionEngine != VoiceRecognitionEngine.localModel) {
      return;
    }

    final preloader = SenseVoiceOnnxLocalVoiceAI();
    try {
      await preloader.prepare().timeout(const Duration(seconds: 35));
      if (kDebugMode) {
        debugPrint('[ASR] preload ready');
      }
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[ASR] preload failed: $error');
      }
    } finally {
      preloader.dispose();
    }
  }

  void _openDiaryInput({bool startInVoiceMode = false}) {
    final l10n = AppLocalizations.of(context);
    showDiaryInputSheet(
      context,
      title: l10n.write,
      startInVoiceMode: startInVoiceMode,
      onSubmit: (text) {
        ref.read(timelineProvider.notifier).createDiary(rawText: text);
      },
    );
  }

  void _editDiaryFromTimeline(VectorDiary diary) {
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

  List<Widget> _buildTimelineItems(List<VectorDiary> diaries) {
    final l10n = AppLocalizations.of(context);
    final items = <Widget>[];
    for (var index = 0; index < diaries.length; index++) {
      final current = diaries[index];
      final currentDate = DateTime.fromMillisecondsSinceEpoch(
        current.updatedAt,
      );
      final previousDate = index == 0
          ? null
          : DateTime.fromMillisecondsSinceEpoch(diaries[index - 1].updatedAt);

      if (index == 0 || _isMonthChanged(previousDate!, currentDate)) {
        items.add(
          _TimelineDivider(
            icon: Icons.calendar_today_outlined,
            label: _formatMonthLabel(currentDate),
          ),
        );
      } else if (_isWeekChanged(previousDate, currentDate)) {
        final weekStart = _startOfWeek(currentDate);
        final weekEnd = weekStart.add(const Duration(days: 6));
        items.add(
          _TimelineDivider(
            icon: Icons.view_week_outlined,
            label:
                '${l10n.weekLabel} ${_formatDayLabel(weekStart)} - ${_formatDayLabel(weekEnd)}',
          ),
        );
      } else {
        final gapDays = _gapDays(previousDate, currentDate);
        if (gapDays >= 2) {
          items.add(
            _TimelineDivider(
              icon: Icons.more_horiz,
              label: l10n.dayGap(gapDays),
              subtle: true,
            ),
          );
        }
      }

      items.add(_buildDiaryDismissible(current));
    }

    return items;
  }

  Widget _buildDiaryDismissible(VectorDiary diary) {
    final l10n = AppLocalizations.of(context);
    return Dismissible(
      key: ValueKey('diary-${diary.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.red.shade500,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.delete_outline, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              l10n.delete,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      confirmDismiss: (_) async {
        return await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(l10n.deleteRecord),
                content: Text(l10n.thisRecordWillBeRemoved),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(l10n.cancel),
                  ),
                  FilledButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text(l10n.delete),
                  ),
                ],
              ),
            ) ??
            false;
      },
      onDismissed: (_) {
        ref.read(timelineProvider.notifier).deleteDiary(diary.id);
      },
      child: _DiaryCard(
        diary: diary,
        onTap: () => context.push('/diary/${diary.id}'),
        onEdit: () => _editDiaryFromTimeline(diary),
      ),
    );
  }

  bool _isMonthChanged(DateTime previous, DateTime current) {
    return previous.year != current.year || previous.month != current.month;
  }

  bool _isWeekChanged(DateTime previous, DateTime current) {
    final a = _startOfWeek(previous);
    final b = _startOfWeek(current);
    return a.year != b.year || a.month != b.month || a.day != b.day;
  }

  DateTime _startOfWeek(DateTime value) {
    final day = DateTime(value.year, value.month, value.day);
    return day.subtract(Duration(days: day.weekday - 1));
  }

  int _gapDays(DateTime previous, DateTime current) {
    final prev = DateTime(previous.year, previous.month, previous.day);
    final cur = DateTime(current.year, current.month, current.day);
    return math.max(0, prev.difference(cur).inDays.abs() - 1);
  }

  String _formatMonthLabel(DateTime date) {
    final localeTag = Localizations.localeOf(context).toLanguageTag();
    final localeKind = resolveAppLocaleKind(Localizations.localeOf(context));
    if (localeKind == AppLocaleKind.zhHans ||
        localeKind == AppLocaleKind.zhHant) {
      return '${date.year}年${date.month}月';
    }
    return DateFormat.yMMMM(localeTag).format(date);
  }

  String _formatDayLabel(DateTime date) {
    final localeTag = Localizations.localeOf(context).toLanguageTag();
    final localeKind = resolveAppLocaleKind(Localizations.localeOf(context));
    if (localeKind == AppLocaleKind.zhHans ||
        localeKind == AppLocaleKind.zhHant) {
      return '${date.month}/${date.day}';
    }
    return DateFormat.Md(localeTag).format(date);
  }

  PreferredSizeWidget _buildAppBar({
    required String username,
    required String fallbackUserName,
  }) {
    final l10n = AppLocalizations.of(context);
    final isCupertino = isCupertinoPlatform(Theme.of(context).platform);
    final title = username.isEmpty ? fallbackUserName : username;

    return AppBar(
      backgroundColor: _pageBackgroundColor(context),
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      centerTitle: isCupertino,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => context.push('/settings'),
          tooltip: l10n.settings,
        ),
      ],
    );
  }

  Widget _buildBody({
    required List<VectorDiary> diaries,
    required List<Widget> timelineItems,
  }) {
    if (diaries.isEmpty) {
      final l10n = AppLocalizations.of(context);
      final scheme = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.note_add_outlined,
              size: 56,
              color: scheme.onSurfaceVariant,
            ),
            const SizedBox(height: 14),
            Text(
              l10n.noMemoriesYet,
              style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 16),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.only(top: 4, bottom: 92),
      itemCount: timelineItems.length,
      itemBuilder: (context, index) => timelineItems[index],
    );
  }

  Widget _buildFloatingDock() {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final scheme = theme.colorScheme;
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1D232D) : scheme.surface,
            borderRadius: BorderRadius.circular(999),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.1),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: _openSearchPage,
                icon: const Icon(Icons.search),
                tooltip: l10n.search,
              ),
              IconButton(
                onPressed: () => _showAiChat(context),
                icon: const Icon(Icons.smart_toy_outlined),
                tooltip: l10n.aiChat,
              ),
              const SizedBox(width: 4),
              Material(
                color: scheme.primary,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: _openDiaryInput,
                  onLongPress: () => _openDiaryInput(startInVoiceMode: true),
                  child: SizedBox(
                    width: 44,
                    height: 44,
                    child: Icon(Icons.add, color: scheme.onPrimary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openSearchPage() {
    Navigator.of(context).push(
      adaptivePageRoute<void>(
        context,
        builder: (_) => const _TimelineSearchPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final diaries = ref.watch(timelineProvider);
    final timelineItems = _buildTimelineItems(diaries);
    final currentUser = ref.watch(authProvider.notifier).getCurrentUser();
    final fallbackUserName = l10n.user;

    return Scaffold(
      backgroundColor: _pageBackgroundColor(context),
      appBar: _buildAppBar(
        username: currentUser?.username ?? '',
        fallbackUserName: fallbackUserName,
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        child: IconTheme(
          data: IconThemeData(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          child: _buildBody(diaries: diaries, timelineItems: timelineItems),
        ),
      ),
      floatingActionButton: _buildFloatingDock(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _showAiChat(BuildContext context) {
    Navigator.of(context).push(
      adaptivePageRoute<void>(context, builder: (_) => const AiChatScreen()),
    );
  }
}

class _TimelineSearchPage extends ConsumerStatefulWidget {
  const _TimelineSearchPage();

  @override
  ConsumerState<_TimelineSearchPage> createState() =>
      _TimelineSearchPageState();
}

class _TimelineSearchPageState extends ConsumerState<_TimelineSearchPage> {
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();

  TimelineSearchResult _searchResult = const TimelineSearchResult();
  bool _loading = false;
  bool _hasSearched = false;
  bool _networkLoading = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onQueryChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      requestKeyboardFocus(context, _searchFocusNode);
    });
  }

  void _onQueryChanged() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    _searchController.removeListener(_onQueryChanged);
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  Future<void> _runSearch([String? input]) async {
    final query = (input ?? _searchController.text).trim();
    if (query.isEmpty) return;
    final networkSearchEnabled = ref.read(settingsProvider).enableNetworkSearch;

    _searchController
      ..text = query
      ..selection = TextSelection.collapsed(offset: query.length);

    setState(() {
      _loading = true;
      _hasSearched = true;
      _networkLoading = networkSearchEnabled;
    });

    Future<List<VectorDiary>>? networkFuture;
    if (networkSearchEnabled) {
      networkFuture = ref.read(timelineProvider.notifier).searchNetwork(query);
    }
    final result = await ref.read(timelineProvider.notifier).search(query);
    if (!mounted) return;

    setState(() {
      _searchResult = result;
      _loading = false;
    });
    ref.read(settingsProvider.notifier).addSearchHistory(query);
    if (networkFuture != null) {
      unawaited(_loadNetworkMatches(query, pending: networkFuture));
    }
  }

  Future<void> _loadNetworkMatches(
    String query, {
    Future<List<VectorDiary>>? pending,
  }) async {
    final networkMatches =
        await (pending ??
            ref.read(timelineProvider.notifier).searchNetwork(query));
    if (!mounted || _searchController.text.trim() != query) return;

    setState(() {
      _searchResult = TimelineSearchResult(
        exactMatches: _searchResult.exactMatches,
        fuzzyMatches: _searchResult.fuzzyMatches,
        fuzzyExcerpts: _searchResult.fuzzyExcerpts,
        networkMatches: networkMatches,
      );
      _networkLoading = false;
    });
  }

  void _clearSearchInput() {
    _searchController.clear();
    setState(() {
      _loading = false;
      _hasSearched = false;
      _networkLoading = false;
      _searchResult = const TimelineSearchResult();
    });
  }

  void _openAiChat() {
    Navigator.of(context).push(
      adaptivePageRoute<void>(context, builder: (_) => const AiChatScreen()),
    );
  }

  String _exactSectionTitle() {
    final localeKind = resolveAppLocaleKind(Localizations.localeOf(context));
    if (localeKind == AppLocaleKind.zhHans ||
        localeKind == AppLocaleKind.zhHant) {
      return '完整匹配（字符串匹配）';
    }
    return 'Exact Match (String Match)';
  }

  String _fuzzySectionTitle() {
    final localeKind = resolveAppLocaleKind(Localizations.localeOf(context));
    if (localeKind == AppLocaleKind.zhHans ||
        localeKind == AppLocaleKind.zhHant) {
      return '模糊匹配（向量匹配 / AI 理解）';
    }
    return 'Fuzzy Match (Vector / AI Understanding)';
  }

  String _networkSectionTitle() {
    final localeKind = resolveAppLocaleKind(Localizations.localeOf(context));
    if (localeKind == AppLocaleKind.zhHans ||
        localeKind == AppLocaleKind.zhHant) {
      return '网络匹配（网络爬虫 / 搜索 API）';
    }
    return 'Network Match (Crawler / Search API)';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final history = ref.watch(settingsProvider.select((s) => s.searchHistory));
    final networkSearchEnabled = ref.watch(
      settingsProvider.select((s) => s.enableNetworkSearch),
    );
    final subtleTextColor = isDark
        ? const Color(0xFFC7D0DD)
        : scheme.onSurfaceVariant;
    final query = _searchController.text.trim();
    final exactMatches = _searchResult.exactMatches;
    final fuzzyMatches = _searchResult.fuzzyMatches;
    final networkMatches = _searchResult.networkMatches;

    final content = Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: isDark ? scheme.surfaceContainerLow : scheme.surface,
              borderRadius: BorderRadius.circular(14),
            ),
            child: ListTile(
              leading: const Icon(Icons.smart_toy_outlined),
              title: Text(
                l10n.openAiChat,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: scheme.onSurface,
                ),
              ),
              subtitle: Text(
                l10n.validateAiQualityHint,
                style: TextStyle(color: subtleTextColor),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: _openAiChat,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: TextField(
            controller: _searchController,
            focusNode: _searchFocusNode,
            textInputAction: TextInputAction.search,
            autofocus: true,
            onTap: () => requestKeyboardFocus(context, _searchFocusNode),
            onSubmitted: (_) => unawaited(_runSearch()),
            decoration: InputDecoration(
              hintText: l10n.searchYourRecords,
              hintStyle: TextStyle(color: subtleTextColor),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: query.isEmpty
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: _clearSearchInput,
                    ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              isDense: true,
              filled: true,
              fillColor: isDark ? scheme.surfaceContainerLow : scheme.surface,
            ),
          ),
        ),
        Expanded(
          child: _loading
              ? const Center(child: CircularProgressIndicator())
              : _hasSearched
              ? ListView(
                  children: [
                    _SectionHeader(
                      title: _exactSectionTitle(),
                      count: exactMatches.length,
                      icon: Icons.check_circle_outline,
                    ),
                    if (exactMatches.isEmpty)
                      _EmptySection(message: l10n.noExactMatches)
                    else
                      _SearchResultWrap(
                        diaries: exactMatches,
                        query: query,
                        matchKind: _SearchMatchKind.exact,
                        matchTypeLabel: l10n.exactMatch,
                        matchTypeColor: scheme.primary,
                      ),
                    const Divider(height: 24, thickness: 1),
                    _SectionHeader(
                      title: _fuzzySectionTitle(),
                      count: fuzzyMatches.length,
                      icon: Icons.blur_on,
                    ),
                    if (fuzzyMatches.isEmpty)
                      _EmptySection(message: l10n.noFuzzyMatches)
                    else
                      _SearchResultWrap(
                        diaries: fuzzyMatches,
                        query: query,
                        matchKind: _SearchMatchKind.fuzzy,
                        matchTypeLabel: l10n.vectorMatch,
                        matchTypeColor: scheme.secondary,
                        fuzzyExcerpts: _searchResult.fuzzyExcerpts,
                      ),
                    const Divider(height: 24, thickness: 1),
                    _SectionHeader(
                      title: _networkSectionTitle(),
                      count: networkMatches.length,
                      icon: Icons.public,
                    ),
                    if (_networkLoading)
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
                        child: LinearProgressIndicator(minHeight: 2),
                      ),
                    if (networkMatches.isEmpty)
                      _EmptySection(
                        message: networkSearchEnabled
                            ? l10n.noNetworkMatches
                            : l10n.networkSearchIsOff,
                      )
                    else
                      _SearchResultWrap(
                        diaries: networkMatches,
                        query: query,
                        matchKind: _SearchMatchKind.network,
                        matchTypeLabel: l10n.networkMatch,
                        matchTypeColor: scheme.tertiary,
                      ),
                    const SizedBox(height: 16),
                  ],
                )
              : (history.isEmpty
                    ? Center(
                        child: Text(
                          l10n.noSearchHistory,
                          style: TextStyle(color: subtleTextColor),
                        ),
                      )
                    : ListView(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                        children: [
                          Row(
                            children: [
                              Text(
                                l10n.searchHistory,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  ref
                                      .read(settingsProvider.notifier)
                                      .clearSearchHistory();
                                },
                                child: Text(l10n.clear),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: history
                                .map(
                                  (item) => ActionChip(
                                    avatar: const Icon(Icons.history, size: 16),
                                    label: Text(item),
                                    onPressed: () =>
                                        unawaited(_runSearch(item)),
                                  ),
                                )
                                .toList(growable: false),
                          ),
                        ],
                      )),
        ),
      ],
    );

    return EdgeSwipeBack(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          centerTitle: true,
          title: Text(l10n.search),
        ),
        body: content,
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;

  const _SectionHeader({
    required this.title,
    required this.count,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(
            '$title · $count',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: scheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptySection extends StatelessWidget {
  final String message;

  const _EmptySection({required this.message});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final mutedTextColor = isDark
        ? const Color(0xFFC7D0DD)
        : scheme.onSurfaceVariant;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 2, 16, 10),
      child: Text(message, style: TextStyle(color: mutedTextColor)),
    );
  }
}

enum _SearchMatchKind { exact, fuzzy, network }

class _SearchResultWrap extends StatelessWidget {
  final List<VectorDiary> diaries;
  final String query;
  final _SearchMatchKind matchKind;
  final String matchTypeLabel;
  final Color matchTypeColor;
  final Map<int, String> fuzzyExcerpts;

  const _SearchResultWrap({
    required this.diaries,
    required this.query,
    required this.matchKind,
    required this.matchTypeLabel,
    required this.matchTypeColor,
    this.fuzzyExcerpts = const {},
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final spacing = 8.0;
          final columns = constraints.maxWidth >= 980
              ? 5
              : constraints.maxWidth >= 760
              ? 4
              : 3;
          final itemWidth =
              (constraints.maxWidth - (columns - 1) * spacing) / columns;

          return Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: diaries
                .map(
                  (diary) => SizedBox(
                    width: itemWidth,
                    child: _SearchResultCard(
                      diary: diary,
                      query: query,
                      matchKind: matchKind,
                      matchTypeLabel: matchTypeLabel,
                      matchTypeColor: matchTypeColor,
                      semanticExcerpt: fuzzyExcerpts[diary.id],
                    ),
                  ),
                )
                .toList(growable: false),
          );
        },
      ),
    );
  }
}

class _SearchResultCard extends StatelessWidget {
  static const String _networkUrlTagPrefix = 'network:url:';
  static const String _networkSourceTagPrefix = 'network:source:';
  static const String _networkTitleTagPrefix = 'network:title:';

  final VectorDiary diary;
  final String query;
  final _SearchMatchKind matchKind;
  final String matchTypeLabel;
  final Color matchTypeColor;
  final String? semanticExcerpt;

  const _SearchResultCard({
    required this.diary,
    required this.query,
    required this.matchKind,
    required this.matchTypeLabel,
    required this.matchTypeColor,
    this.semanticExcerpt,
  });

  int _countMatches(String source, String needle) {
    if (needle.isEmpty) return 0;
    final lowerSource = source.toLowerCase();
    final lowerNeedle = needle.toLowerCase();
    var count = 0;
    var start = 0;
    while (true) {
      final index = lowerSource.indexOf(lowerNeedle, start);
      if (index < 0) break;
      count += 1;
      start = index + lowerNeedle.length;
    }
    return count;
  }

  List<String> _buildHighlightTokens(String source) {
    final tokens = <String>[];
    final trimmed = source.trim();
    if (trimmed.runes.length >= 2) {
      tokens.add(trimmed);
    }

    final lower = trimmed.toLowerCase();
    final latinMatches = RegExp(r'[a-z0-9]+').allMatches(lower);
    for (final match in latinMatches) {
      final token = match.group(0);
      if (token == null || token.length < 2) continue;
      tokens.add(token);
    }

    final cjk = lower.replaceAll(RegExp(r'[^\u4e00-\u9fff]'), '');
    if (cjk.length >= 2) {
      for (var i = 0; i < cjk.length - 1; i++) {
        tokens.add(cjk.substring(i, i + 2));
      }
    } else if (cjk.isNotEmpty) {
      tokens.add(cjk);
    }

    final deduped = <String>{};
    for (final token in tokens) {
      final normalized = token.trim();
      if (normalized.isEmpty) continue;
      deduped.add(normalized.toLowerCase());
    }
    final ordered = deduped.toList(growable: false)
      ..sort((a, b) => b.length.compareTo(a.length));
    return ordered;
  }

  List<_TextRange> _findHighlightRanges(String text, List<String> tokens) {
    if (text.isEmpty || tokens.isEmpty) return const [];
    final lowerText = text.toLowerCase();
    final ranges = <_TextRange>[];

    for (final token in tokens) {
      if (token.isEmpty) continue;
      var start = 0;
      while (true) {
        final index = lowerText.indexOf(token, start);
        if (index < 0) break;
        ranges.add(_TextRange(index, index + token.length));
        start = index + token.length;
      }
    }
    if (ranges.isEmpty) return const [];

    ranges.sort((a, b) => a.start.compareTo(b.start));
    final merged = <_TextRange>[];
    var current = ranges.first;
    for (var i = 1; i < ranges.length; i++) {
      final next = ranges[i];
      if (next.start <= current.end) {
        current = _TextRange(current.start, math.max(current.end, next.end));
      } else {
        merged.add(current);
        current = next;
      }
    }
    merged.add(current);
    return merged;
  }

  Widget _buildHighlightedPreview({
    required BuildContext context,
    required String text,
    required Color textColor,
  }) {
    final maxLines = matchKind == _SearchMatchKind.fuzzy ? 3 : 2;
    final highlightTokens = _buildHighlightTokens(query);
    var ranges = _findHighlightRanges(text, highlightTokens);
    final forceSemanticHighlight =
        matchKind == _SearchMatchKind.fuzzy &&
        (semanticExcerpt?.trim().isNotEmpty ?? false);
    if (ranges.isEmpty && forceSemanticHighlight && text.isNotEmpty) {
      ranges = [_TextRange(0, text.length)];
    }
    if (ranges.isEmpty) {
      return Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 13, color: textColor, height: 1.45),
      );
    }

    final highlightBackground = matchTypeColor.withValues(
      alpha: matchKind == _SearchMatchKind.fuzzy ? 0.30 : 0.22,
    );
    final spans = <TextSpan>[];
    var cursor = 0;
    for (final range in ranges) {
      if (range.start > cursor) {
        spans.add(
          TextSpan(
            text: text.substring(cursor, range.start),
            style: TextStyle(color: textColor),
          ),
        );
      }
      spans.add(
        TextSpan(
          text: text.substring(range.start, range.end),
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w700,
            backgroundColor: highlightBackground,
          ),
        ),
      );
      cursor = range.end;
    }
    if (cursor < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(cursor),
          style: TextStyle(color: textColor),
        ),
      );
    }

    return RichText(
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: TextStyle(fontSize: 13, color: textColor, height: 1.45),
        children: spans,
      ),
    );
  }

  String? _extractTagValue(String? tags, String prefix) {
    if (tags == null || tags.isEmpty) return null;
    final lines = tags.split('\n');
    for (final line in lines) {
      if (line.startsWith(prefix)) {
        final value = line.substring(prefix.length).trim();
        if (value.isNotEmpty) return value;
      }
    }
    return null;
  }

  Future<void> _handleTap(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final networkUrl = _extractTagValue(diary.aiTags, _networkUrlTagPrefix);
    if (networkUrl != null) {
      final decoded = DiaryContentCodec.decode(diary.rawText);
      final previewMarkdown = decoded.text.trim().isEmpty
          ? diary.rawText.trim()
          : decoded.text.trim();
      final title =
          _extractTagValue(diary.aiTags, _networkTitleTagPrefix) ??
          diary.aiSummary ??
          l10n.network;

      await Navigator.of(context).push(
        adaptivePageRoute<void>(
          context,
          builder: (_) => _NetworkMarkdownPreviewPage(
            title: title,
            sourceUrl: networkUrl,
            markdown: previewMarkdown,
          ),
        ),
      );
      return;
    }

    final uri = Uri(
      path: '/diary/${diary.id}',
      queryParameters: {'q': query, 'match': matchTypeLabel},
    );
    context.push(uri.toString());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final mutedTextColor = Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFFC7D0DD)
        : scheme.onSurfaceVariant;
    final date = DateTime.fromMillisecondsSinceEpoch(diary.updatedAt);
    final content = DiaryContentCodec.decode(diary.rawText);
    final visibleText = content.text;
    final networkUrl = _extractTagValue(diary.aiTags, _networkUrlTagPrefix);
    final networkSource = _extractTagValue(
      diary.aiTags,
      _networkSourceTagPrefix,
    );
    final semanticPreview = (semanticExcerpt ?? '').trim();
    final previewText = semanticPreview.isNotEmpty
        ? semanticPreview
        : (visibleText.isEmpty ? l10n.imageMemory : visibleText);
    final matchCount =
        _countMatches(visibleText, query) +
        _countMatches(diary.aiSummary ?? '', query);
    final hasSemanticHint =
        matchKind == _SearchMatchKind.fuzzy && semanticPreview.isNotEmpty;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => unawaited(_handleTap(context)),
        child: Container(
          height: matchKind == _SearchMatchKind.fuzzy ? 126 : 112,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: matchTypeColor.withValues(alpha: 0.50)),
            borderRadius: BorderRadius.circular(12),
            color: matchTypeColor.withValues(alpha: 0.08),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHighlightedPreview(
                context: context,
                text: previewText,
                textColor: scheme.onSurface,
              ),
              const Spacer(),
              if (networkUrl == null)
                Text(
                  hasSemanticHint && matchCount == 0
                      ? matchTypeLabel
                      : l10n.matchCount(matchCount),
                  style: TextStyle(
                    fontSize: 11,
                    color: matchTypeColor,
                    fontWeight: FontWeight.w700,
                  ),
                )
              else
                Text(
                  l10n.sourceFromNetwork(networkSource ?? l10n.network),
                  style: TextStyle(
                    fontSize: 11,
                    color: matchTypeColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              Text(
                networkUrl == null
                    ? formatDateTimeWithSeconds(context, date)
                    : (Uri.tryParse(networkUrl)?.host ?? networkUrl),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10, color: mutedTextColor),
              ),
              if (networkUrl != null)
                Text(
                  l10n.tapToOpenMarkdownPreview,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 9,
                    color: mutedTextColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextRange {
  final int start;
  final int end;

  const _TextRange(this.start, this.end);
}

class _TimelineDivider extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool subtle;

  const _TimelineDivider({
    required this.icon,
    required this.label,
    this.subtle = false,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final base = subtle ? scheme.onSurfaceVariant : scheme.onSurface;
    final color = subtle
        ? base.withValues(alpha: isDark ? 0.86 : 0.78)
        : base.withValues(alpha: isDark ? 0.92 : 0.84);
    final dividerAlpha = subtle
        ? (isDark ? 0.50 : 0.45)
        : (isDark ? 0.58 : 0.45);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 10),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: color.withValues(alpha: dividerAlpha),
              thickness: 0.8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: subtle ? FontWeight.w500 : FontWeight.w600,
                color: color,
                letterSpacing: 0.8,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: color.withValues(alpha: dividerAlpha),
              thickness: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

class _NetworkMarkdownPreviewPage extends StatelessWidget {
  final String title;
  final String sourceUrl;
  final String markdown;

  const _NetworkMarkdownPreviewPage({
    required this.title,
    required this.sourceUrl,
    required this.markdown,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final previewText = markdown.trim();
    return Scaffold(
      backgroundColor: isDark
          ? _TimelineScreenState._darkPaperColor
          : _TimelineScreenState._paperColor,
      appBar: AppBar(
        backgroundColor: isDark
            ? _TimelineScreenState._darkPaperColor
            : _TimelineScreenState._paperColor,
        foregroundColor: scheme.onSurface,
        title: Text(title.trim().isEmpty ? l10n.networkResult : title),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(14, 10, 14, 20),
        children: [
          if (sourceUrl.trim().isNotEmpty)
            Material(
              color: isDark ? scheme.surfaceContainerLow : scheme.surface,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () async {
                  final uri = Uri.tryParse(sourceUrl);
                  if (uri == null) return;
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.link,
                        size: 16,
                        color: scheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          sourceUrl,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: isDark ? scheme.surfaceContainerLow : scheme.surface,
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.all(14),
            child: MarkdownBody(
              data: previewText.isEmpty ? l10n.noPreviewContent : previewText,
              selectable: true,
              styleSheet: MarkdownStyleSheet(
                p: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: scheme.onSurface,
                ),
                h1: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: scheme.onSurface,
                ),
                h2: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: scheme.onSurface,
                ),
                h3: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: scheme.onSurface,
                ),
                code: TextStyle(
                  fontSize: 13,
                  color: scheme.onSurface,
                  fontFamily: 'monospace',
                ),
                blockquote: TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: scheme.onSurfaceVariant,
                ),
              ),
              onTapLink: (text, href, title) async {
                if (href == null || href.trim().isEmpty) return;
                final uri = Uri.tryParse(href);
                if (uri == null) return;
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DiaryCard extends StatelessWidget {
  final VectorDiary diary;
  final VoidCallback onTap;
  final VoidCallback onEdit;

  const _DiaryCard({
    required this.diary,
    required this.onTap,
    required this.onEdit,
  });

  Widget _buildPreviewImage(String source, BuildContext context) {
    final trimmed = source.trim();
    final fallback = Container(
      width: 102,
      height: 82,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      alignment: Alignment.center,
      child: const Icon(Icons.broken_image_outlined, size: 18),
    );
    if (trimmed.isEmpty) return fallback;

    final uri = Uri.tryParse(trimmed);
    final isRemote =
        uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
    final isFileUri = uri != null && uri.scheme == 'file';
    final path = isFileUri ? uri.toFilePath() : trimmed;

    if (isRemote) {
      return Image.network(
        trimmed,
        width: 102,
        height: 82,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => fallback,
      );
    }

    return Image.file(
      File(path),
      width: 102,
      height: 82,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => fallback,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final date = DateTime.fromMillisecondsSinceEpoch(diary.updatedAt);
    final content = DiaryContentCodec.decode(diary.rawText);
    final visibleText = content.text;
    final richPreviewSource = content.blocks
        .where((block) => block.text != null && block.text!.trim().isNotEmpty)
        .map((block) => block.text!)
        .join('\n')
        .trim();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? const Color(0xFF1D232D) : scheme.surface;
    final outerRingColor = isDark
        ? const Color(0xFFE8EEF9).withValues(alpha: 0.26)
        : scheme.outlineVariant.withValues(alpha: 0.20);
    final borderColor = isDark
        ? const Color(0xFF2C3443)
        : scheme.outlineVariant.withValues(alpha: 0.50);
    final primaryText = scheme.onSurface;
    final secondaryText = isDark
        ? const Color(0xFFD1D9E6)
        : scheme.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: outerRingColor, width: isDark ? 1.15 : 0.9),
        ),
        child: Material(
          color: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: borderColor),
          ),
          clipBehavior: Clip.antiAlias,
          elevation: isDark ? 1.4 : 0.6,
          shadowColor: Colors.black.withValues(alpha: isDark ? 0.24 : 0.06),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          formatDateTimeWithSeconds(context, date),
                          style: TextStyle(
                            color: secondaryText,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        tooltip: l10n.editEntry,
                        onPressed: onEdit,
                        icon: Icon(
                          Icons.edit_outlined,
                          size: 18,
                          color: secondaryText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (richPreviewSource.isEmpty)
                    Text(
                      visibleText.isEmpty ? l10n.imageMemory : visibleText,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.65,
                        color: primaryText,
                      ),
                    )
                  else
                    RichText(
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      text: DiaryRichText.buildTextSpan(
                        context: context,
                        source: richPreviewSource,
                        baseStyle: TextStyle(
                          fontSize: 16,
                          height: 1.65,
                          color: primaryText,
                        ),
                      ),
                    ),
                  if (content.imagePaths.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    SizedBox(
                      height: 82,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: content.imagePaths.length > 3
                            ? 3
                            : content.imagePaths.length,
                        separatorBuilder: (_, _) => const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final path = content.imagePaths[index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: _buildPreviewImage(path, context),
                          );
                        },
                      ),
                    ),
                  ],
                  if (diary.aiSummary != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      diary.aiSummary!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: secondaryText,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

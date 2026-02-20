import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

class TimelineScreen extends ConsumerStatefulWidget {
  const TimelineScreen({super.key});

  @override
  ConsumerState<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends ConsumerState<TimelineScreen> {
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

  void _openDiaryInput() {
    showDiaryInputSheet(
      context,
      title: context.t(zhHans: '写文章', zhHant: '寫文章', en: 'Write'),
      onSubmit: (text) {
        ref.read(timelineProvider.notifier).createDiary(rawText: text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final diaries = ref.watch(timelineProvider);
    final currentUser = ref.watch(authProvider.notifier).getCurrentUser();
    final isCupertino = isCupertinoPlatform(Theme.of(context).platform);
    final fallbackUserName = context.t(zhHans: '用户', zhHant: '使用者', en: 'User');

    return Scaffold(
      appBar: AppBar(
        centerTitle: isCupertino,
        title: Text(currentUser?.username ?? fallbackUserName),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
            tooltip: context.t(zhHans: '设置', zhHant: '設定', en: 'Settings'),
          ),
        ],
      ),
      body: Stack(
        children: [
          diaries.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.note_add, size: 64, color: Colors.grey),
                      const SizedBox(height: 16),
                      Text(
                        context.t(
                          zhHans: '还没有记忆',
                          zhHant: '還沒有記憶',
                          en: 'No memories yet',
                        ),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        context.t(
                          zhHans: '点击 + 记录你的想法',
                          zhHant: '點擊 + 記錄你的想法',
                          en: 'Tap + to capture your thoughts',
                        ),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: diaries.length,
                  itemBuilder: (context, index) {
                    final diary = diaries[index];
                    return Dismissible(
                      key: ValueKey('diary-${diary.id}'),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.red.shade500,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              context.t(
                                zhHans: '删除',
                                zhHant: '刪除',
                                en: 'Delete',
                              ),
                              style: TextStyle(
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
                                title: Text(
                                  context.t(
                                    zhHans: '删除记录',
                                    zhHant: '刪除記錄',
                                    en: 'Delete Memory',
                                  ),
                                ),
                                content: Text(
                                  context.t(
                                    zhHans: '这条记录将从时间线移除。',
                                    zhHant: '這條記錄將從時間線移除。',
                                    en: 'This entry will be removed from your timeline.',
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, false),
                                    child: Text(
                                      context.t(
                                        zhHans: '取消',
                                        zhHant: '取消',
                                        en: 'Cancel',
                                      ),
                                    ),
                                  ),
                                  FilledButton(
                                    onPressed: () =>
                                        Navigator.pop(context, true),
                                    child: Text(
                                      context.t(
                                        zhHans: '删除',
                                        zhHant: '刪除',
                                        en: 'Delete',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ) ??
                            false;
                      },
                      onDismissed: (_) {
                        ref
                            .read(timelineProvider.notifier)
                            .deleteDiary(diary.id);
                      },
                      child: _DiaryCard(
                        diary: diary,
                        onTap: () => context.push('/diary/${diary.id}'),
                      ),
                    );
                  },
                ),
        ],
      ),
      bottomNavigationBar: _buildBottomActionBar(context, isCupertino),
    );
  }

  Widget _buildBottomActionBar(BuildContext context, bool isCupertino) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SafeArea(
      top: false,
      child: Container(
        height: isCupertino ? 76 : 70,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor.withValues(
            alpha: isCupertino ? 0.95 : 1,
          ),
          border: Border(
            top: BorderSide(
              color: colorScheme.outlineVariant.withValues(alpha: 0.35),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(isCupertino ? CupertinoIcons.search : Icons.search),
              iconSize: 28,
              onPressed: () => _openSearchPage(context),
              tooltip: context.t(zhHans: '搜索', zhHant: '搜尋', en: 'Search'),
            ),
            IconButton(
              icon: Icon(
                isCupertino
                    ? CupertinoIcons.chat_bubble_2_fill
                    : Icons.smart_toy,
              ),
              iconSize: 28,
              onPressed: () => _showAiChat(context),
              tooltip: context.t(
                zhHans: 'AI 对话',
                zhHant: 'AI 對話',
                en: 'AI Chat',
              ),
            ),
            _buildCreateButton(context, isCupertino),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateButton(BuildContext context, bool isCupertino) {
    if (!isCupertino) {
      return SizedBox(
        width: 56,
        height: 56,
        child: FloatingActionButton(
          heroTag: 'timeline_capture_fab',
          onPressed: _openDiaryInput,
          child: const Icon(Icons.add, size: 32),
        ),
      );
    }

    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: 52,
      height: 52,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.primary,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: _openDiaryInput,
          icon: Icon(
            CupertinoIcons.add,
            size: 28,
            color: colorScheme.onPrimary,
          ),
          tooltip: context.t(zhHans: '新建', zhHant: '新增', en: 'Create'),
        ),
      ),
    );
  }

  void _showAiChat(BuildContext context) {
    Navigator.of(context).push(
      adaptivePageRoute<void>(context, builder: (_) => const AiChatScreen()),
    );
  }

  void _openSearchPage(BuildContext context) {
    Navigator.of(context).push(
      adaptivePageRoute<void>(
        context,
        builder: (_) => const _TimelineSearchPage(),
      ),
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

    _searchController
      ..text = query
      ..selection = TextSelection.collapsed(offset: query.length);

    setState(() {
      _loading = true;
      _hasSearched = true;
      _networkLoading = true;
    });

    final result = await ref.read(timelineProvider.notifier).search(query);
    if (!mounted) return;

    setState(() {
      _searchResult = result;
      _loading = false;
    });
    ref.read(settingsProvider.notifier).addSearchHistory(query);
    unawaited(_loadNetworkMatches(query));
  }

  Future<void> _loadNetworkMatches(String query) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    if (!mounted || _searchController.text.trim() != query) return;

    setState(() {
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

  @override
  Widget build(BuildContext context) {
    final history = ref.watch(settingsProvider.select((s) => s.searchHistory));
    final query = _searchController.text.trim();
    final exactMatches = _searchResult.exactMatches;
    final fuzzyMatches = _searchResult.fuzzyMatches;
    final networkMatches = _searchResult.networkMatches;

    return EdgeSwipeBack(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          centerTitle: true,
          title: Text(context.t(zhHans: '搜索', zhHant: '搜尋', en: 'Search')),
        ),
        body: Column(
          children: [
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
                  hintText: context.t(
                    zhHans: '搜索你的记录...',
                    zhHant: '搜尋你的記錄...',
                    en: 'Search your records...',
                  ),
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
                          title: context.t(
                            zhHans: '完整匹配',
                            zhHant: '完整匹配',
                            en: 'Exact Matches',
                          ),
                          count: exactMatches.length,
                          icon: Icons.check_circle_outline,
                        ),
                        if (exactMatches.isEmpty)
                          _EmptySection(
                            message: context.t(
                              zhHans: '无完整匹配结果',
                              zhHant: '無完整匹配結果',
                              en: 'No exact matches',
                            ),
                          )
                        else
                          _SearchResultWrap(
                            diaries: exactMatches,
                            query: query,
                            matchTypeLabel: context.t(
                              zhHans: '完整匹配',
                              zhHant: '完整匹配',
                              en: 'Exact',
                            ),
                            matchTypeColor: Colors.green,
                          ),
                        const Divider(height: 24, thickness: 1),
                        _SectionHeader(
                          title: context.t(
                            zhHans: '模糊匹配',
                            zhHant: '模糊匹配',
                            en: 'Fuzzy Matches',
                          ),
                          count: fuzzyMatches.length,
                          icon: Icons.blur_on,
                        ),
                        if (fuzzyMatches.isEmpty)
                          _EmptySection(
                            message: context.t(
                              zhHans: '无模糊匹配结果',
                              zhHant: '無模糊匹配結果',
                              en: 'No fuzzy matches',
                            ),
                          )
                        else
                          _SearchResultWrap(
                            diaries: fuzzyMatches,
                            query: query,
                            matchTypeLabel: context.t(
                              zhHans: '向量匹配',
                              zhHant: '向量匹配',
                              en: 'Vector',
                            ),
                            matchTypeColor: Colors.deepPurple,
                          ),
                        const Divider(height: 24, thickness: 1),
                        _SectionHeader(
                          title: context.t(
                            zhHans: '网络匹配',
                            zhHant: '網路匹配',
                            en: 'Network Matches',
                          ),
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
                            message: context.t(
                              zhHans: '网络匹配未启用（本地优先）',
                              zhHant: '網路匹配未啟用（本地優先）',
                              en: 'Network match is disabled (local-first).',
                            ),
                          )
                        else
                          _SearchResultWrap(
                            diaries: networkMatches,
                            query: query,
                            matchTypeLabel: context.t(
                              zhHans: '网络匹配',
                              zhHant: '網路匹配',
                              en: 'Network',
                            ),
                            matchTypeColor: Colors.blue,
                          ),
                        const SizedBox(height: 16),
                      ],
                    )
                  : (history.isEmpty
                        ? Center(
                            child: Text(
                              context.t(
                                zhHans: '暂无历史搜索',
                                zhHant: '暫無歷史搜尋',
                                en: 'No search history',
                              ),
                            ),
                          )
                        : ListView(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                            children: [
                              Row(
                                children: [
                                  Text(
                                    context.t(
                                      zhHans: '历史搜索',
                                      zhHant: '歷史搜尋',
                                      en: 'Search History',
                                    ),
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
                                    child: Text(
                                      context.t(
                                        zhHans: '清空',
                                        zhHant: '清空',
                                        en: 'Clear',
                                      ),
                                    ),
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
                                        avatar: const Icon(
                                          Icons.history,
                                          size: 16,
                                        ),
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
        ),
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(
            '$title · $count',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 2, 16, 10),
      child: Text(message, style: TextStyle(color: Colors.grey[500])),
    );
  }
}

class _SearchResultWrap extends StatelessWidget {
  final List<VectorDiary> diaries;
  final String query;
  final String matchTypeLabel;
  final Color matchTypeColor;

  const _SearchResultWrap({
    required this.diaries,
    required this.query,
    required this.matchTypeLabel,
    required this.matchTypeColor,
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
                      matchTypeLabel: matchTypeLabel,
                      matchTypeColor: matchTypeColor,
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
  final VectorDiary diary;
  final String query;
  final String matchTypeLabel;
  final Color matchTypeColor;

  const _SearchResultCard({
    required this.diary,
    required this.query,
    required this.matchTypeLabel,
    required this.matchTypeColor,
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

  @override
  Widget build(BuildContext context) {
    final date = DateTime.fromMillisecondsSinceEpoch(diary.updatedAt);
    final content = DiaryContentCodec.decode(diary.rawText);
    final visibleText = content.text;
    final matchCount =
        _countMatches(visibleText, query) +
        _countMatches(diary.aiSummary ?? '', query);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          final uri = Uri(
            path: '/diary/${diary.id}',
            queryParameters: {'q': query, 'match': matchTypeLabel},
          );
          context.push(uri.toString());
        },
        child: Container(
          height: 112,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: matchTypeColor.withValues(alpha: 0.50)),
            borderRadius: BorderRadius.circular(12),
            color: matchTypeColor.withValues(alpha: 0.08),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                visibleText.isEmpty
                    ? context.t(
                        zhHans: '[图片记忆]',
                        zhHant: '[圖片記憶]',
                        en: '[Image memory]',
                      )
                    : visibleText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13),
              ),
              const Spacer(),
              Text(
                context.t(
                  zhHans: '匹配:$matchCount',
                  zhHant: '匹配:$matchCount',
                  en: 'Matches: $matchCount',
                ),
                style: TextStyle(
                  fontSize: 11,
                  color: matchTypeColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                formatDateTimeWithSeconds(context, date),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DiaryCard extends StatelessWidget {
  final VectorDiary diary;
  final VoidCallback onTap;

  const _DiaryCard({required this.diary, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.fromMillisecondsSinceEpoch(diary.updatedAt);
    final content = DiaryContentCodec.decode(diary.rawText);
    final visibleText = content.text;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      formatDateTimeWithSeconds(context, date),
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                visibleText.isEmpty
                    ? context.t(
                        zhHans: '[图片记忆]',
                        zhHant: '[圖片記憶]',
                        en: '[Image memory]',
                      )
                    : visibleText,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15),
              ),
              if (content.imagePaths.isNotEmpty) ...[
                const SizedBox(height: 10),
                SizedBox(
                  height: 62,
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
                        child: Image.file(
                          File(path),
                          width: 76,
                          height: 62,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                width: 76,
                                height: 62,
                                color: Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerHighest,
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.broken_image_outlined,
                                  size: 18,
                                ),
                              ),
                        ),
                      );
                    },
                  ),
                ),
              ],
              if (diary.aiSummary != null) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        size: 16,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          diary.aiSummary!,
                          style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

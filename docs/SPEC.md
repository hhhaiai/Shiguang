# 拾光 (Shiguang) - 规格文档

## 1. 项目概述

**项目名称**: 拾光 (Shiguang)
**项目类型**: 跨端应用 (iOS, Android, macOS, Windows, Linux, Web)
**核心定位**: 极度注重隐私的本地化 AI 知识库，实现跨端无感捕获与语义回忆

## 2. 核心需求

### 产品形态
- **移动端 (助手)**: 极速语音录入，快速捕获灵感
- **PC 端 (常驻)**: 全局快捷键唤醒，截图/文本捕获
- **Web 端 (未来)**: 扫码关联 PC，仅作录入入口

### 核心功能
1. **全终端碎片捕获**: 文字、截图、语音极速录入
2. **本地 AI 处理**: 零散内容自动整理成摘要 + 标签
3. **向量语义检索**: 基于 Embedding 的自然语言搜索
4. **用户隔离**: 多用户、PIN 码、本地数据隔离
5. **日历/闹钟提醒**: 端侧抽取待办与日程，端侧触发提醒
6. **图片分享**: 一键生成分享图片
7. **可选外部检索**: 用户显式开启后，允许从公开网络获取最新信息（不上传用户私密内容）

## 3. 技术约束

### 必须使用的库
| 类别 | 库名 | 备注 |
|------|------|------|
| 状态管理 | flutter_riverpod + riverpod_annotation | 代码生成方式 |
| 路由管理 | go_router | 声明式路由 |
| 向量数据库 | objectbox | HNSW 向量检索 |
| 语音输入 | record + WebSocket | PCM 流式录入 |
| UI 分享 | screenshot + share_plus | 图片分享 |
| 安全 | crypto + flutter_secure_storage | PIN 哈希与本地安全存储 |

### 本地 AI 模型
- **语音识别**: SenseVoice (ONNX Runtime)
- **Embedding 向量**: 384 维（默认）
- **LLM 摘要/对话**: Qwen2.5-0.5B int4（默认）

### 外部检索（可选）
- **默认关闭**，仅在用户设置中显式开启
- 仅用于**公开信息**检索，禁止上传用户私密内容或本地笔记
- 结果与本地检索分层展示（本地结果优先）
- 搜索级别能力：对标 Google/Bing/DuckDuckGo 等同类搜索引擎
- 输出结构化结果供 AI 引用（标题/摘要/URL/时间/来源）

#### 外部检索实现约束（SearXNG）
- Provider：SearXNG（自建实例优先）
- 接口：`GET /search` 或 `POST /search`
- 输出格式：`format=json`
- 核心参数：`q`（必填）、`categories`、`engines`、`language`、`pageno`、`time_range`、`safesearch`
- 时间范围：`time_range` 支持 `day/month/year`（引擎支持则生效）
- **注意**：SearXNG 默认可能未开启 JSON 输出，需要在 `settings.yml` 中启用 `search.formats: [html, json]`，否则会返回 403

#### Provider 适配层接口（可插拔）

**统一接口**（伪代码）：
```dart
abstract class WebSearchProvider {
  Future<List<SearchResult>> search({
    required String query,
    String? language,
    String? timeRange, // day/month/year
    int page = 1,
    int pageSize = 10,
  });
}

class SearchResult {
  final String title;
  final String snippet;
  final String url;
  final String source;
  final DateTime? publishedAt;
  final double? score;
}
```

**适配策略**：
- SearXNG 作为默认 Provider
- 可扩展多 Provider（如本地代理/其他引擎），但保持统一结构化输出
- Provider 失败时允许降级：仅展示本地检索结果

#### 缓存与去重策略（外部检索）

**缓存**：
- Key：`hash(query + language + timeRange + page + pageSize)`
- TTL：24 小时（默认），可在设置中调整
- 失效策略：时间到期或用户手动清理

**去重**：
- URL 归一化后去重（移除跟踪参数：`utm_*`, `gclid`, `fbclid`）
- Title + 域名 作为二级去重键
- 与本地结果去重：如本地日记已有同 URL/标题，外部结果标记“已在本地存在”

**排序融合**：
- 本地结果优先显示
- 外部结果按相关性或时间排序（可配置）

#### 来源标注与 RAG 输入规范

**来源标注**：
- 外部结果必须标注：`source` + `url` + `publishedAt`
- UI 中展示来源与时间，避免与本地记忆混淆
- 允许用户手动关闭某来源

**RAG 输入规范（外部信息）**：
- 仅将 `title + snippet + url + publishedAt` 作为外部上下文
- 外部信息作为“背景知识”，不得覆盖本地记忆结论
- 需要可追溯引用：回答中附带来源链接

## 4. 数据库设计 (ObjectBox)

### 用户表 (LocalAccount)
```
- id: int (primary)
- username: string (unique)
- hashedPinCode: string
- createdAt: int
- lastLoginAt: int?
```

### 日记/碎片表 (VectorDiary)
```
- id: int (primary)
- accountId: int (FK -> LocalAccount)
- rawText: string
- aiSummary: string
- aiTags: string? (JSON)
- embedding: Float32List? (384维, HNSW)
- createdAt: int
- updatedAt: int
- isDeleted: bool
```

### 提醒/闹钟表 (LocalReminder)
```
- id: int (primary)
- accountId: int (FK -> LocalAccount)
- diaryId: int? (可选关联 VectorDiary)
- title: string
- body: string?
- triggerAt: int (Unix ms)
- repeatRule: string? (如: "none" / "daily" / "weekly")
- timezone: string? (IANA, 如 "Asia/Shanghai")
- isEnabled: bool
- createdAt: int
- updatedAt: int
```

## 5. 架构设计

### Local-First 原则
- 所有数据存储在本地 ObjectBox
- 模型本地推理，不上传用户内容
- 允许可选拉取“模型列表元数据”，不包含用户数据

### 用户系统
- 本地用户名 + PIN 码认证
- 用户切换功能
- 私密日记保护（预留）

### 提醒/闹钟调度（平台实现）

**Android**:
- 调度：`AlarmManager` + `BroadcastReceiver` + 前台/后台通知
- 精准提醒：优先 `setExactAndAllowWhileIdle`（需兼容电池优化策略）
- 持久化：所有提醒以 `LocalReminder` 为源，重启后重建闹钟
- 静默模式：仅通知不响铃（由通知渠道配置控制）

**iOS**:
- 调度：`UNUserNotificationCenter` 本地通知
- 精准提醒：使用 `UNCalendarNotificationTrigger`
- 持久化：系统自动持久化，App 启动时校验与本地表一致性
- 隐私控制：锁屏通知可隐藏正文

**通用策略**:
- AI 抽取时间/频率 → 生成建议提醒卡片 → 用户确认后落库与调度
- 支持重复规则（none/daily/weekly/monthly/custom）
- 支持时区字段（IANA），跨地区移动时触发策略以本地时区为准

## 6. UI 设计参考

参考 Dawnary (iOS 日记软件):
- 极简留白 + 文字排版
- Timeline 为主界面
- 图片分享生成

## 7. 开发阶段

### Phase 1 (MVP)
- [x] 时间轴 UI
- [x] ObjectBox 本地存储
- [x] 多用户基础认证
- [x] 语音录入 UI 与流式追加

### Phase 2
- [x] 本地 Embedding 生成
- [x] 语义检索
- [ ] 端侧摘要/标签
- [x] 本地提醒/闹钟调度（移动端优先，基础版）

### Phase 3
- [ ] 对话式检索（RAG）
- [ ] PC 端快捷键 + OCR
- [ ] 日历/提醒/闹钟融合
- [ ] 可选外部检索连接器

# CLAUDE.md（仓库唯一规范版）

> 拾光：本地知识库 + 碎片捕获 + 日记/备忘/提醒统一产品
> **原则：Local-First、稳定性/性能优先、默认离线可用**

## 0. 项目北极星

* **100% 本地运行**：数据 / 索引 / 模型均在本地；**严禁云端后端**。
* **统一入口**：碎片捕获（语音/文本/截图/OCR/快捷键）统一沉淀为：日记 / 备忘 / 提醒。
* **端侧 AI**：ASR + Embedding + 摘要/标签 +（未来）对话检索（RAG）。
* **向量检索**：ObjectBox HNSW（优先、稳定、性能第一）。
* **多用户强隔离**：本地账号 + PIN + accountId 隔离。

---

## 1. 不可妥协要求（Non-Negotiable）

1. **本地优先**：用户内容与推理结果**不出端**；默认离线可用。
2. **碎片捕获**：语音/文本/截图/OCR/快捷键；同一条内容可成为日记/备忘/提醒来源。
3. **语音识别**：SenseVoice 本地模型；**PCM 16kHz / int16 / mono**，流式追加。
4. **向量检索**：ObjectBox HNSW；**384 维向量**为默认维度。
5. **多模型协同**：ASR + Embedding + Summarizer/Tagger +（未来）RAG + 提醒调度。
6. **检索策略**：本地向量检索优先；外部检索为可选能力（默认关闭、仅公开信息）。
7. **模型可切换**：设置页可切换本地模型；允许可选拉取“模型列表元数据”（不上传用户内容）。
8. **多用户隔离**：本地账号、PIN/密码、切换用户、私密日志策略预留。
9. **跨端形态**：Android / iOS / PC 可运行本地服务；Web 仅作录入入口（扫码关联 PC）。
10. **编辑/分享**：可编辑；支持截图导出分享。
11. **提醒能力**：日历提醒 + 闹钟提醒（端侧生成、端侧触发）。

---

## 2. 技术栈（Tech Stack）

| 类别            | 技术                                     | 备注                     |
| ------------- | -------------------------------------- | ---------------------- |
| 状态管理          | flutter_riverpod + riverpod_annotation | codegen                |
| 路由            | go_router                              | 声明式                    |
| 本地数据库         | ObjectBox                              | HNSW 向量检索              |
| ASR           | SenseVoice（本地）                         | ONNX Runtime           |
| 推理内核          | ONNX Runtime（C++/移动端）                  | 端侧推理                   |
| Embedding     | 384 维（默认）                              | 速度/体积优先                |
| LLM（摘要/标签/对话） | Qwen2.5-0.5B int4（默认）                  | 端侧（待接入）                |
| 分享            | screenshot + share_plus                | 图片导出                   |
| 安全            | flutter_secure_storage + crypto        | PIN：PBKDF2-HMAC-SHA256 |

---

## 3. 本地语音服务协议（WebSocket 单连接）

**默认 endpoint**：`ws://127.0.0.1:8008/stream`

Client → Server：

```json
{"event":"start","format":"pcm16","sample_rate":16000,"channels":1,"use_itn":true}
```

（随后发送 PCM binary frames）

```json
{"event":"end"}
```

Server → Client：

```json
{"event":"partial","text":"...","seq":1}
{"event":"final","text":"...","seq":N}
```

约束：

* **单连接 WS**（不使用 HTTP+SSE）
* 流式追加、长时录入
* 客户端在 `end` 后**等待 final**，避免尾段丢失

> 实现路线裁决：
>
> * **移动端**可走端内 ONNX ASR（MVP 已有）
> * **PC/高性能**可走 C++ WS server
> * **协议保持一致**：Flutter 客户端对上层只依赖 WS 契约

---

## 4. 数据流（Local-First）

```
麦克风(PCM) -> 本地 ASR(ONNX) -> 文本 -> Embedding(ONNX) -> ObjectBox(HNSW)
                                   ->（可选）摘要/标签/提醒抽取 -> 本地存储/调度
```

---

## 5. 代码结构（约定）

```
aether_diary/
├── lib/
│   ├── main.dart
│   ├── app/ (app + router)
│   ├── core/objectbox/ (service + providers)
│   ├── features/
│   │   ├── auth/ (LocalAccount + PIN)
│   │   └── diary/ (VectorDiary + timeline + ai adapters)
│   ├── objectbox.g.dart        # 生成代码，禁止改
│   └── objectbox-model.json
├── native/
│   └── sensevoice_ws_server/   # C++ WS 服务（ONNX Runtime）
└── assets/
    └── models/                 # 本地模型文件（可离线）
        ├── sensevoice/
        ├── embedding/
        └── llm/
```

---

## 6. 数据库 Schema（ObjectBox）

### LocalAccount（用户）

```dart
@Entity()
class LocalAccount {
  @Id()
  int id;

  @Unique()
  String username;

  // PBKDF2-HMAC-SHA256 (salted) 的编码字符串（建议：iterations:salt:hash）
  String hashedPinCode;

  int createdAt;
  int? lastLoginAt;
}
```

### VectorDiary（日记/碎片）

```dart
@Entity()
class VectorDiary {
  @Id()
  int id;

  int accountId;

  String rawText;
  String aiSummary;
  String? aiTags; // JSON string

  @HnswIndex(dimensions: 384)
  Float32List? embedding;

  int createdAt;
  int updatedAt;
  bool isDeleted;
}
```

### LocalReminder（提醒/闹钟）

```dart
@Entity()
class LocalReminder {
  @Id()
  int id;

  int accountId;
  int? diaryId;

  String title;
  String? body;

  int triggerAt;      // Unix ms
  String? repeatRule; // 建议支持 RRULE 或 JSON（至少覆盖 daily/weekly/monthly/custom）
  String? timezone;   // IANA，如 "Asia/Shanghai"

  bool isEnabled;

  int createdAt;
  int updatedAt;
}
```

---

## 7. 模型策略（默认配置）

* Embedding：**384 维**（移动端性能优先）
* LLM：**Qwen2.5-0.5B int4**（摘要/标签/对话；待接入）
* ASR：SenseVoice（本地）
* 模型切换：设置页选择本地模型
* 可选“模型列表元数据”：仅用于展示/下载入口（**不含用户内容**）

> 模型大小口径约定：文档中若出现大小，需标注是 **原始权重** / **ONNX 导出** / **量化后**，避免混用。

---

## 8. 可选外部检索（默认关闭）

目的：为对话提供“公开信息背景”，不影响本地记忆的优先级。

强约束：

* 必须用户显式开启
* **不得上传**本地日记/笔记片段
* 只允许发送：用户输入 query + 公开参数（language/timeRange/page）
* 结果必须结构化：`title/snippet/url/source/publishedAt`
* UI 明确区分“外部结果/本地结果”，本地优先展示

默认 Provider（建议）：SearXNG（自建优先），缓存 TTL 24h，URL 归一化去重。

---

## 9. 平台注意事项

* iOS：`Info.plist` 添加 `NSMicrophoneUsageDescription`
* Android：`RECORD_AUDIO`；截图保存按需申请存储权限（依系统版本策略）
* 本地服务：App 启动后拉起本机服务（Android 可子进程）

---

## 10. 开发命令

```bash
cd aether_diary
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter devices
flutter run -d <device_id>
flutter build apk --release
flutter build ios --release
flutter clean && flutter pub get
```

---

## 11. 进度（单一事实源）

### Completed

* ObjectBox + HNSW 向量存储/检索
* 多用户认证（PIN）
* Timeline UI + 详情页 + 分享
* Flutter 客户端 WS 协议接入（end 等 final）
* 本地 Embedding（ONNX Runtime）推理 + 写入 384 维
* SenseVoice 端内 ONNX 推理 MVP（PCM→文本）
* 查询资源释放（关闭 query）
* PIN：PBKDF2-HMAC-SHA256（salted）

### In Progress

* C++ WS server（ONNX Runtime 推理）落地
* SenseVoice 流式体验（精度/性能）优化

### Future

* 端侧 LLM（摘要/标签/对话）接入
* RAG（对话式检索）
* Reminder/Calendar/Alarm 完整融合
* PC 捕获（快捷键/截图/OCR）
* Web 扫码入口
* 可选外部检索连接器（opt-in）

---

## 12. 重要提醒

* `objectbox.g.dart` 为生成文件：**禁止手改**
* `Float32List` 用于 HNSW 向量字段（不是 `List<double>`）
* 性能与稳定性优先：任何功能不得牺牲本地可用性与隐私边界

# 拾光 (Shiguang) - 完整项目规范

> 本文档整合自 gemini.md（产品需求）、gpt.md（技术规范）、CLAUDE.md（开发指南）
> **原则：Local-First、稳定性/性能优先、默认离线可用**

---

## 1. 产品概述

### 1.1 产品定位

* **产品名称**：拾光 (Shiguang)
* **核心定位**：极度注重隐私的 Local-First 智能助理与记忆中枢
* **目标人群**：需要高效管理碎片信息、备忘录、待办事项，且对数据隐私有极高要求的数字工作者、创作者及日常需要"外脑"辅助的人群
* **产品愿景**：从"随手记"起步，最终成长为懂用户的私人全能 AI 助理

### 1.2 使用形态

- 碎片捕获（语音/文本/截图/OCR/快捷键）+ 日记 + 备忘 + 提醒
- **100% 本地运行**：数据 / 索引 / 模型均在本地；**严禁云端后端**
- 跨端形态：
  - Android / iOS / PC：本地服务可运行（Android 可子进程）
  - Web：仅作录入入口，扫码关联 PC 客户端

---

## 2. 核心使用场景

1. **极速闪记**：在路上、开会时，不方便打字，直接长按语音录入，AI 自动转文字并提炼重点
2. **回忆检索**：需要找某个信息但忘了具体词汇，通过自然语言描述（如"上个月关于新项目定价的讨论"），AI 从本地数据库中精准捞出
3. **智能决策辅助**：结合本地记忆与网络实时搜索，让 AI 帮做选择（如："根据我平时的口味，结合当前位置，推荐两家附近的餐厅"）

---

## 3. 不可妥协要求（Non-Negotiable）

1. **本地优先**：用户内容与推理结果**不出端**；默认离线可用
2. **碎片捕获**：语音/文本/截图/OCR/快捷键；同一条内容可成为日记/备忘/提醒来源
3. **语音识别**：SenseVoice 本地模型；**PCM 16kHz / int16 / mono**，流式追加
4. **向量检索**：ObjectBox HNSW；**384 维向量**为默认维度
5. **多模型协同**：ASR + Embedding + Summarizer/Tagger +（未来）RAG + 提醒调度
6. **检索策略**：本地向量检索优先；外部检索为可选能力（默认关闭、仅公开信息）
7. **模型可切换**：设置页可切换本地模型；允许可选拉取"模型列表元数据"（不上传用户内容）
8. **多用户隔离**：本地账号、PIN/密码、切换用户、私密日志策略预留
9. **跨端形态**：Android / iOS / PC 可运行本地服务；Web 仅作录入入口（扫码关联 PC）
10. **编辑/分享**：可编辑；支持截图导出分享
11. **提醒能力**：日历提醒 + 闹钟提醒（端侧生成、端侧触发）

---

## 4. 功能需求详细说明

### 4.1 首页与时光阅读 (Timeline View)

* 列表展示：支持**正序（最旧到最新）与倒序（最新到最旧）**一键切换
* 时间分割线：列表按日、月、年及特定"阶段"进行明显的视觉分割，方便快速定位
* 时光阅读 (悬浮入口)：点击后展示"历史上的今天"（例如去年的今天记录了什么），增强情感连接

### 4.2 多模态极速捕获 (Capture)

* 语音优先：考虑到手机端打字效率，提供醒目的语音录入入口（SenseVoice 本地流式识别），支持随说随转，实时展示文字并允许修改
* 文本与快捷键：支持常规图文混排，为未来的 PC 端全局快捷键呼出预留接口

### 4.3 日历与数据统计 (Calendar View)

* 概览信息：顶部直观展示累计记录天数、累计总字数
* 日历交互：月视图展示，有记录的日期高亮显示。点击具体日期，弹出该日的记录摘要及字数统计

### 4.4 智能搜索系统 (AI Search)

* 分层结果展示：
  * 上半部分（精准/本地）：基于关键字或本地 Embedding 向量检索出的历史日记/碎片
  * 下半部分（模糊/推荐）：AI 结合网络检索给出的综合建议
* 网络搜索融合：AI 将本地记忆与外部搜索引擎结果结合，以"助理提供选项，用户做决定"的交互模式呈现（例如提供两个餐饮选项的卡片）

### 4.5 日记详情与编辑交互 (Detail & Actions)

* 快捷操作菜单 (右上角 ...)：
  * 一键复制为 Markdown 格式
  * 设为/取消私密日记
  * 删除（同时支持在列表页长按或从右向左滑动触发快捷删除）
* 精美图片分享：长按或通过菜单触发，将当前内容重新排版，生成带有主题样式的精美卡片用于社交分享

### 4.6 系统设置与个性化 (Settings)

* 私密金库：设置"私密日记"的访问权限（如需二次验证 PIN 码或生物识别）
* 外观与偏好：主题切换（深/浅/跟随系统）、日记格式配置、语言选择、启动引导图自定义
* 模型与 API 配置：
  * 本地模型管理：下载、切换端侧 ASR 和 LLM 模型
  * 云端 API 密钥：提供配置项，允许用户填入第三方大模型 API Key，用于接管复杂的推理和网络整合任务

---

## 5. 技术栈（Tech Stack）

| 类别 | 技术 | 备注 |
|------|------|------|
| 状态管理 | flutter_riverpod + riverpod_annotation | codegen |
| 路由 | go_router | 声明式 |
| 本地数据库 | ObjectBox | HNSW 向量检索 |
| ASR | SenseVoice（本地） | ONNX Runtime |
| 推理内核 | ONNX Runtime（C++/移动端） | 端侧推理 |
| Embedding | 384 维（默认） | 速度/体积优先 |
| LLM（摘要/标签/对话） | Qwen2.5-0.5B int4（默认） | 端侧（待接入） |
| 分享 | screenshot + share_plus | 图片导出 |
| 安全 | flutter_secure_storage + crypto | PIN：PBKDF2-HMAC-SHA256 |

---

## 6. 本地语音服务协议（WebSocket 单连接）

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

**约束**：

* **单连接 WS**（不使用 HTTP+SSE）
* 流式追加、长时录入
* 客户端在 `end` 后**等待 final**，避免尾段丢失

> 实现路线裁决：
>
> * **移动端**可走端内 ONNX ASR（MVP 已有）
> * **PC/高性能**可走 C++ WS server
> * **协议保持一致**：Flutter 客户端对上层只依赖 WS 契约

---

## 7. 数据流（Local-First）

```
麦克风(PCM) -> 本地 ASR(ONNX) -> 文本 -> Embedding(ONNX) -> ObjectBox(HNSW)
                                  ->（可选）摘要/标签/提醒抽取 -> 本地存储/调度
```

### 详细流程

1. **语音输入**: 用户通过麦克风录音 (PCM 格式)
2. **语音识别**: 本地 WS 服务 (ONNX Runtime) → 文本 (流式)
3. **存储**: ObjectBox 存储日记/备忘/碎片
4. **检索**: 通过向量相似度搜索相关记忆；可选外部搜索增强（结构化结果）
5. **总结/标签**: 端侧模型生成摘要与标签
6. **对话检索**: RAG 融合检索片段形成回答（记忆碎片拼装、多轮追问、可追溯来源）
7. **提醒/日历**: 抽取提醒/待办/日程并融合日历，支持闹钟提醒

---

## 8. 代码结构

```text
PersonalAIBrain/
├── lib/
│   ├── main.dart
│   ├── app/ (app + router)
│   ├── core/objectbox/ (service + providers)
│   ├── features/
│   │   ├── auth/ (LocalAccount + PIN)
│   │   ├── diary/ (VectorDiary + timeline + ai adapters)
│   │   ├── reminder/
│   │   └── settings/
│   ├── objectbox.g.dart        # 生成代码，禁止改
│   └── objectbox-model.json
├── assets/
│   └── models/                 # 本地模型文件（可离线）
│       ├── sensevoice-onnx/
│       ├── embedding/
│       └── llm/
└── scripts/
    ├── llm_server.py
    └── qwen_server.py
```

---

## 9. 数据库 Schema（ObjectBox）

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

## 10. 模型策略（默认配置）

| 模型 | 规格 | 目录 |
|------|------|------|
| Embedding | 384 维（默认） | `assets/models/embedding/bge-small-zh-v1.5-ONNX/` |
| LLM | Qwen2.5-0.5B int4（默认） | `assets/models/llm/` |
| ASR | SenseVoice（本地） | `assets/models/sensevoice-onnx/` |

* 模型切换：设置页选择本地模型
* 可选"模型列表元数据"：仅用于展示/下载入口（**不含用户内容**）

> 模型大小口径约定：文档中若出现大小，需标注是 **原始权重** / **ONNX 导出** / **量化后**，避免混用。

---

## 11. 可选外部检索（默认关闭）

目的：为对话提供"公开信息背景"，不影响本地记忆的优先级。

**强约束**：

* 必须用户显式开启
* **不得上传**本地日记/笔记片段
* 只允许发送：用户输入 query + 公开参数（language/timeRange/page）
* 结果必须结构化：`title/snippet/url/source/publishedAt`
* UI 明确区分"外部结果/本地结果"，本地优先展示

默认 Provider（建议）：SearXNG（自建优先），缓存 TTL 24h，URL 归一化去重。

---

## 12. 平台注意事项

* **iOS**：`Info.plist` 添加 `NSMicrophoneUsageDescription`
* **Android**：`RECORD_AUDIO`；截图保存按需申请存储权限（依系统版本策略）
* **本地服务**：App 启动后拉起本机服务（Android 可子进程）

---

## 13. 开发命令

```bash
# 已在仓库根目录时无需 cd
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter devices
flutter run -d <device_id>
flutter build apk --release
flutter build ios --release
flutter clean && flutter pub get
```

---

## 14. 开发进度（单一事实源）

### Completed

- [x] ObjectBox + HNSW 向量存储/检索
- [x] 多用户认证（PIN）
- [x] Timeline UI + 详情页 + 分享
- [x] Flutter 客户端 WS 协议接入（end 等 final）
- [x] 本地 Embedding（ONNX Runtime）推理 + 写入 384 维
- [x] SenseVoice 端内 ONNX 推理 MVP（PCM→文本）
- [x] 查询资源释放（关闭 query）
- [x] PIN：PBKDF2-HMAC-SHA256（salted）
- [x] 详情页宽度自适应移动端

### In Progress

- [ ] C++ WS server（ONNX Runtime 推理）落地
- [ ] SenseVoice 流式体验（精度/性能）优化

### Future

- [ ] 端侧 LLM（摘要/标签/对话）接入
- [ ] RAG（对话式检索）
- [ ] Reminder/Calendar/Alarm 完整融合
- [ ] PC 捕获（快捷键/截图/OCR）
- [ ] Web 扫码入口
- [ ] 可选外部检索连接器（opt-in）

---

## 15. 商业化与盈利路径探索

虽然项目起点是自用，但架构需为未来的商业化做好准备。建议采用 Freemium（免费增值） 模式：

* **基础免费版**：完全本地运行，使用端侧小模型，满足基础的语音识别、本地摘要和基础检索功能
* **Pro 订阅版** (商业化点)：
  * 高级 AI 能力集成：官方提供稳定、免配置的云端大模型接口（用户无需自己折腾 API Key），支持更深度的推理和智能决策
  * 端到端加密云同步：提供跨设备（手机 + PC）的无缝体验，数据在本地加密后同步至云端，官方无法解密
  * 高级分享模板与自定义主题

---

## 16. 风险评估与技术对策

| 风险点 | 描述 | 应对策略 |
|--------|------|----------|
| 端侧小模型智商瓶颈 | 0.5B 级别的模型在进行"结合多方信息给出建议"时容易产生幻觉或逻辑崩溃 | 混合架构：摘要、打标签等单一任务交由端侧；复杂决策和对话开放 API 设置，让用户接入强大云端模型，或在 Pro 版中提供官方接口 |
| 语音流式识别耗电/发热 | 手机端长时间运行 ONNX 推理可能导致设备发烫 | 优化唤醒机制，仅在录音期间激活模型；考虑提供更小量化版本的模型供低端机型选择 |
| 跨端体验割裂 | 目前只有移动端，记录的碎片化优势未完全发挥 | 移动端 UI 跑通后，尽快利用跨平台优势打包 PC 端，补齐"全局快捷键捕获"这一杀手级功能 |

---

## 17. 重要提醒

* `objectbox.g.dart` 为生成文件：**禁止手改**
* `Float32List` 用于 HNSW 向量字段（不是 `List<double>`）
* 性能与稳定性优先：任何功能不得牺牲本地可用性与隐私边界

---

## 18. 模型下载（已备）

| Model | 实际大小 | 目录 | ModelScope 地址 |
|-------|---------|------|----------------|
| SenseVoice (完整版) | ~231MB | `assets/models/sensevoice/` | [tanweiai/sensevoice-small](https://www.modelscope.cn/models/tanweiai/sensevoice-small) |
| SenseVoice (ONNX量化版) | ~160MB | `assets/models/sensevoice-onnx/` | [iic/SenseVoiceSmall-onnx](https://www.modelscope.cn/models/iic/SenseVoiceSmall-onnx) |
| bge-small-zh-v1.5 | ~188MB | `assets/models/embedding/bge-small-zh-v1.5/` | [AI-ModelScope/bge-small-zh-v1.5](https://www.modelscope.cn/models/AI-ModelScope/bge-small-zh-v1.5) |
| bge-small-zh-v1.5-ONNX<br/>(ONNX量化版) | ~50MB | `assets/models/embedding/bge-small-zh-v1.5-ONNX` | [AI-ModelScope/bge-small-zh-v1.5-ONNX](https://www.modelscope.cn/onnx-community/bge-small-zh-v1.5-ONNX) |
| Qwen2.5-0.5B GGUF | ~415-491MB | `assets/models/llm/` | [Qwen/Qwen2.5-0.5B-Instruct-GGUF](https://www.modelscope.cn/models/Qwen/Qwen2.5-0.5B-Instruct-GGUF) |
| **总计** | **~<1g+** | - | - |

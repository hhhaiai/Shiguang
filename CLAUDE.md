# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with this repository.

## Project Overview

**拾光 (Shiguang)** - 本地知识库 + 碎片捕获 + 日记/备忘/提醒的统一产品

- **产品定位**: Local-First，100% 离线运行，严禁云端后端（允许可选拉取"模型列表"元数据，不上传用户内容）
- **使用形态**: 碎片捕获（语音/文本/截图/OCR）+ 日记 + 备忘 + 提醒
- **核心特性**: 多用户本地强隔离、端侧 AI 摘要提取、端侧向量检索 (Semantic Search)
- **平台**: Android / iOS / PC 有本地服务；Web 作为录入入口（扫描关联 PC 客户端）

## Non-Negotiable Requirements

1. **本地优先**：数据/索引/模型全部本地化，严禁依赖云端后端。
2. **碎片捕获**：语音/文本/截图/OCR/快捷键捕获，日记/备忘/提醒统一。
3. **语音识别**：SenseVoice 本地模型，PCM 实时流式转写追加。
4. **向量检索**：优先 ObjectBox HNSW；性能/稳定性第一；体积可控。
5. **多模型协同**：ASR + Embedding + Summarizer + 对话检索 + 日历/闹钟提醒。
6. **检索策略**：优先本地向量检索；可选“网络检索”作为外部信息入口（用户显式开启，默认关闭，支持搜索引擎级别的公开信息检索）。
7. **模型可切换**：设置内可切换本地模型；允许拉取云端“可用模型列表”元数据（可选、离线可用、无用户数据上传）。
8. **多用户隔离**：本地账号、PIN/密码、切换用户、私密日志策略预留。
9. **跨端形态**：
   - Android / iOS / PC：本地服务可运行（Android 可子进程）
   - Web：仅录入入口，扫码关联 PC 客户端
10. **编辑/分享**：内容可编辑；支持截图导出分享。
11. **提醒能力**：支持日历提醒 + 闹钟提醒（端侧生成、端侧触发）。

## Key Commands

```bash
# 进入项目目录
cd aether_diary

# 安装依赖
flutter pub get

# 生成 ObjectBox 数据库代码
dart run build_runner build --delete-conflicting-outputs

# 运行在设备/模拟器
flutter run -d <device_id>

# 查看可用设备
flutter devices

# 构建 release
flutter build apk --release  # Android
flutter build ios --release  # iOS

# 清理构建
flutter clean && flutter pub get
```

## Docs Index

Detailed execution and design docs live under `docs/`. Start here:

- `docs/README.md`

## Architecture

### Tech Stack

| 类别 | 技术 | 说明 |
|------|------|------|
| **状态管理** | flutter_riverpod + riverpod_annotation | 代码生成方式 |
| **路由** | go_router | 声明式路由 |
| **本地数据库** | ObjectBox (优先) | HNSW 向量检索优先，性能/稳定性第一 |
| **语音识别** | SenseVoice (本地模型) | 语音→文本 |
| **推理内核** | ONNX Runtime (C++) | 端侧推理 |
| **Embedding** | 384 维 (默认) | 速度/体积优先 |
| **对话模型** | Qwen2.5-0.5B int4 (默认) | 低资源占用 |
| **截图分享** | screenshot, share_plus | 图片导出分享 |
| **安全** | crypto (SHA-256), flutter_secure_storage | PIN 码哈希存储 |
| **国际化** | Flutter l10n (.arb 文件) | 标准 i18n，支持多语言 |
| **翻译管理** | .arb 文件 + flutter gen-l10n | 详细见 `docs/I18N.md` |

### Internationalization (i18n)

> **重要**：所有用户可见的字符串必须添加到 `lib/l10n/app_en.arb` 中，使用 Flutter 标准 l10n 系统。

#### i18n 规范
1. **使用 .arb 文件**：所有翻译字符串必须添加到 `lib/l10n/app_*.arb` 文件
2. **运行生成器**：添加新字符串后执行 `flutter gen-l10n`
3. **使用生成的代码**：`AppLocalizations.of(context).yourKey`
4. **禁止硬编码**：禁止在代码中直接写用户可见的字符串
5. **添加描述**：为每个键添加 `@description` 帮助译者理解

#### 当前支持的语言
- 英文 (en) - 源语言
- 简体中文 (zh-Hans)
- 繁体中文 (zh-Hant)

#### 添加新语言
详见 `docs/I18N.md`

### Local Service Protocol (WS, single connection)

Client -> Server:
```json
{"event":"start","format":"pcm16","sample_rate":16000,"channels":1,"use_itn":true}
<PCM binary frames>
{"event":"end"}
```

Server -> Client:
```json
{"event":"partial","text":"...","seq":1}
{"event":"final","text":"...","seq":N}
```

Default endpoint: `ws://127.0.0.1:8008/stream`

Notes:
- 优先 WebSocket 单连接（不采用 HTTP+SSE）；支持实时流式追加与长时录入
- PCM 16kHz / int16 / mono 为默认；位宽与通道数以模型支持为准

### Model Strategy

- 默认使用 **Embedding 384 维**（适配移动端性能）
- 默认对话模型 **Qwen2.5-0.5B int4**
- 支持设置内切换本地模型（未来开放更多开源模型）
- 总体原则：**稳定性与性能优先**，体积与功耗可控
- 可选外部检索：接入搜索引擎级别公开信息（如 Google/Bing/DuckDuckGo 等同类服务），结构化结果供对话引用；不上传用户私密内容

### Code Structure

```
aether_diary/
├── lib/
│   ├── main.dart
│   ├── app/
│   │   ├── app.dart
│   │   └── router/app_router.dart
│   ├── core/
│   │   └── objectbox/
│   │       ├── objectbox_service.dart
│   │       └── objectbox_providers.dart
│   ├── features/
│   │   ├── auth/
│   │   │   ├── data/
│   │   │   │   ├── entities/local_account.dart
│   │   │   │   └── repositories/local_account_repository.dart
│   │   │   └── presentation/
│   │   │       ├── controllers/auth_controller.dart
│   │   │       └── screens/login_screen.dart
│   │   └── diary/
│   │       ├── data/
│   │       │   ├── entities/vector_diary.dart
│   │       │   ├── repositories/vector_diary_repository.dart
│   │       │   └── ai/
│   │       │       ├── sensevoice_local_voice_ai.dart
│   │       │       ├── mock_local_voice_ai.dart
│   │       │       └── mock_local_llm.dart
│   │       ├── domain/
│   │       │   └── interfaces/
│   │       │       ├── i_local_voice_ai.dart
│   │       │       └── i_local_llm.dart
│   │       └── presentation/
│   │           ├── controllers/timeline_controller.dart
│   │           ├── screens/
│   │           │   ├── timeline_screen.dart
│   │           │   └── diary_detail_screen.dart
│   │           └── widgets/diary_input_sheet.dart
│   ├── objectbox.g.dart
│   └── objectbox-model.json
│
├── native/
│   └── sensevoice_ws_server/     # C++ WebSocket 服务 (ONNX Runtime)
│       ├── CMakeLists.txt
│       ├── README.md
│       └── src/main.cpp
│
└── assets/
    └── models/                    # 本地模型文件 (需单独下载)
        ├── sensevoice/
        ├── embedding/
        └── llm/
```

## Local-First Data Flow

```
┌─────────────┐    ┌─────────────────────────┐    ┌─────────────┐
│   麦克风    │───▶│ 本地 WS 服务 (ONNX RT) │───▶│  ObjectBox  │
│   (PCM)    │    │ SenseVoice 识别 /流式  │    │  向量存储   │
└─────────────┘    └─────────────────────────┘    └─────────────┘
```

### Detailed Flow

1. **语音输入**: 用户通过麦克风录音 (PCM 格式)
2. **语音识别**: 本地 WS 服务 (ONNX Runtime) → 文本 (流式)
3. **存储**: ObjectBox 存储日记/备忘/碎片
4. **检索**: 通过向量相似度搜索相关记忆；可选外部搜索增强（结构化结果）
5. **总结/标签**: 端侧模型生成摘要与标签
6. **对话检索**: RAG 融合检索片段形成回答（记忆碎片拼装、多轮追问、可追溯来源）
7. **提醒/日历**: 抽取提醒/待办/日程并融合日历，支持闹钟提醒

## Database Schema

### LocalAccount (用户表)

```dart
@Entity()
class LocalAccount {
  @Id()
  int id;

  @Unique()
  String username;

  String hashedPinCode;  // SHA-256 哈希

  int createdAt;

  int? lastLoginAt;
}
```

### VectorDiary (日记/碎片表)

```dart
@Entity()
class VectorDiary {
  @Id()
  int id;

  int accountId;  // 关联用户

  String rawText;        // 原始文本

  String aiSummary;     // AI 摘要

  String? aiTags;       // JSON 编码的标签列表

  @HnswIndex(dimensions: 384)  // ObjectBox 向量索引 (适配 bge-small-zh-v1.5)
  Float32List? embedding;        // 384维向量

  int createdAt;

  int updatedAt;

  bool isDeleted;
}
```

### LocalReminder (提醒/闹钟表)

```dart
@Entity()
class LocalReminder {
  @Id()
  int id;

  int accountId;  // 关联用户

  int? diaryId;   // 可选关联日记

  String title;

  String? body;

  int triggerAt;  // Unix ms

  String? repeatRule;  // "none" / "daily" / "weekly"

  String? timezone;  // IANA, 如 "Asia/Shanghai"

  bool isEnabled;

  int createdAt;

  int updatedAt;
}
```

## Platform-Specific Notes

- **iOS**: Configure microphone permissions in `ios/Runner/Info.plist`
  - NSMicrophoneUsageDescription
- **Android**: Configure permissions in `android/app/src/main/AndroidManifest.xml`
  - RECORD_AUDIO
  - WRITE_EXTERNAL_STORAGE (for screenshot save)
- **Local Service**: App 启动后拉起本机 WS 服务（Android 可放子进程）
- **PC Future**: 语音录入 / 截图 / OCR / 文本捕捉 / 全局快捷键
- **Web**: 作为录入入口，通过扫描关联 PC 客户端

## Model Download

已将下载了对应库在 accets 目录中



### Model Files (已下载)

| Model | 实际大小 | 目录 | ModelScope 地址 |
|-------|---------|------|----------------|
| SenseVoice (完整版) | ~231MB | `assets/models/sensevoice/` | [tanweiai/sensevoice-small](https://www.modelscope.cn/models/tanweiai/sensevoice-small) |
| SenseVoice (ONNX量化版) | ~160MB | `assets/models/sensevoice-onnx/` | [iic/SenseVoiceSmall-onnx](https://www.modelscope.cn/models/iic/SenseVoiceSmall-onnx) |
| bge-small-zh-v1.5 | ~188MB | `assets/models/embedding/bge-small-zh-v1.5/` | [AI-ModelScope/bge-small-zh-v1.5](https://www.modelscope.cn/models/AI-ModelScope/bge-small-zh-v1.5) |
| bge-small-zh-v1.5-ONNX<br/>(ONNX量化版) | ~50MB | `assets/models/embedding/bge-small-zh-v1.5-ONNX` | [AI-ModelScope/bge-small-zh-v1.5-ONNX](https://www.modelscope.cn/onnx-community/bge-small-zh-v1.5-ONNX) |
| Qwen2.5-0.5B GGUF | ~415-491MB | `assets/models/llm/` | [Qwen/Qwen2.5-0.5B-Instruct-GGUF](https://www.modelscope.cn/models/Qwen/Qwen2.5-0.5B-Instruct-GGUF) |
| **总计** | **~<1g+** | - | - |

### ModelScope 下载方式

```python
from modelscope import snapshot_download

# SenseVoice 完整版
snapshot_download('tanweiai/sensevoice-small')

# SenseVoice ONNX 量化版
snapshot_download('iic/SenseVoiceSmall-onnx')

# Embedding 模型
snapshot_download('AI-ModelScope/bge-small-zh-v1.5')

# LLM 模型 (Qwen2.5-0.5B GGUF)
# GGUF 量化版本建议从 HuggingFace 下载: Qwen/Qwen2.5-0.5B-Instruct-GGUF
```

### 模型量化方法

如需进一步减小模型体积，可使用以下量化方法：

#### 1. Embedding 模型 (bge-small-zh-v1.5) 量化

```bash
# 安装 optimum
pip install optimum[exporters]

# 导出 int8 量化版本
optimum-cli export onnx \
  --model baai/bge-small-zh-v1.5 \
  --quantize q8 \
  --task feature-extraction \
  assets/models/embedding/bge-small-zh-v1.5-onnx/

# 导出 int4 版本
optimum-cli export onnx \
  --model baai/bge-small-zh-v1.5 \
  --quantize q4 \
  --task feature-extraction \
  assets/models/embedding/bge-small-zh-v1.5-onnx-int4/
```

量化后预期大小：
- int8: ~50MB
- int4: ~25MB

#### 2. LLM 模型 (Qwen2.5-0.5B) GGUF 量化

GGUF 量化版本可从 HuggingFace 或 ModelScope 下载：

**ModelScope:**
- 模型ID: [Qwen/Qwen2.5-0.5B-Instruct-GGUF](https://www.modelscope.cn/models/Qwen/Qwen2.5-0.5B-Instruct-GGUF)
- 量化版本: FP16, Q2_K, Q3_K_M, Q4_0, Q4_K_M, Q5_0, Q5_K_M, Q6_K, Q8_0

**HuggingFace:**

| 量化类型 | 大小 | 推荐度 |
|---------|------|--------|
| Q2_K | ~415MB | ⭐⭐⭐⭐⭐ (最小) |
| Q3_K_M | ~432MB | ⭐⭐⭐⭐ |
| Q4_0 | ~429MB | ⭐⭐⭐⭐ |
| Q4_K_M | ~491MB | ⭐⭐⭐ |
| Q5_K_M | ~522MB | ⭐⭐ |

推荐使用 **Q2_K** (2-bit) 量化，体积最小，效果尚可。

#### 3. 模型切换配置

在设置中可通过配置切换模型：

```dart
// 模型配置
const modelConfig = {
  'embedding': {
    'default': 'bge-small-zh-v1.5',
    'options': ['bge-small-zh-v1.5', 'bge-small-zh-v1.5-onnx-int4'],
  },
  'llm': {
    'default': 'qwen2.5-0.5b-instruct-q2_k',
    'options': ['qwen2.5-0.5b-instruct-q2_k', 'qwen2.5-0.5b-instruct-q4_k_m'],
  },
};
```

## Important Notes

1. **ObjectBox**: Generated code in `objectbox.g.dart` - DO NOT EDIT
2. **Vector dimensions**: 默认 384 维（bge-small）
3. **HNSW Index**: Requires Float32List, not List<double>
4. **Local-First**: All data stored locally, no cloud calls for AI processing
5. **Multi-user**: Each user has isolated data via accountId
6. **Performance First**: 以稳定性/性能为第一优先级
7. **Model List**: 可选拉取云端“模型列表”元数据，仅用于展示与下载入口，不上传用户数据

## Development Status

### Completed
- [x] ObjectBox database with vector search
- [x] Multi-user authentication (PIN-based)
- [x] Timeline UI (Dawnary style)
- [x] Diary detail with screenshot/share
- [x] SenseVoice WS protocol wired in Flutter client
- [x] C++ WS server skeleton (CMake + ONNX Runtime ready)
- [x] 本地模型文件下载 (SenseVoice + Embedding + LLM)
- [x] Embedding 维度统一为 384 + ObjectBox schema 已重建
- [x] 本地 Embedding ONNX Runtime 推理接入（含 tokenizer + 384 维向量写入）
- [x] SenseVoice 端内 ONNX Runtime 推理 MVP（本地 PCM -> 文本）
- [x] WS 结束等待 final，避免尾段丢失
- [x] ObjectBox 查询流关闭 query，防止资源泄漏
- [x] 详情页宽度自适应移动端
- [x] PIN 哈希升级为 PBKDF2-HMAC-SHA256 (salted)

### In Progress
- [ ] C++ WS server with ONNX Runtime inference
- [ ] SenseVoice 流式精度与性能优化（移动端）

### Future
- [ ] Semantic search (RAG)
- [ ] Reminder / Calendar / Alarm integration
- [ ] Screenshot / OCR capture (PC)
- [ ] Model switcher (settings)
- [ ] Optional Web Search connector (opt-in)

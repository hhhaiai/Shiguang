# 拾光 (Shiguang)

本地优先的 AI 记忆系统：碎片捕获、时间轴回顾、语义检索与智能提醒。

## 当前定位

- 产品名：`Shiguang`（拾光）
- Flutter 包名：`shiguang`
- 移动端应用 ID：`com.sanbo.shiguang`
- 核心原则：`Local-First`、隐私优先、离线可用优先

## 已落地能力

- 多用户本地账号与 PIN 隔离
- 时间轴记录、详情编辑、图片分享
- Markdown 详情预览/分享渲染（含公式、Mermaid；Draw.io 当前为占位显示）
- 语音录入（端内 ASR）+ 文本录入
- ObjectBox 本地存储 + 384 维向量索引
- 本地 Embedding 生成与语义检索
- AI 对话（本地/远程多提供方）
- 可选网络检索（默认关闭）
- 通知提醒调度（本地）
- 多语言国际化（Flutter l10n）

## 技术栈（当前）

| 类别 | 技术 |
|---|---|
| 状态管理 | flutter_riverpod + riverpod_annotation |
| 路由 | go_router |
| 本地数据库 | ObjectBox（含 HNSW 向量） |
| 语音识别 | SenseVoice ONNX / 系统识别 / endpoint |
| Embedding | bge-small-zh-v1.5-ONNX（384 维） |
| 本地提醒 | flutter_local_notifications + timezone |
| 国际化 | Flutter l10n (`lib/l10n/app_*.arb`) |

## 项目结构（关键）

```text
lib/
  app/
    app.dart
    app_router.dart
  core/
    i18n/
    objectbox/
    ui/
    utils/
  features/
    auth/
    diary/
    reminder/
    settings/
  l10n/
  main.dart
```

## 快速开始

```bash
# 1) 安装依赖
flutter pub get

# 2) 生成代码（Riverpod/ObjectBox）
dart run build_runner build --delete-conflicting-outputs

# 3) 运行
flutter devices
flutter run -d <device_id>
```

## 测试与分析

```bash
flutter test

dart analyze lib test
```

## Android / iOS

```bash
# Android 通用包（3 ABI）
./scripts/android_universal_release_build.sh

# Android 快速调试安装
./scripts/android_fast_debug_install.sh <device_id>

# iOS
flutter build ios --release
```

## 文档入口

- 项目主追踪：`CLAUDE.md`
- 规格说明：`docs/SPEC.md`
- 进度对照：`docs/COMPARISON_MATRIX.md`
- 国际化：`docs/I18N.md`

## 说明

- 数据库已统一为 `ObjectBox`。
- `objectbox.g.dart` 与 `lib/l10n/generated/*` 为生成文件，不手改。
- 外部检索默认关闭；当前是基础检索 + 结果预览，后续将按路线升级为更高质量的数据提取与融合策略。

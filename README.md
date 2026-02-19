# 拾光 (Shiguang)

记录时光，拾取记忆 - 本地优先的 AI 知识库

## 功能特性

- **全终端碎片捕获**: 支持文字、语音（SenseVoice）快速录入
- **本地 AI 处理**: 所有数据存储在本地 SQLite (Drift) 数据库
- **自动整理**: 调用本地 LLM 将杂乱内容自动整理成标准 Markdown
- **语义标签**: AI 自动打标签，便于分类检索
- **响应式 UI**: 移动端与 PC 端自适应布局

## 技术栈

| 类别 | 技术 |
|------|------|
| 状态管理 | flutter_riverpod |
| 路由管理 | go_router |
| 本地数据库 | drift (SQLite) |
| 日志 | talker_flutter |
| 网络 | dio |
| 语音输入 | SenseVoice (本地模型) |

## 项目结构

```
lib/
├── main.dart                 # 应用入口
├── app.dart                  # App 根组件
├── core/
│   ├── database/
│   │   ├── database.dart     # Drift 数据库定义
│   │   └── database.g.dart   # 生成的数据库代码
│   ├── network/
│   │   ├── llm_service.dart       # LLM 服务
│   │   └── sensevoice_service.dart # SenseVoice 语音服务
│   └── logger/
│       └── logger_service.dart   # 日志服务
├── features/notes/
│   ├── domain/
│   │   └── note_entity.dart      # Note 实体
│   ├── data/repositories/
│   │   └── note_repository.dart # 数据仓库
│   └── presentation/
│       ├── providers/
│       │   └── notes_provider.dart   # Riverpod Providers
│       ├── screens/
│       │   ├── home_screen.dart       # 首页
│       │   └── note_detail_screen.dart
│       └── widgets/
│           ├── responsive_scaffold.dart
│           ├── quick_input_bar.dart
│           ├── note_card.dart
│           └── note_list.dart
└── router/
    └── app_router.dart            # Go Router 配置
```

## 快速开始

### 1. 安装 Flutter

```bash
# 克隆 Flutter SDK
git clone https://github.com/flutter/flutter.git -b stable ~/flutter

# 添加到 PATH
export PATH="$HOME/flutter/bin:$PATH"

# 验证安装
flutter --version
```

### 2. 安装依赖

```bash
cd personal_ai_brain

# 安装 Flutter 依赖
flutter pub get

# 生成 Drift 数据库代码
dart run build_runner build --delete-conflicting-outputs
```

### 3. 运行项目

```bash
# 列出可用设备
flutter devices

# 运行到 iOS 模拟器
flutter run -d "iPhone 16 Pro"

# 运行到 Android 设备
flutter run -d <device_id>
```

### 4. 构建发布

```bash
# iOS
flutter build ios --release

# Android
flutter build apk --release
```

## SenseVoice 集成

### 本地模型部署（Phase 2）

项目当前使用模拟的语音识别。生产环境需要部署 SenseVoice 本地模型：

#### 方案 A: 本地 HTTP 服务

```bash
# 1. 部署 SenseVoice HTTP 服务
# 参考: https://github.com/FunAudioLLM/SenseVoice

# 2. 修改 sensevoice_service.dart 调用本地服务
```

#### 方案 B: FFI 直接调用

```bash
# 1. 下载 SenseVoice 模型
# ModelScope: iic/SenseVoiceSmall
# HuggingFace: FunAudioLLM/SenseVoiceSmall

# 2. 编译 C++ 推理库
# 参考: https://github.com/ggerganov/llama.cpp

# 3. 使用 flutter_ffi 集成
```

## 多设备同步

推荐使用 LocalSend 实现局域网 P2P 同步：

- **LocalSend**: https://localsend.org/
- **原理**: 基于 mDNS 发现 + HTTP 传输
- **优势**: 无需互联网，纯本地局域网同步

## 隐私说明

- 所有笔记数据存储在本地设备
- 不主动上传任何数据到云端
- 语音识别使用本地模型（推荐）
- 本地 LLM 处理确保数据不离开设备

# 模型管理文档

> 说明：以下为**目标与建议配置**，实际性能需以真机/桌面实测为准。

## 模型清单（默认）

| 模型名称 | 大小 | 维度 | 格式 | 用途 | 备注 |
|---------|------|------|------|------|------|
| **SenseVoice** | ~241MB | - | ONNX | 语音识别 | 本地流式 ASR |
| **bge-small-zh-v1.5** | ~20MB | 384 | ONNX | 文本嵌入 | 默认 Embedding |
| **Qwen2.5-0.5B int4** | ~415MB | - | GGUF/ONNX(可选) | 对话/摘要 | 运行时待定 |
| **总计** | **~676MB** | - | - | - | - |

## 运行时策略

- **ASR / Embedding**：优先 ONNX Runtime
- **LLM**：优先 GGUF (llama.cpp)；如有稳定 ONNX 版本可切换
- **模型可切换**：设置内允许切换本地模型
- **可选模型列表元数据**：允许拉取云端“可用模型列表”用于展示/下载入口，不上传用户内容

## 模型角色划分（整体逻辑）

- **ASR**：语音 → 文本（SenseVoice）
- **Embedding**：文本 → 向量（本地语义检索）
- **LLM**：摘要/标签/对话（端侧）
- **可选外部检索**：仅获取公开信息，作为对话增强的外部来源
  - 搜索级别能力：对标 Google/Bing/DuckDuckGo 等同类搜索引擎
  - 结构化输出：title/snippet/url/publishedAt/source

## SenseVoice (语音识别)

**输入**: PCM 16kHz, int16, mono
**输出**: 文本流（实时）

**配置示例**:
```json
{
  "sample_rate": 16000,
  "channels": 1,
  "bit_depth": 16,
  "language": "auto",
  "use_itn": true
}
```

## bge-small-zh-v1.5 (Embedding)

- 维度: 384
- 输入: 文本
- 输出: Float32List[384]

## Qwen2.5-0.5B int4 (对话/摘要)

- 参数量: 0.5B
- 量化: int4
- 用途: 摘要生成、标签提取、对话检索

## 模型下载

**下载脚本**:
```bash
# 下载所有模型
./scripts/download_models.sh all

# 单独下载
./scripts/download_models.sh sensevoice   # ~241MB
./scripts/download_models.sh embedding    # ~20MB
./scripts/download_models.sh llm          # ~415MB
```

## 模型存储结构

```
assets/
└── models/
    ├── sensevoice/
    │   ├── model.onnx
    │   └── config.json
    ├── embedding/
    │   ├── model.onnx
    │   └── config.json
    └── llm/
        ├── model.gguf
        └── config.json
```

## 模型版本管理

**版本文件** (`assets/models/versions.json`):
```json
{
  "models": {
    "sensevoice": {
      "name": "SenseVoice-small",
      "version": "1.0.0",
      "size": "241MB",
      "checksum": "sha256:xxxx"
    },
    "embedding": {
      "name": "bge-small-zh-v1.5",
      "version": "1.5.0",
      "size": "20MB",
      "dimensions": 384,
      "checksum": "sha256:xxxx"
    },
    "llm": {
      "name": "Qwen2.5-0.5B-int4",
      "version": "2.5.0",
      "size": "415MB",
      "checksum": "sha256:xxxx"
    }
  }
}
```

## 加载与初始化（伪代码）

```dart
class ModelService {
  static Future<void> initialize() async {
    await _checkModelFiles();
    await _loadSenseVoice();
    await _loadEmbeddingModel();
    await _loadLLMModel();
    await _warmupModels();
  }
}
```

> 注：真实运行时路径、API 与加载逻辑以实际实现为准。

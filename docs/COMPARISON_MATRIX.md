# SPEC 对照矩阵（简要）

| 要求 / 功能 | SPEC 期望 | 当前实现（仓库） | 状态 | 备注 |
|---|---:|---|---:|---|
| 本地数据库 | ObjectBox (HNSW) | ObjectBox | 匹配 | 向量检索为优先基建 |
| 状态管理 | flutter_riverpod | Riverpod + codegen | 匹配 | 与规范一致 |
| 路由 | go_router | go_router | 匹配 | 版本需随 Flutter 更新 |
| 语音输入 | SenseVoice 本地 | 端内 ONNX ASR(MVP) + 本地 WS 兼容 | 部分匹配 | 已本地化，流式精度/性能需继续优化 |
| 向量检索 | 本地 Embedding + HNSW | 本地 ONNX Embedding + ObjectBox HNSW | 匹配 | 已落地本地向量链路 |
| 用户系统 | 本地多用户隔离 | LocalAccount + PIN | 匹配 | 数据隔离 via accountId |
| LLM 处理 | 端侧摘要/标签/对话 | Mock LLM | 部分匹配 | 真实模型待接入 |
| 编辑/分享 | 可编辑 + 图片分享 | 详情页已支持 | 匹配 | 样式可继续优化 |
| PC 捕获 | 快捷键 + OCR | 未实现 | 未实现 | Phase 2/3 |
| Web 入口 | 扫码关联 | 未实现 | 未实现 | Phase 3 |

总结：
- 当前实现与“ObjectBox + 本地优先 + 端侧模型”方向一致。
- 主要缺口：端侧 LLM、ASR 流式体验优化、PC/Web 端入口。

# 项目文档索引

欢迎来到 **拾光 (Shiguang)** 文档中心。

## 📚 文档清单

### 核心文档

| 文档名称 | 描述 | 目标读者 |
|---------|------|----------|
| [**CLAUDE.md**](../CLAUDE.md) | 项目核心指南，包含架构、命令、技术栈 | 所有开发者 |
| [**PROJECT_OVERVIEW.md**](PROJECT_OVERVIEW.md) | 项目愿景、痛点、解决方案 | 产品经理、新成员 |
| [**SPEC.md**](SPEC.md) | 技术规格、数据库设计、开发阶段 | 架构师、开发者 |
| [**COMPARISON_MATRIX.md**](COMPARISON_MATRIX.md) | SPEC与实现的对比矩阵 | 项目经理、QA |

### 补充文档

| 文档名称 | 描述 | 目标读者 |
|---------|------|----------|
| [**interaction.md**](interaction.md) | 交互设计、用户流程、动效规范 | UI/UX设计师、前端 |
| [**models.md**](models.md) | 模型管理、下载、加载、切换 | AI工程师、后端 |
| [**performance.md**](performance.md) | 性能指标、优化、监控 | 性能工程师、架构师 |

## 🎯 快速开始

### 新成员入职

1. 阅读 [PROJECT_OVERVIEW.md](PROJECT_OVERVIEW.md) 了解项目愿景
2. 阅读 [CLAUDE.md](../CLAUDE.md) 掌握核心架构和技术栈
3. 查看 [SPEC.md](SPEC.md) 理解技术约束和开发阶段
4. 根据角色阅读相关补充文档

### 开发任务

#### 前端/UI开发
- [interaction.md](interaction.md) - 交互设计规范
- [CLAUDE.md#Code Structure](../CLAUDE.md#code-structure) - 代码结构

#### AI/模型集成
- [models.md](models.md) - 模型管理完整指南
- [performance.md#向量生成性能](performance.md#向量生成性能) - 性能指标

#### 性能优化
- [performance.md](performance.md) - 完整性能指标和优化方案
- [COMPARISON_MATRIX.md](COMPARISON_MATRIX.md) - 当前实现差距

## 📖 文档更新规范

### 何时更新文档

- ✅ 修改核心架构时 → 更新 CLAUDE.md
- ✅ 新增用户流程时 → 更新 interaction.md
- ✅ 集成新模型时 → 更新 models.md
- ✅ 性能优化后 → 更新 performance.md
- ✅ 需求变更时 → 更新 SPEC.md 和 COMPARISON_MATRIX.md

### 文档质量标准

1. **准确性**: 与实际代码保持一致
2. **完整性**: 涵盖所有关键信息
3. **时效性**: 及时更新，避免过期
4. **可读性**: 结构清晰，语言简洁

## 🔗 相关资源

- 主仓库: `/Users/sanbo/Desktop/PersonalAIBrain`
- Flutter 项目: `/Users/sanbo/Desktop/PersonalAIBrain`
- 本地服务脚本: `/Users/sanbo/Desktop/PersonalAIBrain/scripts/llm_server.py`

## 📝 最近更新

- 2026-02-16: 对齐 ObjectBox + 本地 WS + 端侧模型方向

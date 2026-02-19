# 性能指标文档

> 说明：以下为**目标指标与建议测试方法**，当前实现需以真机/桌面实测为准。

## 核心性能指标

### 启动性能

| 指标 | 目标值 | 测量方法 | 优化手段 |
|------|--------|----------|----------|
| **冷启动时间** | < 3秒 | 从点击图标到可交互 | 延迟加载模型 |
| **热启动时间** | < 1秒 | 从后台恢复到可交互 | 保持内存缓存 |
| **模型加载时间** | < 2秒 | ONNX Runtime初始化 | 异步加载 + 预加载 |
| **首屏渲染时间** | < 500ms | Flutter首帧渲染 | 减少初始Widget |

**测量代码**:
```dart
void main() {
  final startupTime = DateTime.now();
  
  runApp(
    StartupTracker(
      onReady: () {
        final duration = DateTime.now().difference(startupTime);
        print('启动耗时: ${duration.inMilliseconds}ms');
        Analytics.log('startup_time', duration.inMilliseconds);
      },
      child: MyApp(),
    ),
  );
}
```

---

### 语音处理性能

| 指标 | 目标值 | 测量方法 | 优化手段 |
|------|--------|----------|----------|
| **语音延迟** | < 500ms | 说话到文字显示 | 流式推理 + 硬件加速 |
| **识别准确率** | > 95% | 标准普通话测试集 | 模型微调 + 降噪 |
| **实时因子** | < 0.3 | 处理时间/音频时长 | 并行处理 |
| **内存占用** | < 100MB | 语音识别运行时 | 量化模型 |

**测量代码**:
```dart
class VoiceMetrics {
  static int _audioStartTime = 0;
  static int _textDisplayTime = 0;
  
  static void onAudioStart() {
    _audioStartTime = DateTime.now().millisecondsSinceEpoch;
  }
  
  static void onTextDisplay() {
    _textDisplayTime = DateTime.now().millisecondsSinceEpoch;
    final latency = _textDisplayTime - _audioStartTime;
    
    Analytics.log('voice_latency', latency);
    
    if (latency > 500) {
      print('警告: 语音延迟过高: $latency ms');
    }
  }
}
```

---

### 向量生成性能

| 指标 | 目标值 | 测量方法 | 优化手段 |
|------|--------|----------|----------|
| **单条生成时间** | < 1秒 | bge模型推理 | ONNX Runtime优化 |
| **批量生成速度** | > 10条/秒 | 平均处理速度 | 批处理 + 并行 |
| **内存占用** | < 50MB | 嵌入模型运行时 | int8量化 |
| **CPU占用** | < 30% | 单核占用 | 多线程优化 |

**基准测试**:
```dart
class EmbeddingBenchmark {
  static Future<void> run() async {
    final model = await EmbeddingModel.load();
    final testTexts = List.generate(100, (i) => '测试文本 $i');
    
    // 单条测试
    final sw = Stopwatch()..start();
    for (final text in testTexts) {
      await model.generate(text);
    }
    sw.stop();
    
    final avgTime = sw.elapsedMilliseconds / testTexts.length;
    print('平均单条生成时间: ${avgTime}ms');
    
    // 批量测试
    sw.reset()..start();
    await model.generateBatch(testTexts);
    sw.stop();
    
    final batchTime = sw.elapsedMilliseconds / testTexts.length;
    print('批量平均时间: ${batchTime}ms');
    print('加速比: ${avgTime / batchTime}x');
  }
}
```

---

### 检索性能

| 指标 | 目标值 | 测量方法 | 优化手段 |
|------|--------|----------|----------|
| **检索响应** | < 100ms | 10万条数据查询 | HNSW索引 |
| **索引构建** | < 5分钟 | 10万条构建时间 | 增量构建 |
| **召回率** | > 90% | Top-10命中率 | 调整M/ef参数 |
| **内存占用** | < 500MB | 索引内存占用 | 量化向量 |

**HNSW参数调优**:
```dart
@Entity()
class VectorDiary {
  @HnswIndex(
    dimensions: 384,
    neighborsPerNode: 32,  // M参数，平衡精度和内存
    indexingSearchCount: 100,  // efConstruction
  )
  Float32List? embedding;
}

// 查询参数
final query = box.query(VectorDiary_.embedding.nearestNeighbors(
  queryVector,
  limit: 10,
  paramEf: 64,  // efSearch，查询时平衡精度和速度
));
```

**性能测试**:
```dart
class SearchBenchmark {
  static Future<void> run() async {
    final repository = await VectorDiaryRepository.create();
    
    // 准备测试数据
    final testQueries = List.generate(100, (i) {
      return Float32List.fromList(
        List.generate(384, (_) => Random().nextDouble())
      );
    });
    
    // 测试检索性能
    final sw = Stopwatch()..start();
    for (final query in testQueries) {
      await repository.findSimilar(query, limit: 10);
    }
    sw.stop();
    
    final avgTime = sw.elapsedMilliseconds / testQueries.length;
    print('平均检索时间: ${avgTime}ms');
    
    if (avgTime > 100) {
      print('警告: 检索性能不达标');
    }
  }
}
```

---

### 存储性能

| 指标 | 目标值 | 测量方法 | 优化手段 |
|------|--------|----------|----------|
| **单条写入** | < 20ms | 插入+索引更新 | 批量写入 |
| **批量导入** | > 100条/秒 | 千条数据导入 | 事务批量 |
| **数据库大小** | < 2GB | 10万条数据 | 384维向量 |
| **增长速率** | < 10MB/千条 | 平均每条约10KB | 压缩文本 |

**存储分析**:
```dart
class StorageAnalyzer {
  static Future<void> analyze() async {
    final box = await ObjectBoxService.create();
    
    // 获取数据库文件大小
    final dbFile = File('${box.directory}/data.mdb');
    final sizeMB = (await dbFile.length()) / 1024 / 1024;
    
    print('数据库大小: ${sizeMB.toStringAsFixed(2)} MB');
    
    // 统计条目数
    final count = box.diaryBox.count();
    print('条目数: $count');
    
    // 计算平均每条约大小
    final avgSize = sizeMB * 1024 / count;
    print('平均每条约: ${avgSize.toStringAsFixed(2)} KB');
    
    // 预估10万条大小
    final estimatedSize = avgSize * 100000 / 1024;
    print('预估10万条大小: ${estimatedSize.toStringAsFixed(2)} MB');
  }
}
```

---

### 内存占用

| 指标 | 目标值 | 测量方法 | 优化手段 |
|------|--------|----------|----------|
| **运行时内存** | < 100MB | 仅App运行时 | 延迟加载 |
| **模型加载后** | < 800MB | 所有模型加载 | 按需加载 |
| **语音录音时** | < 900MB | 录音+识别 | 音频缓冲控制 |
| **内存泄漏** | < 10MB/小时 | 长时间运行 | 定期GC |

**内存监控**:
```dart
import 'dart:io';

class MemoryMonitor {
  static void startMonitoring() {
    Timer.periodic(Duration(seconds: 10), (_) {
      final usage = ProcessInfo.currentRss;
      final usageMB = usage / 1024 / 1024;
      
      print('当前内存占用: ${usageMB.toStringAsFixed(2)} MB');
      
      Analytics.log('memory_usage', usageMB);
      
      if (usageMB > 900) {
        print('警告: 内存占用过高!');
        _releaseResources();
      }
    });
  }
  
  static void _releaseResources() {
    // 释放非必要资源
    ModelPool.clear();
    ImageCache.clear();
    SystemNavigator.pop();
  }
}
```

---

### 电池消耗

| 指标 | 目标值 | 测量方法 | 优化手段 |
|------|--------|----------|----------|
| **待机消耗** | < 1%/小时 | 后台运行 | 释放资源 |
| **录音消耗** | < 5%/小时 | 持续录音 | 硬件加速 |
| **AI处理消耗** | < 8%/小时 | 持续生成 | 批量处理 |
| **屏幕常亮** | < 15%/小时 | 正常使用 | 暗色模式 |

**电池监控**:
```dart
import 'package:battery_plus/battery_plus.dart';

class BatteryMonitor {
  static final Battery _battery = Battery();
  static int _lastLevel = 100;
  static DateTime _lastTime = DateTime.now();
  
  static void startMonitoring() {
    Timer.periodic(Duration(minutes: 5), (_) async {
      final level = await _battery.batteryLevel;
      final now = DateTime.now();
      
      final timeDiff = now.difference(_lastTime).inMinutes;
      final levelDiff = _lastLevel - level;
      
      if (timeDiff > 0) {
        final consumptionRate = levelDiff / timeDiff * 60; // %/小时
        print('电池消耗速率: ${consumptionRate.toStringAsFixed(2)}%/小时');
        
        Analytics.log('battery_consumption', consumptionRate);
      }
      
      _lastLevel = level;
      _lastTime = now;
    });
  }
}
```

---

### 网络性能

| 指标 | 目标值 | 测量方法 | 优化手段 |
|------|--------|----------|----------|
| **WebSocket延迟** | < 100ms | 本地服务通信 | 本地回环 |
| **模型下载速度** | > 1MB/s | 模型拉取 | 断点续传 |
| **元数据请求** | < 500ms | 模型列表获取 | 缓存策略 |
| **离线可用性** | 100% | 无网络功能 | 本地优先 |

---

## 性能测试方案

### 自动化基准测试

```dart
// test/benchmark_test.dart
void main() {
  group('Performance Benchmarks', () {
    test('启动性能测试', () async {
      // 测量冷启动时间
    });
    
    test('语音延迟测试', () async {
      // 测量语音识别延迟
    });
    
    test('向量生成测试', () async {
      // 测量Embedding性能
    });
    
    test('检索性能测试', () async {
      // 测量HNSW检索速度
    });
    
    test('内存占用测试', () async {
      // 测量运行时内存
    });
  });
}
```

### 性能回归测试

**CI/CD集成**:
```yaml
# .github/workflows/performance.yml
name: Performance Regression Test

on:
  pull_request:
    branches: [main]

jobs:
  benchmark:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        
      - name: Run Performance Tests
        run: |
          flutter test test/benchmark_test.dart --benchmark
          
      - name: Compare Results
        run: |
          # 与基线对比，如果性能下降超过10%则失败
          dart tool/compare_benchmark.dart
```

---

## 性能优化清单

### 已实施的优化

- [x] 384维向量 (内存降低75%)
- [x] ONNX Runtime加速 (推理速度提升3-5倍)
- [x] 异步模型加载 (启动时间不阻塞)
- [x] 批量处理 (批量速度提升2-3倍)
- [x] HNSW向量索引 (检索速度 < 100ms)

### 待实施的优化

- [ ] 模型量化 (int8/int4，内存再降50%)
- [ ] 向量压缩 (存储再降4倍)
- [ ] GPU加速 (移动端GPU推理)
- [ ] 内存池管理 (减少GC压力)
- [ ] 智能预加载 (预测性加载模型)

### 未来优化方向

- [ ] 模型蒸馏 (减小模型体积)
- [ ] 分布式推理 (多端协同)
- [ ] 自适应精度 (动态调整精度)
- [ ] 边缘缓存 (CDN-like模型分发)

---

## 性能监控告警

### 告警规则

| 指标 | 阈值 | 级别 | 处理措施 |
|------|------|------|----------|
| 启动时间 | > 5秒 | 警告 | 分析启动链路 |
| 语音延迟 | > 1000ms | 严重 | 检查模型加载 |
| 检索时间 | > 500ms | 警告 | 优化索引参数 |
| 内存占用 | > 1000MB | 严重 | 释放资源 |
| 电池消耗 | > 10%/小时 | 警告 | 降低处理频率 |

**告警通知**:
```dart
class PerformanceAlert {
  static void sendAlert(String metric, double value, String level) {
    // 发送通知到开发者
    DeveloperTool.sendAlert({
      'metric': metric,
      'value': value,
      'level': level,
      'device': DeviceInfo.get(),
    });
  }
}
```

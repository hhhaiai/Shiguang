import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../../../../core/utils/local_endpoint_policy.dart';
import '../../domain/interfaces/i_local_llm.dart';

/// QWEN local LLM via HTTP (Ollama/OpenAI-compatible APIs).
class QwenLocalLLM implements ILocalLLM {
  static const String _defaultEndpoint = 'http://127.0.0.1:11434';
  static const String _defaultModel = 'qwen2.5:0.5b';
  static const int _maxTokens = 512;
  static const double _temperature = 0.7;
  static const Duration _requestTimeout = Duration(seconds: 90);

  final String _endpoint;
  final String _model;
  final bool _enforceLocalEndpoint;
  String? _fallbackModel;

  QwenLocalLLM({
    String? endpoint,
    String? model,
    bool enforceLocalEndpoint = true,
  }) : _endpoint = _normalizeEndpoint(endpoint ?? _defaultEndpoint),
       _model = model ?? _defaultModel,
       _enforceLocalEndpoint = enforceLocalEndpoint;

  static String _normalizeEndpoint(String raw) {
    final parsed = Uri.tryParse(raw.trim());
    if (parsed == null) {
      return _defaultEndpoint;
    }

    if (parsed.scheme == 'ws' || parsed.scheme == 'wss') {
      final normalized = parsed.replace(
        scheme: parsed.scheme == 'wss' ? 'https' : 'http',
      );
      return normalized.toString();
    }

    return parsed.toString();
  }

  Uri get _baseUri => Uri.parse(_endpoint);
  bool get _allowPrivateNetwork => !Platform.isAndroid;
  String get _endpointPolicyLabel =>
      _allowPrivateNetwork ? 'local loopback/private LAN' : 'local loopback';

  @override
  Future<String> summarize(String text) async {
    final prompt = '''请用一句话概括以下内容：

$text

摘要：''';

    return chat(message: prompt, context: const []);
  }

  @override
  Future<List<String>> extractTags(String text) async {
    final prompt = '''从以下文本中提取关键词标签（只返回标签，用逗号分隔）：

$text

标签：''';

    final result = await chat(message: prompt, context: const []);
    return result
        .split(RegExp(r'[,，、\n]'))
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .take(5)
        .toList();
  }

  @override
  Future<Float32List> generateEmbedding(String text) async {
    throw UnsupportedError(
      'QwenLocalLLM.generateEmbedding is disabled. Use EmbeddingService for embeddings.',
    );
  }

  @override
  Future<String> chat({
    required String message,
    List<ChatMessage> context = const [],
  }) async {
    _ensureEndpointAllowed();

    try {
      final primaryModel = _fallbackModel ?? _model;
      final primary = await _tryAllProtocols(
        model: primaryModel,
        message: message,
        context: context,
      );
      if (primary != null && primary.isNotEmpty) {
        return primary;
      }

      final discovered = await _discoverAvailableModel();
      if (discovered != null && discovered != primaryModel) {
        _fallbackModel = discovered;
        final retry = await _tryAllProtocols(
          model: discovered,
          message: message,
          context: context,
        );
        if (retry != null && retry.isNotEmpty) {
          return retry;
        }
      }

      final expected = _fallbackModel ?? _model;
      throw Exception(
        'LLM 服务返回空结果。当前模型: $expected，endpoint: $_endpoint',
      );
    } on TimeoutException {
      throw Exception('LLM request timeout');
    } catch (e) {
      if (e is ArgumentError || e is Exception) rethrow;
      throw Exception('LLM request failed: $e');
    }
  }

  Future<String?> _tryAllProtocols({
    required String model,
    required String message,
    required List<ChatMessage> context,
  }) async {
    final chat = await _sendOllamaChatRequest(
      model: model,
      message: message,
      context: context,
    );
    if (chat != null && chat.isNotEmpty) {
      return chat;
    }

    final generate = await _sendOllamaGenerateRequest(
      model: model,
      message: message,
      context: context,
    );
    if (generate != null && generate.isNotEmpty) {
      return generate;
    }

    final openAi = await _sendOpenAiCompatRequest(
      model: model,
      message: message,
      context: context,
    );
    if (openAi != null && openAi.isNotEmpty) {
      return openAi;
    }

    return null;
  }

  Future<String?> _sendOllamaChatRequest({
    required String model,
    required String message,
    required List<ChatMessage> context,
  }) {
    final uri = _baseUri.resolve('/api/chat');
    final body = {
      'model': model,
      'messages': _buildMessages(message: message, context: context),
      'stream': false,
      'options': {'temperature': _temperature, 'num_predict': _maxTokens},
    };
    return _postAndExtractText(uri: uri, body: body, routeName: '/api/chat');
  }

  Future<String?> _sendOllamaGenerateRequest({
    required String model,
    required String message,
    required List<ChatMessage> context,
  }) {
    final uri = _baseUri.resolve('/api/generate');
    final body = {
      'model': model,
      'prompt': _buildPrompt(message: message, context: context),
      'stream': false,
      'options': {'temperature': _temperature, 'num_predict': _maxTokens},
    };
    return _postAndExtractText(
      uri: uri,
      body: body,
      routeName: '/api/generate',
    );
  }

  Future<String?> _sendOpenAiCompatRequest({
    required String model,
    required String message,
    required List<ChatMessage> context,
  }) {
    final uri = _baseUri.resolve('/v1/chat/completions');
    final body = {
      'model': model,
      'messages': _buildMessages(message: message, context: context),
      'temperature': _temperature,
      'max_tokens': _maxTokens,
      'stream': false,
    };
    return _postAndExtractText(
      uri: uri,
      body: body,
      routeName: '/v1/chat/completions',
    );
  }

  Future<String?> _postAndExtractText({
    required Uri uri,
    required Map<String, dynamic> body,
    required String routeName,
  }) async {
    final response = await http
        .post(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body),
        )
        .timeout(_requestTimeout);

    final responseText = utf8.decode(response.bodyBytes, allowMalformed: true);

    if (response.statusCode == 200) {
      final parsed = _tryDecodeJson(responseText);
      final extracted = _extractText(parsed) ?? responseText.trim();
      if (extracted.isNotEmpty) {
        return extracted;
      }
      throw Exception('Invalid response format from $routeName: $responseText');
    }

    if (_isRetryableMissingModel(responseText) ||
        _isUnsupportedRoute(response.statusCode, responseText, routeName)) {
      return null;
    }

    throw Exception(
      'LLM request failed on $routeName: ${response.statusCode} $responseText',
    );
  }

  List<Map<String, String>> _buildMessages({
    required String message,
    required List<ChatMessage> context,
  }) {
    return <Map<String, String>>[
      {'role': 'system', 'content': '你是一个友好的AI助手，请用中文回答用户的问题。'},
      ...context.map((m) => {'role': m.role, 'content': m.content}),
      {'role': 'user', 'content': message},
    ];
  }

  String _buildPrompt({
    required String message,
    required List<ChatMessage> context,
  }) {
    final sb = StringBuffer();
    sb.writeln('系统: 你是一个友好的AI助手，请用中文回答用户的问题。');
    for (final item in context) {
      final role = item.role == 'assistant' ? '助手' : '用户';
      sb.writeln('$role: ${item.content}');
    }
    sb.writeln('用户: $message');
    sb.write('助手:');
    return sb.toString();
  }

  dynamic _tryDecodeJson(String body) {
    try {
      return jsonDecode(body);
    } catch (_) {
      return body;
    }
  }

  String? _extractText(dynamic data) {
    if (data == null) return null;

    if (data is String) {
      final trimmed = data.trim();
      return trimmed.isEmpty ? null : trimmed;
    }

    if (data is List) {
      for (final item in data) {
        final text = _extractText(item);
        if (text != null && text.isNotEmpty) {
          return text;
        }
      }
      return null;
    }

    if (data is Map) {
      final map = data.map((k, v) => MapEntry(k.toString(), v));

      final message = map['message'];
      if (message is Map) {
        final content = _extractText(message['content']);
        if (content != null) return content;
      }

      final delta = map['delta'];
      if (delta is Map) {
        final content = _extractText(delta['content']);
        if (content != null) return content;
      }

      final choices = map['choices'];
      if (choices is List && choices.isNotEmpty) {
        final choiceText = _extractText(choices.first);
        if (choiceText != null) return choiceText;
      }

      for (final key in [
        'response',
        'text',
        'content',
        'result',
        'output',
        'answer',
        'reply',
      ]) {
        final value = _extractText(map[key]);
        if (value != null && value.isNotEmpty) {
          return value;
        }
      }

      final nestedData = _extractText(map['data']);
      if (nestedData != null) {
        return nestedData;
      }
    }

    return null;
  }

  bool _isRetryableMissingModel(String body) {
    final normalized = body.toLowerCase();
    return normalized.contains('model') &&
        (normalized.contains('not found') || normalized.contains('pull'));
  }

  bool _isUnsupportedRoute(int statusCode, String body, String routeName) {
    if (statusCode == 404 || statusCode == 405) {
      return true;
    }
    final normalized = body.toLowerCase();
    return normalized.contains('not found') && normalized.contains(routeName);
  }

  Future<String?> _discoverAvailableModel() async {
    try {
      final ollama = await _discoverFromOllamaTags();
      if (ollama != null) return ollama;

      final openAi = await _discoverFromOpenAiModels();
      if (openAi != null) return openAi;

      return null;
    } catch (_) {
      return null;
    }
  }

  Future<String?> _discoverFromOllamaTags() async {
    final uri = _baseUri.resolve('/api/tags');
    final response = await http.get(uri).timeout(const Duration(seconds: 10));
    if (response.statusCode != 200) return null;

    final body = utf8.decode(response.bodyBytes, allowMalformed: true);
    final decoded = _tryDecodeJson(body);
    if (decoded is! Map) return null;

    final models = decoded['models'];
    if (models is! List || models.isEmpty) return null;

    final names = models
        .map((item) {
          if (item is Map) {
            final name = item['name']?.toString() ?? item['model']?.toString();
            return name?.trim();
          }
          return item.toString().trim();
        })
        .whereType<String>()
        .where((name) => name.isNotEmpty)
        .toList(growable: false);

    if (names.isEmpty) return null;
    for (final name in names) {
      if (name.toLowerCase().contains('qwen')) {
        return name;
      }
    }
    return names.first;
  }

  Future<String?> _discoverFromOpenAiModels() async {
    final uri = _baseUri.resolve('/v1/models');
    final response = await http.get(uri).timeout(const Duration(seconds: 10));
    if (response.statusCode != 200) return null;

    final body = utf8.decode(response.bodyBytes, allowMalformed: true);
    final decoded = _tryDecodeJson(body);
    if (decoded is! Map) return null;

    final data = decoded['data'];
    if (data is! List || data.isEmpty) return null;

    final ids = data
        .map((item) {
          if (item is Map) {
            return item['id']?.toString().trim();
          }
          return item.toString().trim();
        })
        .whereType<String>()
        .where((id) => id.isNotEmpty)
        .toList(growable: false);

    if (ids.isEmpty) return null;
    for (final id in ids) {
      if (id.toLowerCase().contains('qwen')) {
        return id;
      }
    }
    return ids.first;
  }

  void _ensureEndpointAllowed() {
    if (!_enforceLocalEndpoint) return;
    final uri = _baseUri;
    if (!LocalEndpointPolicy.isAllowedUri(
      uri,
      allowPrivateNetwork: _allowPrivateNetwork,
    )) {
      throw ArgumentError(
        'LLM endpoint must be $_endpointPolicyLabel (current: $_endpoint)',
      );
    }
  }

  /// Stream chat for real-time responses (best-effort).
  Stream<String> chatStream({
    required String message,
    List<ChatMessage> context = const [],
  }) async* {
    final text = await chat(message: message, context: context);
    if (text.isNotEmpty) {
      yield text;
    }
  }

  /// Check if server is available.
  Future<bool> isAvailable() async {
    try {
      _ensureEndpointAllowed();
      final ollamaUri = _baseUri.resolve('/api/tags');
      final ollama = await http
          .get(ollamaUri)
          .timeout(const Duration(seconds: 5));
      if (ollama.statusCode == 200) return true;

      final openAiUri = _baseUri.resolve('/v1/models');
      final openAi = await http
          .get(openAiUri)
          .timeout(const Duration(seconds: 5));
      return openAi.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  @override
  void dispose() {
    // No persistent connection to dispose.
  }
}

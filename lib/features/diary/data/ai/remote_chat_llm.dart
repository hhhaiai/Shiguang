import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../../domain/interfaces/i_local_llm.dart';

enum RemoteLlmProtocol { openai, gemini, anthropic, ollama }

class RemoteChatLLM implements ILocalLLM {
  static const int _maxTokens = 768;
  static const double _temperature = 0.7;

  final RemoteLlmProtocol protocol;
  final String endpoint;
  final String model;
  final String apiKey;
  final Duration timeout;

  const RemoteChatLLM({
    required this.protocol,
    required this.endpoint,
    required this.model,
    this.apiKey = '',
    this.timeout = const Duration(seconds: 90),
  });

  @override
  Future<String> summarize(String text) async {
    final prompt = '请用一句话概括以下内容：\n\n$text\n\n摘要：';
    return chat(message: prompt, context: const []);
  }

  @override
  Future<List<String>> extractTags(String text) async {
    final prompt = '从以下文本中提取关键词标签（只返回标签，用逗号分隔）：\n\n$text\n\n标签：';
    final result = await chat(message: prompt, context: const []);
    return result
        .split(RegExp(r'[,，、\n]'))
        .map((item) => item.trim())
        .where((item) => item.isNotEmpty)
        .take(8)
        .toList(growable: false);
  }

  @override
  Future<Float32List> generateEmbedding(String text) async {
    throw UnsupportedError(
      'RemoteChatLLM.generateEmbedding is disabled. Use EmbeddingService for embeddings.',
    );
  }

  @override
  Future<String> chat({
    required String message,
    List<ChatMessage> context = const [],
  }) async {
    final normalizedEndpoint = endpoint.trim();
    final normalizedModel = model.trim();
    if (normalizedEndpoint.isEmpty) {
      throw Exception('LLM endpoint is empty');
    }
    if (normalizedModel.isEmpty) {
      throw Exception('LLM model is empty');
    }

    switch (protocol) {
      case RemoteLlmProtocol.openai:
        return _chatWithOpenAiCompat(
          baseEndpoint: normalizedEndpoint,
          model: normalizedModel,
          apiKey: apiKey.trim(),
          message: message,
          context: context,
        );
      case RemoteLlmProtocol.gemini:
        return _chatWithGemini(
          baseEndpoint: normalizedEndpoint,
          model: normalizedModel,
          apiKey: apiKey.trim(),
          message: message,
          context: context,
        );
      case RemoteLlmProtocol.anthropic:
        return _chatWithAnthropic(
          baseEndpoint: normalizedEndpoint,
          model: normalizedModel,
          apiKey: apiKey.trim(),
          message: message,
          context: context,
        );
      case RemoteLlmProtocol.ollama:
        return _chatWithOllama(
          baseEndpoint: normalizedEndpoint,
          model: normalizedModel,
          message: message,
          context: context,
        );
    }
  }

  Future<String> _chatWithOpenAiCompat({
    required String baseEndpoint,
    required String model,
    required String apiKey,
    required String message,
    required List<ChatMessage> context,
  }) async {
    if (apiKey.isEmpty) {
      throw Exception('OpenAI API key is empty');
    }

    final uri = _resolveUri(baseEndpoint, '/chat/completions');
    final body = {
      'model': model,
      'messages': _buildOpenAiMessages(message: message, context: context),
      'temperature': _temperature,
      'max_tokens': _maxTokens,
      'stream': false,
    };
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final decoded = await _postJson(uri: uri, body: body, headers: headers);
    final text = _extractText(decoded);
    if (text == null || text.trim().isEmpty) {
      throw Exception('OpenAI response is empty');
    }
    return text.trim();
  }

  Future<String> _chatWithGemini({
    required String baseEndpoint,
    required String model,
    required String apiKey,
    required String message,
    required List<ChatMessage> context,
  }) async {
    if (apiKey.isEmpty) {
      throw Exception('Gemini API key is empty');
    }

    var uri = _resolveUri(baseEndpoint, '/models/$model:generateContent');
    uri = uri.replace(queryParameters: {...uri.queryParameters, 'key': apiKey});

    final body = {
      'contents': _buildGeminiContents(message: message, context: context),
      'generationConfig': {
        'temperature': _temperature,
        'maxOutputTokens': _maxTokens,
      },
    };
    final headers = {'Content-Type': 'application/json'};

    final decoded = await _postJson(uri: uri, body: body, headers: headers);
    final text = _extractText(decoded);
    if (text == null || text.trim().isEmpty) {
      throw Exception('Gemini response is empty');
    }
    return text.trim();
  }

  Future<String> _chatWithAnthropic({
    required String baseEndpoint,
    required String model,
    required String apiKey,
    required String message,
    required List<ChatMessage> context,
  }) async {
    if (apiKey.isEmpty) {
      throw Exception('Anthropic API key is empty');
    }

    final uri = _resolveUri(baseEndpoint, '/messages');
    final headers = {
      'Content-Type': 'application/json',
      'x-api-key': apiKey,
      'anthropic-version': '2023-06-01',
    };
    final body = {
      'model': model,
      'max_tokens': _maxTokens,
      'temperature': _temperature,
      'system': '你是一个友好的 AI 助手，请优先使用中文回答。',
      'messages': [
        ...context.map(
          (item) => {
            'role': item.role == 'assistant' ? 'assistant' : 'user',
            'content': item.content,
          },
        ),
        {'role': 'user', 'content': message},
      ],
    };

    final decoded = await _postJson(uri: uri, body: body, headers: headers);
    final text = _extractText(decoded);
    if (text == null || text.trim().isEmpty) {
      throw Exception('Anthropic response is empty');
    }
    return text.trim();
  }

  Future<String> _chatWithOllama({
    required String baseEndpoint,
    required String model,
    required String message,
    required List<ChatMessage> context,
  }) async {
    // Try Ollama chat API first.
    final chatUri = _resolveUri(baseEndpoint, '/api/chat');
    final chatBody = {
      'model': model,
      'messages': _buildOpenAiMessages(message: message, context: context),
      'stream': false,
      'options': {'temperature': _temperature, 'num_predict': _maxTokens},
    };
    final headers = {'Content-Type': 'application/json'};

    try {
      final chatDecoded = await _postJson(
        uri: chatUri,
        body: chatBody,
        headers: headers,
      );
      final text = _extractText(chatDecoded);
      if (text != null && text.trim().isNotEmpty) {
        return text.trim();
      }
    } catch (_) {
      // Fall through to generate/openai compatible route.
    }

    final generateUri = _resolveUri(baseEndpoint, '/api/generate');
    final generateBody = {
      'model': model,
      'prompt': _buildOllamaPrompt(message: message, context: context),
      'stream': false,
      'options': {'temperature': _temperature, 'num_predict': _maxTokens},
    };

    try {
      final decoded = await _postJson(
        uri: generateUri,
        body: generateBody,
        headers: headers,
      );
      final text = _extractText(decoded);
      if (text != null && text.trim().isNotEmpty) {
        return text.trim();
      }
    } catch (_) {
      // Fall through to OpenAI compatibility.
    }

    final openAiUri = _resolveUri(baseEndpoint, '/v1/chat/completions');
    final openAiBody = {
      'model': model,
      'messages': _buildOpenAiMessages(message: message, context: context),
      'temperature': _temperature,
      'max_tokens': _maxTokens,
      'stream': false,
    };
    final decoded = await _postJson(
      uri: openAiUri,
      body: openAiBody,
      headers: headers,
    );
    final text = _extractText(decoded);
    if (text == null || text.trim().isEmpty) {
      throw Exception('Ollama response is empty');
    }
    return text.trim();
  }

  Uri _resolveUri(String base, String appendPath) {
    final baseUri = Uri.parse(base);
    final path = baseUri.path;
    final normalizedPath = path.endsWith('/')
        ? path.substring(0, path.length - 1)
        : path;

    // If endpoint already points to specific route, keep it as-is.
    if (normalizedPath.endsWith(appendPath)) {
      return baseUri;
    }

    // For endpoints with version suffix (e.g. /v1, /v1beta), append route directly.
    final joinedPath =
        '${normalizedPath.isEmpty ? '' : normalizedPath}${appendPath.startsWith('/') ? '' : '/'}$appendPath';

    return baseUri.replace(path: joinedPath);
  }

  List<Map<String, String>> _buildOpenAiMessages({
    required String message,
    required List<ChatMessage> context,
  }) {
    return <Map<String, String>>[
      {'role': 'system', 'content': '你是一个友好的 AI 助手，请优先使用中文回答。'},
      ...context.map(
        (item) => {
          'role': item.role == 'assistant' ? 'assistant' : 'user',
          'content': item.content,
        },
      ),
      {'role': 'user', 'content': message},
    ];
  }

  List<Map<String, Object>> _buildGeminiContents({
    required String message,
    required List<ChatMessage> context,
  }) {
    final items = <Map<String, Object>>[];

    for (final item in context) {
      items.add({
        'role': item.role == 'assistant' ? 'model' : 'user',
        'parts': [
          {'text': item.content},
        ],
      });
    }

    items.add({
      'role': 'user',
      'parts': [
        {'text': message},
      ],
    });

    return items;
  }

  String _buildOllamaPrompt({
    required String message,
    required List<ChatMessage> context,
  }) {
    final buffer = StringBuffer();
    buffer.writeln('系统: 你是一个友好的 AI 助手，请优先使用中文回答。');
    for (final item in context) {
      final role = item.role == 'assistant' ? '助手' : '用户';
      buffer.writeln('$role: ${item.content}');
    }
    buffer.writeln('用户: $message');
    buffer.write('助手:');
    return buffer.toString();
  }

  Future<dynamic> _postJson({
    required Uri uri,
    required Map<String, dynamic> body,
    required Map<String, String> headers,
  }) async {
    final response = await http
        .post(uri, headers: headers, body: jsonEncode(body))
        .timeout(timeout);
    final raw = utf8.decode(response.bodyBytes, allowMalformed: true);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      final preview = raw.length > 320 ? '${raw.substring(0, 320)}...' : raw;
      throw Exception(
        'LLM request failed (${response.statusCode}) on ${uri.path}: $preview',
      );
    }

    try {
      return jsonDecode(raw);
    } catch (_) {
      return raw;
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
      final map = data.map((key, value) => MapEntry(key.toString(), value));

      final candidates = map['candidates'];
      if (candidates is List && candidates.isNotEmpty) {
        final candidateText = _extractText(candidates.first);
        if (candidateText != null && candidateText.isNotEmpty) {
          return candidateText;
        }
      }

      final message = map['message'];
      if (message is Map) {
        final content = _extractText(message['content']);
        if (content != null && content.isNotEmpty) {
          return content;
        }
      }

      final delta = map['delta'];
      if (delta is Map) {
        final content = _extractText(delta['content']);
        if (content != null && content.isNotEmpty) {
          return content;
        }
      }

      final parts = map['parts'];
      if (parts is List) {
        for (final part in parts) {
          if (part is Map && part['text'] is String) {
            final text = (part['text'] as String).trim();
            if (text.isNotEmpty) return text;
          }
        }
      }

      final content = map['content'];
      if (content is List && content.isNotEmpty) {
        for (final item in content) {
          final text = _extractText(item);
          if (text != null && text.isNotEmpty) {
            return text;
          }
        }
      }
      if (content is Map) {
        final text =
            _extractText(content['text']) ?? _extractText(content['parts']);
        if (text != null && text.isNotEmpty) return text;
      }

      final choices = map['choices'];
      if (choices is List && choices.isNotEmpty) {
        final choiceText = _extractText(choices.first);
        if (choiceText != null && choiceText.isNotEmpty) {
          return choiceText;
        }
      }

      for (final key in [
        'response',
        'text',
        'output_text',
        'result',
        'output',
        'answer',
        'reply',
      ]) {
        final text = _extractText(map[key]);
        if (text != null && text.isNotEmpty) {
          return text;
        }
      }

      final dataField = _extractText(map['data']);
      if (dataField != null && dataField.isNotEmpty) {
        return dataField;
      }
    }

    return null;
  }

  @override
  void dispose() {
    // No persistent state.
  }
}

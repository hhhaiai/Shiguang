import 'dart:typed_data';

/// LLM interface for local AI processing
abstract class ILocalLLM {
  /// Generate summary for given text
  Future<String> summarize(String text);

  /// Extract tags from text
  Future<List<String>> extractTags(String text);

  /// Generate embedding vector for text (384 dimensions for bge-small-zh-v1.5)
  Future<Float32List> generateEmbedding(String text);

  /// Chat completion with context
  Future<String> chat({
    required String message,
    List<ChatMessage> context,
  });

  /// Dispose resources
  void dispose();
}

/// Chat message for conversation
class ChatMessage {
  final String role; // "user" or "assistant"
  final String content;

  ChatMessage({
    required this.role,
    required this.content,
  });
}

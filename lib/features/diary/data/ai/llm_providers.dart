import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../settings/data/settings_provider.dart';
import '../../domain/interfaces/i_local_llm.dart';
import 'qwen_fllama_local_llm.dart';
import 'qwen_gguf_local_llm.dart';
import 'qwen_local_llm.dart';

/// LLM service provider
/// On Android, prefer embedded GGUF runtime by default.
final localLlmProvider = Provider<ILocalLLM>((ref) {
  if (Platform.isAndroid) {
    final llm = QwenGgufLocalLLM();
    ref.onDispose(llm.dispose);
    return llm;
  }

  if (Platform.isIOS) {
    final llm = QwenFllamaLocalLLM();
    ref.onDispose(llm.dispose);
    return llm;
  }

  final settings = ref.watch(settingsProvider);
  final llm = QwenLocalLLM(endpoint: settings.llmEndpoint);
  ref.onDispose(llm.dispose);
  return llm;
});

/// Provider for chat context (conversation history)
final chatContextProvider = StateProvider<List<ChatMessage>>((ref) {
  return [];
});

/// Clear chat context
void clearChatContext(WidgetRef ref) {
  ref.read(chatContextProvider.notifier).state = [];
}

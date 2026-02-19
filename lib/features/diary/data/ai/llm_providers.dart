import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../settings/data/settings_provider.dart';
import '../../domain/interfaces/i_local_llm.dart';
import 'qwen_fllama_local_llm.dart';
import 'qwen_gguf_local_llm.dart';
import 'qwen_local_llm.dart';
import 'remote_chat_llm.dart';

ILocalLLM _buildLocalModelLlm(AppSettings settings) {
  if (Platform.isAndroid) {
    return QwenGgufLocalLLM();
  }

  if (Platform.isIOS) {
    return QwenFllamaLocalLLM();
  }

  return QwenLocalLLM(endpoint: settings.llmEndpoint, model: settings.llmModel);
}

RemoteLlmProtocol _mapCustomProtocol(CustomLlmProtocol protocol) {
  switch (protocol) {
    case CustomLlmProtocol.openai:
      return RemoteLlmProtocol.openai;
    case CustomLlmProtocol.gemini:
      return RemoteLlmProtocol.gemini;
    case CustomLlmProtocol.anthropic:
      return RemoteLlmProtocol.anthropic;
    case CustomLlmProtocol.ollama:
      return RemoteLlmProtocol.ollama;
  }
}

/// LLM service provider for AI chat.
/// Default remains local model, with optional online providers.
final chatLlmProvider = Provider<ILocalLLM>((ref) {
  final settings = ref.watch(settingsProvider);
  late final ILocalLLM llm;

  switch (settings.chatModelProvider) {
    case ChatModelProvider.local:
      llm = _buildLocalModelLlm(settings);
      break;
    case ChatModelProvider.openai:
      llm = RemoteChatLLM(
        protocol: RemoteLlmProtocol.openai,
        endpoint: settings.openAiEndpoint,
        apiKey: settings.openAiApiKey,
        model: settings.openAiModel,
      );
      break;
    case ChatModelProvider.gemini:
      llm = RemoteChatLLM(
        protocol: RemoteLlmProtocol.gemini,
        endpoint: settings.geminiEndpoint,
        apiKey: settings.geminiApiKey,
        model: settings.geminiModel,
      );
      break;
    case ChatModelProvider.anthropic:
      llm = RemoteChatLLM(
        protocol: RemoteLlmProtocol.anthropic,
        endpoint: settings.anthropicEndpoint,
        apiKey: settings.anthropicApiKey,
        model: settings.anthropicModel,
      );
      break;
    case ChatModelProvider.ollama:
      llm = QwenLocalLLM(
        endpoint: settings.llmEndpoint,
        model: settings.llmModel,
        enforceLocalEndpoint: false,
      );
      break;
    case ChatModelProvider.custom:
      llm = RemoteChatLLM(
        protocol: _mapCustomProtocol(settings.customLlmProtocol),
        endpoint: settings.customEndpoint,
        apiKey: settings.customApiKey,
        model: settings.customModel,
      );
      break;
  }

  ref.onDispose(llm.dispose);
  return llm;
});

/// Backward compatible alias used in older call sites.
final localLlmProvider = chatLlmProvider;

/// Provider for chat context (conversation history)
final chatContextProvider = StateProvider<List<ChatMessage>>((ref) {
  return [];
});

/// Clear chat context
void clearChatContext(WidgetRef ref) {
  ref.read(chatContextProvider.notifier).state = [];
}

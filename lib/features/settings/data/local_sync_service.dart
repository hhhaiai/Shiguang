import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

import '../../../core/objectbox/objectbox_service.dart';
import '../../auth/data/entities/local_account.dart';
import '../../diary/data/entities/vector_diary.dart';
import '../../reminder/data/entities/local_reminder.dart';
import 'settings_provider.dart';

class LocalSyncImportResult {
  final int createdAccounts;
  final int updatedAccounts;
  final int createdDiaries;
  final int updatedDiaries;
  final int createdReminders;
  final int updatedReminders;
  final int skipped;
  final Map<String, dynamic>? importedSettings;

  const LocalSyncImportResult({
    required this.createdAccounts,
    required this.updatedAccounts,
    required this.createdDiaries,
    required this.updatedDiaries,
    required this.createdReminders,
    required this.updatedReminders,
    required this.skipped,
    this.importedSettings,
  });

  int get totalChanged =>
      createdAccounts +
      updatedAccounts +
      createdDiaries +
      updatedDiaries +
      createdReminders +
      updatedReminders;
}

class LocalSyncBackupService {
  final ObjectBoxService objectBox;

  LocalSyncBackupService(this.objectBox);

  Future<File> createBackupFile({
    required AppSettings settings,
    bool includeApiKeys = false,
  }) async {
    final accounts = objectBox.localAccountBox.getAll();
    final diaries = objectBox.vectorDiaryBox.getAll();
    final reminders = objectBox.localReminderBox.getAll();

    final payload = {
      'schemaVersion': 1,
      'app': 'shiguang',
      'exportedAt': DateTime.now().toUtc().toIso8601String(),
      'syncMethod': 'localsend',
      'counts': {
        'accounts': accounts.length,
        'diaries': diaries.length,
        'reminders': reminders.length,
      },
      'settings': _serializeSettings(settings, includeApiKeys: includeApiKeys),
      'accounts': accounts.map(_serializeAccount).toList(growable: false),
      'diaries': diaries.map(_serializeDiary).toList(growable: false),
      'reminders': reminders.map(_serializeReminder).toList(growable: false),
    };

    final tempDir = await getTemporaryDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final file = File(
      '${tempDir.path}/shiguang_localsend_backup_$timestamp.json',
    );
    final pretty = const JsonEncoder.withIndent('  ').convert(payload);
    await file.writeAsString(pretty, flush: true);
    return file;
  }

  Future<LocalSyncImportResult> importBackupFile({required File file}) async {
    if (!await file.exists()) {
      throw Exception('Backup file not found: ${file.path}');
    }

    final raw = await file.readAsString();
    final decoded = jsonDecode(raw);
    if (decoded is! Map) {
      throw Exception('Invalid backup format: root is not an object');
    }

    final root = decoded.map((key, value) => MapEntry('$key', value));
    final accountsRaw = root['accounts'];
    final diariesRaw = root['diaries'];
    final remindersRaw = root['reminders'];

    final accountEntries = accountsRaw is List
        ? accountsRaw.whereType<Map>().toList(growable: false)
        : const <Map>[];
    final diaryEntries = diariesRaw is List
        ? diariesRaw.whereType<Map>().toList(growable: false)
        : const <Map>[];
    final reminderEntries = remindersRaw is List
        ? remindersRaw.whereType<Map>().toList(growable: false)
        : const <Map>[];

    final sourceAccountToLocal = <int, int>{};
    final sourceDiaryToLocal = <int, int>{};

    var createdAccounts = 0;
    var updatedAccounts = 0;
    var createdDiaries = 0;
    var updatedDiaries = 0;
    var createdReminders = 0;
    var updatedReminders = 0;
    var skipped = 0;

    final accountBox = objectBox.localAccountBox;
    final diaryBox = objectBox.vectorDiaryBox;
    final reminderBox = objectBox.localReminderBox;

    final existingAccounts = accountBox.getAll();
    final accountByUsername = <String, LocalAccount>{
      for (final account in existingAccounts)
        account.username.trim().toLowerCase(): account,
    };

    for (final entry in accountEntries) {
      final map = entry.map((key, value) => MapEntry('$key', value));
      final username = (map['username']?.toString().trim() ?? '');
      if (username.isEmpty) {
        skipped++;
        continue;
      }

      final sourceAccountId = _asInt(map['id']);
      final key = username.toLowerCase();
      final existing = accountByUsername[key];

      if (existing == null) {
        final created = LocalAccount(
          username: username,
          avatarPath: _asStringOrNull(map['avatarPath']),
          hashedPrivatePin: _asStringOrNull(map['hashedPrivatePin']),
          salt: _asStringOrNull(map['salt']),
          createdAt:
              _asInt(map['createdAt']) ?? DateTime.now().millisecondsSinceEpoch,
          lastLoginAt: _asInt(map['lastLoginAt']),
        );
        accountBox.put(created);
        accountByUsername[key] = created;
        if (sourceAccountId != null && sourceAccountId > 0) {
          sourceAccountToLocal[sourceAccountId] = created.id;
        }
        createdAccounts++;
      } else {
        var changed = false;

        final importedAvatar = _asStringOrNull(map['avatarPath']);
        if ((existing.avatarPath == null || existing.avatarPath!.isEmpty) &&
            importedAvatar != null &&
            importedAvatar.isNotEmpty) {
          existing.avatarPath = importedAvatar;
          changed = true;
        }

        final importedHashedPin = _asStringOrNull(map['hashedPrivatePin']);
        if ((existing.hashedPrivatePin == null ||
                existing.hashedPrivatePin!.isEmpty) &&
            importedHashedPin != null &&
            importedHashedPin.isNotEmpty) {
          existing.hashedPrivatePin = importedHashedPin;
          changed = true;
        }

        final importedSalt = _asStringOrNull(map['salt']);
        if ((existing.salt == null || existing.salt!.isEmpty) &&
            importedSalt != null &&
            importedSalt.isNotEmpty) {
          existing.salt = importedSalt;
          changed = true;
        }

        final importedLastLoginAt = _asInt(map['lastLoginAt']);
        if (importedLastLoginAt != null &&
            (existing.lastLoginAt == null ||
                importedLastLoginAt > existing.lastLoginAt!)) {
          existing.lastLoginAt = importedLastLoginAt;
          changed = true;
        }

        if (changed) {
          accountBox.put(existing);
          updatedAccounts++;
        }

        if (sourceAccountId != null && sourceAccountId > 0) {
          sourceAccountToLocal[sourceAccountId] = existing.id;
        }
      }
    }

    final existingDiaries = diaryBox.getAll();
    final diaryByFingerprint = <String, VectorDiary>{
      for (final diary in existingDiaries) _diaryKey(diary): diary,
    };

    for (final entry in diaryEntries) {
      final map = entry.map((key, value) => MapEntry('$key', value));
      final sourceAccountId = _asInt(map['accountId']);
      if (sourceAccountId == null) {
        skipped++;
        continue;
      }

      final targetAccountId = _resolveTargetAccountId(
        sourceAccountId,
        sourceAccountToLocal,
      );
      if (targetAccountId == null) {
        skipped++;
        continue;
      }

      final rawText = (map['rawText']?.toString() ?? '').trim();
      if (rawText.isEmpty) {
        skipped++;
        continue;
      }

      final createdAt =
          _asInt(map['createdAt']) ?? DateTime.now().millisecondsSinceEpoch;
      final updatedAt = _asInt(map['updatedAt']) ?? createdAt;
      final aiSummary = _asStringOrNull(map['aiSummary']);
      final aiTags = _asStringOrNull(map['aiTags']);
      final embedding = _parseEmbedding(map['embedding']);
      final importedDeleted = _asBool(map['isDeleted']) ?? false;

      final sourceDiaryId = _asInt(map['id']);
      final fingerprint = _diaryFingerprint(
        accountId: targetAccountId,
        createdAt: createdAt,
        rawText: rawText,
      );
      final existing = diaryByFingerprint[fingerprint];

      if (existing == null) {
        final created = VectorDiary(
          accountId: targetAccountId,
          rawText: rawText,
          aiSummary: aiSummary,
          aiTags: aiTags,
          embedding: embedding,
          createdAt: createdAt,
          updatedAt: updatedAt,
          isDeleted: importedDeleted,
        );
        diaryBox.put(created);
        diaryByFingerprint[_diaryKey(created)] = created;
        if (sourceDiaryId != null && sourceDiaryId > 0) {
          sourceDiaryToLocal[sourceDiaryId] = created.id;
        }
        createdDiaries++;
      } else {
        var changed = false;

        final shouldReplace = updatedAt > existing.updatedAt;

        if (shouldReplace) {
          if (aiSummary != null) {
            existing.aiSummary = aiSummary;
            changed = true;
          }
          if (aiTags != null) {
            existing.aiTags = aiTags;
            changed = true;
          }
          if (embedding != null && embedding.isNotEmpty) {
            existing.embedding = embedding;
            changed = true;
          }
          if (importedDeleted && !existing.isDeleted) {
            existing.isDeleted = true;
            changed = true;
          }
          if (updatedAt > existing.updatedAt) {
            existing.updatedAt = updatedAt;
            changed = true;
          }
        } else {
          if ((existing.aiSummary == null || existing.aiSummary!.isEmpty) &&
              aiSummary != null &&
              aiSummary.isNotEmpty) {
            existing.aiSummary = aiSummary;
            changed = true;
          }
          if ((existing.aiTags == null || existing.aiTags!.isEmpty) &&
              aiTags != null &&
              aiTags.isNotEmpty) {
            existing.aiTags = aiTags;
            changed = true;
          }
          if ((existing.embedding == null || existing.embedding!.isEmpty) &&
              embedding != null &&
              embedding.isNotEmpty) {
            existing.embedding = embedding;
            changed = true;
          }
          if (importedDeleted && !existing.isDeleted) {
            existing.isDeleted = true;
            changed = true;
          }
        }

        if (changed) {
          diaryBox.put(existing);
          updatedDiaries++;
        }

        if (sourceDiaryId != null && sourceDiaryId > 0) {
          sourceDiaryToLocal[sourceDiaryId] = existing.id;
        }
      }
    }

    final existingReminders = reminderBox.getAll();
    final reminderByFingerprint = <String, LocalReminder>{
      for (final reminder in existingReminders)
        _reminderKey(reminder): reminder,
    };

    for (final entry in reminderEntries) {
      final map = entry.map((key, value) => MapEntry('$key', value));
      final sourceAccountId = _asInt(map['accountId']);
      if (sourceAccountId == null) {
        skipped++;
        continue;
      }

      final targetAccountId = _resolveTargetAccountId(
        sourceAccountId,
        sourceAccountToLocal,
      );
      if (targetAccountId == null) {
        skipped++;
        continue;
      }

      final title = (map['title']?.toString() ?? '').trim();
      final triggerAt = _asInt(map['triggerAt']);
      if (title.isEmpty || triggerAt == null) {
        skipped++;
        continue;
      }

      final body = _asStringOrNull(map['body']);
      final repeatRule = _asStringOrNull(map['repeatRule']);
      final timezone = _asStringOrNull(map['timezone']);
      final isEnabled = _asBool(map['isEnabled']) ?? true;
      final createdAt =
          _asInt(map['createdAt']) ?? DateTime.now().millisecondsSinceEpoch;
      final updatedAt = _asInt(map['updatedAt']) ?? createdAt;

      final sourceDiaryId = _asInt(map['diaryId']);
      final mappedDiaryId = sourceDiaryId == null
          ? null
          : sourceDiaryToLocal[sourceDiaryId];

      final fingerprint = _reminderFingerprint(
        accountId: targetAccountId,
        triggerAt: triggerAt,
        title: title,
        body: body,
      );
      final existing = reminderByFingerprint[fingerprint];

      if (existing == null) {
        final created = LocalReminder(
          accountId: targetAccountId,
          diaryId: mappedDiaryId,
          title: title,
          body: body,
          triggerAt: triggerAt,
          repeatRule: repeatRule,
          timezone: timezone,
          isEnabled: isEnabled,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
        reminderBox.put(created);
        reminderByFingerprint[_reminderKey(created)] = created;
        createdReminders++;
      } else {
        final shouldReplace = updatedAt > existing.updatedAt;
        var changed = false;

        if (shouldReplace) {
          if (existing.body != body) {
            existing.body = body;
            changed = true;
          }
          if (existing.repeatRule != repeatRule) {
            existing.repeatRule = repeatRule;
            changed = true;
          }
          if (existing.timezone != timezone) {
            existing.timezone = timezone;
            changed = true;
          }
          if (existing.isEnabled != isEnabled) {
            existing.isEnabled = isEnabled;
            changed = true;
          }
          if (mappedDiaryId != null && existing.diaryId != mappedDiaryId) {
            existing.diaryId = mappedDiaryId;
            changed = true;
          }
          if (updatedAt > existing.updatedAt) {
            existing.updatedAt = updatedAt;
            changed = true;
          }
        }

        if (changed) {
          reminderBox.put(existing);
          updatedReminders++;
        }
      }
    }

    final importedSettings = root['settings'] is Map
        ? (root['settings'] as Map).map((key, value) => MapEntry('$key', value))
        : null;

    return LocalSyncImportResult(
      createdAccounts: createdAccounts,
      updatedAccounts: updatedAccounts,
      createdDiaries: createdDiaries,
      updatedDiaries: updatedDiaries,
      createdReminders: createdReminders,
      updatedReminders: updatedReminders,
      skipped: skipped,
      importedSettings: importedSettings,
    );
  }

  Map<String, dynamic> _serializeSettings(
    AppSettings settings, {
    required bool includeApiKeys,
  }) {
    return {
      'themeMode': settings.themeMode.name,
      'language': settings.language.code,
      'chatModelProvider': settings.chatModelProvider.name,
      'voiceRecognitionEngine': settings.voiceRecognitionEngine.name,
      'voiceAiEndpoint': settings.voiceAiEndpoint,
      'embeddingEndpoint': settings.embeddingEndpoint,
      'llmEndpoint': settings.llmEndpoint,
      'llmModel': settings.llmModel,
      'openAiEndpoint': settings.openAiEndpoint,
      'openAiModel': settings.openAiModel,
      'geminiEndpoint': settings.geminiEndpoint,
      'geminiModel': settings.geminiModel,
      'anthropicEndpoint': settings.anthropicEndpoint,
      'anthropicModel': settings.anthropicModel,
      'customEndpoint': settings.customEndpoint,
      'customModel': settings.customModel,
      'customLlmProtocol': settings.customLlmProtocol.name,
      'autoGenerateSummary': settings.autoGenerateSummary,
      'autoGenerateEmbedding': settings.autoGenerateEmbedding,
      if (includeApiKeys) ...{
        'openAiApiKey': settings.openAiApiKey,
        'geminiApiKey': settings.geminiApiKey,
        'anthropicApiKey': settings.anthropicApiKey,
        'customApiKey': settings.customApiKey,
      },
    };
  }

  Map<String, dynamic> _serializeAccount(LocalAccount account) {
    return {
      'id': account.id,
      'username': account.username,
      'avatarPath': account.avatarPath,
      'hashedPrivatePin': account.hashedPrivatePin,
      'salt': account.salt,
      'createdAt': account.createdAt,
      'lastLoginAt': account.lastLoginAt,
    };
  }

  Map<String, dynamic> _serializeDiary(VectorDiary diary) {
    return {
      'id': diary.id,
      'accountId': diary.accountId,
      'rawText': diary.rawText,
      'aiSummary': diary.aiSummary,
      'aiTags': diary.aiTags,
      'embedding': diary.embedding?.toList(growable: false),
      'createdAt': diary.createdAt,
      'updatedAt': diary.updatedAt,
      'isDeleted': diary.isDeleted,
    };
  }

  Map<String, dynamic> _serializeReminder(LocalReminder reminder) {
    return {
      'id': reminder.id,
      'accountId': reminder.accountId,
      'diaryId': reminder.diaryId,
      'title': reminder.title,
      'body': reminder.body,
      'triggerAt': reminder.triggerAt,
      'repeatRule': reminder.repeatRule,
      'timezone': reminder.timezone,
      'isEnabled': reminder.isEnabled,
      'createdAt': reminder.createdAt,
      'updatedAt': reminder.updatedAt,
    };
  }

  int? _resolveTargetAccountId(
    int sourceAccountId,
    Map<int, int> sourceAccountToLocal,
  ) {
    final mapped = sourceAccountToLocal[sourceAccountId];
    if (mapped != null) return mapped;
    final existing = objectBox.localAccountBox.get(sourceAccountId);
    if (existing != null) return existing.id;
    return null;
  }

  int? _asInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value.trim());
    return null;
  }

  bool? _asBool(dynamic value) {
    if (value is bool) return value;
    if (value is num) return value != 0;
    if (value is String) {
      final normalized = value.trim().toLowerCase();
      if (normalized == 'true' || normalized == '1') return true;
      if (normalized == 'false' || normalized == '0') return false;
    }
    return null;
  }

  String? _asStringOrNull(dynamic value) {
    if (value == null) return null;
    final text = value.toString().trim();
    return text.isEmpty ? null : text;
  }

  Float32List? _parseEmbedding(dynamic value) {
    if (value is! List) return null;
    if (value.isEmpty) return null;

    final numbers = <double>[];
    for (final item in value) {
      if (item is num) {
        numbers.add(item.toDouble());
      }
    }
    if (numbers.isEmpty) return null;
    return Float32List.fromList(numbers);
  }

  String _diaryKey(VectorDiary diary) {
    return _diaryFingerprint(
      accountId: diary.accountId,
      createdAt: diary.createdAt,
      rawText: diary.rawText,
    );
  }

  String _diaryFingerprint({
    required int accountId,
    required int createdAt,
    required String rawText,
  }) {
    return '$accountId|$createdAt|${rawText.length}|${rawText.hashCode}';
  }

  String _reminderKey(LocalReminder reminder) {
    return _reminderFingerprint(
      accountId: reminder.accountId,
      triggerAt: reminder.triggerAt,
      title: reminder.title,
      body: reminder.body,
    );
  }

  String _reminderFingerprint({
    required int accountId,
    required int triggerAt,
    required String title,
    required String? body,
  }) {
    return '$accountId|$triggerAt|$title|${body ?? ''}';
  }
}

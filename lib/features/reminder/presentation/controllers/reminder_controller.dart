import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/objectbox/objectbox_providers.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../data/entities/local_reminder.dart';
import '../../data/repositories/reminder_repository.dart';
import '../../data/services/local_reminder_scheduler.dart';

part 'reminder_controller.g.dart';

@riverpod
ReminderRepository reminderRepository(Ref ref) {
  final objectBox = ref.watch(objectBoxServiceProvider);
  return ReminderRepository(objectBox);
}

@riverpod
LocalReminderScheduler localReminderScheduler(Ref ref) {
  return LocalReminderScheduler();
}

@riverpod
class Reminder extends _$Reminder {
  int? _syncedAccountId;

  @override
  List<LocalReminder> build() {
    final accountId = ref.watch(authProvider);
    if (accountId == null) {
      _syncedAccountId = null;
      return [];
    }

    final repository = ref.read(reminderRepositoryProvider);
    final reminders = repository.getByAccountId(accountId);

    if (_syncedAccountId != accountId) {
      _syncedAccountId = accountId;
      unawaited(ref.read(localReminderSchedulerProvider).sync(reminders));
    }

    return reminders;
  }

  ReminderRepository get _repository => ref.read(reminderRepositoryProvider);

  /// Refresh reminders
  void refresh() {
    final accountId = ref.read(authProvider);
    if (accountId == null) return;

    state = _repository.getByAccountId(accountId);
  }

  /// Create a new reminder
  LocalReminder? createReminder({
    required String title,
    String? body,
    required DateTime triggerAt,
    String? repeatRule,
    String? timezone,
    int? diaryId,
  }) {
    final accountId = ref.read(authProvider);
    if (accountId == null) return null;

    final reminder = _repository.create(
      accountId: accountId,
      title: title,
      body: body,
      triggerAt: triggerAt.millisecondsSinceEpoch,
      repeatRule: repeatRule,
      timezone: timezone,
      diaryId: diaryId,
    );

    refresh();
    if (reminder.isEnabled) {
      unawaited(ref.read(localReminderSchedulerProvider).schedule(reminder));
    }
    return reminder;
  }

  /// Update a reminder
  LocalReminder? updateReminder(
    int id, {
    String? title,
    String? body,
    int? triggerAt,
    String? repeatRule,
    bool? isEnabled,
  }) {
    final accountId = ref.read(authProvider);
    if (accountId == null) return null;

    final reminder = _repository.getByIdForAccount(
      accountId: accountId,
      reminderId: id,
    );
    if (reminder == null) return null;

    if (title != null) reminder.title = title;
    if (body != null) reminder.body = body;
    if (triggerAt != null) reminder.triggerAt = triggerAt;
    if (repeatRule != null) reminder.repeatRule = repeatRule;
    if (isEnabled != null) reminder.isEnabled = isEnabled;

    final updated = _repository.update(reminder);
    refresh();
    if (updated.isEnabled) {
      unawaited(ref.read(localReminderSchedulerProvider).schedule(updated));
    } else {
      unawaited(ref.read(localReminderSchedulerProvider).cancel(updated.id));
    }
    return updated;
  }

  /// Toggle reminder enabled state
  void toggleEnabled(int id) {
    final accountId = ref.read(authProvider);
    if (accountId == null) return;

    _repository.toggleEnabledForAccount(accountId: accountId, reminderId: id);
    final reminder = _repository.getByIdForAccount(
      accountId: accountId,
      reminderId: id,
    );
    if (reminder != null) {
      if (reminder.isEnabled) {
        unawaited(ref.read(localReminderSchedulerProvider).schedule(reminder));
      } else {
        unawaited(ref.read(localReminderSchedulerProvider).cancel(reminder.id));
      }
    }
    refresh();
  }

  /// Delete a reminder
  void deleteReminder(int id) {
    final accountId = ref.read(authProvider);
    if (accountId == null) return;

    unawaited(ref.read(localReminderSchedulerProvider).cancel(id));
    _repository.deleteForAccount(accountId: accountId, reminderId: id);
    refresh();
  }

  /// Get upcoming reminders
  List<LocalReminder> getUpcoming({int withinHours = 24}) {
    final accountId = ref.read(authProvider);
    if (accountId == null) return [];

    return _repository.getUpcomingReminders(
      accountId,
      withinHours: withinHours,
    );
  }

  /// Get reminders for a diary
  List<LocalReminder> getByDiaryId(int diaryId) {
    final accountId = ref.read(authProvider);
    if (accountId == null) return [];

    return _repository.getByDiaryId(accountId: accountId, diaryId: diaryId);
  }
}

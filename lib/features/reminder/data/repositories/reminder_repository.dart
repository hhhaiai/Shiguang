import '../../../../core/objectbox/objectbox_service.dart';
import '../../../../objectbox.g.dart';
import '../entities/local_reminder.dart';

class ReminderRepository {
  final ObjectBoxService _objectBoxService;

  ReminderRepository(this._objectBoxService);

  Box<LocalReminder> get _box => _objectBoxService.localReminderBox;

  /// Create a new reminder
  LocalReminder create({
    required int accountId,
    required String title,
    String? body,
    required int triggerAt,
    String? repeatRule,
    String? timezone,
    int? diaryId,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final reminder = LocalReminder(
      accountId: accountId,
      title: title,
      body: body,
      triggerAt: triggerAt,
      repeatRule: repeatRule ?? 'none',
      timezone: timezone,
      diaryId: diaryId,
      isEnabled: true,
      createdAt: now,
      updatedAt: now,
    );
    _box.put(reminder);
    return reminder;
  }

  /// Get reminder by ID
  LocalReminder? getById(int id) {
    return _box.get(id);
  }

  /// Get reminder by ID scoped to an account
  LocalReminder? getByIdForAccount({
    required int accountId,
    required int reminderId,
  }) {
    final query = _box
        .query(
          LocalReminder_.id.equals(reminderId) &
              LocalReminder_.accountId.equals(accountId),
        )
        .build();
    final result = query.findFirst();
    query.close();
    return result;
  }

  /// Get all reminders for an account
  List<LocalReminder> getByAccountId(int accountId) {
    final query = _box
        .query(LocalReminder_.accountId.equals(accountId))
        .order(LocalReminder_.triggerAt)
        .build();
    final results = query.find();
    query.close();
    return results;
  }

  /// Get enabled reminders
  List<LocalReminder> getEnabledReminders(int accountId) {
    final query = _box
        .query(
          LocalReminder_.accountId.equals(accountId) &
              LocalReminder_.isEnabled.equals(true),
        )
        .order(LocalReminder_.triggerAt)
        .build();
    final results = query.find();
    query.close();
    return results;
  }

  /// Get upcoming reminders (within next 24 hours)
  List<LocalReminder> getUpcomingReminders(
    int accountId, {
    int withinHours = 24,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final future = now + (withinHours * 60 * 60 * 1000);
    final query = _box
        .query(
          LocalReminder_.accountId.equals(accountId) &
              LocalReminder_.isEnabled.equals(true) &
              LocalReminder_.triggerAt.greaterThan(now) &
              LocalReminder_.triggerAt.lessThan(future),
        )
        .order(LocalReminder_.triggerAt)
        .build();
    final results = query.find();
    query.close();
    return results;
  }

  /// Update reminder
  LocalReminder update(LocalReminder reminder) {
    reminder.updatedAt = DateTime.now().millisecondsSinceEpoch;
    _box.put(reminder);
    return reminder;
  }

  /// Toggle reminder enabled state
  void toggleEnabled(int id) {
    final reminder = _box.get(id);
    if (reminder != null) {
      reminder.isEnabled = !reminder.isEnabled;
      reminder.updatedAt = DateTime.now().millisecondsSinceEpoch;
      _box.put(reminder);
    }
  }

  /// Toggle reminder enabled state scoped to an account
  bool toggleEnabledForAccount({
    required int accountId,
    required int reminderId,
  }) {
    final reminder = getByIdForAccount(
      accountId: accountId,
      reminderId: reminderId,
    );
    if (reminder == null) {
      return false;
    }

    reminder.isEnabled = !reminder.isEnabled;
    reminder.updatedAt = DateTime.now().millisecondsSinceEpoch;
    _box.put(reminder);
    return true;
  }

  /// Delete reminder
  bool delete(int id) {
    return _box.remove(id);
  }

  /// Delete reminder scoped to an account
  bool deleteForAccount({required int accountId, required int reminderId}) {
    final reminder = getByIdForAccount(
      accountId: accountId,
      reminderId: reminderId,
    );
    if (reminder == null) {
      return false;
    }
    return _box.remove(reminder.id);
  }

  /// Get reminders by diary ID
  List<LocalReminder> getByDiaryId({
    required int accountId,
    required int diaryId,
  }) {
    final query = _box
        .query(
          LocalReminder_.accountId.equals(accountId) &
              LocalReminder_.diaryId.equals(diaryId),
        )
        .build();
    final results = query.find();
    query.close();
    return results;
  }
}

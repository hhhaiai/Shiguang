import 'package:objectbox/objectbox.dart';

@Entity()
class LocalReminder {
  @Id()
  int id;

  int accountId;

  int? diaryId;

  String title;

  String? body;

  int triggerAt;

  String? repeatRule;

  String? timezone;

  bool isEnabled;

  int createdAt;

  int updatedAt;

  LocalReminder({
    this.id = 0,
    required this.accountId,
    this.diaryId,
    required this.title,
    this.body,
    required this.triggerAt,
    this.repeatRule,
    this.timezone,
    this.isEnabled = true,
    required this.createdAt,
    required this.updatedAt,
  });
}

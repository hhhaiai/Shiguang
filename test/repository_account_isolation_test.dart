import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:brain/core/objectbox/objectbox_service.dart';
import 'package:brain/features/diary/data/repositories/vector_diary_repository.dart';
import 'package:brain/features/reminder/data/repositories/reminder_repository.dart';

const _skipReason =
    'Requires ObjectBox native host-test setup (libobjectbox.dylib) not available in current CI/runtime.';

void main() {
  late Directory tempDir;
  late ObjectBoxService objectBoxService;
  late VectorDiaryRepository diaryRepository;
  late ReminderRepository reminderRepository;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('aether_obx_test_');
    objectBoxService = await ObjectBoxService.createInDirectory(tempDir.path);
    diaryRepository = VectorDiaryRepository(objectBoxService);
    reminderRepository = ReminderRepository(objectBoxService);
  });

  tearDown(() async {
    objectBoxService.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test(
    'vector diaries are account-scoped for read/delete operations',
    () {
      final diaryA = diaryRepository.create(accountId: 1, rawText: 'A');
      final diaryB = diaryRepository.create(accountId: 2, rawText: 'B');

      expect(
        diaryRepository.getByIdForAccount(accountId: 1, diaryId: diaryA.id),
        isNotNull,
      );
      expect(
        diaryRepository.getByIdForAccount(accountId: 1, diaryId: diaryB.id),
        isNull,
      );

      final deletedWrongAccount = diaryRepository.softDeleteForAccount(
        accountId: 1,
        diaryId: diaryB.id,
      );
      expect(deletedWrongAccount, isFalse);

      final deletedRightAccount = diaryRepository.softDeleteForAccount(
        accountId: 2,
        diaryId: diaryB.id,
      );
      expect(deletedRightAccount, isTrue);
      expect(
        diaryRepository.getByIdForAccount(accountId: 2, diaryId: diaryB.id),
        isNull,
      );
    },
    skip: _skipReason,
  );

  test(
    'reminders are account-scoped for read/toggle/delete operations',
    () {
      final triggerAt = DateTime.now().add(const Duration(hours: 1));
      final reminderA = reminderRepository.create(
        accountId: 1,
        title: 'A',
        triggerAt: triggerAt.millisecondsSinceEpoch,
        diaryId: 11,
      );
      final reminderB = reminderRepository.create(
        accountId: 2,
        title: 'B',
        triggerAt: triggerAt.millisecondsSinceEpoch,
        diaryId: 11,
      );

      expect(
        reminderRepository.getByIdForAccount(
          accountId: 1,
          reminderId: reminderA.id,
        ),
        isNotNull,
      );
      expect(
        reminderRepository.getByIdForAccount(
          accountId: 1,
          reminderId: reminderB.id,
        ),
        isNull,
      );

      final toggledWrongAccount = reminderRepository.toggleEnabledForAccount(
        accountId: 1,
        reminderId: reminderB.id,
      );
      expect(toggledWrongAccount, isFalse);
      expect(
        reminderRepository
            .getByIdForAccount(accountId: 2, reminderId: reminderB.id)!
            .isEnabled,
        isTrue,
      );

      final accountARemindersByDiary = reminderRepository.getByDiaryId(
        accountId: 1,
        diaryId: 11,
      );
      expect(accountARemindersByDiary.length, 1);
      expect(accountARemindersByDiary.first.id, reminderA.id);

      final deletedWrongAccount = reminderRepository.deleteForAccount(
        accountId: 1,
        reminderId: reminderB.id,
      );
      expect(deletedWrongAccount, isFalse);

      final deletedRightAccount = reminderRepository.deleteForAccount(
        accountId: 2,
        reminderId: reminderB.id,
      );
      expect(deletedRightAccount, isTrue);
    },
    skip: _skipReason,
  );
}

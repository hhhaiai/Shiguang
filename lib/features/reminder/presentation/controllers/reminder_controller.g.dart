// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reminderRepositoryHash() =>
    r'2c1b5993a81d97c7810e8922d89a55a81861d00f';

/// See also [reminderRepository].
@ProviderFor(reminderRepository)
final reminderRepositoryProvider =
    AutoDisposeProvider<ReminderRepository>.internal(
      reminderRepository,
      name: r'reminderRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$reminderRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReminderRepositoryRef = AutoDisposeProviderRef<ReminderRepository>;
String _$localReminderSchedulerHash() =>
    r'923a070ae7dfee71cb5fa9fc9f2629c844928353';

/// See also [localReminderScheduler].
@ProviderFor(localReminderScheduler)
final localReminderSchedulerProvider =
    AutoDisposeProvider<LocalReminderScheduler>.internal(
      localReminderScheduler,
      name: r'localReminderSchedulerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$localReminderSchedulerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocalReminderSchedulerRef =
    AutoDisposeProviderRef<LocalReminderScheduler>;
String _$reminderHash() => r'a9e81b8c8643af8010bb9bc7513487e3c21621db';

/// See also [Reminder].
@ProviderFor(Reminder)
final reminderProvider =
    AutoDisposeNotifierProvider<Reminder, List<LocalReminder>>.internal(
      Reminder.new,
      name: r'reminderProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$reminderHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Reminder = AutoDisposeNotifier<List<LocalReminder>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

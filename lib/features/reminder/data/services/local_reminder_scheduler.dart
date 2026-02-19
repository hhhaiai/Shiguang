import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;
import '../entities/local_reminder.dart';

class ReminderTapEvent {
  final int? reminderId;
  final int? diaryId;
  final String? payload;

  const ReminderTapEvent({this.reminderId, this.diaryId, this.payload});
}

class LocalReminderScheduler {
  static const String _channelId = 'aether_diary_reminders';
  static const String _channelName = 'Reminders';
  static const String _channelDescription = 'Diary reminder notifications';

  LocalReminderScheduler._internal();
  static final LocalReminderScheduler _instance =
      LocalReminderScheduler._internal();
  factory LocalReminderScheduler() => _instance;

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  final StreamController<ReminderTapEvent> _tapController =
      StreamController<ReminderTapEvent>.broadcast();

  bool _initialized = false;
  bool _initializing = false;

  Stream<ReminderTapEvent> get tapStream => _tapController.stream;

  Future<void> ensureInitialized() async {
    if (_initialized || _initializing || kIsWeb) return;
    _initializing = true;

    tz_data.initializeTimeZones();
    await _configureLocalTimezone();

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const darwinSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
      macOS: darwinSettings,
    );

    await _plugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: _handleNotificationResponse,
    );
    await _requestPermissions();

    final launchDetails = await _plugin.getNotificationAppLaunchDetails();
    final launchResponse = launchDetails?.notificationResponse;
    if (launchDetails?.didNotificationLaunchApp == true &&
        launchResponse != null) {
      _handleNotificationResponse(launchResponse);
    }

    _initialized = true;
    _initializing = false;
  }

  Future<void> sync(List<LocalReminder> reminders) async {
    await ensureInitialized();
    for (final reminder in reminders) {
      if (reminder.isEnabled) {
        await schedule(reminder);
      } else {
        await cancel(reminder.id);
      }
    }
  }

  Future<void> schedule(LocalReminder reminder) async {
    if (kIsWeb || reminder.id <= 0) return;

    await ensureInitialized();

    final repeatRule = (reminder.repeatRule ?? 'none').toLowerCase();
    final location = _resolveLocation(reminder.timezone);
    final scheduledAt = tz.TZDateTime.from(
      DateTime.fromMillisecondsSinceEpoch(reminder.triggerAt),
      location,
    );
    final triggerTime = _nextTriggerTime(scheduledAt, repeatRule);

    // One-shot reminders in the past should not be scheduled.
    if (repeatRule == 'none' &&
        !triggerTime.isAfter(tz.TZDateTime.now(location))) {
      await cancel(reminder.id);
      return;
    }

    await _plugin.zonedSchedule(
      id: reminder.id,
      title: reminder.title,
      body: reminder.body,
      scheduledDate: triggerTime,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
        macOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: _matchDateTimeComponents(repeatRule),
      payload: reminder.diaryId != null
          ? 'diary:${reminder.diaryId}'
          : 'reminder:${reminder.id}',
    );
  }

  Future<void> cancel(int reminderId) async {
    if (kIsWeb || reminderId <= 0) return;
    await ensureInitialized();
    await _plugin.cancel(id: reminderId);
  }

  Future<void> _configureLocalTimezone() async {
    try {
      final timezoneInfo = await FlutterTimezone.getLocalTimezone();
      final localLocation = tz.getLocation(timezoneInfo.identifier);
      tz.setLocalLocation(localLocation);
    } catch (_) {
      tz.setLocalLocation(tz.UTC);
    }
  }

  Future<void> _requestPermissions() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      final androidPlugin = _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      await androidPlugin?.requestNotificationsPermission();
      await androidPlugin?.requestExactAlarmsPermission();
      return;
    }

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final iosPlugin = _plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();
      await iosPlugin?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return;
    }

    if (defaultTargetPlatform == TargetPlatform.macOS) {
      final macPlugin = _plugin
          .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin
          >();
      await macPlugin?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  void _handleNotificationResponse(NotificationResponse response) {
    final payload = response.payload;
    final diaryId = _extractDiaryId(payload);

    _tapController.add(
      ReminderTapEvent(
        reminderId: response.id,
        diaryId: diaryId,
        payload: payload,
      ),
    );
  }

  int? _extractDiaryId(String? payload) {
    if (payload == null || payload.isEmpty) return null;

    if (payload.startsWith('diary:')) {
      return int.tryParse(payload.substring('diary:'.length));
    }

    return int.tryParse(payload);
  }

  tz.Location _resolveLocation(String? timezone) {
    if (timezone == null || timezone.isEmpty) {
      return tz.local;
    }

    try {
      return tz.getLocation(timezone);
    } catch (_) {
      return tz.local;
    }
  }

  tz.TZDateTime _nextTriggerTime(tz.TZDateTime triggerTime, String repeatRule) {
    var next = triggerTime;
    final now = tz.TZDateTime.now(triggerTime.location);

    if (next.isAfter(now)) {
      return next;
    }

    switch (repeatRule) {
      case 'daily':
        while (!next.isAfter(now)) {
          next = next.add(const Duration(days: 1));
        }
        return next;
      case 'weekly':
        while (!next.isAfter(now)) {
          next = next.add(const Duration(days: 7));
        }
        return next;
      case 'monthly':
        while (!next.isAfter(now)) {
          next = tz.TZDateTime(
            next.location,
            next.year,
            next.month + 1,
            next.day,
            next.hour,
            next.minute,
            next.second,
          );
        }
        return next;
      default:
        return next;
    }
  }

  DateTimeComponents? _matchDateTimeComponents(String repeatRule) {
    switch (repeatRule) {
      case 'daily':
        return DateTimeComponents.time;
      case 'weekly':
        return DateTimeComponents.dayOfWeekAndTime;
      case 'monthly':
        return DateTimeComponents.dayOfMonthAndTime;
      default:
        return null;
    }
  }
}

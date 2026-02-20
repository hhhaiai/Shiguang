import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../controllers/reminder_controller.dart';
import '../../../../core/ui/keyboard.dart';
import '../../../../core/ui/adaptive_navigation.dart';

class ReminderScreen extends ConsumerWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminders = ref.watch(reminderProvider);
    final isCupertino = isCupertinoPlatform(Theme.of(context).platform);

    return Scaffold(
      appBar: AppBar(centerTitle: isCupertino, title: const Text('Reminders')),
      body: reminders.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_none,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No reminders',
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                final reminder = reminders[index];
                final dateFormat = DateFormat('MMM d, yyyy • HH:mm');
                final date = DateTime.fromMillisecondsSinceEpoch(
                  reminder.triggerAt,
                );

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: ListTile(
                    leading: Switch(
                      value: reminder.isEnabled,
                      onChanged: (_) {
                        ref
                            .read(reminderProvider.notifier)
                            .toggleEnabled(reminder.id);
                      },
                    ),
                    title: Text(
                      reminder.title,
                      style: TextStyle(
                        decoration: reminder.isEnabled
                            ? null
                            : TextDecoration.lineThrough,
                      ),
                    ),
                    subtitle: Text(dateFormat.format(date)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        ref
                            .read(reminderProvider.notifier)
                            .deleteReminder(reminder.id);
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddReminderDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddReminderDialog(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();
    final bodyController = TextEditingController();
    final titleFocusNode = FocusNode();
    final bodyFocusNode = FocusNode();
    DateTime selectedDate = DateTime.now().add(const Duration(hours: 1));

    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Add Reminder'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    focusNode: titleFocusNode,
                    autofocus: true,
                    onTap: () => requestKeyboardFocus(context, titleFocusNode),
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: bodyController,
                    focusNode: bodyFocusNode,
                    onTap: () => requestKeyboardFocus(context, bodyFocusNode),
                    decoration: const InputDecoration(
                      labelText: 'Description (optional)',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.access_time),
                    title: Text(
                      DateFormat('MMM d, yyyy • HH:mm').format(selectedDate),
                    ),
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (!context.mounted) return;
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(selectedDate),
                        );
                        if (!context.mounted) return;
                        if (time != null) {
                          setState(() {
                            selectedDate = DateTime(
                              date.year,
                              date.month,
                              date.day,
                              time.hour,
                              time.minute,
                            );
                          });
                        }
                      }
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () {
                    final title = titleController.text.trim();
                    if (title.isNotEmpty) {
                      ref
                          .read(reminderProvider.notifier)
                          .createReminder(
                            title: title,
                            body: bodyController.text.trim().isEmpty
                                ? null
                                : bodyController.text.trim(),
                            triggerAt: selectedDate,
                          );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      },
    ).whenComplete(() {
      titleController.dispose();
      bodyController.dispose();
      titleFocusNode.dispose();
      bodyFocusNode.dispose();
    });
  }
}

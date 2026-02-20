import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/ui/keyboard.dart';
import '../controllers/reminder_controller.dart';

class ReminderScreen extends ConsumerStatefulWidget {
  const ReminderScreen({super.key});

  @override
  ConsumerState<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends ConsumerState<ReminderScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  void _addReminder() {
    final l10n = AppLocalizations.of(context);
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    if (title.isEmpty) return;

    ref.read(reminderProvider.notifier).createReminder(
          title: title,
          body: description.isNotEmpty ? description : null,
          triggerAt: DateTime.now().add(const Duration(hours: 1)),
        );

    _titleController.clear();
    _descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final reminders = ref.watch(reminderProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.reminders),
      ),
      body: reminders.isEmpty
          ? Center(child: Text(l10n.noReminders))
          : ListView.builder(
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                final reminder = reminders[index];
                return ListTile(
                  title: Text(reminder.title),
                  subtitle: reminder.body != null
                      ? Text(reminder.body!)
                      : null,
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ref
                          .read(reminderProvider.notifier)
                          .deleteReminder(reminder.id);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddReminderDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddReminderDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.addReminder),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              focusNode: _titleFocusNode,
              onTap: () => requestKeyboardFocus(context, _titleFocusNode),
              decoration: InputDecoration(
                labelText: l10n.title,
                border: const OutlineInputBorder(),
              ),
              autofocus: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              focusNode: _descriptionFocusNode,
              onTap: () => requestKeyboardFocus(context, _descriptionFocusNode),
              decoration: InputDecoration(
                labelText: l10n.descriptionOptional,
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () {
              _addReminder();
              Navigator.pop(context);
            },
            child: Text(l10n.add),
          ),
        ],
      ),
    );
  }
}
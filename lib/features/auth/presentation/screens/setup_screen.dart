import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/auth_controller.dart';
import '../../../../core/ui/keyboard.dart';

class SetupScreen extends ConsumerStatefulWidget {
  const SetupScreen({super.key});

  @override
  ConsumerState<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends ConsumerState<SetupScreen> {
  final _usernameController = TextEditingController();
  final _privatePinController = TextEditingController();
  final _confirmPinController = TextEditingController();
  final _usernameFocusNode = FocusNode();
  final _privatePinFocusNode = FocusNode();
  final _confirmPinFocusNode = FocusNode();
  String? _avatarPath;
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _privatePinController.dispose();
    _confirmPinController.dispose();
    _usernameFocusNode.dispose();
    _privatePinFocusNode.dispose();
    _confirmPinFocusNode.dispose();
    super.dispose();
  }

  Future<void> _pickAvatar() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 200,
    );
    if (image != null) {
      setState(() => _avatarPath = image.path);
    }
  }

  Future<void> _submit() async {
    final username = _usernameController.text.trim();
    if (username.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a username')));
      return;
    }

    final privatePin = _privatePinController.text;
    final confirmPin = _confirmPinController.text;

    if (privatePin.isNotEmpty && privatePin != confirmPin) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('PINs do not match')));
      return;
    }

    setState(() => _isLoading = true);

    try {
      final success = await ref
          .read(authProvider.notifier)
          .setupProfile(
            username: username,
            avatarPath: _avatarPath,
            privatePin: privatePin.isNotEmpty ? privatePin : null,
          );

      if (success && mounted) {
        context.go('/timeline');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Avatar
              GestureDetector(
                onTap: _pickAvatar,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    image: _avatarPath != null
                        ? DecorationImage(
                            image: FileImage(File(_avatarPath!)),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: _avatarPath == null
                      ? Icon(
                          Icons.person,
                          size: 60,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tap to add avatar',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              // Username
              TextField(
                controller: _usernameController,
                focusNode: _usernameFocusNode,
                onTap: () => requestKeyboardFocus(
                  context,
                  _usernameFocusNode,
                ),
                decoration: const InputDecoration(
                  labelText: 'Your Name',
                  prefixIcon: Icon(Icons.badge),
                  border: OutlineInputBorder(),
                ),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 24),
              // Private PIN (optional)
              Text(
                'Private PIN (optional)',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Used to encrypt private records',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _privatePinController,
                focusNode: _privatePinFocusNode,
                onTap: () => requestKeyboardFocus(
                  context,
                  _privatePinFocusNode,
                ),
                decoration: const InputDecoration(
                  labelText: 'Private PIN',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  hintText: 'Leave empty for no encryption',
                ),
                obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 6,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _confirmPinController,
                focusNode: _confirmPinFocusNode,
                onTap: () => requestKeyboardFocus(
                  context,
                  _confirmPinFocusNode,
                ),
                decoration: const InputDecoration(
                  labelText: 'Confirm PIN',
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 6,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _isLoading ? null : _submit,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Get Started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

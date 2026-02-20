import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../controllers/auth_controller.dart';
import '../../../../core/ui/keyboard.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _usernameController = TextEditingController();
  final _pinController = TextEditingController();
  final _usernameFocusNode = FocusNode();
  final _pinFocusNode = FocusNode();
  bool _isLogin = true;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _usernameController.dispose();
    _pinController.dispose();
    _usernameFocusNode.dispose();
    _pinFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final username = _usernameController.text.trim();
    final pin = _pinController.text;
    final l10n = AppLocalizations.of(context);

    if (username.isEmpty || pin.isEmpty) {
      setState(() => _errorMessage = l10n.pleaseFillInAllFields);
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final authController = ref.read(authProvider.notifier);
      bool success;

      if (_isLogin) {
        success = await authController.login(username, pin);
      } else {
        if (pin.length < 4) {
          setState(() {
            _isLoading = false;
            _errorMessage = l10n.pinAtLeast4Digits;
          });
          return;
        }
        success = await authController.createAccount(username, pin);
      }

      if (success && mounted) {
        context.go('/timeline');
      } else if (mounted) {
        setState(() {
          _errorMessage = _isLogin
              ? l10n.invalidUsernameOrPinError
              : l10n.usernameAlreadyExists;
        });
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.psychology,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.appTitle,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.captureMomentsKeepMemories,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                TextField(
                  controller: _usernameController,
                  focusNode: _usernameFocusNode,
                  onTap: () =>
                      requestKeyboardFocus(context, _usernameFocusNode),
                  decoration: InputDecoration(
                    labelText: l10n.username,
                    prefixIcon: const Icon(Icons.person),
                    border: const OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _pinController,
                  focusNode: _pinFocusNode,
                  onTap: () => requestKeyboardFocus(context, _pinFocusNode),
                  decoration: InputDecoration(
                    labelText: l10n.pin,
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _submit(),
                ),
                if (_errorMessage != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    _errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: _isLoading ? null : _submit,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(_isLogin ? l10n.login : l10n.createAccount),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                      _errorMessage = null;
                    });
                  },
                  child: Text(
                    _isLogin
                        ? l10n.dontHaveAccountCreateOne
                        : l10n.alreadyHaveAccountLogin,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

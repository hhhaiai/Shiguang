import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/i18n/app_i18n.dart';
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

    if (username.isEmpty || pin.isEmpty) {
      setState(
        () => _errorMessage = context.t(
          zhHans: '请填写所有字段',
          zhHant: '請填寫所有欄位',
          en: 'Please fill in all fields',
        ),
      );
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
            _errorMessage = context.t(
              zhHans: 'PIN 至少 4 位',
              zhHant: 'PIN 至少 4 位',
              en: 'PIN must be at least 4 digits',
            );
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
              ? context.t(
                  zhHans: '用户名或 PIN 错误',
                  zhHant: '使用者名稱或 PIN 錯誤',
                  en: 'Invalid username or PIN',
                )
              : context.t(
                  zhHans: '用户名已存在',
                  zhHant: '使用者名稱已存在',
                  en: 'Username already exists',
                );
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
                  context.t(zhHans: '拾光', zhHant: '拾光', en: 'Shiguang'),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  context.t(
                    zhHans: '记录时光，拾取记忆',
                    zhHant: '記錄時光，拾取記憶',
                    en: 'Capture moments, keep memories',
                  ),
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
                    labelText: context.t(
                      zhHans: '用户名',
                      zhHant: '使用者名稱',
                      en: 'Username',
                    ),
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
                    labelText: context.t(
                      zhHans: 'PIN',
                      zhHant: 'PIN',
                      en: 'PIN',
                    ),
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
                      : Text(
                          _isLogin
                              ? context.t(
                                  zhHans: '登录',
                                  zhHant: '登入',
                                  en: 'Login',
                                )
                              : context.t(
                                  zhHans: '创建账号',
                                  zhHant: '建立帳號',
                                  en: 'Create Account',
                                ),
                        ),
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
                        ? context.t(
                            zhHans: '还没有账号？去创建',
                            zhHant: '還沒有帳號？去建立',
                            en: 'Don\'t have an account? Create one',
                          )
                        : context.t(
                            zhHans: '已有账号？去登录',
                            zhHant: '已有帳號？去登入',
                            en: 'Already have an account? Login',
                          ),
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

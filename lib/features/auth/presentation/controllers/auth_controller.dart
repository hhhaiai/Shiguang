import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/objectbox/objectbox_providers.dart';
import '../../../../core/utils/crypto_utils.dart';
import '../../data/entities/local_account.dart';
import '../../data/repositories/local_account_repository.dart';

part 'auth_controller.g.dart';

/// Simple key-value storage for current user
final _secureStorage = FlutterSecureStorage();
final _currentUserIdKey = 'current_user_id';

@riverpod
LocalAccountRepository localAccountRepository(Ref ref) {
  final objectBox = ref.watch(objectBoxServiceProvider);
  return LocalAccountRepository(objectBox);
}

@riverpod
class Auth extends _$Auth {
  @override
  int? build() {
    _autoLogin();
    return null;
  }

  LocalAccountRepository get _repository => ref.read(localAccountRepositoryProvider);

  /// Auto login with stored user ID
  Future<void> _autoLogin() async {
    try {
      final storedId = await _secureStorage.read(key: _currentUserIdKey);
      if (storedId != null) {
        final userId = int.tryParse(storedId);
        if (userId != null) {
          final user = _repository.getById(userId);
          if (user != null) {
            state = userId;
          }
        }
      }
    } catch (_) {}
  }

  /// Setup or update user profile
  Future<bool> setupProfile({
    required String username,
    String? avatarPath,
    String? privatePin,
  }) async {
    if (username.isEmpty) return false;

    // Get existing user or create new
    var account = _repository.getByUsername(username);

    if (account == null) {
      // Create new account
      account = _repository.create(
        username: username,
        avatarPath: avatarPath,
      );
    } else {
      // Update existing
      account.username = username;
      if (avatarPath != null) account.avatarPath = avatarPath;
      _repository.update(account);
    }

    // Hash private PIN if provided
    if (privatePin != null && privatePin.isNotEmpty) {
      final salt = CryptoUtils.generateSalt();
      final hashed = CryptoUtils.hashPin(privatePin, salt);
      account.salt = salt;
      account.hashedPrivatePin = hashed;
      _repository.update(account);
    }

    // Save current user
    await _secureStorage.write(key: _currentUserIdKey, value: account.id.toString());

    _repository.updateLastLogin(account.id);
    state = account.id;

    return true;
  }

  /// Verify private PIN for encrypted records
  bool verifyPrivatePin(String pin) {
    final account = getCurrentUser();
    if (account == null || account.hashedPrivatePin == null || account.salt == null) {
      return pin.isEmpty; // No PIN set, any input is valid
    }
    return CryptoUtils.verifyPin(pin, account.salt!, account.hashedPrivatePin!);
  }

  /// Check if user has private PIN set
  bool get hasPrivatePin {
    final account = getCurrentUser();
    return account?.hashedPrivatePin != null;
  }

  /// Update avatar
  Future<void> updateAvatar(String path) async {
    final account = getCurrentUser();
    if (account == null) return;

    account.avatarPath = path;
    _repository.update(account);
  }

  /// Update username
  Future<bool> updateUsername(String username) async {
    final account = getCurrentUser();
    if (account == null) return false;

    final trimmed = username.trim();
    if (trimmed.isEmpty) return false;

    final existing = _repository.getByUsername(trimmed);
    if (existing != null && existing.id != account.id) {
      return false;
    }

    account.username = trimmed;
    _repository.update(account);
    return true;
  }

  /// Update private PIN
  Future<void> updatePrivatePin(String? pin) async {
    final account = getCurrentUser();
    if (account == null) return;

    if (pin != null && pin.isNotEmpty) {
      final salt = CryptoUtils.generateSalt();
      final hashed = CryptoUtils.hashPin(pin, salt);
      account.salt = salt;
      account.hashedPrivatePin = hashed;
    } else {
      account.salt = null;
      account.hashedPrivatePin = null;
    }
    _repository.update(account);
  }

  /// Switch user
  Future<void> switchUser(int userId) async {
    final account = _repository.getById(userId);
    if (account == null) return;

    await _secureStorage.write(key: _currentUserIdKey, value: userId.toString());
    _repository.updateLastLogin(userId);
    state = userId;
  }

  /// Logout (clear stored session)
  Future<void> logout() async {
    await _secureStorage.delete(key: _currentUserIdKey);
    state = null;
  }

  /// Get current user
  LocalAccount? getCurrentUser() {
    if (state == null) return null;
    return _repository.getById(state!);
  }

  /// Get all users
  List<LocalAccount> getAllUsers() {
    return _repository.getAll();
  }

  /// Compatibility API for legacy login screen.
  Future<bool> login(String username, String pin) async {
    final account = _repository.getByUsername(username);
    if (account == null) {
      return false;
    }

    if (account.hashedPrivatePin != null && account.salt != null) {
      final verified = CryptoUtils.verifyPin(
        pin,
        account.salt!,
        account.hashedPrivatePin!,
      );
      if (!verified) {
        return false;
      }
    }

    await _secureStorage.write(
      key: _currentUserIdKey,
      value: account.id.toString(),
    );
    _repository.updateLastLogin(account.id);
    state = account.id;
    return true;
  }

  /// Compatibility API for legacy login screen.
  Future<bool> createAccount(String username, String pin) async {
    final exists = _repository.getByUsername(username) != null;
    if (exists) {
      return false;
    }
    return setupProfile(username: username, privatePin: pin);
  }

  /// Delete user
  Future<bool> deleteUser(int userId) async {
    final result = _repository.delete(userId);
    if (result && state == userId) {
      await logout();
    }
    return result;
  }
}

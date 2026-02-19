import '../../../../core/objectbox/objectbox_service.dart';
import '../../../../objectbox.g.dart';
import '../entities/local_account.dart';

class LocalAccountRepository {
  final ObjectBoxService _objectBoxService;

  LocalAccountRepository(this._objectBoxService);

  Box<LocalAccount> get _box => _objectBoxService.localAccountBox;

  /// Create a new account
  LocalAccount create({
    required String username,
    String? avatarPath,
    String? salt,
  }) {
    final account = LocalAccount(
      username: username,
      avatarPath: avatarPath,
      salt: salt,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );
    _box.put(account);
    return account;
  }

  /// Get account by username
  LocalAccount? getByUsername(String username) {
    final query = _box.query(LocalAccount_.username.equals(username)).build();
    final result = query.findFirst();
    query.close();
    return result;
  }

  /// Get account by ID
  LocalAccount? getById(int id) {
    return _box.get(id);
  }

  /// Get all accounts
  List<LocalAccount> getAll() {
    return _box.getAll();
  }

  /// Update account
  void update(LocalAccount account) {
    _box.put(account);
  }

  /// Update last login time
  void updateLastLogin(int accountId) {
    final account = _box.get(accountId);
    if (account != null) {
      account.lastLoginAt = DateTime.now().millisecondsSinceEpoch;
      _box.put(account);
    }
  }

  /// Delete account
  bool delete(int id) {
    return _box.remove(id);
  }
}

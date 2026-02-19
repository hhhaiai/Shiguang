import 'package:objectbox/objectbox.dart';

@Entity()
class LocalAccount {
  @Id()
  int id;

  @Unique()
  String username;

  /// Avatar image path (local file path)
  String? avatarPath;

  /// Private password for encrypted records (hashed)
  String? hashedPrivatePin;

  String? salt;

  int createdAt;

  int? lastLoginAt;

  LocalAccount({
    this.id = 0,
    required this.username,
    this.avatarPath,
    this.hashedPrivatePin,
    this.salt,
    required this.createdAt,
    this.lastLoginAt,
  });
}

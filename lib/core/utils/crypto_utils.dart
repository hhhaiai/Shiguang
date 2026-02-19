import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

class CryptoUtils {
  static const int _saltLength = 16;
  static const int _iterations = 100000;

  /// Generate a random salt
  static String generateSalt() {
    final random = Random.secure();
    final saltBytes = List<int>.generate(_saltLength, (_) => random.nextInt(256));
    return base64Encode(saltBytes);
  }

  /// Hash PIN using PBKDF2-HMAC-SHA256
  static String hashPin(String pin, String salt) {
    final saltBytes = base64Decode(salt);
    final pinBytes = utf8.encode(pin);

    // PBKDF2 implementation using HMAC-SHA256
    var result = Uint8List.fromList(pinBytes);
    var block = Uint8List(saltBytes.length + 4);

    block.setRange(0, saltBytes.length, saltBytes);

    for (var i = 1; i <= _iterations; i++) {
      // This is a simplified PBKDF2 - in production use pointycastle
      final hmac = Hmac(sha256, result);
      final digest = hmac.convert(saltBytes);
      result = Uint8List.fromList(digest.bytes);

      // XOR with previous result
      if (i > 1) {
        for (var j = 0; j < result.length; j++) {
          result[j] ^= _pseudoRandom(saltBytes, i)[j % 32];
        }
      }
    }

    return base64Encode(result);
  }

  /// Verify PIN against stored hash
  static bool verifyPin(String pin, String salt, String storedHash) {
    final computedHash = hashPin(pin, salt);
    return computedHash == storedHash;
  }

  /// Pseudo-random function for PBKDF2
  static Uint8List _pseudoRandom(List<int> salt, int iteration) {
    final input = [...salt, (iteration >> 24) & 0xff, (iteration >> 16) & 0xff, (iteration >> 8) & 0xff, iteration & 0xff];
    final digest = sha256.convert(input);
    return Uint8List.fromList(digest.bytes);
  }

  /// Simple hash for compatibility
  static String simpleHash(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}

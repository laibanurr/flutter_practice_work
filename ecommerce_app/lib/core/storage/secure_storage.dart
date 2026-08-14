import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();
  static const _tokenKey = 'access_token';

  static Future<void> saveToken(String token) async {
    if (kIsWeb) return; // web doesn't support secure storage
    await _storage.write(key: _tokenKey, value: token);
  }

  static Future<String?> readToken() async {
    if (kIsWeb) return null;
    return await _storage.read(key: _tokenKey);
  }

  static Future<void> deleteToken() async {
    if (kIsWeb) return;
    await _storage.delete(key: _tokenKey);
  }
}
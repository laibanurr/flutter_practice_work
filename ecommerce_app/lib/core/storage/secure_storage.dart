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
static Future<void> saveUserId(int id) async {
  if (kIsWeb) return;
  await _storage.write(key: 'user_id', value: id.toString());
}

static Future<int?> readUserId() async {
  if (kIsWeb) return null;
  final value = await _storage.read(key: 'user_id');
  return value != null ? int.parse(value) : null;
}
  static Future<void> deleteToken() async {
    if (kIsWeb) return;
    await _storage.delete(key: _tokenKey);
  }
}
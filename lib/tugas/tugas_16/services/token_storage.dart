import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const String _keyToken = 'tugas16_auth_token';

  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(),
  );

  static Future<void> saveToken(String token) async {
    try {
      await _storage.write(key: _keyToken, value: token);
    } catch (_) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyToken, token);
    }
  }

  static Future<String?> getToken() async {
    try {
      final token = await _storage.read(key: _keyToken);
      if (token != null && token.isNotEmpty) return token;
    } catch (_) {}

    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_keyToken);
    } catch (_) {
      return null;
    }
  }

  static const String _keyAvatar = 'tugas16_local_profile_photo_v2';

  static Future<void> saveAvatar(String photo) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyAvatar, photo);
    } catch (_) {}
  }

  static Future<String?> getCachedAvatar() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_keyAvatar);
    } catch (_) {
      return null;
    }
  }

  static Future<void> clearAvatar() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_keyAvatar);
    } catch (_) {}
  }

  static Future<void> clearToken() async {
    try {
      await _storage.delete(key: _keyToken);
    } catch (_) {}

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_keyToken);
      await prefs.remove(_keyAvatar);
    } catch (_) {}
  }

  static Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}

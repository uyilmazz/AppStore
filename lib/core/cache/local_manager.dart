import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalManager {
  static LocalManager? _instance;
  late FlutterSecureStorage _storage;

  static LocalManager get instance => _instance ??= LocalManager._init();

  LocalManager._init() {
    _storage = const FlutterSecureStorage();
  }

  Future<void> saveToken(String key, String token) async {
    await _storage.write(key: key, value: token);
  }

  Future<String?> getToken(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> deleteToken(String key) async {
    await _storage.delete(key: key);
  }
}

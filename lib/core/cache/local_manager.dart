import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalManager {
  static final LocalManager _instance = LocalManager._init();

  static get instance => _instance;
  late FlutterSecureStorage _storage;

  LocalManager._init() {
    _storage = const FlutterSecureStorage();
  }

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }
}

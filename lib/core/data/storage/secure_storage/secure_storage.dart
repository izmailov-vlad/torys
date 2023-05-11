import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../ui.dart';

abstract class AppSecureStorage {
  Future<void> write({required String key, required String? value});

  Future<String?> read({required String key});

  Future<void> delete({required String key});

  Future<String?> getAccessToken();

  Future<void> setAccessToken(String token);

  Future<void> clearToken();
}

@Singleton(as: AppSecureStorage)
class AppSecureStorageImpl implements AppSecureStorage {
  late final FlutterSecureStorage _flutterSecureStorage;

  AppSecureStorageImpl() : _flutterSecureStorage = const FlutterSecureStorage();

  @override
  Future<void> write({required String key, required String? value}) async =>
      await _flutterSecureStorage.write(key: key, value: value);

  @override
  Future<void> delete({required String key}) async =>
      await _flutterSecureStorage.delete(key: key);

  @override
  Future<String?> read({required String key}) async =>
      await _flutterSecureStorage.read(key: key);

  @override
  Future<String?> getAccessToken() async => await _flutterSecureStorage.read(key: 'token');

  @override
  Future<void> clearToken() async {
    await _flutterSecureStorage.write(key: 'token', value: '');
  }

  @override
  Future<void> setAccessToken(String token) async {
    await _flutterSecureStorage.write(key: 'token', value: token);
  }
}

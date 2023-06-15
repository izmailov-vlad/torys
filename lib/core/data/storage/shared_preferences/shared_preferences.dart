import 'package:shared_preferences/shared_preferences.dart';

import '../../../../inject_package.dart';

abstract class PrefsKeys {
  static const String _wishesKey = 'user_wishes';
}

abstract class UserWishes {
  Future<bool> setWishesPassed();

  Future<bool> resetWishes();

  bool isWishesPassed();
}

@Injectable()
class AppSharedPreferences implements UserWishes {
  final SharedPreferences _prefs;

  AppSharedPreferences(this._prefs);

  Future<bool> putString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  String getString(String key, String defaultValue) {
    return _prefs.getString(key) ?? defaultValue;
  }

  Future<bool> putInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  int getInt(String key, int defaultValue) {
    return _prefs.getInt(key) ?? defaultValue;
  }

  Future<bool> putBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool getBool(String key, bool defaultValue) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  Future<bool> clear() async => await _prefs.clear();

  Future<bool> remove(String key) async => await _prefs.remove(key);

  @override
  bool isWishesPassed() {
    return _prefs.getBool(PrefsKeys._wishesKey) ?? false;
  }

  @override
  Future<bool> setWishesPassed() async {
    return await _prefs.setBool(PrefsKeys._wishesKey, true);
  }

  @override
  Future<bool> resetWishes() async {
    return await _prefs.setBool(PrefsKeys._wishesKey, false);
  }
}

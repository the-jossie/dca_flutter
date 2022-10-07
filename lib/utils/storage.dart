import 'package:shared_preferences/shared_preferences.dart';

import '../../set_up.dart';

class Storage {
  SharedPreferences prefs = getIt<SharedPreferences>();

  Future<void> setBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  Future<void> setInt(String key, int value) async {
    await prefs.setInt(key, value);
  }

  Future<void> setDouble(String key, double value) async {
    await prefs.setDouble(key, value);
  }

  bool? getBool(String key) {
    return prefs.getBool(key);
  }

  String? getString(String key) {
    return prefs.getString(key);
  }

  double? getDobule(String key) {
    return prefs.getDouble(key);
  }

  int? getInt(String key) {
    return prefs.getInt(key);
  }

  Future<void> removeKey(String key) async {
    prefs.remove(key);
  }

  Future<void> resetStorage() async {
    await prefs.clear();
  }
}

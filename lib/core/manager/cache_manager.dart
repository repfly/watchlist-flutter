import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static late SharedPreferences _prefs;

  /// Initializes the [_prefs] while app loads.
  /// Make sure it is called before the widget tree renders.
  static Future<void> ensureInitalized() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Saves the given value with the key pair,
  ///
  ///   [key] (CacheKeys): The key to save the value under.
  ///   [value] (dynamic): The value to be saved.
  static Future<void> saveValue(CacheKeys key, dynamic value) async {
    if (value is String) {
      await _prefs.setString(key.name, value);
    }
    if (value is int) {
      await _prefs.setInt(key.name, value);
    }
    if (value is bool) {
      await _prefs.setBool(key.name, value);
    }
  }

  /// Returns the value matches with the provided [key]
  ///
  /// Args:
  ///   [key] (CacheKeys): The key of the value you want to retrieve.
  static dynamic getValue(CacheKeys key) {
    return _prefs.get(key.name);
  }

  /// If the cache contains a value of given key, returns true.
  ///
  /// Args:
  ///   [key] (CacheKeys): The key to check for.
  static bool containsValue(CacheKeys key) {
    return _prefs.containsKey(key.name);
  }

  /// It clears all the data from the cache.
  static Future<void> clearAll() async {
    await _prefs.clear();
  }
}

enum CacheKeys {
  USER,
  TOKEN,
  LOGGED_IN,
}

import 'package:shared_preferences/shared_preferences.dart';
import 'package:watchlist/core/service/me/model/me_response.dart';

class CacheManager {
  Future<void> saveTheme(bool darkTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(CacheManagerKey.DARK_THEME.toString(), darkTheme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(CacheManagerKey.DARK_THEME.toString());
  }
  Future<bool> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(CacheManagerKey.TOKEN.toString());
  }

  Future<void> clearCache() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}

enum CacheManagerKey { DARK_THEME, TOKEN }

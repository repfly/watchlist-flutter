import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:watchlist/core/manager/cache_manager.dart';
import 'package:watchlist/core/manager/network/network_manager.dart';
import 'package:watchlist/firebase_options.dart';
import 'package:watchlist/modules/home/home.dart';
import 'package:watchlist/modules/login/login.dart';

class AppInitializer {
  static initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    final status = await Permission.notification.status;
    if (status.isDenied) {
      await Permission.notification.request();
    }

    try {
      await CacheManager.ensureInitalized();
      await NetworkManager.ensureInitialized();
    } catch (e) {
      rethrow;
    }
  }

  static Route getHomeRoute() {
    return CacheManager.containsValue(CacheKeys.TOKEN)
        ? Home.route()
        : Login.route();
  }

  static Widget getHome() {
    return CacheManager.containsValue(CacheKeys.TOKEN) ? Home() : Login();
  }
}

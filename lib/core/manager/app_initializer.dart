import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:watchlist/core/manager/cache_manager.dart';

class AppInitializer {
  static void initApp()async {
    WidgetsFlutterBinding.ensureInitialized();
      // await NetworkManager.ensureInitialized();
      await CacheManager.ensureInitalized();
  }
}

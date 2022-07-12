import 'package:flutter/cupertino.dart';

import 'cache_manager.dart';

class AuthenticationManager {
  bool isLoggedIn = false;
  BuildContext context;
  AuthenticationManager({required this.context}) {
    fetchUserLogin();
  }

  Future<void> fetchUserLogin() async {
    final token = await CacheManager.getValue(CacheKeys.TOKEN);
    if (token != null) {
      isLoggedIn = true;
    }
  }
}

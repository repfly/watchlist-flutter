import 'package:flutter/cupertino.dart';

import 'cache_manager.dart';

class AuthenticationManager extends CacheManager {
  bool isLoggedIn = false;
  BuildContext context;
  AuthenticationManager({
    required this.context
  }){
    fetchUserLogin();
  }

  Future<void> fetchUserLogin() async {
    final token = await getToken();
    if (token != null) {
      isLoggedIn = true;
    }
  }
}
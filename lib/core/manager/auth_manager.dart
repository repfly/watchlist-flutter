import 'package:watchlist/core/service/me/me_service.dart';

import 'cache_manager.dart';

class AuthenticationManager {
  bool isLoggedIn = false;

  AuthenticationManager() {
    autoLoginUser();
  }

  Future<void> autoLoginUser() async {
    await CacheManager.getValue(CacheKeys.TOKEN);
    await MeService.shared.fetchUser();
   
  }
}

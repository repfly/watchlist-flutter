import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:watchlist/core/manager/cache_manager.dart';

void main() {
  group('Cache', () {
    test('saving a bool should return bool again', () async {
      WidgetsFlutterBinding.ensureInitialized();
      await CacheManager.ensureInitalized();
      CacheManager.saveValue(CacheKeys.LOGGED_IN, true);
      expect(CacheManager.getValue(CacheKeys.LOGGED_IN), true);
    });
  });
}

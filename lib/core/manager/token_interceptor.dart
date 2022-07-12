// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'cache_manager.dart';

///
class TokenInterceptor extends Interceptor {

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await CacheManager.getValue(CacheKeys.TOKEN);

    if (token == null) {
      handler.next(options);
      return;
    }
    options.headers["Authorization"] = "Bearer " + token;
    handler.next(options);
  }
}
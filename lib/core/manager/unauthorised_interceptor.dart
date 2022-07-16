// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';

import 'cache_manager.dart';

// Project imports:

class UnauthorizedInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == HttpStatus.unauthorized &&
        !CacheManager.containsValue(CacheKeys.TOKEN)) {
      CacheManager.clearAll();
      handler.next(response);
      return;
    }
    handler.next(response);
    super.onResponse(response, handler);
  }
}
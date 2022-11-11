// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/core/manager/navigation_service.dart';
import 'package:watchlist/modules/login/login.dart';

import '../cache_manager.dart';

// Project imports:

class UnauthorizedInterceptor extends Interceptor {
  late final Response<dynamic> _response;
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == HttpStatus.unauthorized) {
      _response = response;
      handler.next(response);
      return;
    }
    handler.next(response);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response != null) {
      if (err.response!.statusCode == 401) {
        CacheManager.clearAll();
        Navigator.of(NavigationService.navigatorKey.currentContext!)
            .pushAndRemoveUntil(Login.route(), (route) => false);
        handler.resolve(_response);
      } else {
        handler.next(err);
      }
    }
    return super.onError(err, handler);
  }
}

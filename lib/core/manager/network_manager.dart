// 📦 Package imports:

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'token_interceptor.dart';

class NetworkManager {
  static late Dio dio;

  static ensureInitialized() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://watchlist.alpr.dev/api',
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        validateStatus: (_) => true,
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000,
        receiveTimeout: 120 * 1000));
    dio.interceptors.add(TokenInterceptor());
    // dio.interceptors.add(UnauthorizedInterceptor());
  }
}

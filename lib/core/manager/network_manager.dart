import 'package:dio/dio.dart';
import 'package:watchlist/core/manager/token_interceptor.dart';

class NetworkManager {
  static NetworkManager? _instance;
  late final Dio dio;
  final String baseUrl = 'https://watchlist.alpr.dev/api';

  static NetworkManager get instance {
    if (_instance != null) {
      return _instance!;
    }
    _instance = NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(TokenInterceptor());
  }
}

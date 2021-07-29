import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkManager {
  static NetworkManager? _instance;
  late final Dio dio;
  final String baseUrl = 'http://localhost:8083/api';

  static NetworkManager get instance {
    if (_instance != null) {
      return _instance!;
    }
    _instance = NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(PrettyDioLogger());
  }
}
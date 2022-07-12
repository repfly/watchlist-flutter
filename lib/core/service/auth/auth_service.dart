import 'package:dio/dio.dart';
import 'package:watchlist/core/manager/cache_manager.dart';
import 'package:watchlist/core/manager/network_manager.dart';
import 'package:watchlist/core/service/auth/model/login_request.dart';
import 'package:watchlist/core/service/auth/model/login_response.dart';
import 'package:watchlist/core/service/auth/model/register_request.dart';

import 'model/register_response.dart';

abstract class IAuthService {
  final String _path = "/authenticate";
  final Dio _dio = NetworkManager.instance.dio;

  Future<RegisterResponse> registerUser(RegisterRequest user);

  Future<LoginResponse> loginUser(LoginRequest user);

  IAuthService();
}

class AuthService extends IAuthService {
  static final shared = AuthService._init();

  AuthService._init();

  @override
  Future<RegisterResponse> registerUser(RegisterRequest user) async {
    var response =
        await _dio.post('$_path/signup', data: registerRequestToJson(user));
    if (response.statusCode != 200) {
      throw "There is a problem with backend while registering";
    }
    return RegisterResponse.fromJson(response.data);
  }

  @override
  Future<LoginResponse> loginUser(LoginRequest user) async {
    var response = await _dio
        .post('$_path/login', data: loginRequestToJson(user))
        .then((value) => LoginResponse.fromJson(value.data));
    if (response.token != null) {
      CacheManager.saveValue(CacheKeys.TOKEN, response.token);
    }
    return response;
  }
}

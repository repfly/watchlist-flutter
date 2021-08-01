import 'dart:io';

import 'package:dio/dio.dart';
import 'package:watchlist/core/manager/cache_manager.dart';
import 'package:watchlist/core/manager/network_manager.dart';
import 'package:watchlist/core/service/me/model/me_response.dart';

abstract class IMeService {
  final String _path = "/me";
  final Dio _dio = NetworkManager.instance.dio;

  Future<MeResponse> fetchUser();
}

class MeService extends IMeService with CacheManager {
  static final shared = MeService.init();
  MeService.init();

  @override
  Future<MeResponse> fetchUser() async {
    var _token = await getToken();
    var response = await _dio.get(_path,
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $_token'}));

    if (response.statusCode != 200) {
      throw "Me service fetch profile error";
    }
    return MeResponse.fromJson(response.data);
  }
}

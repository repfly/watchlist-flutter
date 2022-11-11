import 'package:dio/dio.dart';
import 'package:watchlist/core/manager/network/network_manager.dart';
import 'package:watchlist/core/service/me/model/me_response.dart';

abstract class IMeService {
  final String _path = "/me";
  final Dio _dio = NetworkManager.dio;

  Future<MeResponse> fetchUser();
}

class MeService extends IMeService {
  static final shared = MeService.init();
  MeService.init();

  @override
  Future<MeResponse> fetchUser() async {
    return await _dio
        .get(_path)
        .then((value) => MeResponse.fromJson(value.data));
  }
}

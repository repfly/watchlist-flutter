
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:watchlist/core/manager/cache_manager.dart';
import 'package:watchlist/core/manager/network_manager.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';

abstract class IListService {
  final String _path = "/watchlist";
  final Dio _dio = NetworkManager.instance.dio;

  Future<ListResponse> fetchListById(String listId);
}

class ListService extends IListService with CacheManager {
  static final shared = ListService._init();
  ListService._init();

  @override
  Future<ListResponse> fetchListById(String listId) async {
    var token = await getToken();
    var response = await _dio.get('$_path/$listId', options: Options(headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token'
    }));
    if (response.statusCode != 200) {
      throw 'Error fetching list by id';
    }
    return ListResponse.fromJson(response.data);
  }

}


import 'dart:io';

import 'package:dio/dio.dart';
import 'package:watchlist/core/manager/cache_manager.dart';
import 'package:watchlist/core/manager/network_manager.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';
import 'package:watchlist/core/service/list/model/request/update_list_title_request.dart';

abstract class IListService {
  final String _path = "/watchlist";
  final Dio _dio = NetworkManager.instance.dio;

  Future<void> createList(String title);

  Future<ListResponse> fetchListById(String listId);

  Future<void> updateListTitleById(UpdateListTitleRequest request);

  Future<void> deleteList(String listId);
}

class ListService extends IListService with CacheManager {
  static final shared = ListService._init();

  ListService._init();

  @override
  Future<void> createList(String title) async {
    var token = await getToken();
    var data = {"title": title};
    var response = await _dio.post(_path,
        data: data,
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
    if (response.statusCode != 200) {
      throw 'Error creating list';
    }
  }

  @override
  Future<ListResponse> fetchListById(String listId) async {
    var token = await getToken();
    var response = await _dio.get('$_path/$listId',
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
    if (response.statusCode != 200) {
      throw 'Error fetching list by id';
    }
    return ListResponse.fromJson(response.data);
  }

  @override
  Future<void> updateListTitleById(UpdateListTitleRequest request) async {
    var token = await getToken();
    var response = await _dio.patch('$_path/title',
        data: updateListTitleRequestToJson(request),
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
    if (response.statusCode != 200) {
      throw "Update list id error";
    }
  }

  @override
  Future<void> deleteList(String listId) async {
    var token = await getToken();
    var response = await _dio.delete('$_path/$listId',
        options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}));
    if (response.statusCode != 200) {
      throw "Delete list error";
    }
  }
}

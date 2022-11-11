import 'package:dio/dio.dart';
import 'package:watchlist/core/manager/network/network_manager.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';
import 'package:watchlist/core/service/list/model/request/update_list_title_request.dart';

abstract class IListService {
  final String _path = "/watchlist";
  final Dio _dio = NetworkManager.dio;

  Future<void> createList(String title);
  Future<ListResponse> fetchListById(String listId);
  Future<void> updateListTitleById(UpdateListTitleRequest request);
  Future<void> deleteList(String listId);
  Future<void> addMovieToList(String listId, String imdbId);
}

class ListService extends IListService {
  static final shared = ListService._init();

  ListService._init();

  @override
  Future<void> createList(String title) async {
    await _dio.post(_path, data: {"title": title});
  }

  @override
  Future<ListResponse> fetchListById(String listId) async {
    return await _dio
        .get('$_path/$listId')
        .then((value) => ListResponse.fromJson(value.data));
  }

  @override
  Future<void> updateListTitleById(UpdateListTitleRequest request) async {
    await _dio.patch('$_path/title',
        data: updateListTitleRequestToJson(request));
  }

  @override
  Future<void> deleteList(String listId) async {
    await _dio.delete('$_path/$listId');
  }

  @override
  Future<void> addMovieToList(String listId, String imdbId) async {
    var data = {"listId": listId, "imdbId": imdbId};

    await _dio.post('$_path/add/movie', data: data);
  }
}

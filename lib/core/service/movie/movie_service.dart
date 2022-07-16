import 'package:dio/dio.dart';
import 'package:watchlist/core/manager/network_manager.dart';
import 'package:watchlist/core/service/movie/model/movie_response.dart';
import 'package:watchlist/core/service/movie/model/search_response.dart';
import 'package:watchlist/core/service/movie/model/trending_response.dart';

abstract class IMovieService {
  final String _path = "/movie";
  final Dio _dio = NetworkManager.dio;

  Future<MovieResponse> fetchMovieByIMDBId(String imdbId);

  Future<SearchResponse> searchMovieByTitle(String title);

  Future<MovieResponse> fetchMovieByTitle(String title);

  Future<void> fetchTrendings({int pageNumber = 1, String timeWindow = 'day'});

  IMovieService();
}

class MovieService extends IMovieService {
  static final shared = MovieService._init();

  MovieService._init();

  @override
  Future<MovieResponse> fetchMovieByIMDBId(String imdbId) async {
    var response = await _dio.get('$_path/$imdbId');
    if (response.statusCode != 200) {
      throw "We think something went wrong at fetch movie by id";
    }
    var movie = MovieResponse.fromJson(response.data);
    return movie;
  }

  @override
  Future<SearchResponse> searchMovieByTitle(String title) async {
    var response = await _dio.get('$_path', queryParameters: {'title': title});
    if (response.statusCode != 200) {
      throw "We think something went wrong at search movie by title";
    }
    var searchList = SearchResponse.fromJson(response.data);
    return searchList;
  }

  @override
  Future<MovieResponse> fetchMovieByTitle(String title) async {
    var response = await _dio.get('$_path/title/$title');
    if (response.statusCode != 200) {
      throw "error at get movie by title";
    }
    return MovieResponse.fromJson(response.data);
  }

  @override
  Future<void> fetchTrendings(
      {int pageNumber = 1, String timeWindow = 'day'}) async {
    var response = await _dio.get('$_path/trendings/$timeWindow',
        queryParameters: {
          'timeInterval': timeWindow
        }).then((value) => TrendingsResponse.fromJson(value.data));
  }
}

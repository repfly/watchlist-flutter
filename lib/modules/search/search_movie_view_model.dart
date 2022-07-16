import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:watchlist/core/service/list/list_service.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';
import 'package:watchlist/core/service/movie/model/movie_response.dart';
import 'package:watchlist/core/service/movie/model/search_response.dart';
import 'package:watchlist/core/service/movie/movie_service.dart';

import '../../shared/alert/toast_alert.dart';
import '../../shared/movie_detail/movie_detail.dart';
import 'search_movie.dart';

abstract class SearchMovieViewModel extends State<SearchMovie> {
  ListResponse list;
  SearchMovieViewModel(this.list);

  late SearchResponse searchResponse =
      new SearchResponse(search: [], totalResults: "", response: "");
  FloatingSearchBarController searchBarController =
      FloatingSearchBarController();
  late MovieResponse movieDetail;
  bool isBackButtonActive = false;
  late List<MovieResponse> movies = [];

  @override
  void initState() {
    super.initState();
    fetchMoviesFromList();
  }

  Future<void> fetchMoviesFromList() async {
    List<MovieResponse> tempArr = [];

    if (list.movies == null) {
      movies = tempArr;
      setState(() {});
      return;
    }
    for (String movieId in list.movies!) {
      tempArr.add(await MovieService.shared.fetchMovieByIMDBId(movieId));
    }
    movies = tempArr;
    setState(() {});
  }

  Future<void> searchMovieByTitle() async {
    if (searchBarController.query.length != 0) {
      searchResponse = await MovieService.shared
          .searchMovieByTitle(searchBarController.query);
    }
    setState(() {});
  }

  Future<void> addMovieToList(ListResponse list, String imdbId) async {
    ListService.shared.addMovieToList(list.listId, imdbId);
    CustomAlert.showToast("Movie added to your list!");
    setState(() {});
  }

  Future<void> navigateToMovieDetail(String imdbId) async {
    var movie = await MovieService.shared.fetchMovieByIMDBId(imdbId);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MovieDetail(movie)));
    setState(() {});
  }

  Future<String> getMovieDetail(String imdbId) async {
    var movie = await MovieService.shared.fetchMovieByIMDBId(imdbId);
    return movie.plot;
  }

  @override
  void dispose() {
    super.dispose();
    searchBarController.dispose();
  }
}

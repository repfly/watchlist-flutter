import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:watchlist/core/service/movie/model/MovieResponse.dart';
import 'package:watchlist/core/service/movie/model/SearchResponse.dart';
import 'package:watchlist/core/service/movie/movie_service.dart';
import 'package:watchlist/widgets/movie_detail/movie_detail.dart';

import 'search_movie.dart';

abstract class SearchMovieViewModel extends State<SearchMovie> {
  late SearchResponse searchResponse =
      new SearchResponse(search: [], totalResults: "", response: "");
  FloatingSearchBarController searchBarController =
      FloatingSearchBarController();
  late MovieResponse movieDetail;
  bool isBackButtonActive = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> searchMovieByTitle() async {
    if (searchBarController.query.length != 0) {
      searchResponse = await MovieService.shared
          .searchMovieByTitle(searchBarController.query);
    }
    setState(() {});
  }


  Future<void> navigateToMovieDetail(String imdbId) async {
    var movie = await MovieService.shared.fetchMovieByIMDBId(imdbId);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MovieDetail(movie)));
    setState(() {});
  }

  Future<String> getMovieDetail(String imdbId) async {
    var movie  = await MovieService.shared.fetchMovieByIMDBId(imdbId);
    return movie.plot;
  }


}

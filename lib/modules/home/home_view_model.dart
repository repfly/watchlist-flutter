import 'package:flutter/material.dart';
import 'package:watchlist/core/service/movie/model/movie_response.dart';
import 'package:watchlist/core/service/movie/movie_service.dart';
import 'package:watchlist/modules/home/home.dart';
import 'package:watchlist/modules/profile/profile.dart';

import '../../shared/movie_detail/movie_detail.dart';

abstract class HomeViewModel extends State<Home> {
  var topPicksArray = [
    "tt4154796",
    "tt1483013",
    "tt0325980",
    "tt0080684",
    "tt0816692",
    "tt1631867",
    "tt4633694",
    "tt2250912",
    "tt0133093"
  ];
  late List<MovieResponse> movies = [];
  bool pageLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchTopPicks();
  }

  navigateToProfile() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Profile()));
  }

  Future<void> fetchTopPicks() async {
    MovieService.shared.fetchTrendings();
    List<MovieResponse> result = [];
    for (var movieID in topPicksArray) {
      result.add(await MovieService.shared.fetchMovieByIMDBId(movieID));
    }
    movies.addAll(result);
    pageLoaded = true;
    setState(() {});
  }

  navigateToMovieDetail(MovieResponse movie) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MovieDetail(movie)));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';
import 'package:watchlist/core/service/movie/model/MovieResponse.dart';
import 'package:watchlist/core/service/movie/movie_service.dart';
import 'package:watchlist/widgets/list_detail/list_detail.dart';
import 'package:watchlist/widgets/movie_detail/movie_detail.dart';

abstract class ListDetailViewModel extends State<ListDetail> {
  ListResponse list;

  ListDetailViewModel(this.list);

  late List<MovieResponse> movies = [];

  @override
  void initState() {
    super.initState();

    fetchMoviesFromList();
  }

  Future<void> fetchMoviesFromList() async {
    List<MovieResponse> tempArr = [];

    for (String movieId in list.movies) {
      tempArr.add(await MovieService.shared.fetchMovieByIMDBId(movieId));
    }
    movies = tempArr;
    setState(() {});
  }

  void navigateToMovieDetail(MovieResponse movie) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MovieDetail(movie)));
  }
}

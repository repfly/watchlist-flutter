import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';
import 'package:watchlist/core/service/movie/model/MovieResponse.dart';
import 'package:watchlist/core/service/movie/movie_service.dart';
import 'package:watchlist/modules/search/search_movie.dart';

import '../movie_detail/movie_detail.dart';
import 'list_detail.dart';

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

    if(list.movies == null){
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

  navigateToAddMovie() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => SearchMovie(list)));
  }

  void navigateToMovieDetail(MovieResponse movie) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MovieDetail(movie)));
  }
}

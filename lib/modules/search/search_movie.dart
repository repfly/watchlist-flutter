import 'package:flutter/material.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';
import 'package:watchlist/modules/search/search_movie_view.dart';


class SearchMovie extends StatefulWidget {
  final ListResponse list;
  SearchMovie(this.list);

  @override
  SearchMovieView createState() => SearchMovieView(list);

}
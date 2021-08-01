
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';
import 'package:watchlist/core/service/movie/model/MovieResponse.dart';
import 'package:watchlist/widgets/list_detail/list_detail_view_model.dart';
import 'package:watchlist/widgets/movie_card.dart';

class ListDetailView extends ListDetailViewModel {

  ListDetailView(list) : super(list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(list.listTitle),),
      body: movieListBuilder(),
    );
  }

  movieListBuilder() {
    return ListView.builder(
        itemCount: movies.length,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return MovieCard(movies[index]);
        });
  }

}
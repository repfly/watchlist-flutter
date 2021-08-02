import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/core/service/movie/model/MovieResponse.dart';
import 'package:watchlist/widgets/list_detail/list_detail_view_model.dart';

class ListDetailView extends ListDetailViewModel {
  ListDetailView(list) : super(list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(list.listTitle),
        actions: [
          InkWell(child: Icon(CupertinoIcons.add),
          onTap: () {
            navigateToAddMovie();
          },),
          SizedBox(width: 10,)
        ],
      ),
      body: movieListBuilder(),
    );
  }

  movieListBuilder() {
    return ListView.builder(
        itemCount: movies.length,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return movieCard(movies[index]);
        });
  }

  movieCard(MovieResponse movie) {
    return InkWell(
      onTap: () {
        navigateToMovieDetail(movie);
      },
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 90,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(movie.poster),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(movie.imdbRating)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            movie.plot,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Text(
                                "Release year: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(movie.year),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

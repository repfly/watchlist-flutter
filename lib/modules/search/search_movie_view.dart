import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';
import 'package:watchlist/core/service/movie/model/movie_response.dart';
import 'package:watchlist/core/service/movie/model/search_response.dart';

import 'search_movie_view_model.dart';

class SearchMovieView extends SearchMovieViewModel {
  late final ListResponse list;
  SearchMovieView(this.list) : super(list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(list.listTitle),
      ),
      body: FloatingSearchBar(
          debounceDelay: Duration(milliseconds: 500),
          controller: searchBarController,
          hint: "Search for a movie...",
          closeOnBackdropTap: true,
          onQueryChanged: (_) {
            searchMovieByTitle();
          },
          body: IndexedStack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 65.0),
              child: movieListBuilder(),
            )
          ]),
          builder: (context, _) => buildMovieItems()),
    );
  }

  movieListBuilder() {
    return ListView.builder(
        itemCount: movies.length,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return movieCard(movies[index]);
        });
  }

  movieCard(MovieResponse movie) {
    return InkWell(
      onTap: () {
        navigateToMovieDetail(movie.imdbId);
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
                        SizedBox(height: 5),
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

  buildMovieItems() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        shrinkWrap: true,
        itemCount: searchResponse.search.length,
        itemBuilder: (context, index) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      searchResponse.search[index].poster,
                      width: 50,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    searchResponse.search[index].title,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          );
        });
  }

  searchMovieCard(Search movie) {
    return InkWell(
      onTap: () {
        navigateToMovieDetail(movie.imdbId);
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
                        )
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
                                fontSize: 22, fontWeight: FontWeight.bold),
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
                  InkWell(
                    onTap: () async {
                      await addMovieToList(list, movie.imdbId);
                    },
                    child: Icon(Icons.add),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:watchlist/core/service/movie/model/SearchResponse.dart';

import 'search_movie_view_model.dart';

class SearchMovieView extends SearchMovieViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingSearchBar(
          debounceDelay: Duration(milliseconds: 500),
          controller: searchBarController,
          hint: "Search for a movie...",
          closeOnBackdropTap: true,
          onQueryChanged: (_) {
            searchMovieByTitle();
          },
          body: IndexedStack(children: []),
          builder: (context, _) => buildMovieItems()),
    );
  }

  buildMovieItems() {
    return ListView.builder(
        physics: PageScrollPhysics(),
        shrinkWrap: true,
        itemCount: searchResponse.search.length,
        itemBuilder: (context, index) {
          return movieCard(searchResponse.search[index]);
        });
  }

  movieCard(Search movie) {
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
                    onTap: () {
                      //TODO: ADD MOVIE TO LIST
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

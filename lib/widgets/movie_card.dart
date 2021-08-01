import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/core/service/movie/model/MovieResponse.dart';

import 'movie_detail/movie_detail.dart';

class MovieCard extends StatelessWidget {
  final MovieResponse movie;

  MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToMovieDetail(movie, context);
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

  void navigateToMovieDetail(MovieResponse movie, BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MovieDetail(movie)));
  }
}

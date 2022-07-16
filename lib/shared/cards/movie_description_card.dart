import 'package:flutter/material.dart';
import 'package:watchlist/core/service/movie/model/movie_response.dart';
import 'package:watchlist/shared/movie_detail/movie_detail.dart';

class MovieDescriptionCard extends StatelessWidget {
  final MovieResponse movie;
  const MovieDescriptionCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MovieDetail(movie), fullscreenDialog: true));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            clipBehavior: Clip.hardEdge,
            child: Container(
              height: 100,
              child: Row(
                children: [
                  Image.network(movie.poster),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Flexible(
                            child: Text(
                              movie.plot,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
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
            )),
      ),
    );
  }
}

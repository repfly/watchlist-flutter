import 'package:flutter/material.dart';
import 'package:watchlist/core/service/movie/model/movie_response.dart';

class MovieDetail extends StatelessWidget {
  final MovieResponse movie;

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 600.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: NetworkImage(movie.poster),
                            fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                          )
                        ]),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          movie.title,
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        )),
                        Chip(
                          backgroundColor: Colors.amber,
                          label: Text(
                            movie.imdbRating,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(movie.plot, style: TextStyle(fontFamily: 'Arvo')),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Row(
                    children: [Text("Genre: "), Text(movie.genre)],
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

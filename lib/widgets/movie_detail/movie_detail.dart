import 'package:flutter/material.dart';
import 'package:watchlist/core/service/movie/model/MovieResponse.dart';
import 'dart:ui';

class MovieDetail extends StatelessWidget {
  final MovieResponse movie;

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Scaffold(
          appBar: AppBar(
            leading: BackButton(),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          extendBodyBehindAppBar: true,
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
                            fontSize: 30.0,
                          ),
                        )),
                        Text(
                          movie.imdbRating,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(movie.plot,
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Arvo')),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Row(
                    children: [Text("Genre: "), Text(movie.genre)],
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  // Row(
                  //   children: <Widget>[
                  //     Expanded(
                  //         child: Container(
                  //       width: 150.0,
                  //       height: 60.0,
                  //       alignment: Alignment.center,
                  //       child: Text(
                  //         'Add to your list',
                  //         style: TextStyle(color: Colors.black, fontSize: 20.0),
                  //       ),
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10.0),
                  //           color: Colors.white54),
                  //     )),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

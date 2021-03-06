import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/core/service/movie/model/MovieResponse.dart';

import 'home_view_model.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Watchlist"),
        actions: [
          InkWell(
            child: Icon(CupertinoIcons.profile_circled),
            onTap: () {
              navigateToProfile();
            },
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: pageLoaded
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Top picks for you",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  ListView.builder(
                      itemCount: movies.length,
                      physics: PageScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return topPicksCard(movies[index]);
                      })
                ],
              ),
            )
          : loadingView(),
    );
  }

  Widget loadingView() {
    return Center(
      child: Column(
        children: [
          CircularProgressIndicator(),
          Text(
            "Loading...",
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }

  InkWell topPicksCard(MovieResponse movie) {
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

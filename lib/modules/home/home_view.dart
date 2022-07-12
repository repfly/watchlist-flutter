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
          IconButton(
            icon: Icon(CupertinoIcons.profile_circled),
            onPressed: () {
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

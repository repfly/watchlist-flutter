import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watchlist/shared/cards/movie_description_card.dart';

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
                        return MovieDescriptionCard(movie: movies[index]);
                      })
                ],
              ),
            )
          : loadingView(),
    );
  }

  Widget loadingView() {
    return Center(
        child: LoadingAnimationWidget.waveDots(
            color: Theme.of(context).primaryColor, size: 36));
  }
}

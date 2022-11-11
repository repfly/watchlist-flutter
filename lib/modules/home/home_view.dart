import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watchlist/core/helpers/image_helper.dart';
import 'package:watchlist/core/service/movie/model/trending_response.dart';

import 'home_view_model.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bonfire"),
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
        body: PagedGridView<int, TrendingMovie>(
          pagingController: pagingController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 9 / 15,
            crossAxisCount: 2,
          ),
          builderDelegate: PagedChildBuilderDelegate<TrendingMovie>(
              animateTransitions: true,
              firstPageProgressIndicatorBuilder: (context) => loadingView(),
              itemBuilder: (context, item, index) => homeMovieCard(item)),
        ));
  }

  Padding homeMovieCard(TrendingMovie item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    height: 240,
                    imageUrl:
                        ImageHelper.getTMDBImagePath(item.posterPath, 'w500'),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 50,
                        child: LinearProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Chip(
                          backgroundColor: Colors.amberAccent,
                          label: Text(
                            item.voteAverage.toStringAsFixed(1),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget loadingView() {
    return Center(
        child: LoadingAnimationWidget.waveDots(
            color: Theme.of(context).primaryColor, size: 36));
  }
}

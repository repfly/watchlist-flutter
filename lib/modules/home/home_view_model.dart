import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:watchlist/core/service/movie/model/movie_response.dart';
import 'package:watchlist/core/service/movie/model/trending_response.dart';
import 'package:watchlist/core/service/movie/movie_service.dart';
import 'package:watchlist/modules/home/home.dart';
import 'package:watchlist/modules/profile/profile.dart';

import '../../shared/movie_detail/movie_detail.dart';

abstract class HomeViewModel extends State<Home> {
  final PagingController<int, TrendingMovie> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  navigateToProfile() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Profile()));
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final trendingResponse = await MovieService.shared
          .fetchTrendings(pageNumber: pageKey, timeWindow: 'day');
      var newItems = trendingResponse.results;
      if (trendingResponse.totalPages == pageKey) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  navigateToMovieDetail(MovieResponse movie) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MovieDetail(movie)));
  }
}

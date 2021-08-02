import 'package:flutter/material.dart';
import 'package:watchlist/core/manager/cache_manager.dart';
import 'package:watchlist/core/service/list/list_service.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';
import 'package:watchlist/core/service/me/me_service.dart';
import 'package:watchlist/core/service/me/model/me_response.dart';
import 'package:watchlist/core/service/movie/model/MovieResponse.dart';
import 'package:watchlist/core/service/movie/movie_service.dart';
import 'package:watchlist/modules/login/login.dart';
import 'package:watchlist/modules/profile/profile.dart';
import 'package:watchlist/widgets/edit_list/edit_list.dart';
import 'package:watchlist/widgets/list_detail/list_detail.dart';

abstract class ProfileViewModel extends State<Profile> with CacheManager {
  late MeResponse user =
      new MeResponse(email: "email", username: "username", userLists: []);
  late List<ListResponse> userLists = [];
  bool pageLoading = true;

  @override
  initState() {
    super.initState();
    initProfilePage();
  }

  initProfilePage() async {
    List<ListResponse> tempList = [];
    user = await MeService.shared.fetchUser();
    for (String list in user.userLists) {
      tempList.add(await ListService.shared.fetchListById(list));
    }
    userLists = tempList;
    setState(() {});
  }

  navigateToListDetail(ListResponse list) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ListDetail(list)));
  }

  navigateToListEdit(ListResponse list) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => EditList(list)));
  }
  /*fetchMoviesFromList(ListResponse list) async {
    List<MovieResponse> tempArr = [];

    for (String movieId in list.movies) {
      tempArr.add(await MovieService.shared.fetchMovieByIMDBId(movieId));
    }
    return tempArr;
  }

  getMovieTitles(List<MovieResponse> list) {
    List<String> titleArray = [];
    for (MovieResponse movie in list) {
      titleArray.add(movie.title);
    }
    return titleArray.join(", ");
  }

    */
  logOut() async {
    await clearCache();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login()),
        (Route<dynamic> route) => false);
  }
}

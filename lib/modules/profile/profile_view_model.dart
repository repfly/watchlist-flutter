import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:watchlist/core/manager/cache_manager.dart';
import 'package:watchlist/core/service/list/list_service.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';
import 'package:watchlist/core/service/me/me_service.dart';
import 'package:watchlist/core/service/me/model/me_response.dart';
import 'package:watchlist/modules/login/login.dart';
import 'package:watchlist/modules/profile/profile.dart';
import 'package:watchlist/modules/search/search_movie.dart';
import 'package:watchlist/widgets/create_list/create_list.dart';
import 'package:watchlist/widgets/edit_list/edit_list.dart';

abstract class ProfileViewModel extends State<Profile> with CacheManager {
  late MeResponse user =
      new MeResponse(email: "email", username: "username", userLists: []);
  late List<ListResponse> userLists = [];
  late ScrollController hideButtonController = new ScrollController();
  late TextEditingController editingController = new TextEditingController();
  bool pageLoading = true;
  bool isMoviesNull = true;
  bool isWatchlistNull = true;
  bool isEditingText = false;
  bool isCreateButtonVisible = true;

  @override
  initState() {
    super.initState();
    initProfilePage();
  }

  initProfilePage() async {
    addListenerToScrollController();
    List<ListResponse> tempList = [];
    user = await MeService.shared.fetchUser();
    if (user.userLists == null) {
      userLists = tempList;
      setState(() {});
      return;
    }
    for (String list in user.userLists!) {
      tempList.add(await ListService.shared.fetchListById(list));
    }
    userLists = tempList;
    setState(() {});
  }

  addListenerToScrollController() {
    hideButtonController.addListener(() {
      if (hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isCreateButtonVisible == true) {
          setState(() {
            isCreateButtonVisible = false;
          });
        }
      } else {
        if (hideButtonController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (isCreateButtonVisible == false) {
            setState(() {
              isCreateButtonVisible = true;
            });
          }
        }
      }
    });
  }

  navigateToListDetail(ListResponse list) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SearchMovie(list)));
  }

  navigateToListEdit(ListResponse list) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => EditList(list)));
  }

  navigateToCreateList() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreateList()));
  }

  logOut() async {
    await clearCache();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login()),
        (Route<dynamic> route) => false);
  }
}

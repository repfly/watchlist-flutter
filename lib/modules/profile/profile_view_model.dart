import 'package:flutter/material.dart';

import '../../core/manager/cache_manager.dart';
import '../../core/service/list/list_service.dart';
import '../../core/service/list/model/list_response.dart';
import '../../core/service/me/me_service.dart';
import '../../core/service/me/model/me_response.dart';
import '../../shared/create_list/create_list.dart';
import '../../shared/edit_list/edit_list.dart';
import '../login/login.dart';
import '../search/search_movie.dart';
import 'profile.dart';

abstract class ProfileViewModel extends State<Profile> {
  MeResponse user =
      new MeResponse(email: "email", username: "username", userLists: []);
  late List<ListResponse> userLists = [];
  late ScrollController bodyScrollController = new ScrollController();
  late TextEditingController editingController = new TextEditingController();
  bool pageLoading = true;

  @override
  initState() {
    super.initState();
    initProfilePage();
  }

  initProfilePage() async {
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

  navigateToListDetail(ListResponse list) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SearchMovie(list)));
  }

  navigateToCreateList() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreateList()));
  }

  logOut() async {
    await CacheManager.clearAll();
    Navigator.of(context).pushAndRemoveUntil(Login.route(), (route) => false);
  }
}

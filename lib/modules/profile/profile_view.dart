import 'package:flutter/material.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';
import 'package:watchlist/modules/profile/profile_view_model.dart';

class ProfileView extends ProfileViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            InkWell(
              child: Icon(Icons.logout_rounded),
              onTap: () {
                logOut();
              },
            ),
            SizedBox(
              width: 10,
            )
          ],
          title: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Welcome ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            TextSpan(text: '${user.username}!', style: TextStyle(fontSize: 20))
          ]))),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            userInfo(),
            ElevatedButton(onPressed: () {
              navigateToCreateList();
            }, child: Text("Create new list"),)
          ]),
        ),
      ),
    );
  }

  Widget userInfo() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'You have ${userLists.length} watchlist',
              style: TextStyle(fontSize: 20),
            ),
          ),
          watchlistBuilder()],
      ),
    );
  }

  Widget watchlistBuilder() {
    return ListView.builder(
        itemCount: userLists.length,
        shrinkWrap: true,
        physics: PageScrollPhysics(),
        itemBuilder: (context, index) {
          return watchListCard(userLists[index]);
        });
  }

  Widget watchListCard(ListResponse list) {
    return InkWell(
      onTap: () {
        navigateToListDetail(list);
      },
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list.listTitle,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'With ${list.movies?.length ?? "none"} movies',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Icon(Icons.edit),
                    onTap: () {
                      navigateToListEdit(list);
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}

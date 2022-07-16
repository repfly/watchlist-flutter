import 'package:flutter/material.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';
import 'package:watchlist/modules/profile/profile_view_model.dart';

class ProfileView extends ProfileViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          controller: bodyScrollController,
          shrinkWrap: true,
          slivers: [
            new SliverAppBar(
              title:
                  Text('There are ${user.userLists!.length.toString()} lists'),
              actions: [
                IconButton(
                  icon: Icon(Icons.logout_rounded),
                  onPressed: () {
                    logOut();
                  },
                ),
              ],
            ),
            watchlistBuilder()
          ],
        ),
        floatingActionButton: createListButton());
  }

  Widget userInfo() {
    return Text(
      'You have ${userLists.length} watchlist',
      style: TextStyle(fontSize: 20),
    );
  }

  Visibility createListButton() {
    return Visibility(
      child: new FloatingActionButton(
        onPressed: () {
          navigateToCreateList();
        },
        tooltip: 'Create',
        child: new Icon(Icons.add),
      ),
    );
  }

  SliverPadding watchlistBuilder() {
    return new SliverPadding(
      padding: EdgeInsets.all(20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return watchListCard(userLists[index]);
          },
          childCount: userLists.length,
        ),
      ),
    );
  }

  Widget watchListCard(ListResponse list) {
    return InkWell(
      onTap: () {
        navigateToListDetail(list);
      },
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        list.listTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Chip(label: Text(userLists.length.toString()))
                  ],
                ),
                // Row(children: [ListView.builder(
                //   itemCount: 3,
                //   itemBuilder: (BuildContext context, int index) {
                //     return Container(height: 80, child: Image.network(list.),);
                //   },
                // ),],),
              ],
            ),
          )),
    );
  }
}

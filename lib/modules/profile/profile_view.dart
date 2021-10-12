import 'package:flutter/material.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';
import 'package:watchlist/modules/profile/profile_view_model.dart';

class ProfileView extends ProfileViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          controller: hideButtonController,
          shrinkWrap: true,
          slivers: [
            new SliverAppBar(
              title:
                  Text('There are ${user.userLists!.length.toString()} lists'),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    child: Icon(Icons.logout_rounded),
                    onTap: () {
                      logOut();
                    },
                  ),
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
      visible: isCreateButtonVisible,
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

  Widget listEditingField() {
    return TextField(controller: editingController, onEditingComplete: () {
      setState(() {});
    },);
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
                            'With ${list.movies?.length ?? "no"} movies',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Icon(isEditingText ? Icons.save : Icons.edit),
                    onTap: () {
                      if (!this.isEditingText) {
                        this.isEditingText = true;
                        setState(() {});
                      }
                      if (this.isEditingText) {
                        this.isEditingText = false;
                      }
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}

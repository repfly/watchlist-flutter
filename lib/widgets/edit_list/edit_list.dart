import 'package:flutter/cupertino.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';
import 'package:watchlist/widgets/edit_list/edit_list_view.dart';

class EditList extends StatefulWidget {
  final ListResponse list;
  EditList(this.list);

  @override
  EditListView createState() => EditListView(list);

}
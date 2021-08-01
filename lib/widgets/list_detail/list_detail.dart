import 'package:flutter/cupertino.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';
import 'package:watchlist/widgets/list_detail/list_detail_view.dart';

class ListDetail extends StatefulWidget {
  late final ListResponse list;
  ListDetail(this.list);

  @override
  ListDetailView createState() => ListDetailView(list);
}
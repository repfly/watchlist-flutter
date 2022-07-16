import 'package:flutter/material.dart';
import 'package:watchlist/modules/home/home_view.dart';

class Home extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute<dynamic>(builder: (context) => Home());
  @override
  HomeView createState() => new HomeView();
}

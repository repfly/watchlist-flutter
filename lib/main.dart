import 'package:flutter/material.dart';
import 'package:watchlist/application.dart';
import 'package:watchlist/core/manager/app_initializer.dart';

void main() async {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
   await AppInitializer.initApp();
  runApp(App(navigatorKey: navigatorKey,));
}

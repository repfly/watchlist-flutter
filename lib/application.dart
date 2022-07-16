import 'package:flutter/material.dart';
import 'package:watchlist/core/manager/app_initializer.dart';

class App extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  App({required this.navigatorKey});
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.deepOrange),
      home: AppInitializer.getHome(),
    );
  }
}

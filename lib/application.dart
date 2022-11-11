import 'package:flutter/material.dart';
import 'package:watchlist/core/manager/app_initializer.dart';
import 'package:watchlist/core/manager/navigation_service.dart';

class App extends StatelessWidget {
  App();
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.deepOrange),
      home: AppInitializer.getHome(),
    );
  }
}

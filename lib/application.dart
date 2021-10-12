import 'package:flutter/material.dart';
import 'package:watchlist/core/manager/cache_manager.dart';
import 'package:watchlist/modules/login/login.dart';

class App extends StatelessWidget with CacheManager{

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
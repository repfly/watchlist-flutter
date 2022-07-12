import 'package:flutter/material.dart';
import 'package:watchlist/modules/login/login.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Login(),
    );
  }
}

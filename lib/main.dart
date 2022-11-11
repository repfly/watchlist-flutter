import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/application.dart';
import 'package:watchlist/core/manager/app_initializer.dart';

void main() async {
  await AppInitializer.initApp();
  final dio = Dio(BaseOptions(baseUrl: 'https://instagrapi.batuhangunday.com'));
  dio.post('/auth/login', data: {
    "username": "spectrenotadev",
    "password": "goodwood!11",
  }).then((value) {
    print(value.data);
  });
  runApp(App());
}

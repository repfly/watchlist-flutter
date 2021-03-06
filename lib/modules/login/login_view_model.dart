import 'package:watchlist/core/manager/cache_manager.dart';
import 'package:watchlist/core/service/auth/auth_service.dart';
import 'package:watchlist/core/service/auth/model/login_request.dart';
import 'package:watchlist/core/service/auth/model/login_response.dart';
import 'package:watchlist/core/service/movie/model/MovieResponse.dart';
import 'package:watchlist/modules/home/home.dart';
import 'package:watchlist/modules/register/register.dart';
import 'login.dart';

import 'package:flutter/material.dart';



abstract class LoginViewModel extends State<Login> with CacheManager {
  bool wrongCredentials = false;

  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerUsername = TextEditingController();
  late final MovieResponse movie;

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchLogin(String username, String password) async {
    final LoginResponse response = await AuthService.shared
        .loginUser(new LoginRequest(username: username, password: password));

    if (response.type == LoginResponseType.WRONG_CREDENTIALS) {
      wrongCredentials = true;
    }
    if (response.type == LoginResponseType.SUCCESS) {
      await saveToken(response.token!);
      _navigateToHome();
    }
    setState(() {});
  }

  void navigateToRegister() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Register()));
  }

  void _navigateToHome() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
  }
}

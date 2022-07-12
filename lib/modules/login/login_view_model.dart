import 'package:flutter/material.dart';
import 'package:watchlist/core/service/auth/auth_service.dart';
import 'package:watchlist/core/service/auth/model/login_request.dart';
import 'package:watchlist/core/service/auth/model/login_response.dart';
import 'package:watchlist/modules/home/home.dart';
import 'package:watchlist/modules/register/register.dart';

import 'login.dart';

abstract class LoginViewModel extends State<Login> {
  bool wrongCredentials = false;

  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerUsername = TextEditingController();

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

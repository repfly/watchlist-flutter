import 'package:flutter/material.dart';
import 'package:watchlist/core/service/auth/auth_service.dart';
import 'package:watchlist/core/service/auth/model/register_request.dart';
import 'package:watchlist/modules/home/home.dart';
import 'package:watchlist/modules/login/login.dart';
import 'package:watchlist/modules/register/register.dart';

import '../../shared/alert/toast_alert.dart';

abstract class RegisterViewModel extends State<Register> {
  late bool isCredentialsEmpty = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController checkPasswordController = TextEditingController();

  void navigateToLogin() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }

  void navigateToHome() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
  }

  Future<void> validateUserInfo() async {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        checkPasswordController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      isCredentialsEmpty = false;
      await registerUser();
      setState(() {});
    }
    if (isCredentialsEmpty) {
      CustomAlert.showToast("Please fill the necessary fields.", isAlert: true);
    }
  }

  Future<void> registerUser() async {
    var response = await AuthService.shared.registerUser(new RegisterRequest(
        username: usernameController.text,
        password: passwordController.text,
        email: emailController.text));
    if (response.type == "success") {
      navigateToLogin();
      CustomAlert.showToast("Successfully registered.");
    } else {
      CustomAlert.showToast(response.type, isAlert: true);
    }
  }
}

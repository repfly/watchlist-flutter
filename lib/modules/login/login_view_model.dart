import 'package:flutter/material.dart';
import 'package:watchlist/core/service/auth/auth_service.dart';
import 'package:watchlist/core/service/auth/model/login_request.dart';
import 'package:watchlist/core/service/auth/model/login_response.dart';
import 'package:watchlist/modules/home/home.dart';
import 'package:watchlist/modules/register/register.dart';
import 'package:watchlist/shared/alert/toast_alert.dart';

import 'login.dart';

abstract class LoginViewModel extends State<Login> {
  bool wrongCredentials = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerUsername = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchLogin() async {
    final LoginResponse response = await AuthService.shared.loginUser(
        new LoginRequest(
            username: controllerUsername.text,
            password: controllerPassword.text));

    if (response.type == LoginResponseType.WRONG_CREDENTIALS) {
      CustomAlert.showToast('Wrong credentials, please try again.',
          isAlert: true);
    }
    if (response.type == LoginResponseType.SUCCESS) {
      _navigateToHome();
    }
    setState(() {});
  }

  handleSubmitted() async {
    final form = formKey.currentState!;
    if (!form.validate()) {
      CustomAlert.showToast('Please check the given credentials.',
          isAlert: true);
    } else {
      form.save();
      await fetchLogin();
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Can not be null';
    }

    return null;
  }
    String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Boş bırakılamaz';
    }
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'Lütfen geçerli karakterler kullanın';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Can not be null';
    }
    if (value.length <= 1) {
      return 'Password must contain more than 3 characters.';
    }
    return null;
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

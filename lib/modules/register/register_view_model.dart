import 'package:flutter/material.dart';
import 'package:watchlist/core/service/auth/auth_service.dart';
import 'package:watchlist/core/service/auth/model/register_request.dart';
import 'package:watchlist/modules/home/home.dart';
import 'package:watchlist/modules/register/register.dart';

import '../../shared/alert/toast_alert.dart';

abstract class RegisterViewModel extends State<Register> {
  late bool isCredentialsEmpty = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController checkPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RestorableInt _autoValidateModeIndex =
      RestorableInt(AutovalidateMode.disabled.index);

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

  /// A function that is called when the user submits the form.
  void handleSubmitted() async {
    final form = formKey.currentState!;
    if (!form.validate()) {
      _autoValidateModeIndex.value = AutovalidateMode.always.index;
      CustomAlert.showToast('Please check the info you entered');
    } else {
      form.save();
      await registerUser();
    }
  }

  String? validatePhoneNumber(String? value) {
    final phoneExp = RegExp(r'^[0-9]*$');
    if (!phoneExp.hasMatch(value!)) {
      return 'Lütfen geçerli numara girin.';
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

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Boş bırakılamaz';
    }
    final emailExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailExp.hasMatch(value)) {
      return 'Lütfen geçerli bir eposta adresi girin';
    }
    return null;
  }

  String? validateAdress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Boş bırakılamaz';
    }
    if (value.length < 4) {
      return 'Lütfen geçerli bir adres adresi girin';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Boş bırakılamaz';
    }
    if (value.length <= 4) {
      return 'Lütfen geçerli bir şifre girin';
    }
    return null;
  }

  String? checkPasswordMatch(String? value) {
    if (value == null || value.isEmpty) {
      return 'Boş bırakılamaz';
    }
    if (value != passwordController.text) {
      return 'Girdiğiniz şifreler uyuşmamaktadır';
    }
    return null;
  }

  Future<void> registerUser() async {
    var response = await AuthService.shared.registerUser(new RegisterRequest(
        username: usernameController.text,
        password: passwordController.text,
        email: emailController.text));
    if (response.type == "success") {
      Navigator.of(context).pop();
      CustomAlert.showToast("Successfully registered. Login again to continue");
    } else {
      CustomAlert.showToast(response.type, isAlert: true);
    }
  }
}

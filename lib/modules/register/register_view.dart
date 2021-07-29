import 'package:flutter/material.dart';
import 'package:watchlist/modules/register/register_view_model.dart';
import 'package:watchlist/widgets/alert/toast_alert.dart';

class RegisterView extends RegisterViewModel {
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      decoration: fieldDecoration("Email", Icons.email_outlined),
    );

    final usernameField = TextFormField(
      autofocus: false,
      controller: usernameController,
      decoration: fieldDecoration("Username", Icons.person),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      decoration: fieldDecoration("Password", Icons.lock),
    );

    final confirmPassword = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: checkPasswordController,
      decoration: fieldDecoration("Confirm password", Icons.lock),
    );

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.0),
              Text(
                "Register",
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(height: 20.0),
              emailField,
              SizedBox(height: 20.0),
              usernameField,
              SizedBox(height: 15.0),
              SizedBox(height: 10.0),
              passwordField,
              SizedBox(height: 15.0),
              SizedBox(height: 10.0),
              confirmPassword,
              SizedBox(height: 20.0),
              Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () async {
                        //await validateUserInfo();
                        navigateToHome();
                      },
                      child: Text("signup")))
            ],
          ),
        ),
      ),
    );
  }

  fieldDecoration(String hintText, IconData icon) {
    return InputDecoration(
      labelText: hintText,
      prefixIcon: Icon(icon, color: Colors.black45),
      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login_view_model.dart';

class LoginView extends LoginViewModel {
  final EdgeInsets paddingLow = EdgeInsets.all(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: paddingLow,
        child: Center(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: buildWrapFormBody(),
          ),
        ),
      ),
    );
  }

  Widget buildWrapFormBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
              controller: controllerUsername,
              validator: validateName,
              decoration: InputDecoration(labelText: 'Username')),
          TextFormField(
              controller: controllerPassword,
              obscureText: true,
              enableSuggestions: false,
              validator: validatePassword,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Password',
              )),
          ElevatedButton(
            onPressed: () {
              handleSubmitted();
            },
            child: Text('Login'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Do not have an account? ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                    text: 'Register',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        navigateToRegister();
                      }),
              ]),
            ),
          )
        ],
      ),
    );
  }
}

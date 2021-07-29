import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login_view_model.dart';

class LoginView extends LoginViewModel {
  final EdgeInsets paddingLow = EdgeInsets.all(8.0);
  final GlobalKey<FormState> formKey = GlobalKey();

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
      ),    );
  }

  Wrap buildWrapFormBody() {
    return Wrap(
      runSpacing: 10,
      alignment: WrapAlignment.end,
      children: [
        TextFormField(
            controller: controllerUsername,
            decoration: InputDecoration(
                labelText: 'Username', border: OutlineInputBorder())),
        TextFormField(
            controller: controllerPassword,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
                labelText: 'Password', border: OutlineInputBorder())),
        Padding(
          padding: const EdgeInsets.only(right: 100),
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
        ),

        Visibility(
          child: Text('wrong credentials'),
          visible: wrongCredentials,
        ),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              fetchLogin(controllerUsername.text, controllerPassword.text);
            }
          },
          child: Text('Login'),
        ),
      ],
    );
  }

}
import 'package:flutter/material.dart';

import 'login_view.dart';

class Login extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute<dynamic>(builder: (context) => Login());

  @override
  LoginView createState() => new LoginView();
}

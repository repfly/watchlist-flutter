import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomAlert {
  static void showToast(String message, {bool isAlert = false}) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: isAlert ? Colors.redAccent : Colors.lightGreenAccent,
        textColor: Colors.white);
  }
}

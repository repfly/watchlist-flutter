import 'dart:io';

import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorAlert {
  late final String alertMessage;

  showError(context, bool isAlert, {required String message}) {
    showFlash(
        context: context,
        duration: Duration(seconds: 3),
        builder: (context, controller) {
          return Flash.bar(
              margin: EdgeInsets.all(8),
              borderRadius: BorderRadius.all(Radius.circular(8)),
              controller: controller,
              position: FlashPosition.bottom,
              backgroundColor: isAlert ? Colors.redAccent : Colors.greenAccent,
              child: FlashBar(
                  content: Text(
                message,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )));
        });
  }
}

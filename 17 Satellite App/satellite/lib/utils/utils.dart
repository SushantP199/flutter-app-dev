import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fieldFocusedChanged(
    BuildContext context,
    FocusNode current,
    FocusNode next,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.blue,
        toastLength: Toast.LENGTH_LONG);
  }

  static void flushbarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        backgroundColor: Colors.redAccent,
        positionOffset: 5,
        flushbarPosition: FlushbarPosition.TOP,
        duration: Duration(seconds: 1),
      )..show(context),
    );
  }

  static dynamic snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }
}

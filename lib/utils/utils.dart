import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
  static showBar(BuildContext context, {required String message}) {
    Flushbar(
      message: message,
      backgroundColor: Colors.red,
      icon: Icon(
        Icons.info_rounded,
      ),
      borderRadius: BorderRadius.circular(12),
      duration: Duration(seconds: 5),
      reverseAnimationCurve: Curves.decelerate,
      flushbarPosition: FlushbarPosition.TOP,
      padding: EdgeInsets.all(15),
    ).show(context);
  }
}

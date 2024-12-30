import 'package:flutter/material.dart';
import 'package:food_app/theme/dark.dart';
import 'package:food_app/theme/light.dart';

class Themeprovider extends ChangeNotifier {
  ThemeData _themeData = lightmode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkmode;

  set themeData(ThemeData themedata) {
    _themeData = themedata;
    notifyListeners();
  }

  void toggletheme() {
    if (_themeData == lightmode) {
      themeData = darkmode;
    } else {
      themeData = lightmode;
    }
  }
}

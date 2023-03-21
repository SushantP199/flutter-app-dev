import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  var _theme = ThemeMode.light;

  ThemeMode get theme {
    return _theme;
  }

  void setTheme(ThemeMode theme) {
    _theme = theme;
    notifyListeners();
  }
}

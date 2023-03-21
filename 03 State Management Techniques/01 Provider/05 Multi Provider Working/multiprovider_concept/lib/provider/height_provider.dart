

import 'package:flutter/cupertino.dart';

class HeightProvider extends ChangeNotifier {

  double _height = 50;

  double get height {
    return _height;
  }

  void setHeight (double height) {
    _height = height;
    notifyListeners();
  }
}
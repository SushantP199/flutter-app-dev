import 'package:flutter/cupertino.dart';

class SliderProvider extends ChangeNotifier {

  double _opacity = 1.0;

  double get opacity {
    return _opacity;
  }

  void setOpacity(double opacity) {
    _opacity = opacity;
    notifyListeners();
  }
}
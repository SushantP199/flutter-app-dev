import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {

  int _count = 0;

  int get count => _count;

  setCount() {
    _count = _count + 1;
    notifyListeners();
  }
}
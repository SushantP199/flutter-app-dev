import 'package:flutter/material.dart';

class ItemsProvider extends ChangeNotifier {

  List<bool> _favourites = [];

  List<bool> get favourites {
    return _favourites;
  }

  void setFavourites (int index) {
    _favourites[index] = !_favourites[index];
    notifyListeners();
  }
}
import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _favItem = [];

  List<int> get favItem => _favItem;

  void addFav(int index) {
    _favItem.add(index);
    notifyListeners();
  }

  void removeFav(int index) {
    _favItem.remove(index);
    notifyListeners();
  }
}

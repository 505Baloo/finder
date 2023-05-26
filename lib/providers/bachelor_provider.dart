import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';

class BachelorProvider extends ChangeNotifier {
  final List<Bachelor> _listOfLikedBachelors = [];

  List<Bachelor> get listOfLikedBachelors =>
      List.unmodifiable(_listOfLikedBachelors);

  void add(Bachelor toAddBachelor) {
    if (!_listOfLikedBachelors.contains(toAddBachelor)) {
      _listOfLikedBachelors.add(toAddBachelor);
      notifyListeners();
    }
  }

  void remove(Bachelor toRemoveBachelor) {
    _listOfLikedBachelors.removeWhere(
        (element) => element.firstName == toRemoveBachelor.firstName);
    notifyListeners();
  }
}

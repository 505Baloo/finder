import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';

class BachelorProvider extends ChangeNotifier {
  final List<Bachelor> _listOfLikedBachelors = [];
  List<Bachelor> _bachelors = [];
  Bachelor? _selectedBachelor;

  Bachelor? get selectedBachelor => _selectedBachelor;

  void selectBachelor(Bachelor bachelor) {
    _selectedBachelor = bachelor;
    notifyListeners();
  }

  List<Bachelor> get listOfLikedBachelors =>
      List.unmodifiable(_listOfLikedBachelors);

  List<Bachelor> get bachelors => _bachelors;

  void setBachelors(List<Bachelor> bachelors) {
    _bachelors = bachelors;
    notifyListeners();
  }

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

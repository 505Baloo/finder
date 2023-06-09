import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';

class BachelorProvider extends ChangeNotifier {
  List<Bachelor> _listOfLikedBachelors = [];
  List<Bachelor> _bachelors = [];

  List<Bachelor> get listOfLikedBachelors => _listOfLikedBachelors;

  List<Bachelor> get bachelors => _bachelors;

  void applyLike(Bachelor bachelor) {
    bachelor.isLiked = !bachelor.isLiked;
    notifyListeners();
  }

  void setLikes(List<Bachelor> likedBachelors) {
    _listOfLikedBachelors = likedBachelors;
    notifyListeners();
  }

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
    _listOfLikedBachelors.removeWhere((element) =>
        element.firstName == toRemoveBachelor.firstName &&
        element.lastName == toRemoveBachelor.lastName);
    notifyListeners();
  }

  Bachelor getById(int id) {
    return _bachelors.firstWhere((element) => element.id == id);
  }
}

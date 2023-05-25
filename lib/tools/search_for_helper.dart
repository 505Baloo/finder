import 'package:finder/enums/gender.dart';
import 'package:finder/tools/random_number.dart';

List<Gender> randomizeSearchFor() {
  List<Gender> searchingFor = List.empty(growable: true);
  int randomNumber = generateRandomNumberExcludingZero(3);
  switch (randomNumber) {
    case 3:
      searchingFor.add(Gender.male);
      searchingFor.add(Gender.female);
      break;
    case 2:
      searchingFor.add(Gender.female);
      break;
    case 1:
      searchingFor.add(Gender.female);
      break;
    default:
      break;
  }
  return searchingFor;
}

// Voir extensions ou join
String parseSearchingForToString(List<Gender>? searchingFor) {
  List<String> searchingForToString = List.empty(growable: true);
  String toReturn = "Searching for ";

  if (searchingFor != null) {
    for (var i = 0; i < searchingFor.length; i++) {
      searchingForToString.add(searchingFor[i].name);
    }
  }

  for (int i = 0; i < searchingForToString.length; i++) {
    if (i == 0 && searchingForToString.length > 1) {
      toReturn += "${searchingForToString[i]}, ";
    } else {
      toReturn += searchingForToString[i];
    }
  }

  return toReturn;
}

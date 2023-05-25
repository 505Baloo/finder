import 'package:finder/enums/gender.dart';
import 'package:finder/tools/random_number.dart';

Gender generateRandomGender() {
  int outcomeNumber = generateRandomNumberExcludingZero(2);
  return outcomeNumber == 1 ? Gender.male : Gender.female;
}

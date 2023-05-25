import 'package:faker/faker.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/enums/gender.dart';
import 'package:finder/tools/random_number_helper.dart';
import 'package:finder/tools/search_for_helper.dart';

List<Bachelor> generateRandomBachelors() {
  List<String> maleNames = [
    "Galaad",
    "Ludovic",
    "Luigi",
    "Robin",
    "Nathan",
    "Christian",
    "Thibaut",
    "Jordan",
    "Maxence",
    "Pedro",
    "Flo",
    "Hervé",
    "Nacer",
    "Louis",
    "Bastien"
  ];

  List<String> femaleNames = [
    "Sarah",
    "Éloise",
    "Claudia",
    "Laurine",
    "Julie",
    "Alizée",
    "Ines",
    "Maud",
    "Axelle",
    "Stéphanie",
    "Carla",
    "Jennifer",
    "Chloé",
    "Anna",
    "Léa"
  ];

  List<Bachelor> listOfBachelors = List.empty(growable: true);

  for (int i = 0; i <= 30; i++) {
    listOfBachelors.add(Bachelor(
        firstName: i % 2 == 0
            ? maleNames[generateRandomNumber(maleNames.length)]
            : femaleNames[generateRandomNumber(femaleNames.length)],
        lastName: faker.person.lastName(),
        gender: i % 2 == 0 ? Gender.male : Gender.female,
        avatar: i % 2 == 0
            ? "assets/images/man-${generateRandomNumberExcludingZero(15)}.png"
            : "assets/images/woman-${generateRandomNumberExcludingZero(15)}.png",
        job: faker.job.title(),
        searchFor: randomizeSearchFor()));
  }

  return listOfBachelors;
}

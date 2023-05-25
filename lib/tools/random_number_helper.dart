import 'dart:math';

int generateRandomNumberExcludingZero(int max) {
  return Random().nextInt(max) + 1;
}

int generateRandomNumber(int max) {
  return Random().nextInt(max);
}

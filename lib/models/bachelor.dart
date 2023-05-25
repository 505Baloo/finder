import 'package:finder/enums/gender.dart';

class Bachelor {
  final String firstName;
  final String lastName;
  final Enum gender;
  final String avatar;
  final List<Gender>? searchFor;
  final String? job;
  final String? description;

  Bachelor(
      {required this.firstName,
      required this.lastName,
      required this.gender,
      required this.avatar,
      this.searchFor,
      this.job,
      this.description});
}

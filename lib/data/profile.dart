import 'package:flutter/material.dart';
import 'package:izoneapp/data/izone_picture.dart';
import 'package:izoneapp/data/pictures/izone_pictures.dart';
import 'package:izoneapp/data/zodiac.dart';

class Profile {
  final String birthplace;
  final DateTime dateOfBirth;
  final String name;
  final String nameKorean;
  final int height; // cm
  final String colorDesc;
  final Color color;
  final String company;

  Profile({
    required this.birthplace,
    required this.dateOfBirth,
    required this.name,
    required this.nameKorean,
    required this.height,
    required this.colorDesc,
    required this.color,
    required this.company,
  });

  String get stageName => name.split(' ').last;

  List<IzonePicture> get gallery =>
      IzonePictures(pictures: []).tagged([stageName.toLowerCase()]);

  /// Get birthday for current year
  DateTime get birthday => DateTime.parse(
      '${DateTime.now().year}-${dateOfBirth.month < 10 ? "0" : ""}${dateOfBirth.month}-${dateOfBirth.day < 10 ? "0" : ""}${dateOfBirth.day}');

  /// Consider it to be birthday time if their birthday is within 3 days
  bool get isBirthday => DateTime.now().difference(birthday).inDays.abs() < 3;

  /// Get zodiac sign
  String get zodiac => Zodiac.zodiac(this.dateOfBirth);

  /// Get member's age in years, not Korean age
  int get age => DateTime.now().difference(dateOfBirth).inDays ~/ 365;

  String get imagePath =>
      'assets/images/one-reeler-act-iv/${this.stageName.replaceAll('*', '').toLowerCase()}.png';

  /// Assuming the member's height is given in cm, convert it to inches
  double get heightInInches => height * 0.3937;

  String get heightInFeetInches =>
      '${heightInInches ~/ 12}\' ${(heightInInches % 12).floor()}\"';
}

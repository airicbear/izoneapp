import 'package:flutter/material.dart';
import 'package:izoneapp/data/izone_picture.dart';
import 'package:izoneapp/data/pictures/izone_pictures.dart';

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
    this.birthplace,
    this.dateOfBirth,
    this.name,
    this.nameKorean,
    this.height,
    this.colorDesc,
    this.color,
    this.company,
  });

  String get stageName => name.split(' ').last;

  List<IzonePicture> get gallery =>
      IzonePictures().tagged([stageName.toLowerCase()]);

  /// Get birthday for current year
  DateTime get birthday => DateTime.parse(
      '${DateTime.now().year}-${dateOfBirth.month < 10 ? "0" : ""}${dateOfBirth.month}-${dateOfBirth.day < 10 ? "0" : ""}${dateOfBirth.day}');

  /// Consider it to be birthday time if their birthday is within 3 days
  bool get isBirthday => DateTime.now().difference(birthday).inDays.abs() < 3;

  /// Get member's age in years, not Korean age
  int get age => DateTime.now().difference(dateOfBirth).inDays ~/ 365;

  String get imagePath =>
      'assets/images/oneiric-diary/official-photo-4-${this.stageName.replaceAll('*', '').toLowerCase()}.jpg';

  /// Assuming the member's height is given in cm, convert it to inches
  double get heightInInches => height * 0.3937;

  String get heightInFeetInches =>
      '${heightInInches ~/ 12}\' ${(heightInInches % 12).floor()}\"';
}

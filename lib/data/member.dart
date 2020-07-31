import 'package:flutter/material.dart';
import 'package:izoneapp/data/izone_picture.dart';
import 'package:izoneapp/data/pictures/izone_pictures.dart';

abstract class Member {
  final int id;
  final String birthplace;
  final String dateOfBirth;
  final String fullName;
  final String fullNameKorean;
  final String stageName;
  final String stageNameKorean;
  final int height; // cm
  final String colorDesc;
  final Color color;
  final String bloodType;
  final String company;

  Member({
    this.id,
    this.birthplace,
    this.dateOfBirth,
    this.fullName,
    this.fullNameKorean,
    this.stageName,
    this.stageNameKorean,
    this.height,
    this.colorDesc,
    this.color,
    this.bloodType,
    this.company,
  });

  List<IzonePicture> get gallery =>
      IzonePictures().tagged([stageName.toLowerCase()]);

  DateTime get dateTimeOfBirth => DateTime.parse(dateOfBirth);

  /// Get birthday for current year
  DateTime get birthday => DateTime.parse(
      '${DateTime.now().year}-${dateTimeOfBirth.month < 10 ? "0" : ""}${dateTimeOfBirth.month}-${dateTimeOfBirth.day < 10 ? "0" : ""}${dateTimeOfBirth.day}');

  /// Consider it to be birthday time if their birthday is within 3 days
  bool get isBirthday => DateTime.now().difference(birthday).inDays.abs() < 3;

  /// Get member's age in years, not Korean age
  int get age => DateTime.now().difference(dateTimeOfBirth).inDays ~/ 365;

  String get imagePath =>
      'assets/images/oneiric-diary/official-photo-4-${this.stageName.toLowerCase()}.jpg';

  /// Assuming the member's height is given in cm, convert it to inches
  double get heightInInches => height * 0.3937;

  String get heightInFeetInches =>
      '${heightInInches ~/ 12}\' ${(heightInInches % 12).floor()}\"';
}

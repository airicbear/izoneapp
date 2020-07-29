import 'package:flutter/material.dart';

class Member {
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
  final List<String> galleryUrlList;

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
    this.galleryUrlList,
  });

  int getAge() {
    return DateTime.now().difference(DateTime.parse(this.dateOfBirth)).inDays ~/
        365;
  }

  String getImagePath() {
    return 'assets/images/oneiric-diary/official-photo-4-${this.stageName.toLowerCase()}.jpg';
  }

  String getHeightInFeetInches() {
    var inches = this.height * 0.3937; // cm to inches
    return '${inches ~/ 12}\' ${(inches % 12).floor()}\"';
  }
}
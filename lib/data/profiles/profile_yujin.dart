import 'package:flutter/material.dart';
import 'package:izoneapp/data/profile.dart';

class ProfileYujin extends Profile {
  ProfileYujin()
      : super(
          birthplace: "Cheongju, South Korea",
          bloodType: "A",
          colorDesc: "Blue",
          color: Color.fromRGBO(123, 161, 232, 1),
          company: "Starship Entertainment",
          dateOfBirth: "2003-09-01",
          fullName: "An Yujin",
          fullNameKorean: "안유진",
          height: 168,
          id: 11,
          stageName: "Yujin",
          stageNameKorean: "유진",
        );
}

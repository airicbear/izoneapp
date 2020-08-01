import 'package:flutter/material.dart';
import 'package:izoneapp/data/profile.dart';

class ProfileChaewon extends Profile {
  ProfileChaewon()
      : super(
          birthplace: "Seoul, South Korea",
          bloodType: "B",
          colorDesc: "Mint",
          color: Color.fromRGBO(147, 243, 147, 1),
          company: "Woollim Entertainment",
          dateOfBirth: "2000-08-01",
          fullName: "Kim Chaewon",
          fullNameKorean: "김채원",
          height: 164,
          id: 6,
          stageName: "Chaewon",
          stageNameKorean: "채원",
        );
}

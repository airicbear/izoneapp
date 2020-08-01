import 'package:flutter/material.dart';
import 'package:izoneapp/data/profile.dart';

class ProfileNako extends Profile {
  ProfileNako()
      : super(
          birthplace: "Tokyo, Japan",
          bloodType: null,
          colorDesc: "Sky Blue",
          color: Color.fromRGBO(143, 205, 230, 1),
          company: "EMI Records (HKT48)",
          dateOfBirth: "2001-06-18",
          fullName: "Yabuki Nako",
          fullNameKorean: "야부키 나코",
          height: 150,
          id: 8,
          stageName: "Nako",
          stageNameKorean: "나코",
        );
}

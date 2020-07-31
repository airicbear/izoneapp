import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';

class MemberYena extends Member {
  MemberYena()
      : super(
          birthplace: "Seoul, South Korea",
          bloodType: "A",
          colorDesc: "Yellow",
          color: Color.fromRGBO(250, 230, 80, 1),
          company: "Yuehua Entertainment",
          dateOfBirth: "1999-09-29",
          fullName: "Choi Yena",
          fullNameKorean: "최예나",
          height: 163,
          id: 4,
          stageName: "Yena",
          stageNameKorean: "예나",
        );
}

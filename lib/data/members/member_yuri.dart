import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';

class MemberYuri extends Member {
  MemberYuri()
      : super(
          birthplace: "Busan, South Korea",
          bloodType: "AB",
          colorDesc: "Orange",
          color: Color.fromRGBO(247, 162, 57, 1),
          company: "Stone Music Entertainment",
          dateOfBirth: "2001-10-22",
          fullName: "Jo Yuri",
          fullNameKorean: "조유리",
          height: 162,
          id: 10,
          stageName: "Yuri",
          stageNameKorean: "유리",
        );
}

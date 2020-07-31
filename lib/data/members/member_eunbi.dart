import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';

class MemberEunbi extends Member {
  MemberEunbi()
      : super(
          birthplace: "Seoul, South Korea",
          bloodType: "O",
          colorDesc: "Purple",
          color: Color.fromRGBO(210, 172, 250, 1),
          company: "Woollim Entertainment",
          dateOfBirth: "1995-09-27",
          fullName: "Kwon Eunbi",
          fullNameKorean: "권은비",
          height: 160,
          id: 1,
          stageName: "Eunbi",
          stageNameKorean: "은비",
        );
}

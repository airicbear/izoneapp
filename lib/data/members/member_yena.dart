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
          galleryUrlList: [
            'http://cdn.iz-one.co.kr/images/oneiric-diary/Wrj0g8ez7Ef4/official-photo-1-yena.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-2-yena.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/HFdG2LjN8bg4/official-photo-3-yena.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-4-yena.jpg',
          ],
        );
}

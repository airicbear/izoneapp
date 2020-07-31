import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';

class MemberHyewon extends Member {
  MemberHyewon()
      : super(
          birthplace: "Yangsan, South Korea",
          bloodType: "B",
          colorDesc: "Coral",
          color: Color.fromRGBO(240, 127, 117, 1),
          company: "8D Creative",
          dateOfBirth: "1999-07-05",
          fullName: "Kang Hyewon",
          fullNameKorean: "강혜원",
          height: 163,
          id: 3,
          stageName: "Hyewon",
          stageNameKorean: "혜원",
          galleryUrlList: [
            'http://cdn.iz-one.co.kr/images/oneiric-diary/Wrj0g8ez7Ef4/official-photo-1-hyewon.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-2-hyewon.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/HFdG2LjN8bg4/official-photo-3-hyewon.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-4-hyewon.jpg',
          ],
        );
}

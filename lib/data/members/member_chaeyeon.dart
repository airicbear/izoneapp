import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';

class MemberChaeyeon extends Member {
  MemberChaeyeon()
      : super(
          birthplace: "Yongin, South Korea",
          bloodType: "A",
          colorDesc: "Blue Mint",
          color: Color.fromRGBO(192, 227, 214, 1),
          company: "WM Entertainment",
          dateOfBirth: "2000-01-11",
          fullName: "Lee Chaeyeon",
          fullNameKorean: "이채연",
          height: 165,
          id: 5,
          stageName: "Chaeyeon",
          stageNameKorean: "채연",
          galleryUrlList: [
            'http://cdn.iz-one.co.kr/images/oneiric-diary/Wrj0g8ez7Ef4/official-photo-1-chaeyeon.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-2-chaeyeon.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/HFdG2LjN8bg4/official-photo-3-chaeyeon.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-4-chaeyeon.jpg',
          ],
        );
}

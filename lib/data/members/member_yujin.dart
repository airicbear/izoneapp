import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';

class MemberYujin extends Member {
  MemberYujin()
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
          galleryUrlList: [
            'http://cdn.iz-one.co.kr/images/oneiric-diary/Wrj0g8ez7Ef4/official-photo-1-yujin.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-2-yujin.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/HFdG2LjN8bg4/official-photo-3-yujin.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-4-yujin.jpg',
          ],
        );
}

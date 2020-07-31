import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';

class MemberChaewon extends Member {
  MemberChaewon()
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
          galleryUrlList: [
            'http://cdn.iz-one.co.kr/images/oneiric-diary/Wrj0g8ez7Ef4/official-photo-1-chaewon.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-2-chaewon.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/HFdG2LjN8bg4/official-photo-3-chaewon.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-4-chaewon.jpg',
          ],
        );
}

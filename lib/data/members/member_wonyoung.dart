import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';

class MemberWonyoung extends Member {
  MemberWonyoung()
      : super(
          birthplace: "Seoul, South Korea",
          bloodType: "O",
          colorDesc: "Pink",
          color: Color.fromRGBO(247, 134, 192, 1),
          company: "Starship Entertainment",
          dateOfBirth: "2004-08-31",
          fullName: "Jang Wonyoung",
          fullNameKorean: "장원영",
          height: 171,
          id: 12,
          stageName: "Wonyoung",
          stageNameKorean: "원영",
          galleryUrlList: [
            'http://cdn.iz-one.co.kr/images/oneiric-diary/Wrj0g8ez7Ef4/official-photo-1-wonyoung.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-2-wonyoung.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/HFdG2LjN8bg4/official-photo-3-wonyoung.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-4-wonyoung.jpg',
          ],
        );
}

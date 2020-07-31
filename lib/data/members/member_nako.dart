import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';

class MemberNako extends Member {
  MemberNako()
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
          galleryUrlList: [
            'http://cdn.iz-one.co.kr/images/oneiric-diary/Wrj0g8ez7Ef4/official-photo-1-nako.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-2-nako.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/HFdG2LjN8bg4/official-photo-3-nako.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-4-nako.jpg',
          ],
        );
}

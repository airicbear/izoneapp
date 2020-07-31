import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';

class MemberHitomi extends Member {
  MemberHitomi()
      : super(
          birthplace: "Tochigi, Japan",
          bloodType: "A",
          colorDesc: "Peach",
          color: Color.fromRGBO(244, 183, 143, 1),
          company: "Kings Records (AKB48)",
          dateOfBirth: "2001-10-06",
          fullName: "Honda Hitomi",
          fullNameKorean: "혼다 히토미",
          height: 160,
          id: 9,
          stageName: "Hitomi",
          stageNameKorean: "히토미",
          galleryUrlList: [
            'http://cdn.iz-one.co.kr/images/oneiric-diary/Wrj0g8ez7Ef4/official-photo-1-hitomi.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-2-hitomi.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/HFdG2LjN8bg4/official-photo-3-hitomi.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-4-hitomi.jpg',
          ],
        );
}

import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';

class MemberSakura extends Member {
  MemberSakura()
      : super(
          birthplace: "Kagoshima, Japan",
          bloodType: "A",
          colorDesc: "Pastel Pink",
          color: Color.fromRGBO(247, 202, 213, 1),
          company: "EMI Records (HKT48)",
          dateOfBirth: "1998-03-19",
          fullName: "Miyawaki Sakura",
          fullNameKorean: "미야와키 사쿠라",
          height: 163,
          id: 2,
          stageName: "Sakura",
          stageNameKorean: "사쿠라",
          galleryUrlList: [
            'http://cdn.iz-one.co.kr/images/oneiric-diary/Wrj0g8ez7Ef4/official-photo-1-sakura.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-2-sakura.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/HFdG2LjN8bg4/official-photo-3-sakura.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-4-sakura.jpg',
          ],
        );
}

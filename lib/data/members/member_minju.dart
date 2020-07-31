import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';

class MemberMinju extends Member {
  MemberMinju()
      : super(
          birthplace: "Seoul, South Korea",
          bloodType: "AB",
          colorDesc: "White",
          color: Colors.white,
          company: "Urban Works Entertainment",
          dateOfBirth: "2001-02-05",
          fullName: "Kim Minju",
          fullNameKorean: "김민주",
          height: 164,
          id: 7,
          stageName: "Minju",
          stageNameKorean: "민주",
          galleryUrlList: [
            'http://cdn.iz-one.co.kr/images/oneiric-diary/Wrj0g8ez7Ef4/official-photo-1-minju.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-2-minju.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/HFdG2LjN8bg4/official-photo-3-minju.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-4-minju.jpg',
          ],
        );
}

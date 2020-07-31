import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';

class MemberYuri extends Member {
  MemberYuri()
      : super(
          birthplace: "Busan, South Korea",
          bloodType: "AB",
          colorDesc: "Orange",
          color: Color.fromRGBO(247, 162, 57, 1),
          company: "Stone Music Entertainment",
          dateOfBirth: "2001-10-22",
          fullName: "Jo Yuri",
          fullNameKorean: "조유리",
          height: 162,
          id: 10,
          stageName: "Yuri",
          stageNameKorean: "유리",
          galleryUrlList: [
            'http://cdn.iz-one.co.kr/images/oneiric-diary/Wrj0g8ez7Ef4/official-photo-1-yuri.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-2-yuri.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/HFdG2LjN8bg4/official-photo-3-yuri.jpg',
            'http://cdn.iz-one.co.kr/images/oneiric-diary/v/official-photo-4-yuri.jpg',
          ],
        );
}

import 'package:izoneapp/data/member.dart';
import 'package:izoneapp/data/members/member_chaewon.dart';
import 'package:izoneapp/data/members/member_chaeyeon.dart';
import 'package:izoneapp/data/members/member_eunbi.dart';
import 'package:izoneapp/data/members/member_hitomi.dart';
import 'package:izoneapp/data/members/member_hyewon.dart';
import 'package:izoneapp/data/members/member_minju.dart';
import 'package:izoneapp/data/members/member_nako.dart';
import 'package:izoneapp/data/members/member_sakura.dart';
import 'package:izoneapp/data/members/member_wonyoung.dart';
import 'package:izoneapp/data/members/member_yena.dart';
import 'package:izoneapp/data/members/member_yujin.dart';
import 'package:izoneapp/data/members/member_yuri.dart';

abstract class Members {
  static List<Member> get members => [
        MemberEunbi(),
        MemberSakura(),
        MemberHyewon(),
        MemberYena(),
        MemberChaeyeon(),
        MemberChaewon(),
        MemberMinju(),
        MemberNako(),
        MemberHitomi(),
        MemberYuri(),
        MemberYujin(),
        MemberWonyoung(),
      ];
}

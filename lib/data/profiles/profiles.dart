import 'package:izoneapp/data/profile.dart';
import 'package:izoneapp/data/profiles/profile_chaewon.dart';
import 'package:izoneapp/data/profiles/profile_chaeyeon.dart';
import 'package:izoneapp/data/profiles/profile_eunbi.dart';
import 'package:izoneapp/data/profiles/profile_hitomi.dart';
import 'package:izoneapp/data/profiles/profile_hyewon.dart';
import 'package:izoneapp/data/profiles/profile_minju.dart';
import 'package:izoneapp/data/profiles/profile_nako.dart';
import 'package:izoneapp/data/profiles/profile_sakura.dart';
import 'package:izoneapp/data/profiles/profile_wonyoung.dart';
import 'package:izoneapp/data/profiles/profile_yena.dart';
import 'package:izoneapp/data/profiles/profile_yujin.dart';
import 'package:izoneapp/data/profiles/profile_yuri.dart';

abstract class Profiles {
  static List<Profile> get profiles => [
        ProfileEunbi(),
        ProfileSakura(),
        ProfileHyewon(),
        ProfileYena(),
        ProfileChaeyeon(),
        ProfileChaewon(),
        ProfileMinju(),
        ProfileNako(),
        ProfileHitomi(),
        ProfileYuri(),
        ProfileYujin(),
        ProfileWonyoung(),
      ];
}

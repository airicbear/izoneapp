import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/data/lyrics/30-girls-6-concepts/album_30_girls_6_concepts.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/album_bloom_iz.dart';
import 'package:izoneapp/data/lyrics/buenos-aires/album_buenos_aires.dart';
import 'package:izoneapp/data/lyrics/color-iz/album_color_iz.dart';
import 'package:izoneapp/data/lyrics/d-d-dance/album_d_d_dance.dart';
import 'package:izoneapp/data/lyrics/final/album_final.dart';
import 'package:izoneapp/data/lyrics/heart-iz/album_heart_iz.dart';
import 'package:izoneapp/data/lyrics/one-reeler-act-iv/album_one_reeler_act_iv.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/album_oneiric_diary.dart';
import 'package:izoneapp/data/lyrics/pick-me/album_pick_me.dart';
import 'package:izoneapp/data/lyrics/rise/album_rise.dart';
import 'package:izoneapp/data/lyrics/suki-to-iwasetai/album_suki_to_iwasetai.dart';
import 'package:izoneapp/data/lyrics/twelve/album_twelve.dart';
import 'package:izoneapp/data/lyrics/vampire/album_vampire.dart';
import 'package:izoneapp/data/lyrics/zero-attitude/album_zero_attitude.dart';

abstract class Albums {
  static List<Album> allAlbums(BuildContext context) {
    return [
      AlbumZeroAttitude(context),
      AlbumDDDance(context),
      AlbumOneReelerActIV(context),
      AlbumTwelve(context),
      AlbumOneiricDiary(context),
      AlbumBloomIz(context),
      AlbumVampire(context),
      AlbumBuenosAires(context),
      AlbumHeartIz(context),
      AlbumRise(context),
      AlbumSukiToIwasetai(context),
      AlbumColorIz(context),
      AlbumFinal(context),
      Album30Girls6Concepts(context),
      AlbumPickMe(context),
    ];
  }

  static List<Album> koreanAlbums(BuildContext context) {
    return [
      AlbumOneReelerActIV(context),
      AlbumOneiricDiary(context),
      AlbumBloomIz(context),
      AlbumHeartIz(context),
      AlbumColorIz(context),
    ];
  }

  static List<Album> japaneseAlbums(BuildContext context) {
    return [
      AlbumTwelve(context),
      AlbumVampire(context),
      AlbumBuenosAires(context),
      AlbumSukiToIwasetai(context),
    ];
  }

  static List<Album> singles(BuildContext context) {
    return [
      AlbumZeroAttitude(context),
      AlbumDDDance(context),
      AlbumRise(context),
    ];
  }

  static List<Album> produce48(BuildContext context) {
    return [
      AlbumFinal(context),
      Album30Girls6Concepts(context),
      AlbumPickMe(context),
    ];
  }
}

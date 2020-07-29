import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/data/lyrics/30-girls-6-concepts/Album30Girls6Concepts.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/album_bloom_iz.dart';
import 'package:izoneapp/data/lyrics/buenos-aires/AlbumBuenosAires.dart';
import 'package:izoneapp/data/lyrics/color-iz/AlbumColorIz.dart';
import 'package:izoneapp/data/lyrics/final/AlbumFinal.dart';
import 'package:izoneapp/data/lyrics/heart-iz/AlbumHeartIz.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/AlbumOneiricDiary.dart';
import 'package:izoneapp/data/lyrics/pick-me/AlbumPickMe.dart';
import 'package:izoneapp/data/lyrics/rise/AlbumRise.dart';
import 'package:izoneapp/data/lyrics/suki-to-iwasetai/AlbumSukiToIwasetai.dart';
import 'package:izoneapp/data/lyrics/vampire/AlbumVampire.dart';

class Albums {
  static List<Album> albums(BuildContext context) {
    List<Album> _albums = [
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
    int _index = 0;
    _albums.forEach((album) {
      album.index = _index;
      _index++;
    });
    return _albums;
  }
}

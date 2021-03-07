import 'package:flutter/material.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/data/lyrics/buenos-aires/lyrics_buenos_aires.dart';
import 'package:izoneapp/data/lyrics/buenos-aires/lyrics_human_love.dart';
import 'package:izoneapp/data/lyrics/buenos-aires/lyrics_target.dart';
import 'package:izoneapp/data/lyrics/buenos-aires/lyrics_tomorrow.dart';
import 'package:izoneapp/data/lyrics/buenos-aires/lyrics_toshita_boyfriend.dart';

class AlbumBuenosAires extends Album {
  AlbumBuenosAires(BuildContext context)
      : super(
          context,
          title: "Buenos Aires",
          releaseDate: "2019-06-26",
          color: Color.fromRGBO(107, 45, 49, 1),
          songs: [
            LyricsBuenosAires(context),
            LyricsTomorrow(context),
            LyricsTarget(context),
            LyricsToshitaBoyfriend(context),
            LyricsHumanLove(context),
          ],
        );
}

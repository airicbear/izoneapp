import 'package:flutter/material.dart';
import 'package:izoneapp/data/Album.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_ayayaya.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_dreamlike.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_eyes.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_fiesta.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_so_curious.dart';

class AlbumBloomIz extends Album {
  AlbumBloomIz(BuildContext context)
      : super(
          context,
          title: "BLOOM*IZ",
          releaseDate: "2020-02-17",
          color: Color.fromRGBO(175, 125, 101, 1),
          songs: [
            LyricsEyes(context),
            LyricsFiesta(context),
            LyricsDreamlike(context),
            LyricsAyayaya(context),
            LyricsSoCurious(context),
          ],
        );

  @override
  int index;
}

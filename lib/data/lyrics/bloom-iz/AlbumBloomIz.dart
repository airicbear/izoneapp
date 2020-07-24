import 'package:flutter/material.dart';
import 'package:izoneapp/data/Album.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/LyricsDreamlike.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/LyricsEyes.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/LyricsFiesta.dart';

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
          ],
        );

  @override
  int index;
}

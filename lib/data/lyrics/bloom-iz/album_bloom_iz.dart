import 'package:flutter/material.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_ayayaya.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_daydream.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_destiny.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_dreamlike.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_eyes.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_fiesta.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_open_your_eyes.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_pink_blusher.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_so_curious.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_someday.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_spaceship.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/lyrics_you_and_i.dart';

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
            LyricsSpaceship(context),
            LyricsDestiny(context),
            LyricsYouAndI(context),
            LyricsDaydream(context),
            LyricsPinkBlusher(context),
            LyricsSomeday(context),
            LyricsOpenYourEyes(context),
          ],
        );
}

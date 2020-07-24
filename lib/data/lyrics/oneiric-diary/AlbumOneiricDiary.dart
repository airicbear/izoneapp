import 'package:flutter/material.dart';
import 'package:izoneapp/data/Album.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/LyricsMerryGoRound.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/LyricsPretty.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/LyricsRococo.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/LyricsSecretStoryOfTheSwan.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/LyricsSecretStoryOfTheSwanJapanese.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/LyricsWelcome.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/LyricsWithOne.dart';

class AlbumOneiricDiary extends Album {
  AlbumOneiricDiary(BuildContext context)
      : super(
          context,
          title: "Oneiric Diary",
          releaseDate: "2020-06-15",
          color: Color.fromRGBO(198, 172, 195, 1),
          songs: [
            LyricsWelcome(context),
            LyricsSecretStoryOfTheSwan(context),
            LyricsPretty(context),
            LyricsMerryGoRound(context),
            LyricsRococo(context),
            LyricsWithOne(context),
            LyricsSecretStoryOfTheSwanJapanese(context),
          ],
        );

  @override
  int index;
}

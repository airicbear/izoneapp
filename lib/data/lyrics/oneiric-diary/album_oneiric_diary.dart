import 'package:flutter/material.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/lyrics_merry_go_round.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/lyrics_merry_go_round_japanese.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/lyrics_pretty.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/lyrics_rococo.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/lyrics_secret_story_of_the_swan.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/lyrics_secret_story_of_the_swan_japanese.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/lyrics_welcome.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/lyrics_with_one.dart';

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
            LyricsMerryGoRoundJapanese(context),
          ],
        );
}

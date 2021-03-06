import 'package:flutter/material.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/data/lyrics/one-reeler-act-iv/lyrics_island.dart';
import 'package:izoneapp/data/lyrics/one-reeler-act-iv/lyrics_mise_en_scene.dart';
import 'package:izoneapp/data/lyrics/one-reeler-act-iv/lyrics_o_sole_mio.dart';
import 'package:izoneapp/data/lyrics/one-reeler-act-iv/lyrics_panorama.dart';
import 'package:izoneapp/data/lyrics/one-reeler-act-iv/lyrics_sequence.dart';
import 'package:izoneapp/data/lyrics/one-reeler-act-iv/lyrics_slow_journey.dart';

class AlbumOneReelerActIV extends Album {
  AlbumOneReelerActIV(BuildContext context)
      : super(
          context,
          title: "One-reeler / Act IV",
          releaseDate: "2020-12-07",
          color: Color.fromRGBO(49, 47, 60, 1),
          songs: [
            LyricsMiseEnScene(context),
            LyricsPanorama(context),
            LyricsIsland(context),
            LyricsSequence(context),
            LyricsOSoleMio(context),
            LyricsSlowJourney(context),
          ],
        );

  @override
  int index;
}

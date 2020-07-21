import 'package:flutter/widgets.dart';
import 'package:izoneapp/data/Album.dart';
import 'package:izoneapp/data/lyrics/color-iz/LyricsLaVieEnRose.dart';
import 'package:izoneapp/data/lyrics/heart-iz/LyricsVioleta.dart';

class Albums {
  static List<Album> albums(BuildContext context) {
    return [
      Album(
        title: "Oneiric Diary",
        releaseDate: "2020-06-15",
        songs: [],
      ),
      Album(
        title: "BLOOM*IZ",
        releaseDate: "2020-02-17",
        songs: [],
      ),
      Album(
        title: "Vampire",
        releaseDate: "2019-09-25",
        songs: [],
      ),
      Album(
        title: "Buenos Aires",
        releaseDate: "2019-06-26",
        songs: [],
      ),
      Album(
        title: "HEART*IZ",
        releaseDate: "2019-04-01",
        songs: [
          LyricsVioleta(context),
        ],
      ),
      Album(
        title: "COLOR*IZ",
        releaseDate: "2018-10-29",
        songs: [
          LyricsLaVieEnRose(context),
        ],
      ),
      Album(
        title: "Final",
        releaseDate: "2018-09-01",
        songs: [],
      ),
      Album(
        title: "30 Girls 6 Concepts",
        releaseDate: "2018-08-18",
        songs: [],
      ),
      Album(
        title: "Pick Me",
        releaseDate: "2018-05-10",
        songs: [],
      )
    ];
  }
}

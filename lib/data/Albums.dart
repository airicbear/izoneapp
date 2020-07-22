import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:izoneapp/data/Album.dart';
import 'package:izoneapp/data/lyrics/color-iz/LyricsLaVieEnRose.dart';
import 'package:izoneapp/data/lyrics/heart-iz/LyricsVioleta.dart';
import 'package:izoneapp/data/lyrics/rise/LyricsRise.dart';

class Albums {
  static List<Album> albums(BuildContext context) {
    return [
      Album(
        title: "Oneiric Diary",
        releaseDate: "2020-06-15",
        color: Color.fromRGBO(198, 172, 195, 1),
        songs: [],
      ),
      Album(
        title: "BLOOM*IZ",
        releaseDate: "2020-02-17",
        color: Color.fromRGBO(175, 125, 101, 1),
        songs: [],
      ),
      Album(
        title: "Vampire",
        releaseDate: "2019-09-25",
        color: Color.fromRGBO(132, 134, 138, 1),
        songs: [],
      ),
      Album(
        title: "Buenos Aires",
        releaseDate: "2019-06-26",
        color: Color.fromRGBO(107, 45, 49, 1),
        songs: [],
      ),
      Album(
        title: "HEART*IZ",
        releaseDate: "2019-04-01",
        color: Color.fromRGBO(189, 201, 189, 1),
        songs: [
          LyricsVioleta(context),
        ],
      ),
      Album(
        title: "Rise",
        releaseDate: "2019-03-09",
        songs: [
          LyricsRise(context),
        ],
      ),
      Album(
        title: "Suki to Iwasetai",
        releaseDate: "2019-02-06",
        color: Color.fromRGBO(144, 135, 139, 1),
        songs: [],
      ),
      Album(
        title: "COLOR*IZ",
        releaseDate: "2018-10-29",
        color: Color.fromRGBO(216, 198, 187, 1),
        songs: [
          LyricsLaVieEnRose(context),
        ],
      ),
      Album(
        title: "Final",
        releaseDate: "2018-09-01",
        color: Color.fromRGBO(241, 211, 231, 1),
        songs: [],
      ),
      Album(
        title: "30 Girls 6 Concepts",
        releaseDate: "2018-08-18",
        color: Color.fromRGBO(240, 210, 230, 1),
        songs: [],
      ),
      Album(
        title: "Pick Me",
        releaseDate: "2018-05-10",
        color: Color.fromRGBO(241, 211, 232, 1),
        songs: [],
      )
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:izoneapp/data/Album.dart';
import 'package:izoneapp/data/lyrics/color-iz/LyricsLaVieEnRose.dart';

class AlbumColorIz extends Album {
  AlbumColorIz(BuildContext context)
      : super(
          context,
          title: "COLOR*IZ",
          releaseDate: "2018-10-29",
          color: Color.fromRGBO(216, 198, 187, 1),
          songs: [
            LyricsLaVieEnRose(context),
          ],
        );
}

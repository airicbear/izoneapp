import 'package:flutter/material.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/data/lyrics/twelve/lyrics_beware.dart';

class AlbumTwelve extends Album {
  AlbumTwelve(BuildContext context)
      : super(
          context,
          title: "Twelve",
          releaseDate: "2020-10-21",
          color: Color.fromRGBO(184, 126, 164, 1),
          songs: [
            LyricsBeware(context),
          ],
        );

  @override
  int index;
}

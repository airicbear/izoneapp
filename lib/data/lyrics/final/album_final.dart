import 'package:flutter/material.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/data/lyrics/final/lyrics_we_together.dart';

class AlbumFinal extends Album {
  AlbumFinal(BuildContext context)
      : super(
          context,
          title: "Final",
          releaseDate: "2018-09-01",
          color: Color.fromRGBO(241, 211, 231, 1),
          songs: [
            LyricsWeTogether(context),
          ],
        );

  @override
  int index;
}

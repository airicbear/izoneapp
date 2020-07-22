import 'package:flutter/material.dart';
import 'package:izoneapp/data/Album.dart';
import 'package:izoneapp/data/lyrics/heart-iz/LyricsVioleta.dart';

class AlbumHeartIz extends Album {
  AlbumHeartIz(BuildContext context)
      : super(
          context,
          title: "HEART*IZ",
          releaseDate: "2019-04-01",
          color: Color.fromRGBO(189, 201, 189, 1),
          songs: [
            LyricsVioleta(context),
          ],
        );

  @override
  int index;
}

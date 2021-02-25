import 'package:flutter/material.dart';
import 'package:izoneapp/data/album.dart';

class AlbumTwelve extends Album {
  AlbumTwelve(BuildContext context)
      : super(
          context,
          title: "Twelve",
          releaseDate: "2020-10-21",
          color: Color.fromRGBO(184, 126, 164, 1),
          songs: [],
        );

  @override
  int index;
}

import 'package:flutter/material.dart';
import 'package:izoneapp/data/Album.dart';

class AlbumFinal extends Album {
  AlbumFinal(BuildContext context)
      : super(
          context,
          title: "Final",
          releaseDate: "2018-09-01",
          color: Color.fromRGBO(241, 211, 231, 1),
          songs: [],
        );

  @override
  int index;
}

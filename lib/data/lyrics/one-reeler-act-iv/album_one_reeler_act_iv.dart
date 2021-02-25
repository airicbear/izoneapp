import 'package:flutter/material.dart';
import 'package:izoneapp/data/album.dart';

class AlbumOneReelerActIV extends Album {
  AlbumOneReelerActIV(BuildContext context)
      : super(
          context,
          title: "One-reeler / Act IV",
          releaseDate: "2020-12-07",
          color: Color.fromRGBO(49, 47, 60, 1),
          songs: [],
        );

  @override
  int index;
}

import 'package:flutter/material.dart';
import 'package:izoneapp/data/Album.dart';

class AlbumVampire extends Album {
  AlbumVampire(BuildContext context)
      : super(
          context,
          title: "Vampire",
          releaseDate: "2019-09-25",
          color: Color.fromRGBO(132, 134, 138, 1),
          songs: [],
        );

  @override
  int index;
}

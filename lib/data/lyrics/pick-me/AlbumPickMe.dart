import 'package:flutter/material.dart';
import 'package:izoneapp/data/Album.dart';

class AlbumPickMe extends Album {
  AlbumPickMe(BuildContext context)
      : super(
          context,
          title: "Pick Me",
          releaseDate: "2018-05-10",
          color: Color.fromRGBO(241, 211, 232, 1),
          songs: [],
        );
}

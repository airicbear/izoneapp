import 'package:flutter/material.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/data/lyrics/buenos-aires/LyricsBuenosAires.dart';

class AlbumBuenosAires extends Album {
  AlbumBuenosAires(BuildContext context)
      : super(
          context,
          title: "Buenos Aires",
          releaseDate: "2019-06-26",
          color: Color.fromRGBO(107, 45, 49, 1),
          songs: [
            LyricsBuenosAires(context),
          ],
        );

  @override
  int index;
}

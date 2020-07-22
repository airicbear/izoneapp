import 'package:flutter/material.dart';
import 'package:izoneapp/data/Album.dart';
import 'package:izoneapp/data/lyrics/30-girls-6-concepts/LyricsRollinRollin.dart';

class Album30Girls6Concepts extends Album {
  Album30Girls6Concepts(BuildContext context)
      : super(
          context,
          title: "30 Girls 6 Concepts",
          releaseDate: "2018-08-18",
          color: Color.fromRGBO(240, 210, 230, 1),
          songs: [
            LyricsRollinRollin(context),
          ],
        );

  @override
  int index;
}

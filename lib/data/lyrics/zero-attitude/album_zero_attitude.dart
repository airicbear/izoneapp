import 'package:flutter/material.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/data/lyrics/zero-attitude/lyrics_zero_attitude.dart';

class AlbumZeroAttitude extends Album {
  AlbumZeroAttitude(BuildContext context)
      : super(
          context,
          title: "Zero:Attitude",
          releaseDate: "2021-02-15",
          color: Color.fromRGBO(75, 75, 75, 1),
          songs: [
            LyricsZeroAttitude(context),
          ],
        );

  @override
  int index;
}

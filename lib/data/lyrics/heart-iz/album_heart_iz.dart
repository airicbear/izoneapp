import 'package:flutter/material.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/data/lyrics/heart-iz/lyrics_hey_bae_like_it.dart';
import 'package:izoneapp/data/lyrics/heart-iz/lyrics_highlight.dart';
import 'package:izoneapp/data/lyrics/heart-iz/lyrics_violeta.dart';

class AlbumHeartIz extends Album {
  AlbumHeartIz(BuildContext context)
      : super(
          context,
          title: "HEART*IZ",
          releaseDate: "2019-04-01",
          color: Color.fromRGBO(189, 201, 189, 1),
          songs: [
            LyricsHeyBaeLikeIt(context),
            LyricsVioleta(context),
            LyricsHighlight(context),
          ],
        );

  @override
  int index;
}

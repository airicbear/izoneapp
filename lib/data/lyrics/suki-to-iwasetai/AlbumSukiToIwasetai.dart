import 'package:flutter/material.dart';
import 'package:izoneapp/data/Album.dart';
import 'package:izoneapp/data/lyrics/suki-to-iwasetai/LyricsSukiToIwasetai.dart';

class AlbumSukiToIwasetai extends Album {
  AlbumSukiToIwasetai(BuildContext context)
      : super(
          context,
          title: "Suki to Iwasetai",
          releaseDate: "2019-02-06",
          color: Color.fromRGBO(144, 135, 139, 1),
          songs: [
            LyricsSukiToIwasetai(context),
          ],
        );
}

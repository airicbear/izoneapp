import 'package:flutter/material.dart';
import 'package:izoneapp/data/song.dart';

class LyricsOSoleMio extends Song {
  LyricsOSoleMio(BuildContext context)
      : super(
          context,
          title: 'O Sole Mio',
          length: Duration(minutes: 3, seconds: 31),
          lyrics: {
            "rom": [],
            "han": [],
            "eng": [],
          },
        );
}

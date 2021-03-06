import 'package:flutter/material.dart';
import 'package:izoneapp/data/song.dart';

class LyricsSequence extends Song {
  LyricsSequence(BuildContext context)
      : super(
          context,
          title: 'Sequence',
          length: Duration(minutes: 3, seconds: 11),
          lyrics: {
            "rom": [],
            "han": [],
            "eng": [],
          },
        );
}

import 'package:flutter/material.dart';
import 'package:izoneapp/data/song.dart';

class LyricsSlowJourney extends Song {
  LyricsSlowJourney(BuildContext context)
      : super(
          context,
          title: 'Slow Journey',
          length: Duration(minutes: 3, seconds: 20),
          lyrics: {
            "rom": [],
            "han": [],
            "eng": [],
          },
        );
}

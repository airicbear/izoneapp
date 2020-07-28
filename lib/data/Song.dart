import 'package:flutter/material.dart';

abstract class Song {
  final BuildContext context;
  final String title;
  final Duration length;
  final Map<String, List<String>> lyrics;

  static bool lineCountMatch(Map<String, List<String>> lyrics) {
    return (lyrics.length > 1
            ? lyrics.values.toList()[0].length ==
                lyrics.values.toList()[1].length
            : true) &&
        (lyrics.length > 2
            ? lyrics.values.toList()[1].length ==
                lyrics.values.toList()[2].length
            : true);
  }

  Song(this.context, {this.title, this.length, this.lyrics})
      : assert(lyrics.length > 0 && lineCountMatch(lyrics),
            'Song lyrics must have matching number of lines. The song "$title" has line counts ${lyrics.values.map((e) => e.length)}.');
}

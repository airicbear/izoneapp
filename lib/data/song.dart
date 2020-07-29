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

  /// Returns the number of lines for each
  /// section of a given set of lyrics
  static String sectionIndices(Map<String, List<String>> lyrics) {
    return lyrics
        .map((k, v) {
          List<int> _indices = [];
          int i = 0;
          while (i < v.length) {
            if (v.elementAt(i).isEmpty ||
                (v.elementAt(i).startsWith('[') &&
                    v.elementAt(i).endsWith(']'))) {
              _indices.add(i);
            }
            i++;
          }
          return MapEntry(k, '[${_indices.join(', ')}]');
        })
        .entries
        .join('\n');
  }

  Song(this.context, {this.title, this.length, this.lyrics})
      : assert(lyrics.length > 0 && lineCountMatch(lyrics),
            'Song lyrics must have matching number of lines. The song lyrics for "$title" has section indices\n\n${sectionIndices(lyrics)}\n');
}

import 'dart:ui';

import 'package:izoneapp/data/Song.dart';

class Album {
  final String title;
  final String releaseDate;
  final List<Song> songs;
  final Color color;

  Album({this.title, this.releaseDate, this.songs, this.color});

  String getCoverArtPath() {
    return 'assets/coverart/${this.title.split(RegExp(r'[\s\*]')).join('-').toLowerCase()}.jpg';
  }
}

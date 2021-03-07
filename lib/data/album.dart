import 'package:flutter/material.dart';
import 'package:izoneapp/data/song.dart';

abstract class Album {
  final BuildContext context;
  final String title;
  final String releaseDate;
  final List<Song> songs;
  final Color color;

  Album(
    this.context, {
    this.title,
    this.releaseDate,
    this.songs,
    this.color,
  });

  Duration get totalDuration {
    Duration total = Duration();
    for (Song song in songs) {
      total += song.length;
    }
    return total;
  }

  String get getCoverArtPath =>
      'assets/coverart/${this.title.split(RegExp(r'[\s\*\:\-\/]+')).join('-').toLowerCase()}.jpg';

  DateTime get date => DateTime.parse(this.releaseDate);
}

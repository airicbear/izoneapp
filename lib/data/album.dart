import 'package:flutter/material.dart';
import 'package:izoneapp/data/song.dart';

abstract class Album {
  final BuildContext context;
  final String title;
  final String releaseDate;
  final List<Song> songs;
  final Color color;

  set index(int n);
  int get index;

  Album(this.context, {this.title, this.releaseDate, this.songs, this.color});

  String get getCoverArtPath =>
      'assets/coverart/${this.title.split(RegExp(r'[\s\*\:\-\/]+')).join('-').toLowerCase()}.jpg';
}

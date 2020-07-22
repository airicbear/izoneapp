import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:izoneapp/data/Song.dart';

abstract class Album {
  final BuildContext context;
  final String title;
  final String releaseDate;
  final List<Song> songs;
  final Color color;

  Album(this.context, {this.title, this.releaseDate, this.songs, this.color});

  String get getCoverArtPath =>
      'assets/coverart/${this.title.split(RegExp(r'[\s\*]')).join('-').toLowerCase()}.jpg';
}

import 'package:flutter/material.dart';

abstract class Song {
  final BuildContext context;
  final String title;
  final Duration length;
  final Map<String, List<String>> lyrics;

  Song(this.context, {this.title, this.length, this.lyrics});
}

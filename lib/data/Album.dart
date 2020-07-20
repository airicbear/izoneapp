import 'package:izoneapp/data/Song.dart';

class Album {
  final String title;
  final String releaseDate;
  final List<Song> songs;

  Album({this.title, this.releaseDate, this.songs});

  String getCoverArtPath() {
    return 'assets/coverart/${this.title.split(RegExp(r'[\s\*]')).join('-').toLowerCase()}.jpg';
  }
}

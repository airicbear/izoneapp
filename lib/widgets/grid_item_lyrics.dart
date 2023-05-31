import 'package:flutter/material.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/pages/level_2/page_album_lyrics.dart';

class AlbumLyricsTile extends StatelessWidget {
  const AlbumLyricsTile({
    Key? key,
    required this.album,
    required this.themeData,
  }) : super(key: key);

  final Album album;
  final ThemeData themeData;

  Route _albumLyricsRoute(BuildContext context, Album album) {
    return MaterialPageRoute(
      builder: (context) => AlbumLyricsPage(
        album: album,
        themeData: this.themeData,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12.0),
      child: InkResponse(
        highlightColor: album.color.withOpacity(0.3),
        onTap: () {
          Navigator.of(context).push(_albumLyricsRoute(context, album));
        },
        highlightShape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          children: [
            Hero(
              tag: album.getCoverArtPath,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image(
                  image: AssetImage(album.getCoverArtPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            FittedBox(
              child: Text(
                album.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

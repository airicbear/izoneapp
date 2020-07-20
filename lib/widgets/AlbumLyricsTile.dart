import 'package:flutter/material.dart';
import 'package:izoneapp/data/Album.dart';
import 'package:izoneapp/pages/AlbumLyricsPage.dart';

class AlbumLyricsTile extends StatelessWidget {
  const AlbumLyricsTile({Key key, this.album}) : super(key: key);

  final Album album;

  Route _albumLyricsRoute(BuildContext context, Album album) {
    return MaterialPageRoute(
      builder: (context) => AlbumLyricsPage(
        album: album,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkResponse(
        onTap: () {
          Navigator.of(context).push(_albumLyricsRoute(context, album));
        },
        highlightShape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(32.0),
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: album.getCoverArtPath(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image(
                    image: AssetImage(album.getCoverArtPath()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  Text(album.title),
                  Text(
                    '${MaterialLocalizations.of(context).formatCompactDate(DateTime.parse(album.releaseDate))}',
                    style: TextStyle(
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

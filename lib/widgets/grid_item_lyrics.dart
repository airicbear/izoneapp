import 'package:flutter/material.dart';
import 'package:izoneapp/controllers/lyrics_page_view.dart';
import 'package:izoneapp/data/album.dart';

class AlbumLyricsTile extends StatelessWidget {
  const AlbumLyricsTile({Key key, this.album}) : super(key: key);

  final Album album;

  Route _albumLyricsRoute(BuildContext context, Album album) {
    return MaterialPageRoute(
      builder: (context) => LyricsPageView(
        album: album,
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
            Expanded(
              child: Hero(
                tag: album.getCoverArtPath,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image(
                    image: AssetImage(album.getCoverArtPath),
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

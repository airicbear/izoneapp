import 'package:flutter/material.dart';
import 'package:izoneapp/controllers/lyrics_page_view.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/widgets/gradient_box.dart';
import 'package:izoneapp/widgets/grid_item_label.dart';

class AlbumLyricsTile extends StatelessWidget {
  const AlbumLyricsTile({
    Key key,
    @required this.album,
    @required this.adHeight,
  }) : super(key: key);

  final Album album;
  final double adHeight;

  Route _albumLyricsRoute(BuildContext context, Album album) {
    return MaterialPageRoute(
      builder: (context) => LyricsPageView(
        album: album,
        adHeight: adHeight,
      ),
    );
  }

  Widget _albumInfo(BuildContext context) {
    return Padding(
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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Stack(
              fit: StackFit.expand,
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
                GradientBox(),
              ],
            ),
            GridItemLabel(
              title: album.title,
              subtitle:
                  MaterialLocalizations.of(context).formatShortDate(album.date),
            ),
          ],
        ),
      ),
    );
  }
}

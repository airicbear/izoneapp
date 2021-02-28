import 'package:flutter/material.dart';
import 'package:izoneapp/data/lyrics/albums.dart';
import 'package:izoneapp/widgets/grid_item_lyrics.dart';

class LyricsPage extends StatelessWidget {
  final double adHeight;

  const LyricsPage({Key key, @required this.adHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView.builder(
          key: PageStorageKey(LyricsPage),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 1.0,
            maxCrossAxisExtent: 256.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: AlbumLyricsTile(
                album: Albums.albums(context).elementAt(index),
                adHeight: adHeight,
              ),
            );
          },
          itemCount: Albums.albums(context).length,
        ),
      ),
    );
  }
}

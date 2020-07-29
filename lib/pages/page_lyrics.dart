import 'package:flutter/material.dart';
import 'package:izoneapp/data/albums.dart';
import 'package:izoneapp/widgets/grid_item_lyrics.dart';

class LyricsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 0.8,
            maxCrossAxisExtent: 256.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: AlbumLyricsTile(
                album: Albums.albums(context)[index],
              ),
            );
          },
          itemCount: Albums.albums(context).length,
        ),
      ),
    );
  }
}

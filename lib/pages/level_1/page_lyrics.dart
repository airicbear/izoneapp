import 'package:flutter/material.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/data/lyrics/albums.dart';
import 'package:izoneapp/widgets/grid_item_lyrics.dart';

class LyricsPage extends StatelessWidget {
  const LyricsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _HorizontalAlbumList(
            title: 'Korean albums',
            albums: Albums.koreanAlbums(context),
          ),
          _HorizontalAlbumList(
            title: 'Japanese albums',
            albums: Albums.japaneseAlbums(context),
          ),
          _HorizontalAlbumList(
            title: 'Singles',
            albums: Albums.singles(context),
          ),
          _HorizontalAlbumList(
            title: 'Produce 48',
            albums: Albums.produce48(context),
          ),
        ],
      ),
    );
  }
}

class _HorizontalAlbumList extends StatelessWidget {
  final String title;
  final List<Album> albums;

  const _HorizontalAlbumList({Key key, this.title, this.albums})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
            textScaleFactor: 1.25,
          ),
          Container(
            height: 200.0,
            padding: EdgeInsets.only(top: 16.0),
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              key: PageStorageKey(LyricsPage),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 1.2,
                maxCrossAxisExtent: 256.0,
                mainAxisSpacing: 4.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return AlbumLyricsTile(
                  album: albums.elementAt(index),
                  themeData: Theme.of(context),
                );
              },
              itemCount: albums.length,
            ),
          ),
        ],
      ),
    );
  }
}

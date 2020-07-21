import 'package:flutter/material.dart';
import 'package:izoneapp/data/Album.dart';
import 'package:izoneapp/data/Song.dart';
import 'package:izoneapp/pages/SongLyricsPage.dart';
import 'package:izoneapp/pages/ViewPicturePage.dart';

class AlbumLyricsPage extends StatelessWidget {
  const AlbumLyricsPage({Key key, this.album}) : super(key: key);

  final Album album;

  Route _songLyricsRoute(BuildContext context, Song song) {
    return MaterialPageRoute(
      builder: (context) => SongLyricsPage(song: song),
    );
  }

  Widget _albumCoverArt(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ViewPicturePage(
                memberImagePath: album.getCoverArtPath(),
              );
            },
          ),
        );
      },
      child: Hero(
        tag: album.getCoverArtPath(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32.0),
          child: Image(
            image: AssetImage(album.getCoverArtPath()),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 370,
            flexibleSpace: _albumCoverArt(context),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Card(
                child: InkWell(
                  onTap: () => Navigator.of(context)
                      .push(_songLyricsRoute(context, album.songs[index])),
                  child: ListTile(
                    title: Text(album.songs[index].title),
                  ),
                ),
              ),
              childCount: album.songs.length,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:izoneapp/data/Album.dart';
import 'package:izoneapp/data/Song.dart';
import 'package:izoneapp/pages/SongLyricsPage.dart';
import 'package:izoneapp/pages/ViewPicturePage.dart';

class AlbumLyricsPage extends StatelessWidget {
  const AlbumLyricsPage({Key key, this.album}) : super(key: key);

  final Album album;

  Route _songLyricsRoute({
    BuildContext context,
    Song song,
    String coverArt,
    Color color,
  }) {
    return MaterialPageRoute(
      builder: (context) => SongLyricsPage(
        song: song,
        coverArt: coverArt,
        color: color,
      ),
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
                memberImagePath: album.getCoverArtPath,
              );
            },
          ),
        );
      },
      child: Hero(
        tag: album.getCoverArtPath,
        child: Image(
          image: AssetImage(album.getCoverArtPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _albumSongList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Card(
          child: InkWell(
            splashColor: album.color.withOpacity(0.8),
            onTap: () => Navigator.of(context).push(
              _songLyricsRoute(
                context: context,
                song: album.songs[index],
                coverArt: album.getCoverArtPath,
                color: album.color,
              ),
            ),
            child: ListTile(
              leading: Text(
                '${index + 1}.',
                textScaleFactor: 1.25,
              ),
              title: Text('${album.songs[index].title}'),
              trailing: FittedBox(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Lyrics',
                        textScaleFactor: 1.25,
                      ),
                    ),
                    FaIcon(FontAwesomeIcons.readme),
                  ],
                ),
              ),
            ),
          ),
        ),
        childCount: album.songs.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 410,
                  flexibleSpace: _albumCoverArt(context),
                ),
                _albumSongList(),
              ],
            );
          } else {
            return Row(
              children: [
                Flexible(
                  flex: 2,
                  child: _albumCoverArt(context),
                ),
                Expanded(
                  flex: 3,
                  child: CustomScrollView(
                    slivers: [
                      _albumSongList(),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

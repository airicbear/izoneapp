import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/data/song.dart';
import 'package:izoneapp/generated/l10n.dart';
import 'package:izoneapp/pages/level_3/page_song_lyrics.dart';
import 'package:izoneapp/pages/page_view_picture.dart';

class AlbumLyricsPage extends StatelessWidget {
  const AlbumLyricsPage({
    Key key,
    @required this.album,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 410,
                  flexibleSpace: _AlbumCoverArt(album: album),
                ),
                _AlbumSongList(
                  album: album,
                ),
              ],
            );
          } else {
            return Row(
              children: [
                Flexible(
                  flex: 2,
                  child: _AlbumCoverArt(album: album),
                ),
                Expanded(
                  flex: 3,
                  child: CustomScrollView(
                    slivers: [
                      _AlbumSongList(
                        album: album,
                      ),
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

class _AlbumCoverArt extends StatelessWidget {
  final Album album;

  const _AlbumCoverArt({Key key, @required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ViewPicturePage(
                    path: album.getCoverArtPath,
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
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(4.0)),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Text(
            '${MaterialLocalizations.of(context).formatShortDate(DateTime.parse(album.releaseDate))}',
          ),
        ),
      ],
    );
  }
}

class _AlbumSongList extends StatelessWidget {
  final Album album;

  const _AlbumSongList({Key key, @required this.album}) : super(key: key);

  Route _songLyricsRoute({
    BuildContext context,
    Song song,
    String coverArt,
  }) {
    return MaterialPageRoute(
      builder: (context) => SongLyricsPage(
        song: song,
        coverArt: coverArt,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Card(
          clipBehavior: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
          ).clipBehavior,
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              _songLyricsRoute(
                context: context,
                song: album.songs[index],
                coverArt: album.getCoverArtPath,
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
                        S.of(context).lyrics,
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
}

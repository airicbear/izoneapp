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
    @required this.adHeight,
  }) : super(key: key);

  final Album album;
  final double adHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: adHeight),
      child: Stack(
        children: [
          Container(
            color: album.color,
          ),
          Scaffold(
            backgroundColor:
                Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
            body: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return GlowingOverscrollIndicator(
                    axisDirection: AxisDirection.down,
                    color: album.color,
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          backgroundColor: Colors.transparent,
                          automaticallyImplyLeading: false,
                          expandedHeight: 410,
                          flexibleSpace: _AlbumCoverArt(album: album),
                        ),
                        _AlbumSongList(
                          album: album,
                          adHeight: adHeight,
                        ),
                      ],
                    ),
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
                        child: GlowingOverscrollIndicator(
                          axisDirection: AxisDirection.down,
                          color: album.color,
                          child: CustomScrollView(
                            slivers: [
                              _AlbumSongList(
                                album: album,
                                adHeight: adHeight,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
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
            color: Color.lerp(Theme.of(context).primaryColor, album.color, 0.5),
          ),
          child: Text(
              '${MaterialLocalizations.of(context).formatShortDate(DateTime.parse(album.releaseDate))}'),
        ),
      ],
    );
  }
}

class _AlbumSongList extends StatelessWidget {
  final Album album;
  final double adHeight;

  const _AlbumSongList({Key key, @required this.album, @required this.adHeight})
      : super(key: key);

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
        adHeight: adHeight,
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
              tileColor: album.color.withOpacity(0.3),
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

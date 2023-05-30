import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/data/song.dart';
import 'package:izoneapp/generated/l10n.dart';
import 'package:izoneapp/pages/level_3/page_song_lyrics.dart';
import 'package:izoneapp/pages/page_view_picture.dart';

class AlbumLyricsPage extends StatelessWidget {
  const AlbumLyricsPage({
    Key? key,
    required this.album,
    required this.themeData,
  }) : super(key: key);

  final Album album;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeData.scaffoldBackgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 370,
                  flexibleSpace: _AlbumCoverArt(album: album),
                ),
                _AlbumSongList(
                  album: album,
                  themeData: themeData,
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
                        themeData: themeData,
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

  const _AlbumCoverArt({
    Key? key,
    required this.album,
  }) : super(key: key);

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
                    isNetwork: false,
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
      ],
    );
  }
}

class _AlbumSongList extends StatelessWidget {
  final Album album;
  final ThemeData themeData;

  const _AlbumSongList({
    Key? key,
    required this.album,
    required this.themeData,
  }) : super(key: key);

  Route _songLyricsRoute({
    required BuildContext context,
    required Song song,
    required String coverArt,
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
        (context, index) {
          if (index == 0)
            return ListTile(
              title: Text(
                MaterialLocalizations.of(context)
                    .formatShortDate(DateTime.parse(album.releaseDate)),
                style: themeData.textTheme.bodySmall,
                textScaleFactor: 1.25,
              ),
              trailing: Text(
                '${album.totalDuration.inMinutes} minutes',
                style: themeData.textTheme.bodySmall,
                textScaleFactor: 1.25,
              ),
            );
          return Card(
            color: themeData.cardColor,
            clipBehavior: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
            ).clipBehavior,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                _songLyricsRoute(
                  context: context,
                  song: album.songs[index - 1],
                  coverArt: album.getCoverArtPath,
                ),
              ),
              child: ListTile(
                leading: Text(
                  '$index.',
                  textScaleFactor: 1.25,
                ),
                title: Text('${album.songs[index - 1].title}'),
                trailing: FittedBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          S.of(context)!.lyrics,
                          textScaleFactor: 1.25,
                        ),
                      ),
                      FaIcon(FontAwesomeIcons.readme),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        childCount: album.songs.length + 1,
      ),
    );
  }
}

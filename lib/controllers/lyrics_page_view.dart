import 'package:flutter/material.dart';
import 'package:izoneapp/controllers/scrollable_app_bar_scroll_behavior.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/data/lyrics/albums.dart';
import 'package:izoneapp/pages/level_2/page_album_lyrics.dart';

class LyricsPageView extends StatefulWidget {
  final Album album;

  const LyricsPageView({Key key, this.album}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LyricsPageViewState();
}

class LyricsPageViewState extends State<LyricsPageView> {
  PageController _pageController;
  ScrollController _appBarController;
  int _nextAlbumIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _appBarController = ScrollController();
    _nextAlbumIndex = widget.album.index;
  }

  @override
  void dispose() {
    _pageController.dispose();
    _appBarController.dispose();
    super.dispose();
  }

  Widget _albumTitle(BuildContext context, Album album) {
    int _albumIndex = Albums.albums(context)
        .indexWhere((element) => element.title == album.title);
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          _albumIndex,
          duration: const Duration(
            milliseconds: 1000,
          ),
          curve: Curves.fastLinearToSlowEaseIn,
        );
        _appBarController.animateTo(
          _albumIndex * 100.0,
          duration: Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
        );
      },
      child: Text(
        album.title,
        style: _albumIndex != _nextAlbumIndex
            ? TextStyle(
                color: Theme.of(context).disabledColor,
              )
            : null,
      ),
    );
  }

  Widget _pageViewAppBar(BuildContext context) {
    return AppBar(
      backgroundColor:
          Albums.albums(context)[_nextAlbumIndex].color.withOpacity(0.5),
      title: ScrollConfiguration(
        behavior: ScrollableAppBarScrollBehavior(),
        child: SingleChildScrollView(
          controller: _appBarController,
          scrollDirection: Axis.horizontal,
          child: ButtonBar(
            alignment: MainAxisAlignment.start,
            children: List<Widget>.generate(
              Albums.albums(context).length,
              (index) => _albumTitle(
                context,
                Albums.albums(context)[index],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _pageViewAppBar(context),
      body: PageView(
        onPageChanged: (page) {
          setState(() {
            _nextAlbumIndex = page;
          });
          _appBarController.animateTo(
            _nextAlbumIndex * 100.0,
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
          );
        },
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: List.generate(
          Albums.albums(context).length,
          (index) => AlbumLyricsPage(album: Albums.albums(context)[index]),
        ),
      ),
    );
  }
}

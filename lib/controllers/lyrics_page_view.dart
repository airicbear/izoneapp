import 'package:flutter/material.dart';
import 'package:izoneapp/controllers/scrollable_app_bar_scroll_behavior.dart';
import 'package:izoneapp/data/album.dart';
import 'package:izoneapp/data/app_themes.dart';
import 'package:izoneapp/data/lyrics/albums.dart';
import 'package:izoneapp/pages/level_2/page_album_lyrics.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LyricsPageView extends StatefulWidget {
  final Album album;

  const LyricsPageView({Key key, this.album}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LyricsPageViewState();
}

class LyricsPageViewState extends State<LyricsPageView> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String> _theme;
  PageController _pageController;
  ScrollController _appBarController;
  int _nextAlbumIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.album.index);
    _appBarController = ScrollController(
      initialScrollOffset: widget.album.index * 100.0,
    );
    _nextAlbumIndex = widget.album.index;
    _theme = _prefs.then((prefs) => prefs.getString('theme') ?? 'Auto');
  }

  @override
  void dispose() {
    _pageController.dispose();
    _appBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _theme,
      builder: (context, snapshot) {
        ThemeData _themeData =
            AppThemes.themes(context)[snapshot.data ?? 'Auto'];
        return Theme(
          data: _themeData,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Albums.albums(context)[_nextAlbumIndex]
                  .color
                  .withOpacity(0.5),
              title: _PageViewAppBar(
                pageController: _pageController,
                appBarController: _appBarController,
                nextIndex: _nextAlbumIndex,
                album: widget.album,
              ),
            ),
            body: PageView(
              onPageChanged: (page) {
                setState(() {
                  _nextAlbumIndex = page;
                });
                _appBarController.animateTo(
                  _nextAlbumIndex * 100.0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                );
              },
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                Albums.albums(context).length,
                (index) => AlbumLyricsPage(
                  album: Albums.albums(context).elementAt(index),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AlbumTitle extends StatelessWidget {
  final PageController pageController;
  final ScrollController appBarController;
  final int nextIndex;
  final Album album;

  const _AlbumTitle({
    Key key,
    @required this.pageController,
    @required this.appBarController,
    @required this.nextIndex,
    @required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pageController.animateToPage(
          album.index,
          duration: const Duration(seconds: 1),
          curve: Curves.fastLinearToSlowEaseIn,
        );
        appBarController.animateTo(
          album.index * 100.0,
          duration: const Duration(seconds: 1),
          curve: Curves.fastLinearToSlowEaseIn,
        );
      },
      child: Text(
        album.title,
        style: album.index != nextIndex
            ? TextStyle(
                color: Theme.of(context).disabledColor,
              )
            : null,
      ),
    );
  }
}

class _PageViewAppBar extends StatelessWidget {
  final PageController pageController;
  final ScrollController appBarController;
  final int nextIndex;
  final Album album;

  const _PageViewAppBar({
    @required this.pageController,
    @required this.appBarController,
    @required this.nextIndex,
    @required this.album,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollableAppBarScrollBehavior(),
      child: SingleChildScrollView(
        controller: appBarController,
        scrollDirection: Axis.horizontal,
        child: ButtonBar(
          alignment: MainAxisAlignment.start,
          children: List<Widget>.generate(
            Albums.albums(context).length,
            (index) => _AlbumTitle(
              album: Albums.albums(context).elementAt(index),
              nextIndex: nextIndex,
              appBarController: appBarController,
              pageController: pageController,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:izoneapp/data/app_themes.dart';
import 'package:izoneapp/data/song.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SongLyricsPage extends StatefulWidget {
  const SongLyricsPage({Key key, this.song, this.coverArt}) : super(key: key);

  final Song song;
  final String coverArt;

  @override
  State<StatefulWidget> createState() => SongLyricsPageState();
}

class SongLyricsPageState extends State<SongLyricsPage>
    with TickerProviderStateMixin {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String> _theme;
  TabController _tabController;
  List<String> _currentLyrics;
  final _expandedHeight = 370.0;

  void _changeLyricsListener() {
    setState(() {
      _currentLyrics = widget.song.lyrics.values.toList()[_tabController.index];
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.song.lyrics.length, vsync: this);
    _tabController.addListener(_changeLyricsListener);
    _currentLyrics = widget.song.lyrics.values.toList()[0];
    _theme = _prefs.then((prefs) => prefs.getString('theme') ?? 'Auto');
  }

  @override
  void dispose() {
    _tabController.dispose();
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
            bottomNavigationBar: TabBar(
              controller: _tabController,
              indicatorColor: _themeData.accentColor,
              tabs: List<Tab>.generate(
                widget.song.lyrics.length,
                (index) => Tab(
                  text: widget.song.lyrics.keys.toList()[index].toUpperCase(),
                ),
              ),
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxHeight >= _expandedHeight) {
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        backgroundColor: _themeData.scaffoldBackgroundColor,
                        expandedHeight: _expandedHeight,
                        pinned: true,
                        flexibleSpace: _CoverArt(
                          coverArt: widget.coverArt,
                          themeData: _themeData,
                        ),
                        title: Text(widget.song.title),
                        actions: [
                          _DurationDisplay(
                            song: widget.song,
                            themeData: _themeData,
                          ),
                        ],
                      ),
                      _LyricsList(
                        currentLyrics: _currentLyrics,
                        themeData: _themeData,
                      ),
                    ],
                  );
                } else {
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        backgroundColor: _themeData.scaffoldBackgroundColor,
                        title: Text(widget.song.title),
                        actions: [
                          _DurationDisplay(
                            song: widget.song,
                            themeData: _themeData,
                          ),
                        ],
                      ),
                      _LyricsList(
                        currentLyrics: _currentLyrics,
                        themeData: _themeData,
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}

class _CoverArt extends StatelessWidget {
  final String coverArt;
  final ThemeData themeData;

  const _CoverArt({Key key, this.coverArt, this.themeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: coverArt,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(coverArt),
            colorFilter: ColorFilter.mode(
              themeData.primaryColor.withOpacity(0.3),
              BlendMode.dstATop,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _DurationDisplay extends StatelessWidget {
  final Song song;
  final ThemeData themeData;

  const _DurationDisplay({Key key, this.song, this.themeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _printDuration(Duration duration) {
      String twoDigitMinutes = duration.inMinutes.remainder(60).toString();
      String twoDigitSeconds =
          duration.inSeconds.remainder(60).toString().padLeft(2, "0");
      return "$twoDigitMinutes:$twoDigitSeconds";
    }

    return TextButton(
      onPressed: () {},
      child: Text(
        _printDuration(song.length),
        textScaleFactor: 1.5,
      ),
      style: TextButton.styleFrom(
        primary: themeData.textTheme.bodyText1.color,
      ),
    );
  }
}

class _LyricsList extends StatelessWidget {
  final List<String> currentLyrics;
  final ThemeData themeData;

  const _LyricsList({Key key, this.currentLyrics, this.themeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, _index) {
          bool isEmpty = currentLyrics[_index].isEmpty;
          bool isNewSection = currentLyrics[_index].startsWith('[') &&
              currentLyrics[_index].endsWith(']');
          return Card(
            clipBehavior: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
            ).clipBehavior,
            child: InkWell(
              onTap: () {},
              child: ListTile(
                title: HtmlWidget(
                  isNewSection
                      ? currentLyrics[_index]
                          .substring(1, currentLyrics[_index].length - 1)
                      : currentLyrics[_index],
                ),
                tileColor: isEmpty || isNewSection
                    ? themeData.canvasColor
                    : Colors.transparent,
              ),
            ),
            elevation: isEmpty || isNewSection ? 0 : 1,
          );
        },
        childCount: currentLyrics.length,
      ),
    );
  }
}

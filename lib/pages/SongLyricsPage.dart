import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:izoneapp/data/Song.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:countdown_flutter/utils.dart';

class SongLyricsPage extends StatefulWidget {
  const SongLyricsPage({Key key, this.song, this.coverArt, this.color})
      : super(key: key);

  final Song song;
  final String coverArt;
  final Color color;

  @override
  State<StatefulWidget> createState() => SongLyricsPageState();
}

class SongLyricsPageState extends State<SongLyricsPage>
    with TickerProviderStateMixin {
  TabController _tabController;
  List<String> _currentLyrics;
  bool _startCountdown;

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
    _startCountdown = false;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: false,
            floating: false,
            pinned: true,
            expandedHeight: 370,
            collapsedHeight: 60,
            backgroundColor: Theme.of(context).primaryColor,
            flexibleSpace: Hero(
              tag: widget.coverArt,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor.withOpacity(0.3),
                  BlendMode.dstATop,
                ),
                child: Image(
                  image: AssetImage(widget.coverArt),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(widget.song.title),
            actions: [
              FlatButton(
                onPressed: () => setState(() {
                  _startCountdown = !_startCountdown;
                }),
                child: _startCountdown
                    ? CountdownFormatted(
                        duration: widget.song.length,
                        onFinish: () => setState(() {
                          _startCountdown = !_startCountdown;
                        }),
                        builder: (BuildContext context, String remaining) {
                          return Text(
                            '-$remaining',
                            textScaleFactor: 1.5,
                          );
                        },
                      )
                    : Text(
                        formatByMinutes(widget.song.length),
                        textScaleFactor: 1.5,
                      ),
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: widget.color,
              tabs: List<Tab>.generate(
                widget.song.lyrics.length,
                (index) => Tab(
                  text: widget.song.lyrics.keys.toList()[index].toUpperCase(),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, _index) {
                bool isEmpty = _currentLyrics[_index].isEmpty;
                bool isNewSection = _currentLyrics[_index].startsWith('[') &&
                    _currentLyrics[_index].endsWith(']');
                return Card(
                  child: InkWell(
                    splashColor: widget.color.withOpacity(0.8),
                    onTap: () {},
                    child: ListTile(
                      title: HtmlWidget(
                        isNewSection
                            ? _currentLyrics[_index]
                                .substring(1, _currentLyrics[_index].length - 1)
                            : _currentLyrics[_index],
                      ),
                      tileColor: isEmpty || isNewSection
                          ? Theme.of(context).canvasColor
                          : Theme.of(context).cardColor,
                    ),
                  ),
                  elevation: isEmpty || isNewSection ? 0 : 1,
                );
              },
              childCount: _currentLyrics.length,
            ),
          ),
        ],
      ),
    );
  }
}

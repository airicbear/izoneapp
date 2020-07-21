import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:izoneapp/data/Song.dart';

class SongLyricsPage extends StatefulWidget {
  const SongLyricsPage({Key key, this.song, this.coverArt}) : super(key: key);

  final Song song;
  final String coverArt;

  @override
  State<StatefulWidget> createState() => SongLyricsPageState();
}

class SongLyricsPageState extends State<SongLyricsPage>
    with TickerProviderStateMixin {
  TabController _tabController;
  List<String> _currentLyrics;

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
            flexibleSpace: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor.withOpacity(0.3),
                BlendMode.dstATop,
              ),
              child: Image(
                image: AssetImage(widget.coverArt),
                fit: BoxFit.cover,
              ),
            ),
            title: Text(widget.song.title),
            bottom: TabBar(
              controller: _tabController,
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
              (context, _index) => Card(
                child: InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: HtmlWidget(
                      _currentLyrics[_index],
                    ),
                  ),
                ),
              ),
              childCount: _currentLyrics.length,
            ),
          ),
        ],
      ),
    );
  }
}

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

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.song.lyrics.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        child: TabBarView(
          controller: _tabController,
          children: List.generate(
            widget.song.lyrics.length,
            (index) => Container(
              child: ListView.builder(
                key: PageStorageKey(index),
                itemBuilder: (context, _index) => Card(
                  child: ListTile(
                    title: HtmlWidget(
                      widget.song.lyrics.values.toList()[index][_index],
                    ),
                  ),
                ),
                itemCount: widget.song.lyrics.values.toList()[index].length,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

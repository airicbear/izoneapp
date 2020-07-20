import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:izoneapp/data/Song.dart';

class SongLyricsPage extends StatefulWidget {
  const SongLyricsPage({Key key, this.song}) : super(key: key);

  final Song song;

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
        title: Text(widget.song.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: List<Tab>.generate(
            widget.song.lyrics.length,
            (index) => Tab(
              text: widget.song.lyrics == null
                  ? ''
                  : widget.song.lyrics.keys.toList()[index].toUpperCase(),
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

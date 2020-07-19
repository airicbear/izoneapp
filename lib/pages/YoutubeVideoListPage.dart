import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:izoneapp/data/YoutubeVideo.dart';
import 'package:izoneapp/pages/ViewYoutubeVideoPage.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeVideoListPage extends StatefulWidget {
  const YoutubeVideoListPage({Key key, this.pageController, this.videos})
      : super(key: key);

  final PageController pageController;
  final List<YoutubeVideo> videos;

  @override
  State<StatefulWidget> createState() => YoutubeVideoListPageState();
}

class YoutubeVideoListPageState extends State<YoutubeVideoListPage> {
  String _currentVideo = '';

  @override
  Widget build(BuildContext context) {
    Widget _videoPlaceholder(bool isSliver) {
      try {
        if ((Platform.isAndroid || Platform.isIOS) &&
            _currentVideo.isNotEmpty) {
          return HtmlWidget(
            '<iframe width="560" height="315" src="$_currentVideo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>',
            webView: true,
          );
        }
      } catch (e) {}
      return Container(
        padding: const EdgeInsets.all(64.0),
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text('Select a video to watch.'),
        ),
      );
    }

    Widget _videoList() {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Card(
              color: _currentVideo == widget.videos[index].youtubeUrl
                  ? Theme.of(context).backgroundColor
                  : Theme.of(context).cardColor,
              child: InkWell(
                onTap: () async {
                  try {
                    if (Platform.isAndroid || Platform.isIOS) {
                      setState(() {
                        _currentVideo = widget.videos[index].youtubeUrl;
                      });
                    }
                  } catch (e) {
                    if (await canLaunch(widget.videos[index].youtubeUrl)) {
                      launch(widget.videos[index].youtubeUrl);
                    } else {
                      throw 'Could not launch ${widget.videos[index].youtubeUrl}.';
                    }
                  }
                },
                splashFactory: InkRipple.splashFactory,
                child: ListTile(
                  leading: _currentVideo == widget.videos[index].youtubeUrl
                      ? IconButton(
                          icon: Icon(Icons.fullscreen),
                          onPressed: () {
                            setState(() async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewYoutubeVideoPage(
                                    youtubeUrl: widget.videos[index].youtubeUrl,
                                  ),
                                ),
                              );

                              await Future.delayed(Duration(seconds: 1));

                              SystemChrome.setEnabledSystemUIOverlays([]);
                            });
                          },
                        )
                      : FaIcon(FontAwesomeIcons.youtube),
                  title: Text('${widget.videos[index].title}'),
                  subtitle: Text(widget.videos[index].subtitle),
                  trailing: Text(MaterialLocalizations.of(context)
                      .formatCompactDate(
                          DateTime.parse(widget.videos[index].date))),
                ),
              ),
            );
          },
          childCount: widget.videos.length,
        ),
      );
    }

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 240,
                collapsedHeight: 240,
                floating: true,
                pinned: true,
                elevation: 0,
                flexibleSpace: _videoPlaceholder(true),
              ),
              _videoList(),
            ],
          );
        } else {
          return Container(
            child: Row(
              children: [
                Expanded(
                  child: _videoPlaceholder(false),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      _videoList(),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}

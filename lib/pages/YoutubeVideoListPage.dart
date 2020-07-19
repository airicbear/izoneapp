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

  void _toggleFullscreen(int index) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            _currentVideo = '';

            return ViewYoutubeVideoPage(
              youtubeUrl: widget.videos[index].youtubeUrl,
            );
          },
        ),
      );
    });
  }

  Widget _videoPlaceholder() {
    try {
      if ((Platform.isAndroid || Platform.isIOS) && _currentVideo.isNotEmpty) {
        return HtmlWidget(
          '<iframe width="560" height="315" src="$_currentVideo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>',
          webView: true,
        );
      }
    } catch (e) {}
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Text(
            'Select a video to watch.\n\nPress the Youtube icon to watch the video in the Youtube app. Press the fullscreen icon to show the video in fullscreen mode. Use your device\'s back button to exit fullscreen mode.\n\nAudio may persist if the video is not paused.\nRestricted videos are highlighted in red and will open the Youtube app by default.'),
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
                if (!widget.videos[index].restricted) {
                  try {
                    if ((Platform.isAndroid || Platform.isIOS)) {
                      setState(() {
                        _currentVideo = widget.videos[index].youtubeUrl;
                      });
                    }
                  } catch (e) {}
                } else if (await canLaunch(widget.videos[index].youtubeUrl)) {
                  launch(widget.videos[index].youtubeUrl);
                } else {
                  throw 'Could not launch ${widget.videos[index].youtubeUrl}.';
                }
              },
              splashFactory: InkRipple.splashFactory,
              child: ListTile(
                leading: _currentVideo == widget.videos[index].youtubeUrl
                    ? IconButton(
                        icon: FaIcon(FontAwesomeIcons.expand),
                        onPressed: () => _toggleFullscreen(index),
                      )
                    : IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.youtube,
                          color: widget.videos[index].restricted
                              ? Colors.red
                              : IconTheme.of(context).color,
                        ),
                        onPressed: () async {
                          if (await canLaunch(
                              widget.videos[index].youtubeUrl)) {
                            launch(widget.videos[index].youtubeUrl);
                          } else {
                            showDialog(
                              context: context,
                              child: Center(
                                child: Text(
                                    'Unable to open video "${widget.videos[index].youtubeUrl}"'),
                              ),
                            );
                          }
                        },
                      ),
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

  @override
  Widget build(BuildContext context) {
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
                flexibleSpace: _videoPlaceholder(),
              ),
              _videoList(),
            ],
          );
        } else {
          return Container(
            child: Row(
              children: [
                Expanded(
                  child: _videoPlaceholder(),
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

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:izoneapp/data/youtube_video.dart';
import 'package:izoneapp/pages/page_view_youtube_video.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeVideoListPage extends StatefulWidget {
  const YoutubeVideoListPage({Key key, this.videos}) : super(key: key);

  final List<YoutubeVideo> videos;

  @override
  State<StatefulWidget> createState() => YoutubeVideoListPageState();
}

class YoutubeVideoListPageState extends State<YoutubeVideoListPage> {
  String _currentVideoId = '';
  StreamController<String> _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = StreamController();
    _videoController.stream.listen((videoId) {
      setState(() {
        _currentVideoId = videoId;
      });
    });
  }

  @override
  void dispose() {
    _videoController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.values
            .elementAt(MediaQuery.of(context).orientation.index),
      ],
    );
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
                flexibleSpace: _VideoPlaceholder(videoId: _currentVideoId),
              ),
              _VideoList(
                videoId: _currentVideoId,
                videos: widget.videos,
                videoController: _videoController,
              ),
            ],
          );
        } else {
          return Container(
            child: Row(
              children: [
                Expanded(
                  child: _VideoPlaceholder(videoId: _currentVideoId),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      _VideoList(
                        videoId: _currentVideoId,
                        videos: widget.videos,
                        videoController: _videoController,
                      ),
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

class _VideoPlaceholder extends StatelessWidget {
  final String videoId;

  const _VideoPlaceholder({Key key, @required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      if ((Platform.isAndroid || Platform.isIOS) && videoId.isNotEmpty) {
        return HtmlWidget(
          '<iframe width="560" height="315" src="https://www.youtube.com/embed/$videoId" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>',
          webView: true,
        );
      }
    } catch (e) {}
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: Theme.of(context).primaryColor,
      child: Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
            children: [
              TextSpan(
                text: 'Select a video to watch.\n\n',
              ),
              TextSpan(
                text:
                    'Press the YouTube icon to watch the video in the YouTube app.\n\n',
              ),
              TextSpan(
                text:
                    'Videos highlighted in red will open the YouTube app due to content distribution restrictions.',
                style: TextStyle(
                  color: Color.lerp(
                    Colors.red,
                    Theme.of(context).textTheme.bodyText1.color,
                    0.5,
                  ),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VideoList extends StatefulWidget {
  final String videoId;
  final List<YoutubeVideo> videos;
  final StreamController<String> videoController;

  const _VideoList({
    Key key,
    @required this.videoId,
    @required this.videos,
    @required this.videoController,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VideoListState();
}

class _VideoListState extends State<_VideoList> {
  void _toggleFullscreen(int index) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            // Stop current video and switch to fullscreen
            widget.videoController.add('');

            return ViewYoutubeVideoPage(
              youtubeUrl: widget.videos.elementAt(index).url,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Card(
            clipBehavior: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
            ).clipBehavior,
            color: widget.videoId == widget.videos.elementAt(index).youtubeId
                ? Theme.of(context).backgroundColor
                : Theme.of(context).cardColor,
            child: InkWell(
              onTap: () async {
                if (!widget.videos.elementAt(index).restricted) {
                  try {
                    if ((Platform.isAndroid || Platform.isIOS)) {
                      widget.videoController
                          .add(widget.videos.elementAt(index).youtubeId);
                    } else if (await canLaunch(
                        widget.videos.elementAt(index).url)) {
                      launch(widget.videos.elementAt(index).url);
                    }
                  } catch (e) {
                    // Web
                    if (await canLaunch(widget.videos.elementAt(index).url)) {
                      launch(widget.videos.elementAt(index).url);
                    }
                  }
                  // Restricted
                } else if (await canLaunch(
                    widget.videos.elementAt(index).url)) {
                  launch(widget.videos.elementAt(index).url);
                } else {
                  throw 'Could not launch ${widget.videos.elementAt(index).url}.';
                }
              },
              splashFactory: InkRipple.splashFactory,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.videos.elementAt(index).thumbnail,
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).primaryColor.withOpacity(0.2),
                      BlendMode.dstATop,
                    ),
                  ),
                ),
                child: ListTile(
                  leading:
                      widget.videoId == widget.videos.elementAt(index).youtubeId
                          ? IconButton(
                              icon: const FaIcon(FontAwesomeIcons.expand),
                              onPressed: () => _toggleFullscreen(index),
                            )
                          : IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.youtube,
                                color: widget.videos.elementAt(index).restricted
                                    ? Colors.red
                                    : IconTheme.of(context).color,
                              ),
                              onPressed: () async {
                                if (await canLaunch(
                                    widget.videos.elementAt(index).url)) {
                                  launch(widget.videos.elementAt(index).url);
                                } else {
                                  throw 'Unable to open video "${widget.videos.elementAt(index).url}"';
                                }
                              },
                            ),
                  title: Text('${widget.videos.elementAt(index).title}'),
                  subtitle: Text(widget.videos.elementAt(index).subtitle),
                  trailing: Text(MaterialLocalizations.of(context)
                      .formatCompactDate(widget.videos.elementAt(index).date)),
                ),
              ),
            ),
          );
        },
        childCount: widget.videos.length,
      ),
    );
  }
}

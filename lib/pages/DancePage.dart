import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:izoneapp/pages/ViewYoutubeVideoPage.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoCard {
  final String title;
  final String subtitle;
  final String date;
  final String youtubeUrl;

  VideoCard({this.title, this.subtitle, this.date, this.youtubeUrl});
}

class DancePage extends StatefulWidget {
  const DancePage({Key key, this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  State<StatefulWidget> createState() => DancePageState();
}

class DancePageState extends State<DancePage> {
  String _currentVideo = '';

  @override
  Widget build(BuildContext context) {
    List<VideoCard> videos = [
      VideoCard(
        title: 'Secret Story of the Swan',
        subtitle: 'Dance practice',
        date: '2020-06-23',
        youtubeUrl: 'https://www.youtube.com/embed/1yQjsWhOuJI',
      ),
      VideoCard(
        title: 'Pretty',
        subtitle: 'Dance performance',
        date: '2020-06-19',
        youtubeUrl: 'https://www.youtube.com/embed/o3KQAKchUT8',
      ),
      VideoCard(
        title: 'Secret Story of the Swan',
        subtitle: 'STUDIO CHOOM performance',
        date: '2020-06-16',
        youtubeUrl: 'https://www.youtube.com/embed/fXSXUKXuqu8',
      ),
      VideoCard(
        title: 'SPACESHIP',
        subtitle: 'Choreography (To WIZ*ONE ver.)',
        date: '2020-03-06',
        youtubeUrl: 'https://www.youtube.com/embed/xaWafVLlIZs',
      ),
      VideoCard(
        title: 'SPACESHIP',
        date: '2020-03-06',
        subtitle: 'Choreography (Close up ver.)',
        youtubeUrl: 'https://www.youtube.com/embed/GsEo4_9mIMg',
      ),
      VideoCard(
        title: 'FIESTA',
        subtitle: 'Dance practice',
        date: '2020-02-28',
        youtubeUrl: 'https://www.youtube.com/embed/kCk8x__pXvE',
      ),
      VideoCard(
        title: 'Vampire',
        subtitle: 'Dance practice',
        date: '2019-09-25',
        youtubeUrl: 'https://www.youtube.com/embed/vr9h-epSUZQ',
      ),
      VideoCard(
        title: 'Up',
        subtitle: 'Dance practice',
        date: '2019-05-17',
        youtubeUrl: 'https://www.youtube.com/embed/IsUVaQOj0fs',
      ),
      VideoCard(
        title: 'Violeta',
        subtitle: 'Dance practice (Close up ver.)',
        date: '2019-04-25',
        youtubeUrl: 'https://www.youtube.com/embed/wnTWDHiBRpQ',
      ),
      VideoCard(
        title: 'Violeta',
        subtitle: 'Dance practice',
        date: '2019-04-07',
        youtubeUrl: 'https://www.youtube.com/embed/Z8_aiEDLoY4',
      ),
      VideoCard(
        title: 'La Vie en Rose',
        subtitle: '2018 MAMA ver.',
        date: '2019-01-04',
        youtubeUrl: 'https://www.youtube.com/embed/xhdW-GceM6g',
      ),
      VideoCard(
        title: 'O\' My!',
        subtitle: 'Dance practice',
        date: '2018-11-07',
        youtubeUrl: 'https://www.youtube.com/embed/56XuG4JrByk',
      ),
      VideoCard(
        title: 'La Vie en Rose',
        subtitle: 'Dance practice',
        date: '2018-11-03',
        youtubeUrl: 'https://www.youtube.com/embed/hsMaygLZ3G4',
      ),
      VideoCard(
        title: 'Rumor',
        subtitle: 'SHOW-CON spoiler',
        date: '2018-10-19',
        youtubeUrl: 'https://www.youtube.com/embed/h49TeJo4mK0',
      ),
      VideoCard(
        title: 'PICK ME',
        subtitle: 'Dance practice (12 ver.)',
        date: '2018-10-04',
        youtubeUrl: 'https://www.youtube.com/embed/YGiLQUc8x5E',
      ),
    ];

    Widget _videoPlaceholder() {
      try {
        if (Platform.isAndroid || Platform.isIOS) {
          return SliverAppBar(
            expandedHeight: 240,
            collapsedHeight: 240,
            floating: true,
            pinned: true,
            elevation: 0,
            flexibleSpace: _currentVideo.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(64.0),
                    child: Center(
                      child: Text('Select a video to watch.'),
                    ),
                  )
                : HtmlWidget(
                    '<iframe width="560" height="315" src="$_currentVideo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>',
                    webView: true,
                  ),
          );
        }
      } catch (e) {
        return SliverAppBar();
      }
      return SliverAppBar();
    }

    Widget _videoList() {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Card(
              color: _currentVideo == videos[index].youtubeUrl
                  ? Theme.of(context).backgroundColor
                  : Theme.of(context).cardColor,
              child: InkWell(
                onTap: () async {
                  try {
                    if (Platform.isAndroid || Platform.isIOS) {
                      setState(() {
                        _currentVideo = videos[index].youtubeUrl;
                      });
                    }
                  } catch (e) {
                    if (await canLaunch(videos[index].youtubeUrl)) {
                      launch(videos[index].youtubeUrl);
                    } else {
                      throw 'Could not launch ${videos[index].youtubeUrl}.';
                    }
                  }
                },
                splashFactory: InkRipple.splashFactory,
                child: ListTile(
                  leading: _currentVideo == videos[index].youtubeUrl
                      ? IconButton(
                          icon: Icon(Icons.fullscreen),
                          onPressed: () {
                            setState(() async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewYoutubeVideoPage(
                                    youtubeUrl: videos[index].youtubeUrl,
                                  ),
                                ),
                              );

                              await Future.delayed(Duration(seconds: 1));

                              SystemChrome.setEnabledSystemUIOverlays([]);
                            });
                          },
                        )
                      : FaIcon(FontAwesomeIcons.youtube),
                  title: Text('${videos[index].title}'),
                  subtitle: Text(videos[index].subtitle),
                  trailing: Text(MaterialLocalizations.of(context)
                      .formatCompactDate(DateTime.parse(videos[index].date))),
                ),
              ),
            );
          },
          childCount: videos.length,
        ),
      );
    }

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return CustomScrollView(
            slivers: [
              _videoPlaceholder(),
              _videoList(),
            ],
          );
        } else {
          return Container(
            child: CustomScrollView(slivers: [
              _videoList(),
            ]),
          );
        }
      }),
    );
  }
}

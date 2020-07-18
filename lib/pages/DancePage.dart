import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoCard {
  final String title;
  final String subtitle;
  final String youtubeUrl;
  final String vliveUrl;

  VideoCard({this.title, this.subtitle, this.youtubeUrl, this.vliveUrl});
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
        youtubeUrl: 'https://www.youtube.com/embed/1yQjsWhOuJI',
        vliveUrl: 'https://www.vlive.tv/embed/199011',
      ),
      VideoCard(
        title: 'FIESTA',
        subtitle: 'Dance practice',
        youtubeUrl: 'https://www.youtube.com/embed/kCk8x__pXvE',
        vliveUrl: 'https://www.vlive.tv/embed/177616',
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            collapsedHeight: 200,
            flexibleSpace: _currentVideo.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(64.0),
                    child: Center(
                      child: Text(
                          'Select a video to watch by clicking on its V Live or YouTube button.'),
                    ),
                  )
                : HtmlWidget(
                    "<iframe src='$_currentVideo' frameborder='no' scrolling='no' marginwidth='0' marginheight='0' WIDTH='544' HEIGHT='306' allowfullscreen></iframe>",
                    webView: true,
                  ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  child: Stack(
                    children: [
                      ListTile(
                        title: Text('${videos[index].title}'),
                        subtitle: videos[index].subtitle == null
                            ? null
                            : Text(videos[index].subtitle),
                      ),
                      ButtonBar(
                        children: [
                          IconButton(
                            icon:
                                ImageIcon(AssetImage('assets/icons/vlive.png')),
                            onPressed: () => setState(() {
                              _currentVideo = videos[index].vliveUrl;
                            }),
                          ),
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.youtube),
                            onPressed: () => setState(() {
                              _currentVideo = videos[index].youtubeUrl;
                            }),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              childCount: videos.length,
            ),
          ),
        ],
      ),
    );
  }
}

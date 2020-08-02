import 'package:flutter/material.dart';
import 'package:izoneapp/data/youtube_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoListPage extends StatefulWidget {
  const YoutubeVideoListPage({Key key, this.videos}) : super(key: key);

  final List<YoutubeVideo> videos;

  @override
  State<StatefulWidget> createState() => YoutubeVideoListPageState();
}

class YoutubeVideoListPageState extends State<YoutubeVideoListPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return CustomScrollView(
            slivers: [
              _VideoList(
                videos: widget.videos,
              ),
            ],
          );
        } else {
          return Container(
            child: Row(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      _VideoList(
                        videos: widget.videos,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class _VideoList extends StatelessWidget {
  final List<YoutubeVideo> videos;

  const _VideoList({
    Key key,
    @required this.videos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            height: 230.0,
            child: Card(
              clipBehavior: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
              ).clipBehavior,
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: videos.elementAt(index).youtubeId,
                      ),
                    ),
                    builder: (context, player) {
                      return player;
                    },
                  ),
                )),
                splashFactory: InkRipple.splashFactory,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        videos.elementAt(index).thumbnail,
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).primaryColor.withOpacity(0.2),
                        BlendMode.dstATop,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text('${videos.elementAt(index).title}'),
                    subtitle: Text(videos.elementAt(index).subtitle),
                    trailing: Text(
                      MaterialLocalizations.of(context)
                          .formatCompactDate(videos.elementAt(index).date),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        childCount: videos.length,
      ),
    );
  }
}

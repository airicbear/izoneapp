import 'package:flutter/widgets.dart';
import 'package:izoneapp/data/YoutubeVideo.dart';
import 'package:izoneapp/generated/l10n.dart';

class MusicVideos {
  static List<YoutubeVideo> videos(BuildContext context) {
    return [
      YoutubeVideo(
        title: S.of(context).secretStoryOfTheSwan,
        subtitle: 'Music video',
        date: '2020-06-15',
        youtubeUrl: 'https://www.youtube.com/embed/nnVjsos40qk',
      ),
    ];
  }
}

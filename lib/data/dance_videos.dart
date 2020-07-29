import 'package:flutter/widgets.dart';
import 'package:izoneapp/data/youtube_video.dart';
import 'package:izoneapp/generated/l10n.dart';

class DanceVideos {
  static List<YoutubeVideo> videos(BuildContext context) {
    return [
      YoutubeVideo(
        title: S.of(context).secretStoryOfTheSwan,
        subtitle: 'Dance practice',
        date: '2020-06-23',
        youtubeId: '1yQjsWhOuJI',
      ),
      YoutubeVideo(
        title: 'Pretty',
        subtitle: 'Dance performance',
        date: '2020-06-19',
        youtubeId: 'o3KQAKchUT8',
      ),
      YoutubeVideo(
        title: S.of(context).secretStoryOfTheSwan,
        subtitle: 'STUDIO CHOOM performance',
        date: '2020-06-16',
        youtubeId: 'fXSXUKXuqu8',
      ),
      YoutubeVideo(
        title: 'SPACESHIP',
        subtitle: 'Choreography (To WIZ*ONE ver.)',
        date: '2020-03-06',
        youtubeId: 'xaWafVLlIZs',
      ),
      YoutubeVideo(
        title: 'SPACESHIP',
        date: '2020-03-06',
        subtitle: 'Choreography (Close up ver.)',
        youtubeId: 'GsEo4_9mIMg',
      ),
      YoutubeVideo(
        title: 'FIESTA',
        subtitle: 'Dance practice',
        date: '2020-02-28',
        youtubeId: 'kCk8x__pXvE',
      ),
      YoutubeVideo(
        title: 'Vampire',
        subtitle: 'Dance practice',
        date: '2019-09-25',
        youtubeId: 'vr9h-epSUZQ',
      ),
      YoutubeVideo(
        title: S.of(context).up,
        subtitle: 'Dance practice',
        date: '2019-05-17',
        youtubeId: 'IsUVaQOj0fs',
      ),
      YoutubeVideo(
        title: S.of(context).violeta,
        subtitle: 'Dance practice (Close up ver.)',
        date: '2019-04-25',
        youtubeId: 'wnTWDHiBRpQ',
      ),
      YoutubeVideo(
        title: S.of(context).violeta,
        subtitle: 'Dance practice',
        date: '2019-04-07',
        youtubeId: 'Z8_aiEDLoY4',
      ),
      YoutubeVideo(
        title: S.of(context).laVieEnRose,
        subtitle: '2018 MAMA ver.',
        date: '2019-01-04',
        youtubeId: 'xhdW-GceM6g',
      ),
      YoutubeVideo(
        title: 'O\' My!',
        subtitle: 'Dance practice',
        date: '2018-11-07',
        youtubeId: '56XuG4JrByk',
      ),
      YoutubeVideo(
        title: S.of(context).laVieEnRose,
        subtitle: 'Dance practice',
        date: '2018-11-03',
        youtubeId: 'hsMaygLZ3G4',
      ),
      YoutubeVideo(
        title: 'Rumor',
        subtitle: 'SHOW-CON spoiler',
        date: '2018-10-19',
        youtubeId: 'h49TeJo4mK0',
      ),
      YoutubeVideo(
        title: S.of(context).pickMe,
        subtitle: 'Dance practice (12 ver.)',
        date: '2018-10-04',
        youtubeId: 'YGiLQUc8x5E',
      ),
    ];
  }
}

import 'package:flutter/widgets.dart';
import 'package:izoneapp/data/YoutubeVideo.dart';

class DanceVideos {
  static List<YoutubeVideo> videos(BuildContext context) {
    return [
      YoutubeVideo(
        title: 'Secret Story of the Swan',
        subtitle: 'Dance practice',
        date: '2020-06-23',
        youtubeUrl: 'https://www.youtube.com/embed/1yQjsWhOuJI',
      ),
      YoutubeVideo(
        title: 'Pretty',
        subtitle: 'Dance performance',
        date: '2020-06-19',
        youtubeUrl: 'https://www.youtube.com/embed/o3KQAKchUT8',
      ),
      YoutubeVideo(
        title: 'Secret Story of the Swan',
        subtitle: 'STUDIO CHOOM performance',
        date: '2020-06-16',
        youtubeUrl: 'https://www.youtube.com/embed/fXSXUKXuqu8',
      ),
      YoutubeVideo(
        title: 'SPACESHIP',
        subtitle: 'Choreography (To WIZ*ONE ver.)',
        date: '2020-03-06',
        youtubeUrl: 'https://www.youtube.com/embed/xaWafVLlIZs',
      ),
      YoutubeVideo(
        title: 'SPACESHIP',
        date: '2020-03-06',
        subtitle: 'Choreography (Close up ver.)',
        youtubeUrl: 'https://www.youtube.com/embed/GsEo4_9mIMg',
      ),
      YoutubeVideo(
        title: 'FIESTA',
        subtitle: 'Dance practice',
        date: '2020-02-28',
        youtubeUrl: 'https://www.youtube.com/embed/kCk8x__pXvE',
      ),
      YoutubeVideo(
        title: 'Vampire',
        subtitle: 'Dance practice',
        date: '2019-09-25',
        youtubeUrl: 'https://www.youtube.com/embed/vr9h-epSUZQ',
      ),
      YoutubeVideo(
        title: 'Up',
        subtitle: 'Dance practice',
        date: '2019-05-17',
        youtubeUrl: 'https://www.youtube.com/embed/IsUVaQOj0fs',
      ),
      YoutubeVideo(
        title: 'Violeta',
        subtitle: 'Dance practice (Close up ver.)',
        date: '2019-04-25',
        youtubeUrl: 'https://www.youtube.com/embed/wnTWDHiBRpQ',
      ),
      YoutubeVideo(
        title: 'Violeta',
        subtitle: 'Dance practice',
        date: '2019-04-07',
        youtubeUrl: 'https://www.youtube.com/embed/Z8_aiEDLoY4',
      ),
      YoutubeVideo(
        title: 'La Vie en Rose',
        subtitle: '2018 MAMA ver.',
        date: '2019-01-04',
        youtubeUrl: 'https://www.youtube.com/embed/xhdW-GceM6g',
      ),
      YoutubeVideo(
        title: 'O\' My!',
        subtitle: 'Dance practice',
        date: '2018-11-07',
        youtubeUrl: 'https://www.youtube.com/embed/56XuG4JrByk',
      ),
      YoutubeVideo(
        title: 'La Vie en Rose',
        subtitle: 'Dance practice',
        date: '2018-11-03',
        youtubeUrl: 'https://www.youtube.com/embed/hsMaygLZ3G4',
      ),
      YoutubeVideo(
        title: 'Rumor',
        subtitle: 'SHOW-CON spoiler',
        date: '2018-10-19',
        youtubeUrl: 'https://www.youtube.com/embed/h49TeJo4mK0',
      ),
      YoutubeVideo(
        title: 'PICK ME',
        subtitle: 'Dance practice (12 ver.)',
        date: '2018-10-04',
        youtubeUrl: 'https://www.youtube.com/embed/YGiLQUc8x5E',
      ),
    ];
  }
}

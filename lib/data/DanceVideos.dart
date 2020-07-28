import 'package:flutter/widgets.dart';
import 'package:izoneapp/data/YoutubeVideo.dart';
import 'package:izoneapp/data/lyrics/30-girls-6-concepts/Album30Girls6Concepts.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/album_bloom_iz.dart';
import 'package:izoneapp/data/lyrics/color-iz/AlbumColorIz.dart';
import 'package:izoneapp/data/lyrics/heart-iz/AlbumHeartIz.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/AlbumOneiricDiary.dart';
import 'package:izoneapp/data/lyrics/pick-me/AlbumPickMe.dart';
import 'package:izoneapp/data/lyrics/vampire/AlbumVampire.dart';
import 'package:izoneapp/generated/l10n.dart';

class DanceVideos {
  static List<YoutubeVideo> videos(BuildContext context) {
    return [
      YoutubeVideo(
        title: S.of(context).secretStoryOfTheSwan,
        subtitle: 'Dance practice',
        date: '2020-06-23',
        youtubeUrl: 'https://www.youtube.com/embed/1yQjsWhOuJI',
        imagePath: AlbumOneiricDiary(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: 'Pretty',
        subtitle: 'Dance performance',
        date: '2020-06-19',
        youtubeUrl: 'https://www.youtube.com/embed/o3KQAKchUT8',
        imagePath: AlbumOneiricDiary(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: 'Secret Story of the Swan',
        subtitle: 'STUDIO CHOOM performance',
        date: '2020-06-16',
        youtubeUrl: 'https://www.youtube.com/embed/fXSXUKXuqu8',
        imagePath: AlbumOneiricDiary(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: 'SPACESHIP',
        subtitle: 'Choreography (To WIZ*ONE ver.)',
        date: '2020-03-06',
        youtubeUrl: 'https://www.youtube.com/embed/xaWafVLlIZs',
        imagePath: AlbumBloomIz(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: 'SPACESHIP',
        date: '2020-03-06',
        subtitle: 'Choreography (Close up ver.)',
        youtubeUrl: 'https://www.youtube.com/embed/GsEo4_9mIMg',
        imagePath: AlbumBloomIz(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: 'FIESTA',
        subtitle: 'Dance practice',
        date: '2020-02-28',
        youtubeUrl: 'https://www.youtube.com/embed/kCk8x__pXvE',
        imagePath: AlbumBloomIz(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: 'Vampire',
        subtitle: 'Dance practice',
        date: '2019-09-25',
        youtubeUrl: 'https://www.youtube.com/embed/vr9h-epSUZQ',
        imagePath: AlbumVampire(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: 'Up',
        subtitle: 'Dance practice',
        date: '2019-05-17',
        youtubeUrl: 'https://www.youtube.com/embed/IsUVaQOj0fs',
        imagePath: AlbumHeartIz(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: S.of(context).violeta,
        subtitle: 'Dance practice (Close up ver.)',
        date: '2019-04-25',
        youtubeUrl: 'https://www.youtube.com/embed/wnTWDHiBRpQ',
        imagePath: AlbumHeartIz(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: S.of(context).violeta,
        subtitle: 'Dance practice',
        date: '2019-04-07',
        youtubeUrl: 'https://www.youtube.com/embed/Z8_aiEDLoY4',
        imagePath: AlbumHeartIz(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: S.of(context).laVieEnRose,
        subtitle: '2018 MAMA ver.',
        date: '2019-01-04',
        youtubeUrl: 'https://www.youtube.com/embed/xhdW-GceM6g',
        imagePath: AlbumColorIz(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: 'O\' My!',
        subtitle: 'Dance practice',
        date: '2018-11-07',
        youtubeUrl: 'https://www.youtube.com/embed/56XuG4JrByk',
        imagePath: AlbumColorIz(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: S.of(context).laVieEnRose,
        subtitle: 'Dance practice',
        date: '2018-11-03',
        youtubeUrl: 'https://www.youtube.com/embed/hsMaygLZ3G4',
        imagePath: AlbumColorIz(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: 'Rumor',
        subtitle: 'SHOW-CON spoiler',
        date: '2018-10-19',
        youtubeUrl: 'https://www.youtube.com/embed/h49TeJo4mK0',
        imagePath: Album30Girls6Concepts(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: 'PICK ME',
        subtitle: 'Dance practice (12 ver.)',
        date: '2018-10-04',
        youtubeUrl: 'https://www.youtube.com/embed/YGiLQUc8x5E',
        imagePath: AlbumPickMe(context).getCoverArtPath,
      ),
    ];
  }
}

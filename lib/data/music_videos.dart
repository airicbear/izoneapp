import 'package:flutter/widgets.dart';
import 'package:izoneapp/data/youtube_video.dart';
import 'package:izoneapp/generated/l10n.dart';

class MusicVideos {
  static List<YoutubeVideo> videos(BuildContext context) {
    return [
      YoutubeVideo(
        title: 'Pretty',
        subtitle: 'Dance performance',
        date: '2020-06-19',
        youtubeId: 'o3KQAKchUT8',
      ),
      YoutubeVideo(
        title: S.of(context).secretStoryOfTheSwan,
        subtitle: 'Music video',
        date: '2020-06-15',
        youtubeId: 'nnVjsos40qk',
      ),
      YoutubeVideo(
        title: 'FIESTA',
        subtitle: 'Music video',
        date: '2020-02-17',
        youtubeId: 'eDEFolvLn0A',
        restricted: true,
      ),
      YoutubeVideo(
        title: 'Vampire',
        subtitle: 'Music video',
        date: '2019-09-12',
        youtubeId: 'nRYCLOTRAK4',
      ),
      YoutubeVideo(
        title: 'Airplane',
        subtitle: 'Special film (in NY)',
        date: '2019-08-31',
        youtubeId: 'bRs9WRurVCQ',
      ),
      YoutubeVideo(
        title: 'Buenos Aires',
        subtitle: 'Music video',
        date: '2019-06-12',
        youtubeId: 'M46FRJsB0Qw',
      ),
      YoutubeVideo(
        title: S.of(context).violeta,
        subtitle: 'Music video',
        date: '2019-04-01',
        youtubeId: '6eEZ7DJMzuk',
        restricted: true,
      ),
      YoutubeVideo(
        title: 'Gokigen Sayonara',
        subtitle: 'Music video (Japanese ver.)',
        date: '2019-02-06',
        youtubeId: '5DYxn1a34dU',
      ),
      YoutubeVideo(
        title: 'Suki to Iwasetai',
        subtitle: 'Music video',
        date: '2019-01-24',
        youtubeId: 'dLymsYC7Kmo',
      ),
      YoutubeVideo(
        title: S.of(context).laVieEnRose,
        subtitle: 'Music video (Performance ver.)',
        date: '2018-11-08',
        youtubeId: 'E-T1gEeUqwA',
        restricted: true,
      ),
      YoutubeVideo(
        title: S.of(context).laVieEnRose,
        subtitle: 'Music video',
        date: '2018-10-29',
        youtubeId: 'WZwr2a_lFWY',
        restricted: true,
      ),
    ];
  }
}

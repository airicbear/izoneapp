import 'package:flutter/material.dart';
import 'package:izoneapp/data/media_content.dart';
import 'package:izoneapp/data/youtube_video.dart';
import 'package:izoneapp/generated/l10n.dart';

class YoutubeVideos implements MediaContent<YoutubeVideo> {
  static List<YoutubeVideo> _videos;
  final bool sorted;

  @override
  List<YoutubeVideo> tagged(List<String> tags) {
    return _videos.where((video) {
      for (final tag in tags) {
        if (!video.tags.contains(tag)) {
          return false;
        }
      }
      return true;
    }).toList();
  }

  YoutubeVideos(BuildContext context, {this.sorted = true}) {
    _videos = [
      YoutubeVideo(
        title: 'ZERO:ATTITUDE',
        subtitle: 'Music video',
        date: DateTime(2021, 02, 15),
        youtubeId: 'WGVpBTw3PYo',
        tags: ['mv'],
      ),
      YoutubeVideo(
        title: 'Sequence',
        subtitle: 'Dance practice',
        date: DateTime(2020, 12, 18),
        youtubeId: '49XOs_pibB4',
        tags: ['dance'],
      ),
      YoutubeVideo(
        title: 'Panorama',
        subtitle: 'Dance practice',
        date: DateTime(2020, 12, 16),
        youtubeId: 'aDdgU2gPtQQ',
        tags: ['dance'],
      ),
      YoutubeVideo(
        title: 'Panorama',
        subtitle: 'Music video (Performance ver.)',
        date: DateTime(2020, 12, 14),
        youtubeId: '64hndxW-pJw',
        tags: ['mv'],
      ),
      YoutubeVideo(
        title: 'Panorama',
        subtitle: 'Music video',
        date: DateTime(2020, 12, 7),
        youtubeId: 'G8GaQdW2wHc',
        tags: ['mv'],
      ),
      YoutubeVideo(
        title: 'Beware',
        subtitle: 'Music video',
        date: DateTime(2020, 10, 06),
        youtubeId: 'QqsvrV1_XEA',
        tags: ['mv'],
      ),
      YoutubeVideo(
        title: 'Pretty',
        subtitle: 'Dance performance',
        date: DateTime(2020, 06, 19),
        youtubeId: 'o3KQAKchUT8',
        tags: ['mv', 'dance'],
      ),
      YoutubeVideo(
        title: S.of(context).secretStoryOfTheSwan,
        subtitle: 'Music video',
        date: DateTime(2020, 06, 15),
        youtubeId: 'nnVjsos40qk',
        tags: ['mv'],
      ),
      YoutubeVideo(
        title: 'FIESTA',
        subtitle: 'Music video',
        date: DateTime(2020, 02, 17),
        youtubeId: 'eDEFolvLn0A',
        tags: ['mv'],
        restricted: true,
      ),
      YoutubeVideo(
        title: 'Vampire',
        subtitle: 'Music video',
        date: DateTime(2019, 09, 12),
        youtubeId: 'nRYCLOTRAK4',
        tags: ['mv'],
      ),
      YoutubeVideo(
        title: 'Airplane',
        subtitle: 'Special film (in NY)',
        date: DateTime(2019, 08, 31),
        youtubeId: 'bRs9WRurVCQ',
        tags: ['mv'],
      ),
      YoutubeVideo(
        title: 'Buenos Aires',
        subtitle: 'Music video',
        date: DateTime(2019, 06, 12),
        youtubeId: 'M46FRJsB0Qw',
        tags: ['mv'],
      ),
      YoutubeVideo(
        title: S.of(context).violeta,
        subtitle: 'Music video',
        date: DateTime(2019, 04, 01),
        youtubeId: '6eEZ7DJMzuk',
        tags: ['mv'],
        restricted: true,
      ),
      YoutubeVideo(
        title: 'Gokigen Sayonara',
        subtitle: 'Music video (Japanese ver.)',
        date: DateTime(2019, 02, 06),
        youtubeId: '5DYxn1a34dU',
        tags: ['mv'],
      ),
      YoutubeVideo(
        title: 'Suki to Iwasetai',
        subtitle: 'Music video',
        date: DateTime(2019, 01, 24),
        youtubeId: 'dLymsYC7Kmo',
        tags: ['mv'],
      ),
      YoutubeVideo(
        title: S.of(context).laVieEnRose,
        subtitle: 'Music video (Performance ver.)',
        date: DateTime(2018, 11, 08),
        youtubeId: 'E-T1gEeUqwA',
        tags: ['mv'],
        restricted: true,
      ),
      YoutubeVideo(
        title: S.of(context).laVieEnRose,
        subtitle: 'Music video',
        date: DateTime(2018, 10, 29),
        youtubeId: 'WZwr2a_lFWY',
        tags: ['mv'],
        restricted: true,
      ),
      YoutubeVideo(
        title: S.of(context).secretStoryOfTheSwan,
        subtitle: 'Dance practice',
        date: DateTime(2020, 06, 23),
        youtubeId: '1yQjsWhOuJI',
        tags: ['dance'],
      ),
      YoutubeVideo(
        title: S.of(context).secretStoryOfTheSwan,
        subtitle: 'STUDIO CHOOM performance',
        date: DateTime(2020, 06, 16),
        youtubeId: 'fXSXUKXuqu8',
        tags: ['dance'],
      ),
      YoutubeVideo(
        title: 'SPACESHIP',
        subtitle: 'Choreography (To WIZ*ONE ver.)',
        date: DateTime(2020, 03, 06),
        youtubeId: 'xaWafVLlIZs',
        tags: ['dance'],
      ),
      YoutubeVideo(
        title: 'SPACESHIP',
        date: DateTime(2020, 03, 06),
        subtitle: 'Choreography (Close up ver.)',
        youtubeId: 'GsEo4_9mIMg',
        tags: ['dance'],
      ),
      YoutubeVideo(
        title: 'FIESTA',
        subtitle: 'Dance practice',
        date: DateTime(2020, 02, 28),
        youtubeId: 'kCk8x__pXvE',
        tags: ['dance'],
      ),
      YoutubeVideo(
        title: 'Vampire',
        subtitle: 'Dance practice',
        date: DateTime(2019, 09, 25),
        youtubeId: 'vr9h-epSUZQ',
        tags: ['dance'],
      ),
      YoutubeVideo(
        title: S.of(context).up,
        subtitle: 'Dance practice',
        date: DateTime(2019, 05, 17),
        youtubeId: 'IsUVaQOj0fs',
        tags: ['dance'],
      ),
      YoutubeVideo(
        title: S.of(context).violeta,
        subtitle: 'Dance practice (Close up ver.)',
        date: DateTime(2019, 04, 25),
        youtubeId: 'wnTWDHiBRpQ',
        tags: ['dance'],
      ),
      YoutubeVideo(
        title: S.of(context).violeta,
        subtitle: 'Dance practice',
        date: DateTime(2019, 04, 07),
        youtubeId: 'Z8_aiEDLoY4',
        tags: ['dance'],
      ),
      YoutubeVideo(
        title: S.of(context).laVieEnRose,
        subtitle: '2018 MAMA ver.',
        date: DateTime(2019, 01, 04),
        youtubeId: 'xhdW-GceM6g',
        tags: ['dance'],
      ),
      YoutubeVideo(
        title: 'O\' My!',
        subtitle: 'Dance practice',
        date: DateTime(2018, 11, 07),
        youtubeId: '56XuG4JrByk',
        tags: ['dance'],
      ),
      YoutubeVideo(
        title: S.of(context).laVieEnRose,
        subtitle: 'Dance practice',
        date: DateTime(2018, 11, 03),
        youtubeId: 'hsMaygLZ3G4',
        tags: ['dance'],
      ),
      YoutubeVideo(
        title: 'Rumor',
        subtitle: 'SHOW-CON spoiler',
        date: DateTime(2018, 10, 19),
        youtubeId: 'h49TeJo4mK0',
        tags: ['dance'],
      ),
      YoutubeVideo(
        title: S.of(context).pickMe,
        subtitle: 'Dance practice (12 ver.)',
        date: DateTime(2018, 10, 04),
        youtubeId: 'YGiLQUc8x5E',
        tags: ['dance'],
      ),
    ];
    if (sorted) {
      _videos.sort((a, b) => b.date.compareTo(a.date));
    }
  }
}

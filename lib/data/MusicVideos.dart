import 'package:flutter/widgets.dart';
import 'package:izoneapp/data/YoutubeVideo.dart';
import 'package:izoneapp/data/lyrics/bloom-iz/AlbumBloomIz.dart';
import 'package:izoneapp/data/lyrics/buenos-aires/AlbumBuenosAires.dart';
import 'package:izoneapp/data/lyrics/color-iz/AlbumColorIz.dart';
import 'package:izoneapp/data/lyrics/heart-iz/AlbumHeartIz.dart';
import 'package:izoneapp/data/lyrics/oneiric-diary/AlbumOneiricDiary.dart';
import 'package:izoneapp/data/lyrics/suki-to-iwasetai/AlbumSukiToIwasetai.dart';
import 'package:izoneapp/data/lyrics/vampire/AlbumVampire.dart';
import 'package:izoneapp/generated/l10n.dart';

class MusicVideos {
  static List<YoutubeVideo> videos(BuildContext context) {
    return [
      YoutubeVideo(
        title: 'Pretty',
        subtitle: 'Dance performance',
        date: '2020-06-19',
        youtubeUrl: 'https://www.youtube.com/embed/o3KQAKchUT8',
        imagePath: AlbumOneiricDiary(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: S.of(context).secretStoryOfTheSwan,
        subtitle: 'Music video',
        date: '2020-06-15',
        youtubeUrl: 'https://www.youtube.com/embed/nnVjsos40qk',
        imagePath: AlbumOneiricDiary(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: 'FIESTA',
        subtitle: 'Music video',
        date: '2020-02-17',
        youtubeUrl: 'https://www.youtube.com/embed/eDEFolvLn0A',
        imagePath: AlbumBloomIz(context).getCoverArtPath,
        restricted: true,
      ),
      YoutubeVideo(
        title: 'Vampire',
        subtitle: 'Music video',
        date: '2019-09-12',
        youtubeUrl: 'https://www.youtube.com/embed/nRYCLOTRAK4',
        imagePath: AlbumVampire(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: 'Airplane',
        subtitle: 'Special film (in NY)',
        date: '2019-08-31',
        youtubeUrl: 'https://www.youtube.com/embed/bRs9WRurVCQ',
        imagePath: AlbumHeartIz(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: 'Buenos Aires',
        subtitle: 'Music video',
        date: '2019-06-12',
        youtubeUrl: 'https://www.youtube.com/embed/M46FRJsB0Qw',
        imagePath: AlbumBuenosAires(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: S.of(context).violeta,
        subtitle: 'Music video',
        date: '2019-04-01',
        youtubeUrl: 'https://www.youtube.com/embed/6eEZ7DJMzuk',
        restricted: true,
        imagePath: AlbumHeartIz(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: 'Gokigen Sayonara',
        subtitle: 'Music video (Japanese ver.)',
        date: '2019-02-06',
        youtubeUrl: 'https://www.youtube.com/embed/5DYxn1a34dU',
        imagePath: AlbumHeartIz(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: 'Suki to Iwasetai',
        subtitle: 'Music video',
        date: '2019-01-24',
        youtubeUrl: 'https://www.youtube.com/embed/dLymsYC7Kmo',
        imagePath: AlbumSukiToIwasetai(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: S.of(context).laVieEnRose,
        subtitle: 'Music video (Performance ver.)',
        date: '2018-11-08',
        youtubeUrl: 'https://www.youtube.com/embed/E-T1gEeUqwA',
        restricted: true,
        imagePath: AlbumColorIz(context).getCoverArtPath,
      ),
      YoutubeVideo(
        title: S.of(context).laVieEnRose,
        subtitle: 'Music video',
        date: '2018-10-29',
        youtubeUrl: 'https://www.youtube.com/embed/WZwr2a_lFWY',
        restricted: true,
        imagePath: AlbumColorIz(context).getCoverArtPath,
      ),
    ];
  }
}

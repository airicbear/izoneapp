import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MediaLinkInfo {
  final String url;
  final Widget icon;
  final String description;

  MediaLinkInfo({this.url, this.icon, this.description});
}

class MediaLinks {
  static List<MediaLinkInfo> links = [
    MediaLinkInfo(
      url: 'https://www.facebook.com/official.izone',
      icon: FaIcon(FontAwesomeIcons.facebook),
      description: 'Facebook',
    ),
    MediaLinkInfo(
      url: 'https://www.instagram.com/official_izone',
      icon: FaIcon(FontAwesomeIcons.instagram),
      description: 'Instagram',
    ),
    MediaLinkInfo(
      url: 'https://twitter.com/official_izone',
      icon: FaIcon(FontAwesomeIcons.twitter),
      description: 'Twitter',
    ),
    MediaLinkInfo(
      url: 'https://www.tiktok.com/@officializone_',
      icon: FaIcon(FontAwesomeIcons.tiktok),
      description: 'TikTok',
    ),
    MediaLinkInfo(
      url: 'https://www.youtube.com/c/officialIZONE/',
      icon: FaIcon(FontAwesomeIcons.youtube),
      description: 'YouTube',
    ),
    MediaLinkInfo(
        url: 'https://channels.vlive.tv/C1B7AF',
        icon: ImageIcon(AssetImage('assets/icons/vlive.png')),
        description: 'V Live'),
    MediaLinkInfo(
      url: 'https://open.spotify.com/artist/5r1tUTxVSgvBHnoDuDODPH',
      icon: FaIcon(FontAwesomeIcons.spotify),
      description: 'Spotify',
    ),
    MediaLinkInfo(
      url: 'https://www.reddit.com/r/izone/',
      icon: FaIcon(FontAwesomeIcons.redditAlien),
      description: 'Reddit (r/IZONE) (unofficial)',
    ),
    MediaLinkInfo(
      url: 'https://music.apple.com/us/artist/iz-one/1440449616',
      icon: FaIcon(FontAwesomeIcons.itunesNote),
      description: 'Apple Music',
    ),
    MediaLinkInfo(
      url:
          'https://play.google.com/music/r/m/Avt4ltg3radsfcc2gnggnvnsa4m?t=IZONE',
      icon: FaIcon(FontAwesomeIcons.googlePlay),
      description: 'Google Play Music',
    ),
    MediaLinkInfo(
      url: 'https://music.youtube.com/channel/UCG81UKNsFg9Perf0uPQOsQw',
      icon: FaIcon(FontAwesomeIcons.playCircle),
      description: 'YouTube Music',
    ),
    MediaLinkInfo(
      url: 'https://pandora.app.link/cFvHL2U587',
      icon: ImageIcon(AssetImage('assets/icons/pandora.png')),
      description: 'Pandora',
    ),
    MediaLinkInfo(
      url: 'https://music.amazon.com/artists/B07JZF2B3R',
      icon: FaIcon(FontAwesomeIcons.amazon),
      description: 'Amazon Music',
    ),
    MediaLinkInfo(
      url: 'https://soundcloud.com/search?q=iz*one',
      icon: FaIcon(FontAwesomeIcons.soundcloud),
      description: 'Soundcloud (unofficial)',
    ),
    MediaLinkInfo(
        url: 'https://tidal.com/artist/10528069',
        icon: ImageIcon(AssetImage('assets/icons/tidal.png')),
        description: 'Tidal Music'),
    MediaLinkInfo(
      url: 'http://iz-one.co.kr/',
      icon: FaIcon(FontAwesomeIcons.globeAmericas),
      description: 'Official website',
    ),
  ];
}

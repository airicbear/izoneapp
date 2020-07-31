import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

typedef MediaLinkLaunch = void Function();

class MediaLinkInfo {
  final MediaLinkLaunch launch;
  final Widget icon;
  final String description;

  MediaLinkInfo({this.launch, this.icon, this.description});
}

class MediaLinks {
  static _launchUrl(url, {altUrl}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      await launch(altUrl);
    }
  }

  static List<MediaLinkInfo> links = [
    MediaLinkInfo(
      launch: () async {
        _launchUrl(
          'fb://facewebmodal/f?href=https://www.facebook.com/official.izone',
          altUrl: 'https://www.facebook.com/official.izone',
        );
      },
      icon: FaIcon(FontAwesomeIcons.facebook),
      description: 'Facebook (@official.izone)',
    ),
    MediaLinkInfo(
      launch: () => _launchUrl('https://www.instagram.com/official_izone'),
      icon: FaIcon(FontAwesomeIcons.instagram),
      description: 'Instagram (@official_izone)',
    ),
    MediaLinkInfo(
      launch: () => _launchUrl('https://twitter.com/official_izone'),
      icon: FaIcon(FontAwesomeIcons.twitter),
      description: 'Twitter (@official_izone)',
    ),
    MediaLinkInfo(
      launch: () => _launchUrl('https://www.tiktok.com/@officializone_'),
      icon: FaIcon(FontAwesomeIcons.tiktok),
      description: 'TikTok (@officializone_)',
    ),
    MediaLinkInfo(
      launch: () => _launchUrl('https://www.youtube.com/c/officialIZONE/'),
      icon: FaIcon(FontAwesomeIcons.youtube),
      description: 'YouTube (c/officialIZONE)',
    ),
    MediaLinkInfo(
        launch: () {
          _launchUrl(
            'globalv://channel?channelseq=C1B7AF',
            altUrl: 'https://channels.vlive.tv/C1B7AF/',
          );
        },
        icon: ImageIcon(AssetImage('assets/icons/vlive.png')),
        description: 'V Live (C1B7AF)'),
    MediaLinkInfo(
      launch: () =>
          _launchUrl('https://open.spotify.com/artist/5r1tUTxVSgvBHnoDuDODPH'),
      icon: FaIcon(FontAwesomeIcons.spotify),
      description: 'Spotify',
    ),
    MediaLinkInfo(
      launch: () => _launchUrl('https://www.reddit.com/r/izone/'),
      icon: FaIcon(FontAwesomeIcons.redditAlien),
      description: 'Reddit (r/IZONE) (unofficial)',
    ),
    MediaLinkInfo(
      launch: () =>
          _launchUrl('https://music.apple.com/us/artist/iz-one/1440449616'),
      icon: FaIcon(FontAwesomeIcons.itunesNote),
      description: 'Apple Music',
    ),
    MediaLinkInfo(
      launch: () => _launchUrl(
          'https://music.youtube.com/channel/UCG81UKNsFg9Perf0uPQOsQw'),
      icon: FaIcon(FontAwesomeIcons.playCircle),
      description: 'YouTube Music',
    ),
    MediaLinkInfo(
      launch: () => _launchUrl('https://pandora.app.link/cFvHL2U587'),
      icon: ImageIcon(AssetImage('assets/icons/pandora.png')),
      description: 'Pandora',
    ),
    MediaLinkInfo(
      launch: () => _launchUrl('https://music.amazon.com/artists/B07JZF2B3R'),
      icon: FaIcon(FontAwesomeIcons.amazon),
      description: 'Amazon Music',
    ),
    MediaLinkInfo(
      launch: () => _launchUrl('https://soundcloud.com/search?q=iz*one'),
      icon: FaIcon(FontAwesomeIcons.soundcloud),
      description: 'Soundcloud (unofficial)',
    ),
    MediaLinkInfo(
        launch: () => _launchUrl('https://tidal.com/artist/10528069'),
        icon: ImageIcon(AssetImage('assets/icons/tidal.png')),
        description: 'Tidal Music'),
    MediaLinkInfo(
      launch: () => _launchUrl('http://iz-one.co.kr/'),
      icon: FaIcon(FontAwesomeIcons.globeAmericas),
      description: 'Official website',
    ),
  ];
}

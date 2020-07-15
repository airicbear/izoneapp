import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FaIcon, FontAwesomeIcons;
import 'package:url_launcher/url_launcher.dart' show canLaunch, launch;

class MediaButtons extends StatelessWidget {
  void _launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ButtonBar(
        children: [
          IconButton(
            onPressed: () {
              String url = 'https://www.facebook.com/official.izone';

              try {
                if (Platform.isAndroid) {
                  url =
                      'fb://facewebmodal/f?href=https://www.facebook.com/official.izone';
                }
              } catch (e) {}

              _launchUrl(url);
            },
            icon: FaIcon(FontAwesomeIcons.facebook),
          ),
          IconButton(
            onPressed: () =>
                _launchUrl('https://www.instagram.com/official_izone'),
            icon: FaIcon(FontAwesomeIcons.instagram),
          ),
          IconButton(
            onPressed: () => _launchUrl('https://twitter.com/official_izone'),
            icon: FaIcon(FontAwesomeIcons.twitter),
          ),
          IconButton(
            onPressed: () =>
                _launchUrl('https://www.tiktok.com/@officializone_'),
            icon: FaIcon(FontAwesomeIcons.tiktok),
          ),
          IconButton(
            onPressed: () =>
                _launchUrl('https://www.youtube.com/c/officialIZONE/'),
            icon: FaIcon(FontAwesomeIcons.youtube),
          ),
          IconButton(
            onPressed: () => _launchUrl('https://channels.vlive.tv/C1B7AF'),
            icon: ImageIcon(AssetImage('assets/icons/vlive.png')),
          ),
          IconButton(
            onPressed: () => _launchUrl(
                'https://open.spotify.com/artist/5r1tUTxVSgvBHnoDuDODPH'),
            icon: FaIcon(FontAwesomeIcons.spotify),
          ),
          IconButton(
            onPressed: () => _launchUrl('https://www.reddit.com/r/izone/'),
            icon: FaIcon(FontAwesomeIcons.redditAlien),
          ),
          IconButton(
            onPressed: () => _launchUrl('http://iz-one.co.kr/'),
            icon: FaIcon(FontAwesomeIcons.globeAmericas),
          ),
          IconButton(
            onPressed: () => _launchUrl(
                'https://music.apple.com/us/artist/iz-one/1440449616'),
            icon: FaIcon(FontAwesomeIcons.itunesNote),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DisclaimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disclaimer'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Content rights',
              textScaleFactor: 2.0,
            ),
            subtitle: Text(
                'This is an unofficial fan-made app. This fan app and its content are not officially endorsed or produced by, nor associated with or affiliated with the music artist(s) or any associated entities of the artist(s), such as management or record label. All trademarks and copyrights are property of their respective owners.'),
          ),
          Column(
            children: [
              ListTile(
                title: Text(
                  'Content accuracy',
                  textScaleFactor: 2.0,
                ),
                subtitle: Text(
                    'The content in this app references multiple different sources. I strive to get the most accurate and up-to-date information as possible however it is not always possible.'),
              ),
              // ButtonBar(
              //   children: [
              //     TextButton.icon(
              //       label: Text('Submit an issue'),
              //       icon: FaIcon(FontAwesomeIcons.github),
              //       onPressed: () =>
              //           launch('https://github.com/airicbear/izone-app'),
              //     ),
              //   ],
              // )
            ],
          ),
          ListTile(
            title: Text(
              'References',
              textScaleFactor: 2.0,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () => launch('https://genius.com/artists/Izone'),
                  icon: FaIcon(FontAwesomeIcons.globeAmericas),
                  label: Text('Genius.com'),
                ),
                TextButton.icon(
                  onPressed: () => launch(
                      'https://colorcodedlyrics.com/2018/11/iz-one-aijeuwon-produce-48-lyrics-index'),
                  icon: FaIcon(FontAwesomeIcons.globeAmericas),
                  label: Text('colorcodedlyrics.com'),
                ),
                TextButton.icon(
                  onPressed: () => launch(
                      'https://www.youtube.com/results?search_query=iz%2Aone+color+coded+lyrics'),
                  icon: FaIcon(FontAwesomeIcons.youtube),
                  label: Text('YouTube'),
                ),
                TextButton.icon(
                  onPressed: () => launch(
                      'https://translate.google.com/#view=home&op=translate&sl=ko&tl=en'),
                  icon: FaIcon(FontAwesomeIcons.language),
                  label: Text('Google Translate'),
                ),
                TextButton.icon(
                    onPressed: () =>
                        launch('https://en.wikipedia.org/wiki/Iz*One'),
                    icon: FaIcon(FontAwesomeIcons.wikipediaW),
                    label: Text('Wikipedia: Iz*One')),
                TextButton.icon(
                  onPressed: () => launch('http://iz-one.co.kr/'),
                  icon: FaIcon(FontAwesomeIcons.globeAmericas),
                  label: Text('Official IZ*ONE website'),
                ),
                TextButton.icon(
                  onPressed: () => launch('https://www.izone-official.com/'),
                  icon: FaIcon(FontAwesomeIcons.globeAmericas),
                  label: Text('Official IZ*ONE Japan website'),
                ),
                TextButton.icon(
                  onPressed: () =>
                      launch('https://kprofiles.com/izone-members-profile/'),
                  icon: FaIcon(FontAwesomeIcons.globeAmericas),
                  label: Text('KProfiles.com'),
                ),
                TextButton.icon(
                  onPressed: () =>
                      launch('https://kpop.fandom.com/wiki/IZ*ONE'),
                  icon: FaIcon(FontAwesomeIcons.globeAmericas),
                  label: Text('FANDOM KPOP Wiki Page'),
                ),
                TextButton.icon(
                  onPressed: () => launch('https://dbkpop.com/group/izone'),
                  icon: FaIcon(FontAwesomeIcons.globeAmericas),
                  label: Text('dbkpop.com'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

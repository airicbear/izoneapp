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
              //           launchUrl('https://github.com/airicbear/izone-app' as Uri),
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
                  onPressed: () =>
                      launchUrl('https://genius.com/artists/Izone' as Uri),
                  icon: FaIcon(FontAwesomeIcons.earthAmericas),
                  label: Text('Genius.com'),
                ),
                TextButton.icon(
                  onPressed: () => launchUrl(
                      'https://colorcodedlyrics.com/2018/11/iz-one-aijeuwon-produce-48-lyrics-index'
                          as Uri),
                  icon: FaIcon(FontAwesomeIcons.earthAmericas),
                  label: Text('colorcodedlyrics.com'),
                ),
                TextButton.icon(
                  onPressed: () => launchUrl(
                      'https://www.youtube.com/results?search_query=iz%2Aone+color+coded+lyrics'
                          as Uri),
                  icon: FaIcon(FontAwesomeIcons.youtube),
                  label: Text('YouTube'),
                ),
                TextButton.icon(
                  onPressed: () => launchUrl(
                      'https://translate.google.com/#view=home&op=translate&sl=ko&tl=en'
                          as Uri),
                  icon: FaIcon(FontAwesomeIcons.language),
                  label: Text('Google Translate'),
                ),
                TextButton.icon(
                    onPressed: () => launchUrl(
                        'https://en.wikipedia.org/wiki/Iz*One' as Uri),
                    icon: FaIcon(FontAwesomeIcons.wikipediaW),
                    label: Text('Wikipedia: Iz*One')),
                TextButton.icon(
                  onPressed: () => launchUrl('http://iz-one.co.kr/' as Uri),
                  icon: FaIcon(FontAwesomeIcons.earthAmericas),
                  label: Text('Official IZ*ONE website'),
                ),
                TextButton.icon(
                  onPressed: () =>
                      launchUrl('https://www.izone-official.com/' as Uri),
                  icon: FaIcon(FontAwesomeIcons.earthAmericas),
                  label: Text('Official IZ*ONE Japan website'),
                ),
                TextButton.icon(
                  onPressed: () => launchUrl(
                      'https://kprofiles.com/izone-members-profile/' as Uri),
                  icon: FaIcon(FontAwesomeIcons.earthAmericas),
                  label: Text('KProfiles.com'),
                ),
                TextButton.icon(
                  onPressed: () =>
                      launchUrl('https://kpop.fandom.com/wiki/IZ*ONE' as Uri),
                  icon: FaIcon(FontAwesomeIcons.earthAmericas),
                  label: Text('FANDOM KPOP Wiki Page'),
                ),
                TextButton.icon(
                  onPressed: () =>
                      launchUrl('https://dbkpop.com/group/izone' as Uri),
                  icon: FaIcon(FontAwesomeIcons.earthAmericas),
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

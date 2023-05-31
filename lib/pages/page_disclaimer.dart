import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DisclaimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Theme.of(context).textTheme.titleLarge?.color,
        ),
        title: Text(
          'Disclaimer',
          style: Theme.of(context).textTheme.titleLarge,
        ),
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
              //       label: Text(
              //         'Submit an issue',
              //         style: Theme.of(context).textTheme.titleMedium,
              //       ),
              //       icon: FaIcon(
              //         FontAwesomeIcons.github,
              //         color: Theme.of(context).textTheme.titleMedium?.color,
              //       ),
              //       onPressed: () => launchUrl(
              //           'https://github.com/airicbear/izone-app' ),
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
                      launchUrl(Uri.parse('https://genius.com/artists/Izone')),
                  icon: FaIcon(
                    FontAwesomeIcons.earthAmericas,
                    color: Theme.of(context).textTheme.titleMedium?.color,
                  ),
                  label: Text(
                    'Genius.com',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                TextButton.icon(
                  onPressed: () => launchUrl(Uri.parse(
                      'https://colorcodedlyrics.com/2018/11/iz-one-aijeuwon-produce-48-lyrics-index')),
                  icon: FaIcon(
                    FontAwesomeIcons.earthAmericas,
                    color: Theme.of(context).textTheme.titleMedium?.color,
                  ),
                  label: Text(
                    'colorcodedlyrics.com',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                TextButton.icon(
                  onPressed: () => launchUrl(Uri.parse(
                      'https://www.youtube.com/results?search_query=iz%2Aone+color+coded+lyrics')),
                  icon: FaIcon(
                    FontAwesomeIcons.youtube,
                    color: Theme.of(context).textTheme.titleMedium?.color,
                  ),
                  label: Text(
                    'YouTube',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                TextButton.icon(
                  onPressed: () => launchUrl(Uri.parse(
                      'https://translate.google.com/#view=home&op=translate&sl=ko&tl=en')),
                  icon: FaIcon(
                    FontAwesomeIcons.language,
                    color: Theme.of(context).textTheme.titleMedium?.color,
                  ),
                  label: Text(
                    'Google Translate',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                TextButton.icon(
                  onPressed: () => launchUrl(
                      Uri.parse('https://en.wikipedia.org/wiki/Iz*One')),
                  icon: FaIcon(
                    FontAwesomeIcons.wikipediaW,
                    color: Theme.of(context).textTheme.titleMedium?.color,
                  ),
                  label: Text(
                    'Wikipedia: Iz*One',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                TextButton.icon(
                  onPressed: () => launchUrl(Uri.parse('http://iz-one.co.kr/')),
                  icon: FaIcon(
                    FontAwesomeIcons.earthAmericas,
                    color: Theme.of(context).textTheme.titleMedium?.color,
                  ),
                  label: Text(
                    'Official IZ*ONE website',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                TextButton.icon(
                  onPressed: () =>
                      launchUrl(Uri.parse('https://www.izone-official.com/')),
                  icon: FaIcon(
                    FontAwesomeIcons.earthAmericas,
                    color: Theme.of(context).textTheme.titleMedium?.color,
                  ),
                  label: Text(
                    'Official IZ*ONE Japan website',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                TextButton.icon(
                  onPressed: () => launchUrl(Uri.parse(
                      'https://kprofiles.com/izone-members-profile/')),
                  icon: FaIcon(
                    FontAwesomeIcons.earthAmericas,
                    color: Theme.of(context).textTheme.titleMedium?.color,
                  ),
                  label: Text(
                    'KProfiles.com',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                TextButton.icon(
                  onPressed: () => launchUrl(
                      Uri.parse('https://kpop.fandom.com/wiki/IZ*ONE')),
                  icon: FaIcon(
                    FontAwesomeIcons.earthAmericas,
                    color: Theme.of(context).textTheme.titleMedium?.color,
                  ),
                  label: Text(
                    'FANDOM KPOP Wiki Page',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                TextButton.icon(
                  onPressed: () =>
                      launchUrl(Uri.parse('https://dbkpop.com/group/izone')),
                  icon: FaIcon(
                    FontAwesomeIcons.earthAmericas,
                    color: Theme.of(context).textTheme.titleMedium?.color,
                  ),
                  label: Text(
                    'dbkpop.com',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

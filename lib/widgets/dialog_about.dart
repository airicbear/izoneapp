import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void appAboutDialog(BuildContext context) {
  showAboutDialog(
    context: context,
    applicationName: 'IZ*ONE Lyrics',
    applicationIcon: Image.asset(
      'assets/launcher.png',
      width: 64,
    ),
    children: [
      Text(
          'This is an unofficial fan-made app dedicated to IZ*ONE and is free and open-source for everyone. There is a web version of this app also available:'),
      FlatButton.icon(
        label: Text('airicbear.github.io/izone-app'),
        icon: Icon(Icons.open_in_browser),
        onPressed: () => launch('https://airicbear.github.io/izone-app'),
      ),
      Divider(height: 24),
      Text(
          'If you want to contribute to this app, please visit the GitHub page at github.com/airicbear/izone-app using the button below.'),
      FlatButton.icon(
        label: Text('airicbear/izone-app'),
        icon: FaIcon(FontAwesomeIcons.github),
        onPressed: () => launch('https://github.com/airicbear/izone-app'),
      ),
      Divider(height: 24),
      Text(
          'If you want to support the development of this app, you can pay through PayPal using the button below. The recommended amount is \$10 for most people.'),
      FlatButton.icon(
        label: Text('airicbear'),
        icon: FaIcon(FontAwesomeIcons.paypal),
        onPressed: () => launch('https://www.paypal.me/airicbear'),
      ),
    ],
    applicationLegalese: 'MIT License\n\nCopyright (c) 2020 Eric Nguyen\n',
  );
}

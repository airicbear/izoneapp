import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  final double adHeight;

  const AboutAppPage({Key key, @required this.adHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: adHeight),
      child: Scaffold(
        appBar: AppBar(
          title: Text('About'),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: Image.asset('assets/launcher.png'),
              title: Text(
                'IZ*ONE Lyrics',
                textScaleFactor: 2.0,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('MIT License\nCopyright (c) 2020 Eric Nguyen'),
                  FlatButton.icon(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LicensePage(),
                      ),
                    ),
                    icon: Icon(Icons.book),
                    label: Text('View all licenses'),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                  'This is a free, unofficial fan-made app dedicated to IZ*ONE.'),
              // subtitle: FlatButton.icon(
              //   label: Text('airicbear.github.io/izone-app'),
              //   icon: Icon(Icons.open_in_browser),
              //   onPressed: () => launch('https://airicbear.github.io/izone-app'),
              // ),
            ),
            // ListTile(
            //   title: Text(
            //       'If you want to contribute to this app, please visit the GitHub page at github.com/airicbear/izone-app using the button below.'),
            //   subtitle: FlatButton.icon(
            //     label: Text('airicbear/izone-app'),
            //     icon: FaIcon(FontAwesomeIcons.github),
            //     onPressed: () => launch('https://github.com/airicbear/izone-app'),
            //   ),
            // ),
            // ListTile(
            //   title: Text(
            //       'If you want to support the development of this app, you can pay through PayPal using the button below. The recommended amount is \$10.'),
            //   subtitle: FlatButton.icon(
            //     label: Text('airicbear'),
            //     icon: FaIcon(FontAwesomeIcons.paypal),
            //     onPressed: () => launch('https://www.paypal.me/airicbear'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

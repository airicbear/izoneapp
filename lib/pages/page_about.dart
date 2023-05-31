import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).textTheme.titleLarge?.color,
        ),
        title: Text(
          'About',
          style: Theme.of(context).textTheme.titleLarge,
        ),
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
                TextButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LicensePage(),
                    ),
                  ),
                  icon: Icon(
                    Icons.book,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  label: Text(
                    'View all licenses',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'This is a free, unofficial fan-made app dedicated to IZ*ONE.',
            ),
            // subtitle: TextButton.icon(
            //   label: Text('airicbear.github.io/izone-app'),
            //   icon: Icon(Icons.open_in_browser),
            //   onPressed: () => launch('https://airicbear.github.io/izone-app'),
            // ),
          ),
        ],
      ),
    );
  }
}

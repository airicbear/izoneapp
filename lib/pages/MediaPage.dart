import 'package:flutter/material.dart';
import 'package:izoneapp/data/media_links.dart';
import 'package:izoneapp/widgets/MediaLinkTile.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MediaLinkTile(link: MediaLinks.links[index]);
        },
        itemCount: MediaLinks.links.length,
      ),
    );
  }
}

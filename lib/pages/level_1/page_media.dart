import 'package:flutter/material.dart';
import 'package:izoneapp/data/links/media_links.dart';
import 'package:izoneapp/widgets/list_tile_media.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        key: PageStorageKey(MediaPage),
        itemBuilder: (context, index) {
          return MediaLinkTile(link: MediaLinks.links[index]);
        },
        itemCount: MediaLinks.links.length,
      ),
    );
  }
}

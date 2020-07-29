import 'package:flutter/material.dart';
import 'package:izoneapp/data/media_links.dart';

class MediaButton extends StatelessWidget {
  const MediaButton({Key key, this.link}) : super(key: key);

  final MediaLinkInfo link;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => link.launch(),
      icon: link.icon,
    );
  }
}

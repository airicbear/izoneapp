import 'package:flutter/material.dart';
import 'package:izoneapp/data/MediaLinks.dart';
import 'package:url_launcher/url_launcher.dart';

class MediaButton extends StatelessWidget {
  const MediaButton({Key key, this.link}) : super(key: key);

  final MediaLinkInfo link;

  void _launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _launchUrl(link.url),
      icon: link.icon,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:izoneapp/data/MediaLinks.dart';

class MediaLinkTile extends StatelessWidget {
  const MediaLinkTile({Key key, this.link}) : super(key: key);

  final MediaLinkInfo link;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => link.launch(),
        child: ListTile(
          leading: link.icon,
          title: Text(link.description),
          trailing: Icon(Icons.open_in_new),
        ),
      ),
    );
  }
}

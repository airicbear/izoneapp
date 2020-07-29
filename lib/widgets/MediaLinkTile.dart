import 'package:flutter/material.dart';
import 'package:izoneapp/data/media_links.dart';

class MediaLinkTile extends StatelessWidget {
  const MediaLinkTile({Key key, this.link}) : super(key: key);

  final MediaLinkInfo link;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
      ).clipBehavior,
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

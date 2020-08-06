import 'package:flutter/material.dart';
import 'package:izoneapp/pages/page_view_picture.dart';

class GalleryTile extends StatelessWidget {
  const GalleryTile({Key key, @required this.url, this.color})
      : super(key: key);

  final String url;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ViewPicturePage(
                path: url,
                color: color,
                isNetwork: true,
              );
            },
          ),
        );
      },
      child: Hero(
        tag: url,
        child: Image.network(
          url,
          cacheWidth: 256,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.none,
          loadingBuilder:
              (BuildContext context, Widget widget, ImageChunkEvent progress) {
            if (progress == null) return widget;
            return Image.asset(
              'assets/gif/yuri.gif',
              cacheWidth: 256,
              fit: BoxFit.cover,
            );
          },
          errorBuilder: (context, error, stackTrace) => Center(
            child: Image.asset(
              'assets/gif/yuri.gif',
              cacheWidth: 256,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

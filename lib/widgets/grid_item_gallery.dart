import 'package:cached_network_image/cached_network_image.dart';
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
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.none,
          placeholder: (context, url) {
            return Image.asset(
              'assets/gif/yuri.gif',
              cacheWidth: 256,
              fit: BoxFit.cover,
            );
          },
          errorWidget: (context, url, error) => Center(
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

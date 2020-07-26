import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewPicturePage extends StatelessWidget {
  const ViewPicturePage({
    Key key,
    @required this.memberImagePath,
    this.color,
    this.isNetwork,
  }) : super(key: key);

  final String memberImagePath;
  final Color color;
  final bool isNetwork;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Center(
          child: PhotoView(
            backgroundDecoration:
                BoxDecoration(color: color?.withOpacity(0.5) ?? Colors.black),
            imageProvider: isNetwork == null || isNetwork == false
                ? AssetImage(memberImagePath)
                : NetworkImage(memberImagePath),
            heroAttributes: PhotoViewHeroAttributes(
              tag: memberImagePath,
            ),
            minScale: PhotoViewComputedScale.contained,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}

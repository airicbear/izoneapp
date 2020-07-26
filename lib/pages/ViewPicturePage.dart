import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewPicturePage extends StatelessWidget {
  const ViewPicturePage({
    Key key,
    this.memberImagePath,
    this.color,
  }) : super(key: key);

  final String memberImagePath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Center(
          child: PhotoView(
            backgroundDecoration: BoxDecoration(color: color ?? Colors.black),
            imageProvider: AssetImage(memberImagePath),
            heroAttributes: PhotoViewHeroAttributes(
              tag: memberImagePath,
            ),
            minScale: PhotoViewComputedScale.contained,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewPicturePage extends StatelessWidget {
  const ViewPicturePage({Key key, this.memberImagePath}) : super(key: key);

  final String memberImagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Center(
          child: PhotoView(
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

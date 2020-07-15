import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/services.dart';

class MemberPictureView extends StatelessWidget {
  const MemberPictureView({Key key, this.memberImagePath}) : super(key: key);

  final String memberImagePath;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
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

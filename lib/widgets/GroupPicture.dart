import 'package:flutter/material.dart';
import 'package:izoneapp/pages/ViewPicturePage.dart';

class GroupPicture extends StatelessWidget {
  const GroupPicture({Key key, this.imagePath}) : super(key: key);

  final String imagePath;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ViewPicturePage(memberImagePath: imagePath);
            },
          ),
        );
      },
      child: Hero(
        tag: imagePath,
        child: Image.asset(imagePath),
      ),
    );
  }
}

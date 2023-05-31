import 'package:flutter/material.dart';
import 'package:izoneapp/pages/page_view_picture.dart';

class GroupPicture extends StatelessWidget {
  const GroupPicture({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ViewPicturePage(
                path: imagePath,
                isNetwork: false,
              );
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

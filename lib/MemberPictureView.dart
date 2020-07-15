import 'package:flutter/material.dart';

class MemberPictureView extends StatelessWidget {
  const MemberPictureView({Key key, this.memberImagePath}) : super(key: key);

  final String memberImagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Center(
          child: Hero(
            tag: memberImagePath,
            child: Image(
              image: AssetImage(memberImagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

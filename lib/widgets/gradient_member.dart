import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';

class MemberPictureGradient extends StatelessWidget {
  const MemberPictureGradient(
      {Key key, @required this.member, this.beginY = 0.8})
      : super(key: key);

  final Member member;
  final double beginY;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.0, beginY),
          end: Alignment(0.0, 0.0),
          colors: [
            Color.lerp(
              Theme.of(context).primaryColor,
              member.color,
              0.45,
            ),
            Theme.of(context).primaryColor.withOpacity(0.1),
          ],
        ),
      ),
    );
  }
}

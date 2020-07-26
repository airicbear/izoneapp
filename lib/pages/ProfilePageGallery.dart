import 'package:flutter/material.dart';
import 'package:izoneapp/data/Member.dart';
import 'package:izoneapp/widgets/GalleryTile.dart';

class ProfilePageGallery extends StatelessWidget {
  const ProfilePageGallery({Key key, this.member}) : super(key: key);

  final Member member;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 512 / 3),
      itemBuilder: (BuildContext context, int index) {
        return GalleryTile(
          url: member.galleryUrlList.elementAt(index),
          color: member.color.withOpacity(0.2),
        );
      },
      itemCount: member.galleryUrlList?.length ?? 0,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';
import 'package:izoneapp/widgets/grid_item_gallery.dart';

class ProfilePageGallery extends StatelessWidget {
  const ProfilePageGallery({Key key, this.member}) : super(key: key);

  final Member member;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 512.0 / 3.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => GalleryTile(
          url: member.gallery.elementAt(index).path,
          color: member.color.withOpacity(0.2),
        ),
        childCount: member.gallery?.length ?? 0,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:izoneapp/data/izone_picture.dart';
import 'package:izoneapp/data/member.dart';
import 'package:izoneapp/data/pictures/izone_pictures.dart';
import 'package:izoneapp/widgets/grid_item_gallery.dart';

class ProfilePageGallery extends StatefulWidget {
  const ProfilePageGallery({
    Key key,
    @required this.member,
  }) : super(key: key);

  final Member member;

  @override
  State<StatefulWidget> createState() => _ProfilePageGalleryState();
}

class _ProfilePageGalleryState extends State<ProfilePageGallery> {
  Future<List<IzonePicture>> _pictures;
  int _numPictures = 10;

  @override
  void initState() {
    super.initState();
    _pictures = IzonePictures.search(widget.member.fullName);
    _pictures.then((value) {
      _numPictures = value.length;
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 512.0 / 3.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => FutureBuilder<List<IzonePicture>>(
          future: _pictures,
          builder: (context, snapshot) {
            return GalleryTile(
              url: snapshot?.data?.elementAt(index)?.path ??
                  // Jo Yuri GIF placeholder
                  'https://media1.tenor.com/images/e2b87e27ae95e036005c1046a5bc4724/tenor.gif',
              color: widget.member.color,
            );
          },
        ),
        childCount: _numPictures,
      ),
    );
  }
}

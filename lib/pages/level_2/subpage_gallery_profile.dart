import 'package:flutter/material.dart';
import 'package:izoneapp/data/izone_picture.dart';
import 'package:izoneapp/data/pictures/izone_pictures.dart';
import 'package:izoneapp/data/profile.dart';
import 'package:izoneapp/widgets/grid_item_gallery.dart';

class ProfilePageGallery extends StatefulWidget {
  const ProfilePageGallery({
    Key key,
    @required this.profile,
  }) : super(key: key);

  final Profile profile;

  @override
  State<StatefulWidget> createState() => _ProfilePageGalleryState();
}

class _ProfilePageGalleryState extends State<ProfilePageGallery> {
  Future<List<IzonePicture>> _pictures;
  int _numPictures = 9;

  @override
  void initState() {
    super.initState();
    _pictures = IzonePictures.search('izone+${widget.profile.stageName}');
    _pictures.then((value) {
      if (this.mounted) {
        setState(() {
          _numPictures = value.length;
        });
      }
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
            if (snapshot?.data?.elementAt(index)?.path == null) {
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              );
            }

            return GalleryTile(
              url: snapshot?.data?.elementAt(index)?.path,
              color: widget.profile.color,
            );
          },
        ),
        childCount: _numPictures,
      ),
    );
  }
}

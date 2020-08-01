import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';

class ViewPicturePage extends StatefulWidget {
  const ViewPicturePage({
    Key key,
    @required this.memberImagePath,
    this.color,
    this.isNetwork,
  }) : super(key: key);

  final String memberImagePath;
  final Color color;
  final bool isNetwork;

  @override
  State<StatefulWidget> createState() => _ViewPicturePageState();
}

class _ViewPicturePageState extends State<ViewPicturePage> {
  bool isFocused;

  @override
  void initState() {
    super.initState();
    isFocused = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: !isFocused,
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () {
          setState(() {
            isFocused = !isFocused;
          });
        },
        child: PhotoView(
          backgroundDecoration: BoxDecoration(
            color: widget.color?.withOpacity(0.5) ?? Colors.black,
          ),
          imageProvider: widget.isNetwork == null || widget.isNetwork == false
              ? AssetImage(widget.memberImagePath)
              : NetworkImage(widget.memberImagePath),
          heroAttributes: PhotoViewHeroAttributes(
            tag: widget.memberImagePath,
          ),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.contained * 10.0,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}

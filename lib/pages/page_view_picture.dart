import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:photo_view/photo_view.dart';

class ViewPicturePage extends StatefulWidget {
  const ViewPicturePage({
    Key key,
    @required this.path,
    this.color,
    this.isNetwork,
  }) : super(key: key);

  final String path;
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

  _savePicture() async {
    var response = await Dio().get(
      widget.path,
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );
    await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      quality: 60,
      name: widget.path.split('/').last.split('.').first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: !isFocused,
        actions: [
          widget.path.startsWith('http')
              ? FlatButton.icon(
                  onPressed: () => _savePicture(),
                  icon: Icon(Icons.save),
                  label: Text('Save picture'),
                )
              : Spacer(),
        ],
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
              ? AssetImage(widget.path)
              : NetworkImage(widget.path),
          heroAttributes: PhotoViewHeroAttributes(
            tag: widget.path,
          ),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.contained * 10.0,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}

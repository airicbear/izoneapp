import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:photo_view/photo_view.dart';

class ViewPicturePage extends StatefulWidget {
  const ViewPicturePage({
    Key? key,
    required this.path,
    required this.isNetwork,
  }) : super(key: key);

  final String path;
  final bool isNetwork;

  @override
  State<StatefulWidget> createState() => _ViewPicturePageState();
}

class _ViewPicturePageState extends State<ViewPicturePage> {
  late bool isSaved;

  @override
  void initState() {
    super.initState();
    isSaved = false;
  }

  _savePicture() async {
    setState(() {
      isSaved = true;
    });
    String filename = widget.path.split('/').last;
    await GallerySaver.saveImage(widget.path).then((bool? success) {
      Fluttertoast.showToast(
        msg: 'Saved $filename',
        toastLength: Toast.LENGTH_LONG,
        textColor: Theme.of(context).textTheme.bodyLarge?.color,
        backgroundColor: Theme.of(context).cardColor,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          widget.path.startsWith('http')
              ? isSaved
                  ? TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.check),
                      label: Text('Saved'),
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.white),
                    )
                  : TextButton.icon(
                      onPressed: () => _savePicture(),
                      icon: Icon(Icons.save),
                      label: Text('Save picture'),
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.white),
                    )
              : Spacer()
        ],
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => _FocusedViewPicturePage(
                isNetwork: widget.isNetwork,
                path: widget.path,
                color: Colors.black,
              ),
            ),
          );
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ));
        },
        child: PhotoView(
          backgroundDecoration: BoxDecoration(
            color: Colors.black,
          ),
          imageProvider: widget.isNetwork == false
              ? AssetImage(widget.path) as ImageProvider
              : CachedNetworkImageProvider(widget.path),
          heroAttributes: PhotoViewHeroAttributes(
            tag: widget.path,
          ),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.contained * 10.0,
          filterQuality: FilterQuality.high,
          loadingBuilder: (_context, _event) {
            return Image.asset(
              'assets/gif/yuri.gif',
              cacheWidth: 256,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}

class _FocusedViewPicturePage extends StatelessWidget {
  final Color color;
  final bool isNetwork;
  final String path;

  const _FocusedViewPicturePage({
    Key? key,
    required this.isNetwork,
    required this.path,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        return true;
      },
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: PhotoView(
          backgroundDecoration: BoxDecoration(
            color: Colors.black,
          ),
          imageProvider: isNetwork == false
              ? AssetImage(path) as ImageProvider
              : NetworkImage(path),
          heroAttributes: PhotoViewHeroAttributes(
            tag: path,
          ),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.contained * 10.0,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}

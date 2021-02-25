import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:photo_view/photo_view.dart';

class ViewPicturePage extends StatefulWidget {
  const ViewPicturePage({
    Key key,
    @required this.path,
    this.isNetwork,
  }) : super(key: key);

  final String path;
  final bool isNetwork;

  @override
  State<StatefulWidget> createState() => _ViewPicturePageState();
}

class _ViewPicturePageState extends State<ViewPicturePage> {
  bool isSaved;

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
    await GallerySaver.saveImage(widget.path).then((bool success) {
      Fluttertoast.showToast(
        msg: 'Saved $filename',
        toastLength: Toast.LENGTH_LONG,
        textColor: Theme.of(context).textTheme.bodyText1.color,
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
                  ? FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.check),
                      label: Text('Saved'),
                    )
                  : FlatButton.icon(
                      onPressed: () => _savePicture(),
                      icon: Icon(Icons.save),
                      label: Text('Save picture'),
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
          imageProvider: widget.isNetwork == null || widget.isNetwork == false
              ? AssetImage(widget.path)
              : CachedNetworkImageProvider(widget.path),
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

class _FocusedViewPicturePage extends StatelessWidget {
  final Color color;
  final bool isNetwork;
  final String path;

  const _FocusedViewPicturePage(
      {Key key, this.color, this.isNetwork, this.path})
      : super(key: key);

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
          imageProvider: isNetwork == null || isNetwork == false
              ? AssetImage(path)
              : CachedNetworkImageProvider(path),
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

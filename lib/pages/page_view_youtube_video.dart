import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ViewYoutubeVideoPage extends StatelessWidget {
  const ViewYoutubeVideoPage({Key key, this.youtubeUrl}) : super(key: key);

  final String youtubeUrl;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );
    return WillPopScope(
      onWillPop: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        Navigator.pop(context);
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: HtmlWidget(
            '<iframe style="width:100%; height:100%;" src="$youtubeUrl" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>',
            webView: true,
          ),
        ),
      ),
    );
  }
}

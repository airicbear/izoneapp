import 'package:flutter/material.dart';

class ScrollableAppBarScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection direction,
  ) {
    return child;
  }
}

import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  const GradientBox({Key key, this.beginY = 0.8}) : super(key: key);

  final double beginY;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.0, beginY),
          end: Alignment(0.0, 0.0),
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.01),
          ],
        ),
      ),
    );
  }
}

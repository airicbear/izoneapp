import 'package:flutter/material.dart';

class GridItemLabel extends StatelessWidget {
  final String title;
  final String subtitle;

  const GridItemLabel({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline5.fontSize,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.caption.fontSize,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:izoneapp/pages/page_disclaimer.dart';
import 'package:izoneapp/widgets/dialog_about.dart';

enum More { DISCLAIMER, ABOUT }

class AppMoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (More result) {
        switch (result) {
          case More.DISCLAIMER:
            showDialog(
              context: context,
              child: DisclaimerPage(),
            );
            break;
          case More.ABOUT:
            appAboutDialog(context);
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<More>>[
        const PopupMenuItem<More>(
          value: More.DISCLAIMER,
          child: Text('Disclaimer'),
        ),
        const PopupMenuItem<More>(
          value: More.ABOUT,
          child: Text('About this app'),
        ),
      ],
    );
  }
}

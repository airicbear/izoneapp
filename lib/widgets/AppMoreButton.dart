import 'package:flutter/material.dart';
import 'package:izoneapp/pages/DisclaimerPage.dart';
import 'package:izoneapp/widgets/AboutDialog.dart';

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

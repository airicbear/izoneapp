import 'package:flutter/material.dart';
import 'package:izoneapp/generated/l10n.dart';
import 'package:izoneapp/pages/ViewPicturePage.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key, this.pageController}) : super(key: key);

  final PageController pageController;

  Widget _izonePicture(BuildContext context) {
    const imagePath = 'assets/images/oneiric-diary/official-photo-4-izone.jpg';
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ViewPicturePage(memberImagePath: imagePath);
            },
          ),
        );
      },
      child: Hero(
        tag: imagePath,
        child: Image.asset(imagePath),
      ),
    );
  }

  Widget _izoneDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SelectableText(S.of(context).aboutIzone),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 800) {
            return ListView(
              children: [
                _izonePicture(context),
                _izoneDescription(context),
              ],
            );
          } else {
            return Center(
              child: Row(
                children: [
                  _izonePicture(context),
                  Expanded(
                    child: ListView(children: [_izoneDescription(context)]),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

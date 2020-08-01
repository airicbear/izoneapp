import 'package:flutter/material.dart';
import 'package:izoneapp/generated/l10n.dart';
import 'package:izoneapp/widgets/group_picture.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return Column(
              children: [
                Flexible(
                  child: GroupPicture(
                    imagePath:
                        'assets/images/oneiric-diary/official-photo-4-izone.jpg',
                  ),
                ),
                Expanded(
                  child: _IzoneDescription(),
                ),
              ],
            );
          } else {
            return Row(
              children: [
                Expanded(
                  child: GroupPicture(
                    imagePath:
                        'assets/images/oneiric-diary/official-photo-4-izone.jpg',
                  ),
                ),
                Flexible(
                  child: _IzoneDescription(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class _IzoneDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      padding: const EdgeInsets.all(12.0),
      childrenDelegate: SliverChildListDelegate.fixed(
        [
          SelectableText(S.of(context).aboutIzone),
        ],
      ),
    );
  }
}

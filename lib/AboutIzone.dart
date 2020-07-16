import 'package:flutter/material.dart';
import 'package:izoneapp/MediaButtons.dart';
import 'package:izoneapp/MemberPictureView.dart';

class AboutIzone extends StatelessWidget {
  Widget _izonePicture(context) {
    const imagePath = 'assets/images/oneiric-diary/official-photo-4-izone.jpg';
    return Flexible(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MemberPictureView(
                  memberImagePath: imagePath,
                );
              },
            ),
          );
        },
        child: Hero(
          tag: imagePath,
          child: Image.asset(
            imagePath,
          ),
        ),
      ),
    );
  }

  Widget _izoneDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SelectableText(
          '''
IZ*ONE is an idol group formed through idol survival show Produce 48, a collaborative project between Korean music channel MNet's audition program Produce 101 and Japan's AKB48 idol group. The group features 12 members (nine Korean and three Japanese).

The group's debut album, COLOR*IZ, was released in Korea on October 29th, 2018. The album topped the charts in 10 countries, breaking the record for debut albums released by Korean girl groups. The group's debut also caused ripples in Japan, gaining traction in the media as one of the notable artists of 2019. On February 6th, 2019, the group will also make its Japan debut with the album Suki to Iwasetai under the auspices of producer Yasushi Akimoto.
''',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SingleChildScrollView(
          child: ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              Text('About'),
              FlatButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/Members');
                },
                child: Text(
                  'Members',
                  style: TextStyle(
                    color: Theme.of(context).disabledColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: MediaButtons(),
        color: Theme.of(context).primaryColor,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 800) {
            return Column(
              children: [
                _izonePicture(context),
                _izoneDescription(),
              ],
            );
          } else {
            return Center(
              child: Row(
                children: [
                  _izonePicture(context),
                  _izoneDescription(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

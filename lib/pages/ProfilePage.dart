import 'package:flutter/material.dart';
import 'package:izoneapp/pages/ViewPicturePage.dart';
import '../data/Member.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key, this.member, this.collectionNumber})
      : super(key: key);

  final Member member;
  final int collectionNumber;

  Widget _memberHero(context, height) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ViewPicturePage(
                memberImagePath: member.getImagePath(),
                color: member.color,
              );
            },
          ),
        );
      },
      child: Hero(
        tag: member.getImagePath(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32.0),
          child: Image(
            image: AssetImage(member.getImagePath()),
            fit: BoxFit.cover,
            height: height,
          ),
        ),
      ),
    );
  }

  Widget _memberInfo(context) {
    var memberInfo = [
      ['Stage Name', '${member.stageName} (${member.stageNameKorean})'],
      ['Full Name', '${member.fullName} (${member.fullNameKorean})'],
      [
        'Date of birth',
        '${MaterialLocalizations.of(context).formatFullDate(DateTime.parse(member.dateOfBirth))}'
      ],
      ['Age', '${member.getAge()} years old'],
      ['Birthplace', member.birthplace],
      ['Company', member.company],
      [
        'Color',
        Row(
          children: [
            Text(member.colorDesc),
            Container(
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.only(left: 12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(4.0),
                color: member.color,
              ),
            ),
          ],
        ),
      ],
      ['Height', '≈ ${member.height} cm (${member.getHeightInFeetInches()})'],
      ['Blood type', member.bloodType == null ? 'Unknown' : member.bloodType],
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Expanded(
                  child: SelectableText(memberInfo[index][0]),
                  flex: 2,
                ),
                Expanded(
                  child: memberInfo[index][1] is String
                      ? SelectableText(memberInfo[index][1])
                      : memberInfo[index][1],
                  flex: 4,
                ),
              ],
            ),
          );
        },
        childCount: memberInfo.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600.0) {
          return Stack(
            children: [
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                color: member.color,
                child: Text('HELLO'),
              ),
              Scaffold(
                backgroundColor:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 440.0,
                      centerTitle: true,
                      backgroundColor: Colors.transparent,
                      flexibleSpace: _memberHero(context, 470.0),
                    ),
                    _memberInfo(context),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Scaffold(
            backgroundColor: member.color.withOpacity(0.3),
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Row(
              children: [
                Expanded(
                  child: _memberHero(context, null),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      _memberInfo(context),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

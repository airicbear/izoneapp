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
                memberImagePath: member.getImagePath('oneiric-diary'),
              );
            },
          ),
        );
      },
      child: Hero(
        tag: member.getImagePath('oneiric-diary'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32.0),
          child: Image(
            image: AssetImage(member.getImagePath('oneiric-diary')),
            fit: BoxFit.cover,
            height: height,
          ),
        ),
      ),
    );
  }

  Widget _memberInfo() {
    var memberInfo = [
      ['Stage Name', '${member.stageName} (${member.stageNameKorean})'],
      ['Full Name', '${member.fullName} (${member.fullNameKorean})'],
      ['Date of birth', '${member.dateOfBirth} (${member.getAge()} years old)'],
      ['Birthplace', member.birthplace],
      ['Company', member.company],
      ['Color', member.color],
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
                  child: SelectableText(memberInfo[index][1]),
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
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 440.0,
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: _memberHero(context, 470.0),
                ),
                _memberInfo(),
              ],
            ),
          );
        } else {
          return Scaffold(
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
                      _memberInfo(),
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

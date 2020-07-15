import 'package:flutter/material.dart';
import 'package:izoneapp/MemberPictureView.dart';
import 'Member.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({Key key, this.member, this.collectionNumber})
      : super(key: key);

  final Member member;
  final int collectionNumber;

  @override
  Widget build(BuildContext context) {
    var memberInfo = [
      ["Stage Name", '${member.stageName} (${member.stageNameKorean})'],
      ["Full Name", '${member.fullName} (${member.fullNameKorean})'],
      ["Date of birth", '${member.dateOfBirth} (${member.getAge()} years old)'],
      ["Nationality", member.nationality],
      ["Birthplace", member.birthplace],
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 440,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MemberPictureView(
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
                    height: 470,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: <Widget>[
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
          ),
        ],
      ),
    );
  }
}

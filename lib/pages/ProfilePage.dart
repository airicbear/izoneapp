import 'package:flutter/material.dart';
import 'package:izoneapp/pages/ViewPicturePage.dart';
import 'package:izoneapp/data/Member.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key, this.member, this.collectionNumber})
      : super(key: key);

  final Member member;
  final int collectionNumber;

  Widget _profileBackButton(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.3),
                blurRadius: 1.0,
                spreadRadius: 1.0,
                offset: Offset(0.0, 1.5),
              )
            ],
          ),
          child: BackButton(
            color: Theme.of(context).textTheme.bodyText1.color,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Color.lerp(Theme.of(context).textTheme.bodyText1.color,
                member.color.withOpacity(0.3), 0.8),
          ),
          child: BackButton(
            color: Theme.of(context).textTheme.bodyText1.color,
          ),
        ),
      ],
    );
  }

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
        child: Image(
          image: AssetImage(member.getImagePath()),
          fit: BoxFit.cover,
          height: height,
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
          return Card(
            clipBehavior: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
            ).clipBehavior,
            child: InkWell(
              onTap: () {},
              child: ListTile(
                tileColor: member.color.withOpacity(0.3),
                leading: Container(
                  width: 100,
                  child: Text(memberInfo[index][0]),
                ),
                title: memberInfo[index][1] is String
                    ? Text(memberInfo[index][1])
                    : memberInfo[index][1],
              ),
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
              ),
              Scaffold(
                backgroundColor:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      leading: _profileBackButton(context),
                      expandedHeight: 430.0,
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
            backgroundColor:
                Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: _profileBackButton(context),
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

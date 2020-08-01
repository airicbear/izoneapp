import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';

class ProfilePageInfo extends StatelessWidget {
  const ProfilePageInfo({Key key, @required this.member}) : super(key: key);

  final Member member;

  @override
  Widget build(BuildContext context) {
    final memberInfo = [
      ['Stage Name', '${member.stageName} (${member.stageNameKorean})'],
      ['Full Name', '${member.fullName} (${member.fullNameKorean})'],
      [
        'Date of birth',
        '${MaterialLocalizations.of(context).formatFullDate(DateTime.parse(member.dateOfBirth))}'
      ],
      ['Age', '${member.age} years old'],
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
      ['Height', '≈ ${member.height} cm (${member.heightInFeetInches})'],
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
}

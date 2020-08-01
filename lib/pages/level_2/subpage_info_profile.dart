import 'package:flutter/material.dart';
import 'package:izoneapp/data/profile.dart';

class ProfilePageInfo extends StatelessWidget {
  const ProfilePageInfo({Key key, @required this.profile}) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final profileInfo = [
      ['Stage Name', '${profile.stageName} (${profile.stageNameKorean})'],
      ['Full Name', '${profile.fullName} (${profile.fullNameKorean})'],
      [
        'Date of birth',
        '${MaterialLocalizations.of(context).formatFullDate(DateTime.parse(profile.dateOfBirth))}'
      ],
      ['Age', '${profile.age} years old'],
      ['Birthplace', profile.birthplace],
      ['Company', profile.company],
      [
        'Color',
        Row(
          children: [
            Text(profile.colorDesc),
            Container(
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.only(left: 12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(4.0),
                color: profile.color,
              ),
            ),
          ],
        ),
      ],
      ['Height', '≈ ${profile.height} cm (${profile.heightInFeetInches})'],
      ['Blood type', profile.bloodType == null ? 'Unknown' : profile.bloodType],
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
                tileColor: profile.color.withOpacity(0.3),
                leading: Container(
                  width: 100,
                  child: Text(profileInfo[index][0]),
                ),
                title: profileInfo[index][1] is String
                    ? Text(profileInfo[index][1])
                    : profileInfo[index][1],
              ),
            ),
          );
        },
        childCount: profileInfo.length,
      ),
    );
  }
}

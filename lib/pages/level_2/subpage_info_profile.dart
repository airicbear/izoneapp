import 'package:flutter/material.dart';
import 'package:izoneapp/data/profile.dart';

class ProfilePageInfo extends StatelessWidget {
  const ProfilePageInfo({Key key, @required this.profile}) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final profileInfo = [
      ['Name', '${profile.name} (${profile.nameKorean})'],
      [
        'Date of birth',
        '${MaterialLocalizations.of(context).formatFullDate(profile.dateOfBirth)}'
      ],
      ['Age', '${profile.age} year${profile.age > 1 ? "s" : ""} old'],
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
      ['Zodiac', profile.zodiac],
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

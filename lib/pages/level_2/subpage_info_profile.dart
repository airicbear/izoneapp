import 'package:flutter/material.dart';
import 'package:izoneapp/data/profile.dart';

class ProfilePageInfo extends StatelessWidget {
  const ProfilePageInfo({
    Key? key,
    required this.profile,
  }) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final List<(String, String)> profileInfo = [
      ('Name', '${profile.name} (${profile.nameKorean})'),
      (
        'Date of birth',
        '${MaterialLocalizations.of(context).formatFullDate(profile.dateOfBirth)}'
      ),
      ('Age', '${profile.age} year${profile.age > 1 ? "s" : ""} old'),
      ('Birthplace', profile.birthplace),
      ('Company', profile.company),
      ('Color', profile.colorDesc),
      ('Height', '≈ ${profile.height} cm (${profile.heightInFeetInches})'),
      ('Zodiac', profile.zodiac),
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
                  child: Text(profileInfo[index].$1),
                ),
                title: Text(profileInfo[index].$2),
              ),
            ),
          );
        },
        childCount: profileInfo.length,
      ),
    );
  }
}

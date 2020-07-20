import 'package:flutter/material.dart';
import 'package:izoneapp/data/Member.dart';
import 'package:izoneapp/pages/ProfilePage.dart';

Route _memberRoute(BuildContext context, Member member) {
  return MaterialPageRoute(
    builder: (context) => ProfilePage(
      member: member,
    ),
  );
}

class MemberTile extends StatelessWidget {
  const MemberTile({Key key, this.member}) : super(key: key);

  final Member member;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkResponse(
        onTap: () {
          Navigator.of(context).push(_memberRoute(context, member));
        },
        highlightShape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(32.0),
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: member.getImagePath(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image(
                    image: AssetImage(member.getImagePath()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  Text(member.stageName),
                  Text(
                    '${MaterialLocalizations.of(context).formatCompactDate(DateTime.parse(member.dateOfBirth))} (${member.getAge()})',
                    style: TextStyle(
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

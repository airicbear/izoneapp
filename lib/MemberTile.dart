import 'package:flutter/material.dart';
import 'Member.dart';
import 'MemberPage.dart';

Route _memberRoute(BuildContext context, Member member) {
  return MaterialPageRoute(
    builder: (context) => MemberPage(
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
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: member.stageName,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image(
                    image: AssetImage(member.getImagePath('oneiric-diary')),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: <Widget>[
                  Text(member.stageName),
                  Text(
                    '${member.getAge()} years old',
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

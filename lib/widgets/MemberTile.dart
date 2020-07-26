import 'package:flutter/material.dart';
import 'package:izoneapp/data/Member.dart';
import 'package:izoneapp/pages/ProfilePage.dart';

class MemberTile extends StatelessWidget {
  const MemberTile({Key key, this.member}) : super(key: key);

  final Member member;

  Route _memberRoute(BuildContext context, Member member) {
    return MaterialPageRoute(
      builder: (context) => ProfilePage(
        member: member,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkResponse(
        highlightColor: member.color.withOpacity(0.6),
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
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.only(left: 12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(4.0),
                        color: member.color,
                      ),
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

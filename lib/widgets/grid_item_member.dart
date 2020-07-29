import 'package:flutter/material.dart';
import 'package:izoneapp/data/member.dart';
import 'package:izoneapp/pages/page_profile.dart';
import 'package:izoneapp/widgets/gradient_member.dart';

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
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image(
                          image: AssetImage(member.getImagePath()),
                          fit: BoxFit.cover,
                        ),
                        MemberPictureGradient(member: member, beginY: 1.0),
                      ],
                    ),
                    FittedBox(
                      child: Column(
                        children: [
                          Text(
                            member.stageName,
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .fontSize,
                            ),
                          ),
                          Text(
                            MaterialLocalizations.of(context).formatShortDate(
                              DateTime.parse(member.dateOfBirth),
                            ),
                            style: TextStyle(
                              fontSize:
                                  Theme.of(context).textTheme.caption.fontSize,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

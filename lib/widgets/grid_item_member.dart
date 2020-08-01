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
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image(
                      image: AssetImage(member.imagePath),
                      fit: BoxFit.cover,
                    ),
                    MemberPictureGradient(member: member, beginY: 1.0),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                          _memberRoute(context, member),
                        ),
                        splashColor: Color.lerp(
                          member.color.withOpacity(0.6),
                          Theme.of(context).primaryColor,
                          0.25,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    _memberRoute(context, member),
                  ),
                  child: _MemberTileLabel(member: member),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MemberTileLabel extends StatelessWidget {
  final Member member;

  const _MemberTileLabel({Key key, this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          Text(
            '${member.stageName}${member.isBirthday ? " 🎂" : ""}',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline5.fontSize,
            ),
          ),
          Text(
            MaterialLocalizations.of(context).formatShortDate(
              DateTime.parse(member.dateOfBirth),
            ),
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.caption.fontSize,
            ),
          )
        ],
      ),
    );
  }
}

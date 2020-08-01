import 'package:flutter/material.dart';
import 'package:izoneapp/data/profile.dart';
import 'package:izoneapp/pages/level_2/page_profile.dart';
import 'package:izoneapp/widgets/gradient_profile.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({Key key, this.profile}) : super(key: key);

  final Profile profile;

  Route _profileRoute(BuildContext context, Profile profile) {
    return MaterialPageRoute(
      builder: (context) => ProfilePage(
        profile: profile,
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
                      image: AssetImage(profile.imagePath),
                      fit: BoxFit.cover,
                    ),
                    ProfilePictureGradient(profile: profile, beginY: 1.0),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                          _profileRoute(context, profile),
                        ),
                        splashColor: Color.lerp(
                          profile.color.withOpacity(0.6),
                          Theme.of(context).primaryColor,
                          0.25,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    _profileRoute(context, profile),
                  ),
                  child: _ProfileTileLabel(profile: profile),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileTileLabel extends StatelessWidget {
  final Profile profile;

  const _ProfileTileLabel({Key key, this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          Text(
            '${profile.stageName}${profile.isBirthday ? " 🎂" : ""}',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline5.fontSize,
            ),
          ),
          Text(
            MaterialLocalizations.of(context).formatShortDate(
              DateTime.parse(profile.dateOfBirth),
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

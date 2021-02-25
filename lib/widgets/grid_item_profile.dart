import 'package:flutter/material.dart';
import 'package:izoneapp/data/profile.dart';
import 'package:izoneapp/pages/level_2/page_profile.dart';
import 'package:izoneapp/widgets/gradient_profile.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key key,
    @required this.profile,
    @required this.adHeight,
  }) : super(key: key);

  final Profile profile;
  final double adHeight;

  Route _profileRoute(BuildContext context, Profile profile) {
    return PageRouteBuilder<void>(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return Opacity(
              opacity: Interval(
                0.0,
                1.0,
                curve: Curves.fastOutSlowIn,
              ).transform(animation.value),
              child: ProfilePage(
                profile: profile,
                adHeight: adHeight,
              ),
            );
          },
        );
      },
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
                Hero(
                  tag: profile.imagePath,
                  child: Stack(
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
            '${profile.stageName ?? ""}${profile.isBirthday ? " 🎂" : ""}',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline5.fontSize,
            ),
          ),
          Text(
            MaterialLocalizations.of(context)
                .formatShortDate(profile.dateOfBirth),
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.caption.fontSize,
            ),
          )
        ],
      ),
    );
  }
}

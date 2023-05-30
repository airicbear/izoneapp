import 'package:flutter/material.dart';
import 'package:izoneapp/data/profile.dart';
import 'package:izoneapp/pages/level_2/page_profile.dart';
import 'package:izoneapp/widgets/gradient_box.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key? key,
    required this.profile,
  }) : super(key: key);

  final Profile profile;

  Route _profileRoute(BuildContext context, Profile profile) {
    return PageRouteBuilder<void>(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: Interval(
                0.0,
                1.0,
                curve: Curves.fastOutSlowIn,
              ).transform(animation.value),
              child: ProfilePage(
                profile: profile,
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
                Stack(
                  fit: StackFit.expand,
                  children: [
                    Hero(
                      tag: profile.imagePath,
                      child: Image(
                        image: AssetImage(profile.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    GradientBox(beginY: 1.0),
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
                  child: FittedBox(
                    child: Text(
                      '${profile.stageName ?? ""}${profile.isBirthday ? " 🎂" : ""}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

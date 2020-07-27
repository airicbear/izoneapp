import 'package:flutter/material.dart';
import 'package:izoneapp/pages/ProfilePageGallery.dart';
import 'package:izoneapp/pages/ProfilePageInfo.dart';
import 'package:izoneapp/data/Member.dart';
import 'package:izoneapp/pages/ViewPicturePage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key, @required this.member}) : super(key: key);

  final Member member;

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Widget> _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      ProfilePageInfo(member: widget.member),
      ProfilePageGallery(member: widget.member),
    ];
  }

  Widget _bottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      backgroundColor: Color.lerp(
        widget.member.color,
        Theme.of(context).primaryColor,
        0.5,
      ),
      selectedItemColor: Color.lerp(
        widget.member.color,
        Theme.of(context).textTheme.bodyText1.color,
        0.8,
      ),
      unselectedItemColor: Color.lerp(
        Colors.transparent,
        Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5),
        0.8,
      ),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          title: Text('Info'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          title: Text('Gallery'),
        ),
      ],
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  Widget _memberHero(context, height) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ViewPicturePage(
                memberImagePath: widget.member.getImagePath(),
                color: widget.member.color,
              );
            },
          ),
        );
      },
      child: Hero(
        tag: widget.member.getImagePath(),
        child: Image(
          image: AssetImage(widget.member.getImagePath()),
          fit: BoxFit.cover,
          height: height,
        ),
      ),
    );
  }

  Widget _memberHeroGradient(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.0, 0.8),
          end: Alignment(0.0, 0.0),
          colors: [
            Color.lerp(
              Theme.of(context).primaryColor,
              widget.member.color,
              0.45,
            ),
            Theme.of(context).primaryColor.withOpacity(0.1),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(context),
      backgroundColor: Color.lerp(
        Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
        widget.member.color,
        0.5,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return GlowingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              color: widget.member.color,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 430.0,
                    backgroundColor: Color.lerp(
                      Theme.of(context).primaryColor,
                      widget.member.color,
                      0.45,
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(widget.member.stageName),
                      centerTitle: true,
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          _memberHero(context, 470.0),
                          _memberHeroGradient(context),
                        ],
                      ),
                    ),
                  ),
                  _pages.elementAt(_selectedIndex),
                ],
              ),
            );
          } else {
            return Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(
                        children: [
                          Stack(
                            fit: StackFit.expand,
                            children: [
                              _memberHero(context, 470.0),
                              _memberHeroGradient(context),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: BackButton(
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          widget.member.stageName,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GlowingOverscrollIndicator(
                    axisDirection: AxisDirection.down,
                    color: widget.member.color,
                    child: CustomScrollView(
                      slivers: [
                        _pages.elementAt(_selectedIndex),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

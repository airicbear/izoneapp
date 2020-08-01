import 'dart:async';

import 'package:flutter/material.dart';
import 'package:izoneapp/pages/subpage_gallery_profile.dart';
import 'package:izoneapp/pages/subpage_info_profile.dart';
import 'package:izoneapp/data/member.dart';
import 'package:izoneapp/pages/page_view_picture.dart';
import 'package:izoneapp/widgets/gradient_member.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key, @required this.member}) : super(key: key);

  final Member member;

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Widget> _pages;
  int _selectedIndex = 0;
  StreamController<int> _pageController;

  @override
  void initState() {
    super.initState();
    _pages = [
      ProfilePageInfo(member: widget.member),
      ProfilePageGallery(member: widget.member),
    ];
    _pageController = StreamController();
    _pageController.stream.listen((index) {
      setState(() {
        _selectedIndex = index;
      });
    });
  }

  @override
  void dispose() {
    _pageController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _BottomNavBar(
        member: widget.member,
        index: _selectedIndex,
        controller: _pageController,
      ),
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
                          _MemberHero(member: widget.member, height: 470.0),
                          MemberPictureGradient(
                            member: widget.member,
                          ),
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
                              _MemberHero(member: widget.member, height: 470.0),
                              MemberPictureGradient(
                                member: widget.member,
                              ),
                            ],
                          ),
                          SafeArea(
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

class _BottomNavBar extends StatefulWidget {
  final Member member;
  final int index;
  final StreamController<int> controller;

  const _BottomNavBar({
    Key key,
    @required this.member,
    @required this.index,
    @required this.controller,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<_BottomNavBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.index,
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
          widget.controller.add(index);
        });
      },
    );
  }
}

class _MemberHero extends StatelessWidget {
  final Member member;
  final double height;

  const _MemberHero({Key key, this.member, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ViewPicturePage(
                path: member.imagePath,
                color: member.color,
              );
            },
          ),
        );
      },
      child: Hero(
        tag: member.imagePath,
        child: Image(
          image: AssetImage(member.imagePath),
          fit: BoxFit.cover,
          height: height,
        ),
      ),
    );
  }
}

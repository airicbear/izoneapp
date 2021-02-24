import 'dart:async';

import 'package:flutter/material.dart';
import 'package:izoneapp/data/app_themes.dart';
import 'package:izoneapp/data/profile.dart';
import 'package:izoneapp/pages/level_2/subpage_gallery_profile.dart';
import 'package:izoneapp/pages/level_2/subpage_info_profile.dart';
import 'package:izoneapp/pages/page_view_picture.dart';
import 'package:izoneapp/widgets/gradient_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key key,
    @required this.profile,
    @required this.adHeight,
  }) : super(key: key);

  final Profile profile;
  final double adHeight;

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String> _theme;
  List<Widget> _pages;
  int _selectedIndex = 0;
  StreamController<int> _pageController;

  @override
  void initState() {
    super.initState();
    _pages = [
      ProfilePageInfo(profile: widget.profile),
      ProfilePageGallery(profile: widget.profile),
    ];
    _pageController = StreamController();
    _pageController.stream.listen((index) {
      setState(() {
        _selectedIndex = index;
      });
    });
    _theme = _prefs.then((prefs) => prefs.getString('theme') ?? 'Auto');
  }

  @override
  void dispose() {
    _pageController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _theme,
      builder: (context, snapshot) {
        ThemeData _themeData =
            AppThemes.themes(context)[snapshot.data ?? 'Auto'];
        return Theme(
          data: _themeData,
          child: Container(
            margin: EdgeInsets.only(bottom: widget.adHeight),
            child: Scaffold(
              bottomNavigationBar: _BottomNavBar(
                profile: widget.profile,
                index: _selectedIndex,
                controller: _pageController,
              ),
              backgroundColor: Color.lerp(
                _themeData.scaffoldBackgroundColor,
                widget.profile.color,
                0.45,
              ),
              body: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 600) {
                    return GlowingOverscrollIndicator(
                      axisDirection: AxisDirection.down,
                      color: widget.profile.color,
                      child: CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            pinned: true,
                            expandedHeight: 430.0,
                            flexibleSpace: FlexibleSpaceBar(
                              title: Text(widget.profile.stageName),
                              centerTitle: true,
                              background: Stack(
                                fit: StackFit.expand,
                                children: [
                                  _ProfileHero(
                                    profile: widget.profile,
                                    height: 470.0,
                                  ),
                                  ProfilePictureGradient(
                                    profile: widget.profile,
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
                                      _ProfileHero(
                                        profile: widget.profile,
                                        height: 470.0,
                                      ),
                                      ProfilePictureGradient(
                                        profile: widget.profile,
                                      ),
                                    ],
                                  ),
                                  SafeArea(
                                    child: BackButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  widget.profile.stageName,
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: GlowingOverscrollIndicator(
                            axisDirection: AxisDirection.down,
                            color: widget.profile.color,
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
            ),
          ),
        );
      },
    );
  }
}

class _BottomNavBar extends StatefulWidget {
  final Profile profile;
  final int index;
  final StreamController<int> controller;

  const _BottomNavBar({
    Key key,
    @required this.profile,
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
        widget.profile.color,
        Theme.of(context).primaryColor,
        0.5,
      ),
      selectedItemColor: Color.lerp(
        widget.profile.color,
        Theme.of(context).textTheme.bodyText1.color,
        0.8,
      ),
      unselectedItemColor: Color.lerp(
        Color.lerp(widget.profile.color, Theme.of(context).primaryColor, 0.5),
        Theme.of(context).textTheme.bodyText1.color,
        0.5,
      ),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Info',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: 'Gallery',
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

class _ProfileHero extends StatelessWidget {
  final Profile profile;
  final double height;

  const _ProfileHero({Key key, this.profile, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ViewPicturePage(
                path: profile.imagePath,
                color: Color.lerp(Colors.black, profile.color, 0.5),
              );
            },
          ),
        );
      },
      child: Hero(
        tag: profile.imagePath,
        child: Image(
          image: AssetImage(profile.imagePath),
          fit: BoxFit.cover,
          height: height,
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:izoneapp/data/app_themes.dart';
import 'package:izoneapp/data/profile.dart';
import 'package:izoneapp/pages/level_2/subpage_gallery_profile.dart';
import 'package:izoneapp/pages/level_2/subpage_info_profile.dart';
import 'package:izoneapp/pages/page_view_picture.dart';
import 'package:izoneapp/widgets/gradient_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
    required this.profile,
  }) : super(key: key);

  final Profile profile;

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _theme;
  late List<Widget> _pages;
  int _selectedIndex = 0;
  late StreamController<int> _pageController;

  final _expandedHeight = 470.0;
  final _collapsedHeight = 80.0;

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
        // ThemeData _themeData =
        //     AppThemes.themes(context)[snapshot.data ?? 'Auto']!;
        ThemeData _themeData = Theme.of(context);
        return Theme(
          data: _themeData,
          child: Scaffold(
            bottomNavigationBar: _BottomNavBar(
              profile: widget.profile,
              index: _selectedIndex,
              controller: _pageController,
            ),
            backgroundColor: _themeData.scaffoldBackgroundColor,
            body: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        backgroundColor: _themeData.scaffoldBackgroundColor,
                        pinned: true,
                        collapsedHeight: _collapsedHeight,
                        expandedHeight: _expandedHeight,
                        flexibleSpace: LayoutBuilder(
                          builder: (_context, _constraints) {
                            return Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Opacity(
                                  opacity: (_constraints.biggest.height /
                                          (_expandedHeight + _collapsedHeight))
                                      .clamp(0.0, 1.0),
                                  child: _ProfileHero(
                                    profile: widget.profile,
                                    height: _expandedHeight + 50.0,
                                  ),
                                ),
                                Text(
                                  widget.profile.stageName,
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      _pages.elementAt(_selectedIndex),
                    ],
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
                                    GradientBox(),
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
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: CustomScrollView(
                          slivers: [
                            _pages.elementAt(_selectedIndex),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              },
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
    Key? key,
    required this.profile,
    required this.index,
    required this.controller,
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      selectedItemColor: Theme.of(context).textTheme.bodyLarge!.color,
      unselectedItemColor:
          Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.5),
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

class _ProfileHero extends StatefulWidget {
  final Profile profile;
  final double height;

  const _ProfileHero({
    Key? key,
    required this.profile,
    required this.height,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileHeroState();
}

class _ProfileHeroState extends State<_ProfileHero> {
  double kOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        kOpacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ViewPicturePage(
                path: widget.profile.imagePath,
                isNetwork: false,
              );
            },
          ),
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: widget.profile.imagePath,
            child: Image(
              image: AssetImage(widget.profile.imagePath),
              fit: BoxFit.cover,
              height: widget.height,
            ),
          ),
          AnimatedOpacity(
            opacity: kOpacity,
            duration: Duration(milliseconds: 100),
            child: GradientBox(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:izoneapp/data/DanceVideos.dart';
import 'package:izoneapp/data/MusicVideos.dart';
import 'package:izoneapp/generated/l10n.dart';
import 'package:izoneapp/pages/AboutPage.dart';
import 'package:izoneapp/widgets/MediaButtons.dart';
import 'package:izoneapp/pages/MembersPage.dart';
import 'package:izoneapp/widgets/AppMoreButton.dart';
import 'package:izoneapp/pages/YoutubeVideoListPage.dart';

enum Page { ABOUT, MEMBERS, DANCE, MV }

class AppPageView extends StatefulWidget {
  AppPageView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppPageViewState();
}

class _AppPageViewState extends State<AppPageView> {
  PageController _pageController;
  Page _page = Page.ABOUT;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _pageTitle(BuildContext context, String title, Page page) {
    return GestureDetector(
      onTap: () => _pageController.animateToPage(
        page.index,
        duration: const Duration(
          milliseconds: 1000,
        ),
        curve: Curves.fastLinearToSlowEaseIn,
      ),
      child: Text(
        title,
        style: _page != page
            ? TextStyle(
                color: Theme.of(context).disabledColor,
              )
            : null,
      ),
    );
  }

  Widget _pageViewAppBar(BuildContext context) {
    return AppBar(
      title: ButtonBar(
        alignment: MainAxisAlignment.start,
        children: [
          _pageTitle(context, S.of(context).about, Page.ABOUT),
          _pageTitle(context, S.of(context).members, Page.MEMBERS),
          _pageTitle(context, S.of(context).dance, Page.DANCE),
          _pageTitle(context, 'MV', Page.MV),
        ],
      ),
      actions: [
        AppMoreButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _pageViewAppBar(context),
      body: PageView(
        onPageChanged: (page) {
          setState(() {
            _page = Page.values[page];
          });
        },
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: [
          AboutPage(pageController: _pageController),
          MembersPage(pageController: _pageController),
          YoutubeVideoListPage(
            pageController: _pageController,
            videos: DanceVideos.videos(context),
          ),
          YoutubeVideoListPage(
            pageController: _pageController,
            videos: MusicVideos.videos(context),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: MediaButtons(),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:izoneapp/pages/AboutPage.dart';
import 'package:izoneapp/MediaButtons.dart';
import 'package:izoneapp/pages/MembersPage.dart';

enum Page { ABOUT, MEMBERS }

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
          _pageTitle(context, 'About', Page.ABOUT),
          _pageTitle(context, 'Members', Page.MEMBERS),
        ],
      ),
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
          AboutPage(
            pageController: _pageController,
          ),
          MembersPage(
            pageController: _pageController,
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

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:izoneapp/generated/l10n.dart';
import 'package:izoneapp/pages/AboutPage.dart';
import 'package:izoneapp/pages/DisclaimerPage.dart';
import 'package:izoneapp/pages/widgets/MediaButtons.dart';
import 'package:izoneapp/pages/MembersPage.dart';
import 'package:url_launcher/url_launcher.dart';

enum Page { ABOUT, MEMBERS }
enum More { DISCLAIMER, ABOUT }

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
        ],
      ),
      actions: [
        PopupMenuButton(
          onSelected: (More result) {
            switch (result) {
              case More.DISCLAIMER:
                showDialog(
                  context: context,
                  child: DisclaimerPage(),
                );
                break;
              case More.ABOUT:
                showAboutDialog(
                  context: context,
                  applicationIcon: Image.asset(
                    'assets/launcher_round.png',
                    width: 64,
                  ),
                  children: [
                    Text(
                        'This is an unofficial fan-made app dedicated to IZ*ONE and is free and open-source for everyone.'),
                    Divider(height: 24),
                    Text(
                        'If you want to contribute to this app, please visit the GitHub page at github.com/airicbear/izone-app using the button below.'),
                    FlatButton.icon(
                      label: Text('airicbear/izone-app'),
                      icon: FaIcon(FontAwesomeIcons.github),
                      onPressed: () =>
                          launch('https://github.com/airicbear/izone-app'),
                    ),
                    Divider(height: 24),
                    Text(
                        'If you want to support the development of this app, you can pay through PayPal using the button below.'),
                    FlatButton.icon(
                      label: Text('airicbear'),
                      icon: FaIcon(FontAwesomeIcons.paypal),
                      onPressed: () =>
                          launch('https://www.paypal.me/airicbear'),
                    ),
                  ],
                  applicationLegalese: '''
MIT License

Copyright (c) 2020 Eric Nguyen
                  ''',
                );
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<More>>[
            const PopupMenuItem<More>(
              value: More.DISCLAIMER,
              child: Text('Disclaimer'),
            ),
            const PopupMenuItem<More>(
              value: More.ABOUT,
              child: Text('About this app'),
            ),
          ],
        ),
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

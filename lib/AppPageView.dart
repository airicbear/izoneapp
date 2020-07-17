import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:izoneapp/pages/AboutPage.dart';
import 'package:izoneapp/MediaButtons.dart';
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
          _pageTitle(context, 'About', Page.ABOUT),
          _pageTitle(context, 'Members', Page.MEMBERS),
        ],
      ),
      actions: [
        PopupMenuButton(
          onSelected: (More result) {
            switch (result) {
              case More.DISCLAIMER:
                showDialog(
                  context: context,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text('Disclaimer'),
                    ),
                    body: ListView(
                      children: [
                        ListTile(
                          title: Text(
                            'Content rights',
                            textScaleFactor: 2.0,
                          ),
                          subtitle: Text(
                              'This is an unofficial fan-made app. This fan app and its content are not officially endorsed or produced by, nor associated with or affiliated with the music artist(s) or any associated entities of the artist(s), such as management or record label. All trademarks and copyrights are property of their respective owners.'),
                        ),
                        Column(
                          children: [
                            ListTile(
                              title: Text(
                                'Content accuracy',
                                textScaleFactor: 2.0,
                              ),
                              subtitle: Text(
                                  'The content in this app references multiple different sources. I strive to get the most accurate and up-to-date information as possible however it is not always possible. If you find that there is inaccurate information in this app please submit an issue on the GitHub page providing your sources and I will try to fix it as soon as possible.'),
                            ),
                            ButtonBar(
                              children: [
                                _githubButton('Submit an issue'),
                              ],
                            )
                          ],
                        ),
                        ListTile(
                          title: Text(
                            'References',
                            textScaleFactor: 2.0,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'There are several different sources referenced in this app including'),
                              FlatButton.icon(
                                onPressed: () => launch('http://iz-one.co.kr/'),
                                icon: FaIcon(FontAwesomeIcons.globeAmericas),
                                label: Text('The official IZ*ONE website'),
                              ),
                              FlatButton.icon(
                                onPressed: () =>
                                    launch('https://www.izone-official.com/'),
                                icon: FaIcon(FontAwesomeIcons.globeAmericas),
                                label:
                                    Text('The official IZ*ONE Japan website'),
                              ),
                              FlatButton.icon(
                                onPressed: () => launch(
                                    'https://kprofiles.com/izone-members-profile/'),
                                icon: FaIcon(FontAwesomeIcons.globeAmericas),
                                label: Text(
                                    'IZ*ONE Members Profile at KProfiles.com'),
                              ),
                              FlatButton.icon(
                                onPressed: () => launch(
                                    'https://kpop.fandom.com/wiki/IZ*ONE'),
                                icon: FaIcon(FontAwesomeIcons.globeAmericas),
                                label: Text('IZ*ONE FANDOM KPOP Wiki Page'),
                              ),
                              FlatButton.icon(
                                onPressed: () =>
                                    launch('https://dbkpop.com/group/izone'),
                                icon: FaIcon(FontAwesomeIcons.globeAmericas),
                                label: Text('dbkpop.com'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                    _githubButton('airicbear/izone-app'),
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

  Widget _githubButton(String label) {
    return FlatButton.icon(
      label: Text(label),
      icon: FaIcon(FontAwesomeIcons.github),
      onPressed: () => launch('https://github.com/airicbear/izone-app'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:izoneapp/generated/l10n.dart';

enum AppPage { HOME, ABOUT, MEMBERS, DANCE, MV }

class AppPageInfo {
  final String title;
  final String longTitle;
  final int index;
  final Icon icon;

  AppPageInfo({
    this.title,
    this.longTitle,
    this.index,
    this.icon,
  });
}

class AppPages {
  static AppPageInfo home(BuildContext context) =>
      pages(context)[AppPage.HOME.index];
  static AppPageInfo about(BuildContext context) =>
      pages(context)[AppPage.ABOUT.index];
  static AppPageInfo members(BuildContext context) =>
      pages(context)[AppPage.MEMBERS.index];
  static AppPageInfo dance(BuildContext context) =>
      pages(context)[AppPage.DANCE.index];
  static AppPageInfo mv(BuildContext context) =>
      pages(context)[AppPage.MV.index];

  static List<AppPageInfo> pages(BuildContext context) {
    return [
      AppPageInfo(
        title: S.of(context).home,
        longTitle: S.of(context).home,
        index: AppPage.HOME.index,
        icon: Icon(Icons.home),
      ),
      AppPageInfo(
        title: S.of(context).about,
        longTitle: 'About IZ*ONE',
        index: AppPage.ABOUT.index,
        icon: Icon(Icons.help),
      ),
      AppPageInfo(
        title: S.of(context).members,
        longTitle: 'Member profiles',
        index: AppPage.MEMBERS.index,
        icon: Icon(Icons.portrait),
      ),
      AppPageInfo(
        title: S.of(context).dance,
        longTitle: 'Dance videos',
        index: AppPage.DANCE.index,
        icon: Icon(FontAwesomeIcons.video),
      ),
      AppPageInfo(
        title: 'MV',
        longTitle: 'Music videos',
        index: AppPage.MV.index,
        icon: Icon(FontAwesomeIcons.video),
      ),
    ];
  }

  static void goToPage(
    AppPageInfo page,
    PageController pageController,
    ScrollController appBarController,
  ) {
    pageController.animateToPage(
      page.index,
      duration: const Duration(
        milliseconds: 1000,
      ),
      curve: Curves.fastLinearToSlowEaseIn,
    );

    appBarController.animateTo(
      page.index * 10.0,
      duration: Duration(milliseconds: 1000),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }
}

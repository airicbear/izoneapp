import 'package:flutter/material.dart';
import 'package:izoneapp/generated/l10n.dart';

enum AppPage { HOME, MEMBERS, DANCE, MV }

class AppPageInfo {
  final String title;
  final int index;

  AppPageInfo({
    this.title,
    this.index,
  });
}

class AppPages {
  static AppPageInfo home(BuildContext context) =>
      pages(context)[AppPage.HOME.index];
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
        index: AppPage.HOME.index,
      ),
      AppPageInfo(
        title: S.of(context).members,
        index: AppPage.MEMBERS.index,
      ),
      AppPageInfo(
        title: S.of(context).dance,
        index: AppPage.DANCE.index,
      ),
      AppPageInfo(
        title: 'MV',
        index: AppPage.MV.index,
      ),
    ];
  }
}

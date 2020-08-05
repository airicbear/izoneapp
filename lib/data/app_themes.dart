import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.purpleAccent,
        cardColor: Color.fromRGBO(35, 35, 35, 1.0),
        canvasColor: Colors.black,
      );

  static ThemeData get light => ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
        primaryColor: Colors.white,
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  static ThemeData get magenta => ThemeData(
        primaryColor: Color(0xffef539d),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xffef539d),
        accentColor: Color(0xfff7a9cd),
        cardColor: Color(0xfff16baa),
        canvasColor: Color(0xfff05fa3),
        backgroundColor: Color(0xfff05fa3),
      );

  static Map<String, ThemeData> themes(BuildContext context) {
    return {
      'Auto': Theme.of(context),
      'Dark': dark,
      'Light': light,
      'Magenta': magenta,
    };
  }
}

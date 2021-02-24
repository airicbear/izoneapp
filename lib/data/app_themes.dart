import 'package:flutter/material.dart';

class AppThemes {
  static MaterialColor get magentaColor => MaterialColor(
        0xFFEF539D,
        {
          50: Color(0xFFFACEE3),
          100: Color(0xFFF8B5D4),
          200: Color(0xFFF69CC6),
          300: Color(0xFFF484B8),
          400: Color(0xFFF16BAA),
          500: Color(0xFFef539d),
          600: Color(0xFFEB2883),
          700: Color(0xFFD2146C),
          800: Color(0xFFA81057),
          900: Color(0xFF7E0C41),
        },
      );

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        primarySwatch: magentaColor,
        accentColor: magentaColor,
        cardColor: Color.fromRGBO(35, 35, 35, 1.0),
        canvasColor: Colors.black,
      );

  static ThemeData get light => ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
        primaryColor: Colors.white,
        primarySwatch: magentaColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  static ThemeData get magenta => ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
        primaryColor: Color(0xFFEF539D),
        primarySwatch: magentaColor,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFFEF539D),
        accentColor: Color(0xFFF7A9CD),
        cardColor: Color(0xFFF16BAA),
        canvasColor: Color(0xFFF05FA3),
        backgroundColor: Color(0xFFF05FA3),
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

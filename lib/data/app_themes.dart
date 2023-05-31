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
        primaryColor: Colors.black,
        cardColor: Color.fromRGBO(35, 35, 35, 1.0),
        canvasColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: magentaColor)
            .copyWith(secondary: magentaColor)
            .copyWith(brightness: Brightness.dark),
      );

  static ThemeData get light => ThemeData(
        primaryColor: Colors.white,
        primarySwatch: magentaColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  static ThemeData get magenta => ThemeData(
        primaryColor: Color(0xFFEF539D),
        scaffoldBackgroundColor: Color(0xFFEF539D),
        cardColor: Color(0xFFF16BAA),
        canvasColor: Color(0xFFF05FA3),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: magentaColor)
            .copyWith(secondary: Color(0xFFF7A9CD))
            .copyWith(background: Color(0xFFF05FA3))
            .copyWith(brightness: Brightness.dark),
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

import 'package:flutter/material.dart';
import 'package:izoneapp/AppPageView.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:izoneapp/generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IZ*ONE',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.purpleAccent,
        cardColor: Color.fromRGBO(35, 35, 35, 1.0),
        canvasColor: Colors.black,
      ),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
        primaryColor: Colors.white,
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AppPageView(),
      localizationsDelegates: [
        const AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale.fromSubtags(
          languageCode: 'en',
          countryCode: 'US',
        ),
        const Locale.fromSubtags(
          languageCode: 'ko',
          countryCode: 'KO',
        ),
      ],
    );
  }
}

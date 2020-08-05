import 'package:flutter/material.dart';
import 'package:izoneapp/controllers/app_page_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:izoneapp/data/themes.dart';
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
      home: AppPageView(),
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemes.dark,
      theme: AppThemes.light,
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

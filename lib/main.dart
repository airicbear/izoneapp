import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:izoneapp/ad_manager.dart';
import 'package:izoneapp/controllers/app_page_view.dart';
import 'package:izoneapp/data/app_themes.dart';
import 'package:izoneapp/generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Future<void> _initAdMob() {
    return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initAdMob(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        return AppPageView();
      },
    );
  }
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

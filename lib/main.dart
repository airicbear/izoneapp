import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:izoneapp/controllers/app_page_view.dart';
import 'package:izoneapp/data/app_themes.dart';
import 'package:izoneapp/generated/l10n.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Future<InitializationStatus> _initGoogleMobileAds() {
  //   return MobileAds.instance.initialize();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: FutureBuilder<InitializationStatus>(
      // future: _initGoogleMobileAds(),
      // builder: (context, snapshot) => AppPageView(),
      // ),
      home: AppPageView(),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'l10n/messages_all.dart';

class AppLocalizations {
  AppLocalizations(this.localeName);

  final String localeName;

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        (locale.countryCode == null || locale.countryCode.isEmpty)
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      return AppLocalizations(localeName);
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: 'Name of the About page.',
      locale: localeName,
    );
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ko'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

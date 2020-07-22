// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Members`
  String get members {
    return Intl.message(
      'Members',
      name: 'members',
      desc: '',
      args: [],
    );
  }

  /// `Lyrics`
  String get lyrics {
    return Intl.message(
      'Lyrics',
      name: 'lyrics',
      desc: '',
      args: [],
    );
  }

  /// `Media`
  String get media {
    return Intl.message(
      'Media',
      name: 'media',
      desc: '',
      args: [],
    );
  }

  /// `IZ*ONE is an idol group formed through idol survival show Produce 48, a collaborative project between Korean music channel MNet's audition program Produce 101 and Japan's AKB48 idol group. The group features 12 members (nine Korean and three Japanese).\n\nThe group's debut album, COLOR*IZ, was released in Korea on October 29th, 2018. The album topped the charts in 10 countries, breaking the record for debut albums released by Korean girl groups. The group's debut also caused ripples in Japan, gaining traction in the media as one of the notable artists of 2019. On February 6th, 2019, the group made its Japan debut with the album Suki to Iwasetai under the auspices of producer Yasushi Akimoto.`
  String get aboutIzone {
    return Intl.message(
      'IZ*ONE is an idol group formed through idol survival show Produce 48, a collaborative project between Korean music channel MNet\'s audition program Produce 101 and Japan\'s AKB48 idol group. The group features 12 members (nine Korean and three Japanese).\n\nThe group\'s debut album, COLOR*IZ, was released in Korea on October 29th, 2018. The album topped the charts in 10 countries, breaking the record for debut albums released by Korean girl groups. The group\'s debut also caused ripples in Japan, gaining traction in the media as one of the notable artists of 2019. On February 6th, 2019, the group made its Japan debut with the album Suki to Iwasetai under the auspices of producer Yasushi Akimoto.',
      name: 'aboutIzone',
      desc: '',
      args: [],
    );
  }

  /// `Dance`
  String get dance {
    return Intl.message(
      'Dance',
      name: 'dance',
      desc: '',
      args: [],
    );
  }

  /// `Secret Story of the Swan`
  String get secretStoryOfTheSwan {
    return Intl.message(
      'Secret Story of the Swan',
      name: 'secretStoryOfTheSwan',
      desc: '',
      args: [],
    );
  }

  /// `Violeta`
  String get violeta {
    return Intl.message(
      'Violeta',
      name: 'violeta',
      desc: '',
      args: [],
    );
  }

  /// `La Vie en Rose`
  String get laVieEnRose {
    return Intl.message(
      'La Vie en Rose',
      name: 'laVieEnRose',
      desc: '',
      args: [],
    );
  }

  /// `We Together`
  String get weTogether {
    return Intl.message(
      'We Together',
      name: 'weTogether',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ko'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
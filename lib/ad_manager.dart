import 'dart:io';

class AdManager {
  static String get appId {
    if (Platform.isAndroid) {
      // Test ID
      // return "ca-app-pub-3940256099942544/3419835294";

      // Actual ID
      return "ca-app-pub-2754960959595614~1630853664";
    } else if (Platform.isIOS) {
      return "ca-app-pub-2754960959595614~1630853664";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      // Actual ID
      // return 'ca-app-pub-2754960959595614/3965827216';

      // Test ID
      return 'ca-app-pub-3940256099942544/2247696110';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/3986624511';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      // Test ID
      // return "ca-app-pub-3940256099942544/6300978111";

      // Actual ID
      return "ca-app-pub-2754960959595614/5079337607";
    } else if (Platform.isIOS) {
      return "ca-app-pub-2754960959595614/5079337607";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/7049598008";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/3964253750";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/8673189370";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/7552160883";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}

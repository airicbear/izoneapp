# IZ*ONE Fan App <img src="./assets/launcher_round.png" width="64" alt="App icon"/>

An unofficial fan-made app dedicated to [IZ*ONE](http://iz-one.co.kr/).

## Contributing

The easiest way to contribute to this app is to simply use it and give feedback on how the app can be improved.
You may [submit issues](https://github.com/airicbear/izone-app/issues) with your device specifications for any problems you are facing or for any feedback or suggestions.

Another way you can contribute is to add translations.
Edit each the `lib/l10n/intl_*.arb` files so that they all have the same fields and submit a pull request.

## Building

1. Install Flutter: https://flutter.dev/docs/get-started/install

    - Follow the web setup (get [Google Chrome](https://www.google.com/chrome/)): https://flutter.dev/docs/get-started/web

    - Follow the linux setup: https://flutter.dev/desktop

2. Install Android Studio: https://developer.android.com/studio

3. Install VS Code: https://code.visualstudio.com/

4. Install the following VS Code plugins:

    - Dart: https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code

    - Flutter: https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter

    - Flutter Intl: https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl

5. Git clone this repository

6. Use a `flutter build` command:

    - Android: `flutter build apk --split-per-abi`

    - Web: `flutter build web --release`

7. You can also just run the app using your editor's Run/Debug button or using the command line:

    - Android: `flutter run --release`

    - Web: `flutter run -d chrome`

    - Linux: `flutter run -d linux`

## Known Issues

### Web version

The Web version is *very* much not well supported.

1. Embedded Youtube videos don't work (see the [flutter_widget_from_html](https://pub.dev/packages/flutter_widget_from_html) package).

2. Cached network images don't work (see the [cached_network_image](https://pub.dev/packages/cached_network_image) package).

3. The most useful thing about the Web version is to share the app with others using a link.

The app might actually be better off using Image assets rather than cached network images, at least for pages such as the `AboutPage` and `MembersPage`.

### App layout

There is an issue with the [`PageController`](https://api.flutter.dev/flutter/widgets/PageController-class.html) going beyond the last page when the [`LayoutBuilder`](https://api.flutter.dev/flutter/widgets/LayoutBuilder-class.html) switches from vertical to horizontal layout.
This might be a bug concerning the use of [`CustomScrollView`](https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html) under a [`PageView`](https://api.flutter.dev/flutter/widgets/PageView-class.html), I'm not exactly sure.
It may be worth checking out the [`SliverLayoutBuilder`](https://api.flutter.dev/flutter/widgets/SliverLayoutBuilder-class.html) class.

### Embedded Youtube video (Android)

The audio from the embedded Youtube video persists if the app is not closed and the user decides to go out of the app or turns off their display.
I figure this may be more of a feature than a bug, though, potentially allowing for Youtube streaming without ads.

## References

- https://dbkpop.com/group/izone
- https://www.izone-official.com
- https://kprofiles.com/izone-members-profile/
- https://kpop.fandom.com/wiki/IZ*ONE
- http://iz-one.co.kr/photos/

## Developer Notes

I initially tried using SQLite hence the `assets/izoneapp.db` but then exported it to `assets/izone.json` after realizing how much easier it would be to just use JSON.
I'm keeping this method of editing the `.db` file and exporting to `.json` in case I want to use SQL in the future.

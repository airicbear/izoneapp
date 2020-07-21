import 'package:flutter_test/flutter_test.dart';
import 'package:izoneapp/data/Albums.dart';

void main() {
  test('Lyrics line count match test', () {
    Albums.albums(null).forEach((element) {
      element.songs.forEach((_element) {
        if (_element.lyrics.values.toList().length > 1) {
          expect(_element.lyrics.values.toList()[0].length,
              _element.lyrics.values.toList()[1].length);
        }
        if (_element.lyrics.values.toList().length > 2) {
          expect(_element.lyrics.values.toList()[1].length,
              _element.lyrics.values.toList()[2].length);
        }
        if (_element.lyrics.values.toList().length > 3) {
          expect(_element.lyrics.values.toList()[2].length,
              _element.lyrics.values.toList()[3].length);
        }
      });
    });
  });
}

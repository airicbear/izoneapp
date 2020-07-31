import 'dart:convert';

import 'package:izoneapp/data/izone_picture.dart';
import 'package:izoneapp/data/media_content.dart';
import 'package:http/http.dart' as http;

class IzonePictures implements MediaContent<IzonePicture> {
  static const izoneId = 127;
  final List<IzonePicture> pictures;

  IzonePictures({this.pictures});

  @override
  List<IzonePicture> tagged(List<String> tags) {
    List<IzonePicture> _taggedPictures = pictures.where((picture) {
      for (final tag in tags) {
        if (!picture.tags.contains(tag)) {
          return false;
        }
      }
      return true;
    }).toList();
    _taggedPictures.sort((a, b) => b.date.compareTo(a.date));
    return _taggedPictures;
  }

  static Future<List<IzonePicture>> search(String query) async {
    final response = await http.get(
        'https://dbkpop.com/wp-json/wp/v2/media?tags=$izoneId&search=$query&per_page=100');

    if (response.statusCode == 200) {
      return IzonePicture.fromJsonList(json.decode(response.body));
    } else {
      throw Exception('Failed to get picture from dbkpop.com.');
    }
  }
}

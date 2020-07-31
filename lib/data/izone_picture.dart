import 'package:flutter/foundation.dart';

class IzonePicture {
  final String path;
  final DateTime date;
  final String description;
  final List<String> tags;

  IzonePicture({
    @required this.path,
    @required this.date,
    @required this.description,
    @required this.tags,
  });
}

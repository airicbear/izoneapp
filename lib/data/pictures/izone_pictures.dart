import 'package:izoneapp/data/izone_picture.dart';
import 'package:izoneapp/data/media_content.dart';
import 'package:izoneapp/data/members/members.dart';

class IzonePictures implements MediaContent<IzonePicture> {
  static List<IzonePicture> _pictures;

  @override
  List<IzonePicture> tagged(List<String> tags) {
    List<IzonePicture> _taggedPictures = _pictures.where((picture) {
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

  static List<IzonePicture> oneiricDiaryPictures(number, ver) {
    const _dbkpopUrl = 'https://dbkpop.com/wp-content/uploads';
    List<String> memberNames = List.generate(
        Members.members.length,
        (index) => Members.members
            .elementAt(index)
            .fullName
            .replaceAll(' ', '_')
            .toLowerCase());
    return List.generate(
      memberNames.length,
      (index) => IzonePicture(
        path:
            '$_dbkpopUrl/2020/06/izone_oneiric_diary_teaser_$ver${number > 1 ? '_' + number.toString() : ""}_${memberNames.elementAt(index)}.jpg',
        date: DateTime(2020, 06, 03),
        description:
            'Oneiric Diary Teaser Photo $number (Diary ver.) ${Members.members.elementAt(index).fullName}',
        tags: [
          Members.members.elementAt(index).stageName.toLowerCase(),
          'oneiric-diary',
        ],
      ),
    );
  }

  IzonePictures() {
    _pictures = [
      ...oneiricDiaryPictures(1, 'diary'),
      ...oneiricDiaryPictures(2, 'diary'),
      ...oneiricDiaryPictures(3, 'diary'),
      ...oneiricDiaryPictures(4, 'oneiric_diary'),
    ];
  }
}

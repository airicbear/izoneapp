import 'package:izoneapp/data/izone_picture.dart';
import 'package:izoneapp/data/media_content.dart';

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

  IzonePictures() {
    _pictures = [
      IzonePicture(
        path:
            'https://dbkpop.com/wp-content/uploads/2020/06/izone_oneiric_diary_teaser_diary_an_yujin.jpg',
        date: DateTime(2020, 06, 03),
        description: 'Oneiric Diary Teaser Photo 1 (Diary ver.) An Yujin',
        tags: ['yujin', 'oneiric-diary'],
      ),
      IzonePicture(
        path:
            'https://dbkpop.com/wp-content/uploads/2020/06/izone_oneiric_diary_teaser_diary_jo_yuri.jpg',
        date: DateTime(2020, 06, 03),
        description: 'Oneiric Diary Teaser Photo 1 (Diary ver.) Jo Yuri',
        tags: ['yuri', 'oneiric-diary'],
      ),
      IzonePicture(
        path:
            'https://dbkpop.com/wp-content/uploads/2020/06/izone_oneiric_diary_teaser_diary_kim_chaewon.jpg',
        date: DateTime(2020, 06, 03),
        description: 'Oneiric Diary Teaser Photo 1 (Diary ver.) Kim Chaewon',
        tags: ['chaewon', 'oneiric-diary'],
      ),
      IzonePicture(
        path:
            'https://dbkpop.com/wp-content/uploads/2020/06/izone_oneiric_diary_teaser_diary_kwon_eunbi.jpg',
        date: DateTime(2020, 06, 03),
        description: 'Oneiric Diary Teaser Photo 1 (Diary ver.) Kwon Eunbi',
        tags: ['eunbi', 'oneiric-diary'],
      ),
      IzonePicture(
        path:
            'https://dbkpop.com/wp-content/uploads/2020/06/izone_oneiric_diary_teaser_diary_miyawaki_sakura.jpg',
        date: DateTime(2020, 06, 03),
        description:
            'Oneiric Diary Teaser Photo 1 (Diary ver.) Miyawaki Sakura',
        tags: ['sakura', 'oneiric-diary'],
      ),
      IzonePicture(
        path:
            'https://dbkpop.com/wp-content/uploads/2020/06/izone_oneiric_diary_teaser_diary_kang_hyewon.jpg',
        date: DateTime(2020, 06, 03),
        description: 'Oneiric Diary Teaser Photo 1 (Diary ver.) Kang Hyewon',
        tags: ['hyewon', 'oneiric-diary'],
      ),
      IzonePicture(
        path:
            'https://dbkpop.com/wp-content/uploads/2020/06/izone_oneiric_diary_teaser_diary_choi_yena.jpg',
        date: DateTime(2020, 06, 03),
        description: 'Oneiric Diary Teaser Photo 1 (Diary ver.) Choi Yena',
        tags: ['yena', 'oneiric-diary'],
      ),
      IzonePicture(
        path:
            'https://dbkpop.com/wp-content/uploads/2020/06/izone_oneiric_diary_teaser_diary_lee_chaeyeon.jpg',
        date: DateTime(2020, 06, 03),
        description: 'Oneiric Diary Teaser Photo 1 (Diary ver.) Lee Chaeyeon',
        tags: ['chaeyeon', 'oneiric-diary'],
      ),
      IzonePicture(
        path:
            'https://dbkpop.com/wp-content/uploads/2020/06/izone_oneiric_diary_teaser_diary_kim_minju.jpg',
        date: DateTime(2020, 06, 03),
        description: 'Oneiric Diary Teaser Photo 1 (Diary ver.) Kim Minju',
        tags: ['minju', 'oneiric-diary'],
      ),
      IzonePicture(
        path:
            'https://dbkpop.com/wp-content/uploads/2020/06/izone_oneiric_diary_teaser_diary_yabuki_nako.jpg',
        date: DateTime(2020, 06, 03),
        description: 'Oneiric Diary Teaser Photo 1 (Diary ver.) Yabuki Nako',
        tags: ['nako', 'oneiric-diary'],
      ),
      IzonePicture(
        path:
            'https://dbkpop.com/wp-content/uploads/2020/06/izone_oneiric_diary_teaser_diary_honda_hitomi.jpg',
        date: DateTime(2020, 06, 03),
        description: 'Oneiric Diary Teaser Photo 1 (Diary ver.) Honda Hitomi',
        tags: ['hitomi', 'oneiric-diary'],
      ),
      IzonePicture(
        path:
            'https://dbkpop.com/wp-content/uploads/2020/06/izone_oneiric_diary_teaser_diary_jang_wonyoung.jpg',
        date: DateTime(2020, 06, 03),
        description: 'Oneiric Diary Teaser Photo 1 (Diary ver.) Jang Wonyoung',
        tags: ['wonyoung', 'oneiric-diary'],
      ),
    ];
  }
}

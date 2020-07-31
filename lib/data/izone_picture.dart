class IzonePicture {
  final int id;
  final String path;
  final DateTime date;
  final String description;
  final List<String> tags;

  IzonePicture({
    this.id,
    this.path,
    this.date,
    this.description,
    this.tags,
  });

  factory IzonePicture.fromJson(Map<String, dynamic> json) {
    return IzonePicture(
      id: json['id'],
      path: json['source_url'],
      date: DateTime.parse(json['date']),
      description: json['alt_text'],
      tags:
          "${json['alt_text']}".split(' ').map((e) => e.toLowerCase()).toList(),
    );
  }

  static List<IzonePicture> fromJsonList(List<dynamic> json) {
    return List<IzonePicture>.generate(
        json.length, (index) => IzonePicture.fromJson(json[index]));
  }
}

class Member {
  final int id;
  final String birthplace;
  final String dateOfBirth;
  final String fullName;
  final String fullNameKorean;
  final String stageName;
  final String stageNameKorean;
  final int height;
  final String color;
  final String bloodType;
  final String company;

  Member({
    this.id,
    this.birthplace,
    this.dateOfBirth,
    this.fullName,
    this.fullNameKorean,
    this.stageName,
    this.stageNameKorean,
    this.height,
    this.color,
    this.bloodType,
    this.company,
  });

  int getAge() {
    return DateTime.now().difference(DateTime.parse(this.dateOfBirth)).inDays ~/
        365;
  }

  String getImagePath(String album) {
    return 'assets/images/$album/official-photo-4-${this.stageName.toLowerCase()}.jpg';
  }
}

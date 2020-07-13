class Member {
  final int id;
  final String birthplace;
  final String dateOfBirth;
  final String fullName;
  final String fullNameKorean;
  final String nationality;
  final String stageName;
  final String stageNameKorean;

  Member(
      {this.id,
      this.birthplace,
      this.dateOfBirth,
      this.fullName,
      this.fullNameKorean,
      this.nationality,
      this.stageName,
      this.stageNameKorean});

  int getAge() {
    return DateTime.now().difference(DateTime.parse(this.dateOfBirth)).inDays ~/
        365;
  }

  String getImagePath(String album) {
    return 'assets/images/$album/official-photo-3-${this.stageName.toLowerCase()}.jpg';
  }
}

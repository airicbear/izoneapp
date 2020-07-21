abstract class Song {
  final String title;
  final Duration length;
  final Map<String, List<String>> lyrics;

  Song({
    this.title,
    this.length,
    this.lyrics,
  });
}

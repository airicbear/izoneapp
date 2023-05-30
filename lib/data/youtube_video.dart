class YoutubeVideo {
  final String title;
  final String subtitle;
  final DateTime date;
  final String youtubeId;
  final bool restricted;
  final List<String> tags;

  YoutubeVideo({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.youtubeId,
    this.restricted = false,
    required this.tags,
  }) : assert(youtubeId.isNotEmpty);

  get url => 'https://www.youtube.com/embed/$youtubeId';
}

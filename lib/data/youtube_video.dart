class YoutubeVideo {
  final String title;
  final String subtitle;
  final DateTime date;
  final String youtubeId;
  final bool restricted;
  final List<String> tags;

  YoutubeVideo({
    this.title,
    this.subtitle,
    this.date,
    this.youtubeId,
    this.restricted = false,
    this.tags,
  }) : assert(youtubeId.isNotEmpty);

  get thumbnail => 'https://i.ytimg.com/vi/$youtubeId/sddefault.jpg';
  get url => 'https://www.youtube.com/embed/$youtubeId';
}

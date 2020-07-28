class YoutubeVideo {
  final String title;
  final String subtitle;
  final String date;
  final String youtubeId;
  final bool restricted;

  YoutubeVideo({
    this.title,
    this.subtitle,
    this.date,
    this.youtubeId,
    this.restricted = false,
  });

  get thumbnail => 'https://i.ytimg.com/vi/$youtubeId/sddefault.jpg';
  get url => 'https://www.youtube.com/embed/$youtubeId';
}

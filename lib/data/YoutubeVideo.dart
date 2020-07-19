class YoutubeVideo {
  final String title;
  final String subtitle;
  final String date;
  final String youtubeUrl;
  final bool restricted;

  YoutubeVideo(
      {this.title,
      this.subtitle,
      this.date,
      this.youtubeUrl,
      this.restricted = false});
}

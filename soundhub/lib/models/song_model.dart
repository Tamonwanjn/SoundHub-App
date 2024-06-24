class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
      title: 'Super Shy',
      description: 'NewJeans',
      url: 'assets/music/supershy.mp3',
      coverUrl: 'assets/images/supershy.jpg',
    ),
    Song(
      title: 'Vampire',
      description: 'Olivia Rodrigo',
      url: 'assets/music/vampire.mp3',
      coverUrl: 'assets/images/vampire.jpg',
    ),
    Song(
      title: 'Life Boy',
      description: '4EVE',
      url: 'assets/music/lifeboy1.mp3',
      coverUrl: 'assets/images/lifeboy.jpg',
    ),
  ];
}

class NewSong {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  NewSong(
      {required this.title,
      required this.description,
      required this.url,
      required this.coverUrl});

  static List<NewSong> newsongs = [
    NewSong(
      title: 'Speak Now', 
      description: 'Taylor Swift', 
      url: 'assets/music/supershy.mp3', 
      coverUrl: 'assets/images/speak.jpg'
    ),
    NewSong(
      title: 'Seven', 
      description: 'Jungkook', 
      url: 'assets/music/supershy.mp3', 
      coverUrl: 'assets/images/seven.jpg'
    ),
    NewSong(
      title: 'Unforgiven', 
      description: 'LE SSERAFIM', 
      url: 'assets/music/supershy.mp3', 
      coverUrl: 'assets/images/unforgiven.jpg'
    ),
  ];
}

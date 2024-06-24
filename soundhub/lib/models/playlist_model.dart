import 'song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<Playlist> playlists = [
    Playlist(
      title: 'My Playlist #1',
      songs: Song.songs,
      imageUrl:
          'https://newjeans.kr/imgs/getup/photos/NJ_GetUp_25.jpg',
    ),
    Playlist(
      title: 'My Playlist #2',
      songs: Song.songs,
      imageUrl:
          'https://newjeans.kr/imgs/getup/photos/NJ_GetUp_33.jpg',
    ),
  ];
}
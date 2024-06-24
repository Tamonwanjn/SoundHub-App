import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/playlist_model.dart';

class InPlaylistScreen extends StatelessWidget {
  const InPlaylistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? playlistData = Get.arguments;
    final Playlist playlist = playlistData != null
        ? Playlist(
            title: playlistData['name'],
            songs: [], // Replace with appropriate songs data
            imageUrl: 'https://newjeans.kr/imgs/getup/photos/NJ_GetUp_25.jpg',
          )
        : Playlist.playlists[0];

    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 17, 17, 17),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            playlist.title,
            style: TextStyle(
              color: Color.fromARGB(255, 234, 255, 247),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _PlaylistInformation(playlist: playlist),
                const SizedBox(height: 30),
                _PlaylistSongs(playlist: playlist),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaylistSongs extends StatelessWidget {
  const _PlaylistSongs({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: playlist.songs.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(
            '${index + 1}',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 73, 190, 183),
                ),
          ),
          title: Text(
            playlist.songs[index].title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 234, 255, 247),
                ),
          ),
          subtitle: Text(
            playlist.songs[index].description,
            style: const TextStyle(
              color: Color.fromARGB(255, 234, 255, 247),
            ),
          ),
          trailing: const Icon(
            Icons.play_circle,
            color: Color.fromARGB(255, 73, 190, 183),
          ),
        );
      },
    );
  }
}

class _PlaylistInformation extends StatelessWidget {
  const _PlaylistInformation({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.network(
            playlist.imageUrl,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          playlist.title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 234, 255, 247),
              ),
        ),
      ],
    );
  }
}

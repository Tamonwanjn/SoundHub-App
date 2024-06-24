import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:project_soundhub/widgets/section_header.dart';
import 'package:project_soundhub/widgets/song_card.dart';
import 'package:project_soundhub/widgets/newsong_card.dart';

import '../models/song_model.dart';
import '../models/newsong_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<NewSong> newsongs = NewSong.newsongs;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 17, 17, 17),
            Color.fromARGB(255, 17, 17, 17),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _ImageSlideshow(),
              _MusicTrending(songs: songs),
              _NewReleases(songs: songs, newsongs: newsongs),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewReleases extends StatelessWidget {
  const _NewReleases({
    super.key,
    required this.songs,
    required this.newsongs,
  });

  final List<Song> songs;
  final List<NewSong> newsongs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 20.0,
        bottom: 20.0,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SectionHeader(title: 'New Releases'),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return NewSongCard(newsong: newsongs[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MusicTrending extends StatelessWidget {
  const _MusicTrending({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 20.0,
        bottom: 20.0,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SectionHeader(title: 'Music Trending'),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(song: songs[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageSlideshow extends StatelessWidget {
  const _ImageSlideshow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: ImageSlideshow(
            width: double.infinity,
            height: 200,
            initialPage: 0,
            indicatorColor: const Color.fromARGB(255, 73, 190, 183),
            indicatorBackgroundColor: const Color.fromARGB(255, 234, 255, 247),
            onPageChanged: (value) {
              debugPrint('Page changed: $value');
            },
            autoPlayInterval: 3000,
            isLoop: true,
            children: [
              Image.asset(
                "assets/NewJeans.jpg",
                fit: BoxFit.cover,
              ),
              Image.asset(
                "assets/Taylor.jpg",
                fit: BoxFit.cover,
              ),
              Image.asset(
                "assets/LESSERAFIM.jpg",
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(
        Icons.menu,
        color: Color.fromARGB(
            255, 73, 190, 183), // Set the color of the leading icon
      ),
      title: const Align(
        // Wrap the title text with an Align widget
        alignment: Alignment.center,
        child: Text(
          'Discover', // Add your desired text here
          style: TextStyle(
            color:
                Color.fromARGB(255, 234, 255, 247), // Set the color of the text
            fontSize: 25, // Set the font size of the text
            fontWeight: FontWeight.bold, // Set the font weight of the text
          ),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const Icon(
            Icons.more_horiz,
            color: Color.fromARGB(
                255, 73, 190, 183), // Set the color of the action icon
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

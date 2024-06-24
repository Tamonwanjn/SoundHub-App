import 'package:flutter/material.dart'; // import ไลบรารี Line Awesome Flutter

import '../widgets/browse_card.dart';
import '../widgets/search_input.dart';
import '../widgets/section_header.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: SearchInput(),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SectionHeader(title: 'Browse all'),
                  ],
                ),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  BrowseCard(
                    title: 'Made For You',
                    color1: '#E02FCF',
                    color2: '#00C188',
                  ),
                  BrowseCard(
                    title: 'Charts',
                    color1: '#0A3CEC',
                    color2: '#4DD4AC',
                  ),
                  BrowseCard(
                    title: 'Discover',
                    color1: '#0A3CEC',
                    color2: '#D9DD01',
                  ),
                  BrowseCard(
                    title: 'New Release',
                    color1: '#0E31AE',
                    color2: '#DD1010',
                  ),
                  BrowseCard(
                    title: 'Thai Music',
                    color1: '#00897b',
                    color2: '#ffc107',
                  ),
                  BrowseCard(
                    title: 'K-Pop',
                    color1: '#f57c00',
                    color2: '#7e57c2',
                  ),
                  BrowseCard(
                    title: 'Hip-Hop',
                    color1: '#e51c23',
                    color2: '#673ab7',
                  ),
                  BrowseCard(
                    title: 'R&B',
                    color1: '#3f51b5',
                    color2: '#7cb342',
                  ),
                  BrowseCard(
                    title: 'Rock',
                    color1: '#1a237e',
                    color2: '#26c6da',
                  ),
                  BrowseCard(
                    title: 'Top-Hits',
                    color1: '#ff5722',
                    color2: '#ec407a',
                  ),
                ],
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
      title: const Align(
        alignment: Alignment.center,
        child: Text(
          'My Playlist',
          style: TextStyle(
            color: Color.fromARGB(255, 234, 255, 247),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(66.0);
}

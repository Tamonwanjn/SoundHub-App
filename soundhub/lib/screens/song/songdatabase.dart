import 'package:flutter/material.dart';
import 'package:project_soundhub/screens/song_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiEndpoint = 'http://10.10.11.85/flutter_sh';

class Song {
  final String image;
  final String title;

  Song({required this.image, required this.title});

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      image: json['image'],
      title: json['title'],
    );
  }
}

class SongListScreen extends StatefulWidget {
  @override
  _SongListScreenState createState() => _SongListScreenState();
}

class _SongListScreenState extends State<SongListScreen> {
  List<Song> songs = [];

  Future<void> fetchSongs() async {
    final response = await http.get(Uri.parse('$apiEndpoint/readsong.php'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        songs = jsonData.map((item) => Song.fromJson(item)).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            255, 17, 17, 17), // กำหนดสีพื้นหลัง AppBar เป็นสีดำ
        elevation: 0, // กำหนด elevation เป็น 0 เพื่อลบเส้นด้านล่างของ AppBar
        title: Text(
          'Song List',
          style: TextStyle(
            color: const Color.fromARGB(
                255, 234, 255, 243), // กำหนดสีข้อความเป็นสีขาว
          ),
        ),
      ),
      backgroundColor:
          const Color.fromARGB(255, 17, 17, 17), // กำหนดสีพื้นหลังแอปเป็นสีดำ
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0), // เพิ่มระยะห่างด้านบน
        child: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            final song = songs[index];
            return Column(
              children: [
                ListTile(
                  leading: Image.network(song.image),
                  title: Text(
                    song.title,
                    style: TextStyle(
                      color: const Color.fromARGB(
                          255, 234, 255, 243), // กำหนดสีข้อความเป็นสีขาว
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SongScreen(), // ส่งข้อมูลเพลงไปยัง SongScreen
                        ),
                      );
                    },
                    child: Icon(
                      Icons.play_circle,
                      color: Color.fromARGB(255, 73, 190, 183),
                    ),
                  ),
                ),

                SizedBox(height: 8), // กำหนดระยะห่างด้านล่าง
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_soundhub/screens/inplaylist_screen.dart';
// import 'package:project_soundhub/screens/song/songdatabase.dart';
import 'dart:convert';
import '../models/playlist_model.dart';
import '../screens/playlist/createplaylist.dart';
import '../screens/playlist/update.dart';

const String apiEndpoint =
    'http://10.10.11.85/flutter_sh'; // Replace with your API endpoint

class PlaylistScreen extends StatefulWidget {
  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  List<dynamic> data = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('$apiEndpoint/read.php'));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> deleteData(String id) async {
    final response = await http.post(
      Uri.parse('$apiEndpoint/delete.php'),
      body: {'id': id},
    );
    if (response.statusCode == 200) {
      fetchData();
    }
  }

  Future<void> updatePlaylist(
      String id, String newName, String newDescription) async {
    final response =
        await http.post(Uri.parse('$apiEndpoint/update.php'), body: {
      'id': id,
      'name': newName,
      'description': newDescription,
    });

    if (response.statusCode == 200) {
      // Data updated successfully
      // Manually update the data in the list
      final index = data.indexWhere((playlist) => playlist['id'] == id);
      if (index != -1) {
        setState(() {
          data[index]['name'] = newName;
          data[index]['description'] = newDescription;
        });
      }
    }
  }

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _CustomAppBar(),
        body: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final playlistData = data[index];
            final playlist = Playlist(
              title: playlistData['name'],
              songs: [], // Replace with the appropriate songs data
              imageUrl: playlistData['image'],
            );

            return Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 90,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withOpacity(0.5), // Set shadow color
                          blurRadius: 5, // Set blur radius
                          offset: Offset(0, 3), // Set shadow offset
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(playlist.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  playlist.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 234, 255, 247),
                  ),
                ),
                subtitle: Text(
                  playlistData[
                      'description'], // Add this line to display the description
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 166, 166, 166),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      color: const Color.fromARGB(255, 73, 190, 183),
                      onPressed: () {
                        // Show delete confirmation dialog
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              'Confirm Delete',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 234, 255, 247),
                              ),
                            ),
                            content: Text(
                              'Are you sure you want to delete this file?',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 234, 255, 247),
                              ),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 17, 17, 17),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 73, 190, 183),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Delete data
                                  deleteData(data[index]['id']);
                                },
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert), // Add the "more vert" icon
                      color: const Color.fromARGB(255, 73, 190, 183),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdatePlaylistScreen(
                              data: data[
                                  index], // Send the selected playlist data
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                onTap: () async {
                  // Navigate to InPlaylistScreen
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InPlaylistScreen()),
                  );
                  if (result == true) {
                    // Refresh the list after returning from InPlaylistScreen
                    fetchData();
                  }
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // Navigate to the create screen
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreatePlaylistScreen()),
            );
            if (result == true) {
              // Refresh the list after returning from the create screen
              fetchData();
            }
          },
          backgroundColor: Color.fromARGB(255, 73, 190, 183),
          child: Icon(Icons.add),
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

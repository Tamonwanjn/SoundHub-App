import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

const String apiEndpoint = 'http://10.10.11.85/flutter_sh';

class UpdatePlaylistScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  UpdatePlaylistScreen({required this.data});

  @override
  _UpdatePlaylistScreenState createState() => _UpdatePlaylistScreenState();
}

class _UpdatePlaylistScreenState extends State<UpdatePlaylistScreen> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController imageController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.data['name']);
    descriptionController =
        TextEditingController(text: widget.data['description']);
    imageController = TextEditingController(text: widget.data['image']);
  }

  // UpdatePlaylist data via API
  Future<void> UpdatePlaylistData(
      String id, String newName, String newdescription, String newimage) async {
    final response =
        await http.post(Uri.parse('$apiEndpoint/update.php'), body: {
      'id': id,
      'name': newName,
      'description': newdescription,
      'image': newimage,
    });

    if (response.statusCode == 200) {
      // Data UpdatePlaylistd successfully
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 17, 17),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 17, 17, 17),
        centerTitle: true,
        elevation: 0,
        title: Text(
          '${widget.data['name']}',
          style: TextStyle(
            color: Color.fromARGB(255, 234, 255, 247),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                        widget.data['image']), // โหลดรูปภาพจาก URL ใน 'image'
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Enter Image URL'),
                            content: TextField(
                              controller: imageController,
                              decoration: InputDecoration(
                                labelText: 'Image URL',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 234, 255,
                                      247), // Set the label text color
                                ),
                              ),
                              style: TextStyle(
                                color: Color.fromARGB(255, 234, 255,
                                    247), // Set the input text color
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Color.fromARGB(
                                        255, 255, 7, 7), // Set the text color
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Update the image in the UI
                                  setState(() {});
                                },
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 73, 190,
                                        183), // Set the text color
                                  ),
                                ),
                              ),
                            ],
                            backgroundColor: Color.fromARGB(255, 17, 17, 17),
                          ),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 73, 190, 183),
                        ),
                        child: const Icon(
                          LineAwesomeIcons.alternate_pencil,
                          color: Color.fromARGB(255, 234, 255, 247),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 73, 190, 183),
                    fontSize: 26,
                  ),
                ),
                style: TextStyle(
                  color: Color.fromARGB(255, 234, 255, 247),
                  fontSize: 16, // สีตัวอักษรใน input field
                ),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 73, 190, 183),
                    fontSize: 26, // สีตัวอักษรใน label
                  ),
                ),
                style: TextStyle(
                  color: Color.fromARGB(255, 234, 255, 247),
                  fontSize: 16, // สีตัวอักษรใน input field
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // UpdatePlaylist data
                  UpdatePlaylistData(
                    widget.data['id'],
                    nameController.text,
                    descriptionController.text,
                    imageController.text,
                  );
                },
                child: Text('Update Playlist'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 73, 190, 183), // สีพื้นหลังปุ่ม
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

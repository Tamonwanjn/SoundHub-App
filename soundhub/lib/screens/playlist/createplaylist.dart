import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

const String apiEndpoint =
    'http://10.10.11.85/flutter_sh'; // Replace with your API endpoint

class CreatePlaylistScreen extends StatefulWidget {
  @override
  _CreatePlaylistScreenState createState() => _CreatePlaylistScreenState();
}

class _CreatePlaylistScreenState extends State<CreatePlaylistScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  String imageUrl = ''; // Store the selected image URL

  Future<void> addData(BuildContext context, String name, String description,
      String image) async {
    final response = await http.post(
      Uri.parse('$apiEndpoint/create.php'),
      body: {
        'name': name,
        'description': description,
        'image': image,
      },
    );

    print({
      'name': name,
      'description': description,
      'image': image,
    });

    if (response.statusCode == 200) {
      print('Data added successfully');
      print('Response body: ${response.body}');
      Navigator.pop(context, true);
    } else {
      print('Failed to add data');
      print('Response status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 17, 17),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 17, 17),
        centerTitle: true,
        elevation: 0, // Add this line to remove the shadow under AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'ตั้งชื่อเพลย์ลิสต์ใหม่เลย',
                style: TextStyle(
                  fontSize: 30, // ขนาด 20px
                  fontWeight: FontWeight.bold, // ตัวหนา
                ),
              ),
              SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // เปลี่ยนจาก 50 เป็น 10
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // สีเงา
                          blurRadius: 8, // รัศมีของเงา
                          offset: Offset(0, 4), // ตำแหน่งเงา (x, y)
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://thumbs.dreamstime.com/b/favorite-playlist-line-icon-music-star-linear-style-sign-mobile-concept-web-design-note-outline-vector-symbol-logo-275600048.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
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
                ],
              ),
              SizedBox(height: 15),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 73, 190, 183),
                  ), // Change label text color
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 234, 255, 247),
                ), // Change input text color
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 73, 190, 183),
                  ), // Change label text color
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 234, 255, 247),
                ), // Change input text color
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Add new data
                  addData(context, nameController.text,
                      descriptionController.text, imageController.text);
                },
                child: Text('Create'),
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

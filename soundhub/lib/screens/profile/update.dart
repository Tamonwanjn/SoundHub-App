import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 17, 17),
        elevation: 0, // เพิ่มบรรทัดนี้เพื่อลบเส้นสีดำใต้ AppBar
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(color: const Color.fromARGB(255, 234, 255, 247)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // -- IMAGE with ICON
              Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(50), // Rounded corners
                      image: DecorationImage(
                        image: AssetImage("assets/jum.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(255, 73, 190, 183),
                      ),
                      child: const Icon(
                        LineAwesomeIcons.camera,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                          color: const Color.fromARGB(255, 234, 255, 247)),
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 234, 255, 247)),
                        prefixIcon: Icon(LineAwesomeIcons.user,
                            color: const Color.fromARGB(255, 234, 255, 247)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      style: TextStyle(
                          color: const Color.fromARGB(255, 234, 255, 247)),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 234, 255, 247)),
                        prefixIcon: Icon(LineAwesomeIcons.envelope_1,
                            color: const Color.fromARGB(255, 234, 255, 247)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      style: TextStyle(
                          color: const Color.fromARGB(255, 234, 255, 247)),
                      decoration: const InputDecoration(
                        labelText: 'Phone No',
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 234, 255, 247)),
                        prefixIcon: Icon(LineAwesomeIcons.phone,
                            color: const Color.fromARGB(255, 234, 255, 247)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 234, 255, 247)),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 234, 255, 247)),
                        prefixIcon: Icon(Icons.fingerprint,
                            color: const Color.fromARGB(255, 234, 255, 247)),
                        suffixIcon: IconButton(
                          icon: Icon(LineAwesomeIcons.eye_slash,
                              color: const Color.fromARGB(255, 234, 255, 247)),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Implement your profile update logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 73, 190, 183),
                          shape: StadiumBorder(),
                        ),
                        child: const Text('Edit Profile',
                            style: TextStyle(
                                color:
                                    const Color.fromARGB(255, 234, 255, 247))),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // -- Delete Button
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Logout'),
                            content:
                                const Text('Are you sure, you want to logout?'),
                            backgroundColor:
                                Colors.black, // Set background color to black
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // TODO: Perform logout action
                                  Navigator.of(context).pop();
                                },
                                style: TextButton.styleFrom(
                                  primary: Color.fromARGB(255, 73, 190,
                                      183), // Set text color to white
                                ),
                                child: const Text('Yes'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: TextButton.styleFrom(
                                  primary: Color.fromARGB(255, 73, 190,
                                      183), // Set text color to white
                                ),
                                child: const Text('No'),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.withOpacity(0.1),
                        elevation: 0,
                        primary: Colors.red,
                        shape: StadiumBorder(),
                        side: BorderSide.none,
                      ),
                      child: const Text('Delete Profile',
                          style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

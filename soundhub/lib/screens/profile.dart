import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project_soundhub/controller/auth_controller.dart';

import '../screens/profile/profilemenu.dart';
import '../screens/profile/update.dart';
import '../models/playlist_model.dart';
import '../widgets/playlist_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 17, 17),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 17, 17),
        centerTitle: true,
        elevation: 0, // เพิ่มบรรทัดนี้เพื่อลบเส้นสีดำใต้ AppBar
        title: Text('Profile',
            style: TextStyle(
              color: const Color.fromARGB(255, 234, 255, 247),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(isDark ? LineAwesomeIcons.cog : LineAwesomeIcons.cog),
            color: Color.fromARGB(255, 73, 190, 183),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
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
                        LineAwesomeIcons.alternate_pencil,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                '@Jumming',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: const Color.fromARGB(255, 234, 255, 247),
                      fontSize: 18,
                    ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  Text(
                    '10k Followers',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 234, 255, 247),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    '100 Following',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 234, 255, 247),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UpdateProfileScreen())),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 73, 190, 183),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text('Edit Profile',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 17, 17, 17),
                      )),
                ),
              ),
              const SizedBox(height: 5),
              // แสดงเพลย์ลิสต์และเพลงในเพลย์ลิสต์
              const SizedBox(height: 20),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text('My Playlists',
              //       style: TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //           color: const Color.fromARGB(255, 234, 255, 247))),
              // ),
              // _PlaylistSection(
              //     playlists: Playlist.playlists), //โค้ดเพลย์ลิสต์เก่า
              // const SizedBox(height: 5),
              // const Divider(),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Profile Settings',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 234, 255, 247))),
              ),
              ProfileMenuWidget(
                title: 'Settings',
                icon: LineAwesomeIcons.user,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: 'Billing Details',
                icon: LineAwesomeIcons.wallet,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: 'Information',
                icon: LineAwesomeIcons.info,
                onPress: () {},
              ),
              GestureDetector(
                onTap: () {
                  AuthController.instance.logOut();
                },
                child: ProfileMenuWidget(
                  title: 'Logout',
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Logout'),
                        content:
                            const Text('Are you sure, you want to logout?'),
                        backgroundColor: Colors.black,
                        actions: [
                          TextButton(
                            onPressed: () {
                              // TODO: Perform logout action
                              AuthController.instance.logOut();
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(
                              primary: Color.fromARGB(255, 73, 190, 183),
                            ),
                            child: const Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(
                              primary: Color.fromARGB(255, 73, 190, 183),
                            ),
                            child: const Text('No'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlaylistSection extends StatelessWidget {
  final List<Playlist> playlists;

  _PlaylistSection({required this.playlists});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: playlists.length,
      itemBuilder: ((context, index) {
        return PlaylistCard(playlist: playlists[index]);
      }),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_soundhub/controller/auth_controller.dart';
import 'package:project_soundhub/screens/inplaylist_screen.dart';
import 'package:project_soundhub/screens/song_screen.dart';
import 'package:project_soundhub/screens/splash.dart';
import 'package:project_soundhub/screens/profile.dart';
import 'package:project_soundhub/screens/search.dart';
import 'screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SoundHub',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: const Color.fromARGB(255, 234, 255, 247),
              displayColor: Colors.black,
            ),
      ),
      home: const SplashScreen(),
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/song', page: () => const SongScreen()),
        GetPage(name: '/playlist', page: () => const InPlaylistScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
        GetPage(name: '/search', page: () => const SearchScreen()),
      ],
    );
  }
}

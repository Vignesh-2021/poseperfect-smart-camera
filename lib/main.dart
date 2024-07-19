import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oppo1/Pages/camera.dart';
import 'package:oppo1/Pages/poses.dart';
import 'package:oppo1/Pages/profile.dart';
import 'package:oppo1/Pages/search.dart';
import 'package:oppo1/logs/wrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pose Perfect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home:  const Wapper(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentindex = 2;
  List screens = [
    const Poses(),
    const Search(),
    const CameraScreen(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        onTap: (value) {
          setState(() => currentindex = value);
        },
        selectedItemColor: const Color(0xffFFFFFF),
        unselectedItemColor: const Color(0xffFFFFFF),
        items: const [
          BottomNavigationBarItem(
            label: ('Poses'),
            icon: Icon(Icons.image_outlined,color: Colors.white),
            backgroundColor: Color(0xFF4D243D),
          ),
          BottomNavigationBarItem(
            label: ('Search'),
            icon: Icon(Icons.image_search,color: Colors.white),
            backgroundColor: Color(0xFF4D243D),
          ),
          BottomNavigationBarItem(
            label: ('Camera'),
            icon: Icon(Icons.camera_alt_outlined,color: Colors.white),
            backgroundColor: Color(0xFF4D243D),
          ),
          BottomNavigationBarItem(
            label: ('Profile'),
            icon: Icon(Icons.perm_identity_rounded,color: Colors.white),
            backgroundColor: Color(0xFF4D243D),
          ),
        ],
      ),
    );
  }
}

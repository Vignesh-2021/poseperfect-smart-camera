import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oppo1/Pages/about.dart';
import 'package:oppo1/Pages/privacy.dart';
import 'package:oppo1/logs/signIn.dart'; // Make sure this import path is correct

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  signout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInPage()),
      );
      print("Sign-out successful, navigating to SignInPage.");
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff6cb),
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xffecdcc9),
          ),
        ),
        backgroundColor: const Color(0xff4d243d),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white), // Added this line to change the back button color to white
      ),
      body: Column(
        children: [
          _SettingsBox(
            title: 'Privacy',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyPage()),
              );
            },
          ),
          _SettingsBox(
            title: 'About Us',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUsPage()),
              );
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: signout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff4d243d),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffecdcc9),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsBox extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _SettingsBox({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xffecdcc9),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffd0a98f).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff4d243d),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Color(0xff4d243d)),
          ],
        ),
      ),
    );
  }
}

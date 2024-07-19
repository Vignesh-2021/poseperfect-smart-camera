import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'settings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  File? _image;
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      final DatabaseReference userRef = _database.reference().child('users').child(user.uid);
      final DataSnapshot snapshot = await userRef.once() as DataSnapshot;

      final Map<dynamic, dynamic>? userDoc = snapshot.value as Map<dynamic, dynamic>?;

      if (userDoc != null) {
        setState(() {
          _nameController.text = userDoc['username'] ?? '';
          _emailController.text = userDoc['email'] ?? '';
          _locationController.text = userDoc['location'] ?? '';
          _dobController.text = userDoc['dateOfBirth'] ?? '';
          _profileImageUrl = userDoc['profileImage'] ?? '';
        });
      }
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveProfile() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      String? profileImageUrl = _profileImageUrl; // Initialize with current profile image URL

      // Check if there's a new image selected
      if (_image != null) {
        // Upload image to Firebase Storage
        final Reference storageRef = _storage.ref().child('profileImages/${user.uid}');
        await storageRef.putFile(_image!);
        // Get download URL of uploaded image
        profileImageUrl = await storageRef.getDownloadURL();
      }

      // Update user profile data in Realtime Database
      final DatabaseReference userRef = _database.reference().child('users').child(user.uid);
      await userRef.update({
        'username': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'location': _locationController.text.trim(),
        'dateOfBirth': _dobController.text.trim(),
        'profileImage': profileImageUrl ?? '', // Ensure to set a default value if null
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );

      // Update local state with new profile image URL
      setState(() {
        _profileImageUrl = profileImageUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff6cb),
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back button
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xffecdcc9),
          ),
        ),
        backgroundColor: const Color(0xff4d243d),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xffecdcc9)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _image != null
                            ? FileImage(_image!)
                            : _profileImageUrl != null
                            ? NetworkImage(_profileImageUrl!) as ImageProvider
                            : const AssetImage(
                            'assets/images/profile_placeholder.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xffecdcc9),
                          radius: 18,
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera_alt,
                              size: 20,
                              color: Color(0xff4d243d),
                            ),
                            onPressed: _pickImage,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              Column(
                children: <Widget>[
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor: const Color(0xffd0a98f).withOpacity(0.5),
                      filled: true,
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor: const Color(0xffd0a98f).withOpacity(0.5),
                      filled: true,
                      prefixIcon: const Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      hintText: "Location",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor: const Color(0xffd0a98f).withOpacity(0.5),
                      filled: true,
                      prefixIcon: const Icon(Icons.location_on),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _dobController,
                    decoration: InputDecoration(
                      hintText: "Date of Birth",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor: const Color(0xffd0a98f).withOpacity(0.5),
                      filled: true,
                      prefixIcon: const Icon(Icons.calendar_today),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 20, color: Color(0xffecdcc9)),
                ),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 120),
                  backgroundColor: const Color(0xff4d243d),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

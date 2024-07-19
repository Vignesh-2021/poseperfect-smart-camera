import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({Key? key}) : super(key: key);

  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String? _uploadedImageUrl;
  bool _uploadingImage = false;

  Future pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No image selected.')),
        );
      }
    });
  }

  Future uploadImage() async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image to upload.')),
      );
      return;
    }

    setState(() {
      _uploadingImage = true; // Set uploading flag
    });

    final request = http.MultipartRequest('POST', Uri.parse('http://100.126.0.114:5000/upload'));
    request.files.add(await http.MultipartFile.fromPath('file', _image!.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final decodedResponse = json.decode(responseBody);
      setState(() {
        _uploadedImageUrl = decodedResponse['filename'];
      });
      getSuggestions(decodedResponse['filename']);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Upload failed')),
      );
    }

    setState(() {
      _uploadingImage = false; // Reset uploading flag
    });
  }

  Future getSuggestions(String filename) async {
    final response = await http.get(Uri.parse('http://100.126.0.114:5000/suggest/$filename'));

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      final relatedImages = List<String>.from(
        decodedResponse['related_images'].map((image) => image['url'] as String),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SuggestionsPage(relatedImages: relatedImages),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to get suggestions')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff6cb),
      appBar: AppBar(
        title: const Text(
          'Background',
          style: TextStyle(
            color: Color(0xffecdcc9),
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xff4d243d),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xffecdcc9)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              if (_image != null)
                SizedBox(
                  height: 300, // Specify a height for the container
                  child: Image.file(_image!),
                )
              else
                const Text(
                  'No image selected.',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: pickImage,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Text(
                    'Pick Image',
                    style: TextStyle(fontSize: 18, color: Color(0xffffffff)),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff4d243d), // Button color
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: uploadImage,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Text(
                    'Upload Image',
                    style: TextStyle(fontSize: 18, color: Color(0xffffffff)),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff4d243d), // Button color
                ),
              ),
              if (_uploadingImage)
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Analyzing...',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class SuggestionsPage extends StatelessWidget {
  final List<String> relatedImages;

  const SuggestionsPage({Key? key, required this.relatedImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff6cb),
      appBar: AppBar(
        title: const Text(
          'Suggestions',
          style: TextStyle(
            color: Color(0xffecdcc9),
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xff4d243d),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xffecdcc9)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 100 / 140, // Adjust the aspect ratio of each image
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: relatedImages.length,
        itemBuilder: (context, index) {
          return Image.network(
            relatedImages[index],
            fit: BoxFit.cover, // Adjust the fit of the image inside the container
          );
        },
      ),
    );
  }
}

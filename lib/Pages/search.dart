import 'package:flutter/material.dart';
import 'package:oppo1/poses/upload.dart';
import 'poses_disp.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  void _handleUploadBackground() {
    // Navigate to a new page for uploading background image
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ImageUploadScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff6cb),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Search',
          style: TextStyle(
            color: Color(0xffecdcc9),
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xff4d243d),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleUploadBackground,
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 70),
                  backgroundColor: const Color(0xffd0a98f),
                ),
                child: const Text(
                  "Upload  Background",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Backgrounds',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (100 / 140),
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  DashboardButton(
                    imagePath: 'assets/backgrounds/cafe.jpg',
                    poseImages: [
                      'assets/resturant/1.jpeg',
                      'assets/resturant/2.jpeg',
                      'assets/resturant/3.jpeg',
                      'assets/resturant/4.jpeg',
                      'assets/resturant/5.jpeg',
                      'assets/resturant/6.jpeg',
                      'assets/resturant/7.jpeg',
                      'assets/resturant/8.jpeg',
                      'assets/resturant/9.jpeg',
                      'assets/resturant/10.jpeg',
                      'assets/resturant/11.jpeg',
                      'assets/resturant/12.jpeg',
                      'assets/resturant/15.jpeg',
                      'assets/resturant/16.jpeg',
                    ],
                  ),
                  DashboardButton(
                    imagePath: 'assets/backgrounds/park.jpeg',
                    poseImages: [
                      'assets/park/1.jpeg',
                      'assets/park/2.jpeg',
                      'assets/park/3.jpeg',
                      'assets/park/4.jpeg',
                      'assets/park/5.jpeg',
                      'assets/park/6.jpeg',
                      'assets/park/7.jpeg',
                      'assets/park/8.jpeg',
                      'assets/park/9.jpeg',
                      'assets/park/10.jpeg',
                    ],
                  ),
                  DashboardButton(
                    imagePath: 'assets/backgrounds/play.jpg',
                    poseImages: [
                      'assets/outside/1.jpeg',
                      'assets/outside/2.jpeg',
                      'assets/outside/3.jpeg',
                      'assets/outside/4.jpeg',
                      'assets/outside/5.jpeg',
                      'assets/outside/6.jpeg',
                      'assets/outside/7.jpeg',
                      'assets/outside/8.jpeg',
                      'assets/outside/9.jpeg',
                      'assets/outside/10.jpeg',
                    ],
                  ),
                  DashboardButton(
                    imagePath: 'assets/backgrounds/beach.jpg',
                    poseImages: [
                      'assets/beach/1.jpeg',
                      'assets/beach/2.jpeg',
                      'assets/beach/3.jpeg',
                      'assets/beach/4.jpeg',
                      'assets/beach/5.jpeg',
                      'assets/beach/6.jpeg',
                      'assets/beach/7.jpeg',
                      'assets/beach/8.jpeg',
                      'assets/beach/9.jpeg',
                      'assets/beach/10.jpeg',
                      'assets/beach/11.jpeg',
                      'assets/beach/12.jpeg',
                      'assets/beach/13.jpeg',
                      'assets/beach/14.jpeg',
                    ],
                  ),
                  DashboardButton(
                    imagePath: 'assets/backgrounds/greenry.jpg',
                    poseImages: [
                      'assets/train/1.jpeg',
                      'assets/train/2.jpeg',
                      'assets/train/3.jpeg',
                      'assets/train/4.jpeg',
                      'assets/train/5.jpeg',
                      'assets/train/6.jpeg',
                      'assets/train/7.jpeg',
                      'assets/train/8.jpeg',
                      'assets/train/9.jpeg',
                      'assets/train/10.jpeg',
                    ],
                  ),
                  DashboardButton(
                    imagePath: 'assets/backgrounds/road.jpg',
                    poseImages: [
                      'assets/road/1.jpeg',
                      'assets/road/2.jpeg',
                      'assets/road/3.jpeg',
                      'assets/road/4.jpeg',
                      'assets/road/5.jpeg',
                      'assets/road/6.jpeg',
                      'assets/road/7.jpeg',
                      'assets/road/8.jpeg',
                      'assets/road/9.jpeg',
                      'assets/road/10.jpeg',
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String imagePath;
  final List<String> poseImages;

  const DashboardButton({Key? key, required this.imagePath, required this.poseImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageDetailPage(imagePath: imagePath, poseImages: poseImages),
              ),
            );
          },
          child: Container(
            width: 140,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


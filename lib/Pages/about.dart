import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff6cb),
      appBar: AppBar(
        title: const Text(
          'About Us',
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
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('About Pose Perfect',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text('Pose Perfect is a groundbreaking mobile application developed by a dedicated group of three college students as part of their mini project. Our app is designed to enhance your photoshoots by suggesting the perfect poses based on the background you capture, ensuring every picture is as stunning as possible.',
                  style: TextStyle(
                      fontSize: 15)),
              SizedBox(height: 20),
              Text('What We Offer',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text('Background Analysis',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 6),
              Text('Pose Perfect utilizes advanced algorithms to analyze the background of your photoshoot in real-time. By examining elements such as scenery, lighting, and composition, our app understands the context of your environment.',
                style: TextStyle(
                    fontSize: 15),
              ),
              SizedBox(height: 10),
              Text('Personalized Pose Suggestions',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 6),
              Text('Based on the analyzed background, Pose Perfect suggests a variety of poses that complement the scene. Whether you are at a beach, in a park, or at a city landmark, our app provides poses that enhance the aesthetics of your photo.',
                style: TextStyle(
                    fontSize: 15),),
              SizedBox(height: 10),
              Text('Expert Guidance',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 6),
              Text('Our app includes pose libraries curated by professional photographers and models. Each suggested pose comes with detailed instructions and visual examples to help you achieve the perfect shot.',
                style: TextStyle(
                    fontSize: 15),
              ),
              SizedBox(height: 10),
              Text('User-Friendly Interface',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 6),
              Text('Pose Perfect features an intuitive interface that makes it easy to capture your background, receive pose suggestions, and follow guidance. With just a few taps, you can elevate your photoshoots to the next level.',
                style: TextStyle(
                    fontSize: 15),
              ),
              SizedBox(height: 15),
              Text('Get Started Today!',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600)),
              Text('Ready to transform your photoshoots with perfect poses? Download Pose Perfect now and experience the power of personalized pose suggestions. Developed with dedication and innovation by a talented team of college students, Pose Perfect is here to help you capture stunning photos effortlessly.',
                style: TextStyle(
                    fontSize: 15),
              ),
              SizedBox(height: 10),
              Text('For more information or assistance, please contact us at [poseperfect2024@gmail.com]. Thank you for choosing Pose Perfect!',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
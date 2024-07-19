import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff6cb),
      appBar: AppBar(
        title: const Text(
          'Privacy',
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
              Text('Privacy Policy',
                style: TextStyle(
                    fontSize: 25,
                fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text('Pose Perfect is committed to protecting and respecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application.  Please read this policy carefully to understand our views and practices regarding your personal data and how we will treat it.',
                style: TextStyle(
                    fontSize: 15)),
              SizedBox(height: 20),
              Text('1. Information We Collect',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text('1.1 Personal Information',
                  style: TextStyle(
                      fontSize: 15,
                  fontWeight: FontWeight.w600)),
              Text('When you register or use our App, we may collect the following personal information :\n1.Name\n2.Email\n3.Username\n4.Profile picture',
                style: TextStyle(
                    fontSize: 15),
              ),
              SizedBox(height: 20),
              Text('2. How We Use Your Information',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              Text('We use the information we collect in the following ways:',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600)),
              Text('1.To provide, maintain, and improve our App.\n2.To personalize your experience with the App\n3.To communicate with you, including sending updates, security alerts, and support messages',
                style: TextStyle(
                    fontSize: 15),),
              SizedBox(height: 20),
              Text('3. Your Rights and Choices',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text('3.1 Access and Update Your Information',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600)),
              Text('You have the right to access, update, or delete your personal information. You can do this by logging into your account and making the necessary changes or contacting us.',
                style: TextStyle(
                    fontSize: 15),
              ),
              SizedBox(height: 20),
              Text('4. Security',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text('We take reasonable measures to help protect your personal information from loss, theft, misuse, and unauthorized access, disclosure, alteration, and destruction. However, please be aware that no method of transmission over the Internet or method of electronic storage is completely secure.',
                style: TextStyle(
                    fontSize: 15),
              ),
              SizedBox(height: 20),
              Text('5. Changes to This Privacy Policy',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text('We may update this Privacy Policy from time to time. If we make material changes, we will notify you by email (sent to the email address specified in your account) or through the App before the change becomes effective. We encourage you to review this policy periodically for any updates or changes.',
                style: TextStyle(
                    fontSize: 15),
              ),
              SizedBox(height: 20),
              Text('6. Contact Us',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text('If you have any questions or concerns about this Privacy Policy, please contact us at:',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              Text('Email: poseperfect2024@gmail.com.\nAddress: Hyderabad,India.',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              Text('By using the Pose Perfect App, you agree to the terms of this Privacy Policy.',
                style: TextStyle(
                    fontSize: 15),
              ),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}


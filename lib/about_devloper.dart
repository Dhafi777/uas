import 'package:flutter/material.dart';

class AboutDeveloper extends StatelessWidget {
  const AboutDeveloper({super.key});

  static const String profileImage = 'images/dhafi.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Pengembang')), // Changed title
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30.0),
              CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage(profileImage),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Dhafi Nurhadi",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Email : dhafi@gmail.com",
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              const Text(
                "No HP : 0812-2322-7890",
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              const Text(
                "Program Studi : D4 Rekayasa Perangkat Lunak",
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              const Text(
                "Jurusan : Teknik Informatika",
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              const Text(
                "Politeknik Negeri Bengkalis",
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}

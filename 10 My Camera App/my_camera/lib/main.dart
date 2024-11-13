import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(const CameraGallery());

class CameraGallery extends StatelessWidget {
  const CameraGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera & Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: const HomePage(),
    );
  }
}
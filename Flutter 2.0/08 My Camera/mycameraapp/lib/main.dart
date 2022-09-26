import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(CameraGallery());

class CameraGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera & Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: HomePage(),
    );
  }
}
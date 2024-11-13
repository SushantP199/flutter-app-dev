import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;

  Future _openCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      _image = null;
      return;
    }

    setState(() {
      _image = File(image.path);
    });

    /// New Syntax for handling future heavy thread operation on main ui thread
  }

  Future _openGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      _image = null;
      return;
    }

    setState(() {
      _image = File(image.path);
    });
  }

  Future<void> _showDialogBox() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.lightBlueAccent,
          shape: const StadiumBorder(),
          title: const Text(
            'Pick up Image',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: _openCamera,
                  child: const Text(
                    'Take a Photo',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Divider(),
                GestureDetector(
                  onTap: _openGallery,
                  child: const Text(
                    'Select a Photo',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text('Camera & Gallery'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child:
              (_image != null) ? Image.file(_image!) : const Text("No Image"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialogBox,
        tooltip: 'Open a Camera',
        child: const Icon(
          Icons.add_a_photo,
        ),
      ),
    );
  }
}

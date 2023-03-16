import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;

  /// Old syntax
  // Future openCamera() {
  //   Future<File> image = ImagePicker.pickImage(source: ImageSource.camera);
  //   image.then((imageFile) {
  //     setState(() {
  //       this._image = imageFile;
  //     });
  //   });
  // }
  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      this._image = image;
    });
  }

  /// New Syntax for handling future heavy thread operation on main ui thread
  Future openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this._image = image;
    });
  }

  Future<void> _showDialogBox() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.lightBlueAccent,
          shape: StadiumBorder(),
          title: Text(
            'Pick up Image',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          content: SingleChildScrollView(
            child:ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: this.openCamera,
                  child: Text(
                    'Take a Photo',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: this.openGallery,
                  child: Text(
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
  Widget build(BuildContext contxt) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Camera & Gallery'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: (this._image != null)
              ? Image.file(this._image)
              : Text("No Image"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: this._showDialogBox,
        tooltip: 'Open a Camera',
        child: Icon(
          Icons.add_a_photo,
        ),
      ),
    );
  }
}

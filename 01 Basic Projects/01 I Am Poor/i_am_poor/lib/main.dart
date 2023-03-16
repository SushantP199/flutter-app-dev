import 'package:flutter/material.dart';

void main() {

  var app = MaterialApp(
    home : Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('I am Poor'),
        backgroundColor: Colors.black12,
      ),
      body : Center(
        child : Image(
          image: AssetImage('images/Coal.png'),
        ),
      ),
    ),
  );

  /// Run app
  runApp(app);
}
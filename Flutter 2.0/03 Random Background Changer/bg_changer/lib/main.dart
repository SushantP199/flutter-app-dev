import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'BG Changer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random Background'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var colors = [
    Colors.amber,
    Colors.pinkAccent,
    Colors.greenAccent,
    Colors.yellowAccent,
    Colors.deepPurple,
    Colors.blueAccent,
    Colors.indigoAccent,
    Colors.redAccent
  ];

  var currentColor = Colors.white;
  var currentColorButton = Colors.black;

  void setRandomColor() {
    var randomColor = Random().nextInt(colors.length);
    var randomColorButton = Random().nextInt(colors.length);
    setState(() {
      currentColor = colors[randomColor];
      currentColorButton = colors[randomColorButton];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: currentColor,
      child: Center(
        child: RaisedButton(
          onPressed: setRandomColor,
          color: currentColorButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical:20.0),
            child: Text(
              'Change BG!',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

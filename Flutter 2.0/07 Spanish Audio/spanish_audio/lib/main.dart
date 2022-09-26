import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(SpanishAudio());

class SpanishAudio extends StatelessWidget{

  @override 
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'Spanish Audio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
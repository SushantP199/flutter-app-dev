import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(const SpanishAudio());

class SpanishAudio extends StatelessWidget{
  const SpanishAudio({super.key});


  @override 
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'Spanish Audio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
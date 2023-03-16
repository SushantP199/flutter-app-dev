import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(ScratchWin());

class ScratchWin extends StatelessWidget{

  @override 
  Widget build (BuildContext context){

    return MaterialApp(
      title: 'Scratch & Win',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: HomePage(),
    );
  }
}

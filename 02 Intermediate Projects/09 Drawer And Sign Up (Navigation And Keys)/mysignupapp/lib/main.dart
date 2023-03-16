import 'package:flutter/material.dart';
import 'SignUpPage.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget{

  @override 
  Widget build (BuildContext context){

    return MaterialApp(
      title: 'Sign Up App',
      debugShowCheckedModeBanner:false,
      theme:ThemeData.dark(),
      home: SignUpPage(),
    );
  }
}
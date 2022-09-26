import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(GitHubApp());

class GitHubApp extends StatelessWidget{

  @override 
  Widget build (BuildContext context){

    return MaterialApp(
      title:'My GitHub App',
      debugShowCheckedModeBanner:false,
      theme:ThemeData(
        primarySwatch:Colors.purple,
      ),
      home:HomePage(title:'Parse the JSON data Page'),
    );
  }
}
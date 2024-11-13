import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(const GitHubApp());

class GitHubApp extends StatelessWidget {
  const GitHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My GitHub App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(title: 'Parse the JSON data Page'),
    );
  }
}

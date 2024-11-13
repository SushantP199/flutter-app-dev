import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(const RandomUser());

class RandomUser extends StatelessWidget {
  const RandomUser({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Random Users",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.fallback(),
      home: const HomePage(),
    );
  }
}

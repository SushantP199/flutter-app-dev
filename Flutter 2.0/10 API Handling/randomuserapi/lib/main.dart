import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(RandomUser());


class RandomUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Random Users",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.fallback(),
      home: HomePage(),
    );
  }
}
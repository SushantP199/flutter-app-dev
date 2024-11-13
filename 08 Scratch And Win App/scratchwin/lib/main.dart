import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(const ScratchWin());

class ScratchWin extends StatelessWidget {
  const ScratchWin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scratch & Win',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:math';

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = Random().nextInt(5) + 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(
          onPressed: () {
            setState(() {
              ballNumber = Random().nextInt(5) + 1;
            });
          },
          child: Image.asset('images/ball$ballNumber.png'),
        ),
      ),
    );
  }
}

class BallPage extends StatelessWidget {
  final appPage = Scaffold(
    backgroundColor: Colors.blue,
    appBar: AppBar(
      backgroundColor: Colors.blue[700],
      title: const Text(
        'Ask Me Anything',
      ),
    ),
    body: const Ball(),
  );

  BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return appPage;
  }
} 

void main() {
  var app = MaterialApp(
    home: BallPage(),
  );

  runApp(app);
}

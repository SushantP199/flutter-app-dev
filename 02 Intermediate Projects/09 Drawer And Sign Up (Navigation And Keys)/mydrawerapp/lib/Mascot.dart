import 'package:flutter/material.dart';

class Mascot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mascot Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/mascot.png'),
            Text(
              "LearnCodeOnline.in",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20.0,
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

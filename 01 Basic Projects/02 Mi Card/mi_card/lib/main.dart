import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  final app = MaterialApp(
    home : Scaffold(
      backgroundColor : Colors.purple,
      body : SafeArea(
        child : Column(
          // crossAxisAlignment : CrossAxisAlignment.stretch,
          mainAxisAlignment : MainAxisAlignment.center,
          children : <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/accountimage.png'),
            ),
            Text(
              'Sushant Pagam',
              style: TextStyle(
                fontFamily: 'Prompt',
                fontSize : 30.0,
                color : Colors.white,
                fontWeight : FontWeight.bold,
              ),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style : TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 25.0,
                color: Colors.purpleAccent.shade100,
              ),
            ),
            SizedBox(
              height: 5.0,
              width: 250.0,
              child: Divider(
                color: Colors.purpleAccent.shade100,
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              // padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 7.0),
              child: ListTile(
                leading:Icon(
                  Icons.phone,
                  color: Colors.purple[600],
                  size: 40.0,
                ),
                title:Text(
                 '+91 9967622382',
                  style: TextStyle(
                  fontSize : 18.0,
                  color : Colors.purple[800],
                    ),
                ),
              ),
              // child: Row(
              //   children: <Widget>[
              //     Icon(
              //       Icons.phone,
              //       color: Colors.teal[900],
              //       size: 40.0,
              //     ),
              //     SizedBox(
              //       width: 10.0,
              //     ),
              //     Text(
              //       '+91 9967622382',
              //       style: TextStyle(
              //         fontSize : 18.0,
              //         color : Colors.teal[800],
              //       ),
              //     ),
              //   ],
              // ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal:20.0),
              // padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 7.0),
              child: ListTile(
                leading:Icon(
                  Icons.email,
                  color: Colors.purple[600],
                  size: 40.0,
                ),
                title:Text(
                 'sushantpagam199@gmail.com',
                  style: TextStyle(
                  fontSize : 15.0,
                  color : Colors.purple[800],
                    ),
                ),
              ),
              // child: Row(
              //   children: <Widget>[
              //     Icon(
              //       Icons.email,
              //       color: Colors.teal[900],
              //       size: 40.0,
              //     ),
              //     SizedBox(
              //       width: 10.0,
              //     ),
              //     Text(
              //       'sushantpagam199@gmail.com',
              //       style: TextStyle(
              //         fontSize : 15.0,
              //         color : Colors.teal[800],
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return app;
  }
}

void main() {
  /// Run app
  runApp(MyApp());
}

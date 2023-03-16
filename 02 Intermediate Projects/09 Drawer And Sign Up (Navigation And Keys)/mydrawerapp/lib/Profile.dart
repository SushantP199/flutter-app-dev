import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 90.0,
              backgroundColor: Colors.brown,
              child: Image.asset('images/mascot.png'),
            ),
            SizedBox(height: 10),
            Text(
              "Flutter Developer",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 15.0,
                color: Colors.brown,
              ),
            ),
            Divider(),
            SizedBox(height: 20.0),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(
                "Sushant Pagam",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  color: Colors.brown,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(
                "sushantpagam@gmail.com",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  color: Colors.brown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

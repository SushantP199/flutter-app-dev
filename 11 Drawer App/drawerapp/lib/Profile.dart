import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: const Text('Profile Page'),
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
            const SizedBox(height: 10),
            const Text(
              "Flutter Developer",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 15.0,
                color: Colors.brown,
              ),
            ),
            const Divider(),
            const SizedBox(height: 20.0),
            const ListTile(
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
            const ListTile(
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

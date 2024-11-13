import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name, email, mobile, collegeName, password;

  const HomePage({
    super.key,
    required this.name,
    required this.email,
    required this.mobile,
    required this.collegeName,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(text: 'HomePage'),
        ),
      ),
      body: Form(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(50.0),
              ),
              const Image(
                image: AssetImage('images/mascot.png'),
                height: 100.0,
                width: 100.0,
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: Text(name),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: Text(email),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(mobile),
              ),
              ListTile(
                leading: const Icon(Icons.school),
                title: Text(collegeName),
              ),
              ListTile(
                leading: const Icon(Icons.security),
                title: Text(password),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

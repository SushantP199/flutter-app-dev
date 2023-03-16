import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name, email, mobile, collegeName, password;

  HomePage({
    Key key,
    @required this.name,
    @required this.email,
    @required this.mobile,
    @required this.collegeName,
    @required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: RichText(
          text: TextSpan(text: 'HomePage'),
        ),
      ),
      body: Form(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(50.0),
              ),
              Image(
                image: AssetImage('images/mascot.png'),
                height: 100.0,
                width: 100.0,
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text(this.name),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(this.email),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(this.mobile),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text(this.collegeName),
              ),
              ListTile(
                leading: Icon(Icons.security),
                title: Text(this.password),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

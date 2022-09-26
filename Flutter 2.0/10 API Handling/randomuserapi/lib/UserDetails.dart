import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final String picture, username, name, gender, dob, email, phone, password;
  UserDetails(
      {Key key,
      @required this.picture,
      @required this.username,
      @required this.name,
      @required this.gender,
      @required this.dob,
      @required this.email,
      @required this.phone,
      @required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.name),
      ),
      body: Center(
        child: Card(
          shape: StadiumBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10.0),
              Image(
                image: NetworkImage(this.picture),
              ),
              SizedBox(height: 20.0),
              ListTile(
                leading: Icon(Icons.verified_user),
                title: Text(this.username),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(this.gender),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text(this.dob),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(this.email),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(this.phone),
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

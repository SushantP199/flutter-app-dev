import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final String picture, username, name, gender, dob, email, phone, password;

  const UserDetails({
    super.key,
    required this.picture,
    required this.username,
    required this.name,
    required this.gender,
    required this.dob,
    required this.email,
    required this.phone,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Card(
          shape: const StadiumBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10.0),
              Image(
                image: NetworkImage(picture),
              ),
              const SizedBox(height: 20.0),
              ListTile(
                leading: const Icon(Icons.verified_user),
                title: Text(username),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(gender),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: Text(dob),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: Text(email),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(phone),
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

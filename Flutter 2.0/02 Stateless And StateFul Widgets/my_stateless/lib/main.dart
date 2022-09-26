import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        accentColor: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateless Flutter App'),
          backgroundColor: Colors.tealAccent,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('This is line 1'),
              Text('This is line Two'),
              RaisedButton(
                onPressed: () {},
                child: Text('SignUp'),
                color: Colors.redAccent,
                splashColor: Colors.pink,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.account_circle,
          ),
        ),
      ),
    );
  }
}

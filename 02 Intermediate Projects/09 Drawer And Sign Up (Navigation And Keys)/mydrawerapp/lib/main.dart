import 'package:flutter/material.dart';
import 'package:mydrawerapp/Category.dart';
import 'package:mydrawerapp/Mascot.dart';
import 'package:mydrawerapp/Profile.dart';
import 'HomePage.dart';


void main() => runApp(DrawerApp());

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DrawerApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/mascot":(BuildContext context) => Mascot(),
        "/profile":(BuildContext context) => UserProfile(),
        "/category": (BuildContext context) => Category(),
      },
    );
  }
}

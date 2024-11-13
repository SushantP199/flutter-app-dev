import 'package:drawerapp/Category.dart';
import 'package:drawerapp/Mascot.dart';
import 'package:drawerapp/Profile.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';


void main() => runApp(const DrawerApp());

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DrawerApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const HomePage(),
      routes: <String, WidgetBuilder>{
        "/mascot":(BuildContext context) => Mascot(),
        "/profile":(BuildContext context) => UserProfile(),
        "/category": (BuildContext context) => const Category(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'SignUpPage.dart';

void main() => runApp(const SignUpApp());

class SignUpApp extends StatelessWidget {
  const SignUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SignUpPage(),
    );
  }
}

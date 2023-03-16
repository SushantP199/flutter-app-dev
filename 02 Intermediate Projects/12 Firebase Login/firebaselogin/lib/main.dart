import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebaselogin/HomePage.dart';
import 'SignUpPage.dart';
import 'SignInPage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const FirebaseLoginApp());
}

class FirebaseLoginApp extends StatelessWidget {
  const FirebaseLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Firebase Login",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: <String, WidgetBuilder>{
        "/SignUpPage": (BuildContext context) => SignUpPage(),
        "/SignInPage": (BuildContext context) => SignInPage(),
      },
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? user;
  bool isSignedIn = false;

  checkAuthentication() async {
    _firebaseAuth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushReplacementNamed(context, "/SignInPage");
      }
    });
  }

  getUser() async {
    User? user = await _firebaseAuth.currentUser;
    await user?.reload();
    user = await _firebaseAuth.currentUser;

    if (user != null) {
      setState(() {
        this.user = user;
        isSignedIn = true;
      });
    }

    print("user : ${user}");
  }

  signOut() async {
    _firebaseAuth.signOut();
  }

  @override
  void initState() {
    super.initState();
    checkAuthentication();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: !isSignedIn
              ? const CircularProgressIndicator()
              : Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(50),
                      child: const Image(
                        image: AssetImage("assets/logo.png"),
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(50.0),
                      child: Text(
                        "Hello, ${user!.displayName}, you are logged in as ${user!.email}",
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: signOut,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 100,
                            vertical: 20,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                        child: const Text(
                          "Sign Out",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

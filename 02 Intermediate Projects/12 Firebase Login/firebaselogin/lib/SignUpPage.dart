import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? _name, _email, _password;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  checkAuthentication() async {
    _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.of(context).pushReplacementNamed("/SignInPage");
      }
    });
  }

  navigateToSignInPage() {
    Navigator.pushReplacementNamed(context, "/SignInPage");
  }

  showError(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                ),
                child: const Text("OK"),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    checkAuthentication();
  }

  signUp() async {
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();

      try {
        await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: _email.toString(), password: _password.toString())
            .then(
          (user) {
            if (user != null) {
              FirebaseAuth.instance.currentUser!.updateDisplayName(_name);
            }
          },
        );
      } catch (e) {
        showError(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0),
                  child: const Image(
                    image: AssetImage("assets/logo.png"),
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                // Name
                Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Provide a name";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onSaved: (input) => _name = input,
                  ),
                ),
                // Email
                Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Provide an email";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onSaved: (input) => _email = input,
                  ),
                ),
                // Password
                Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    validator: (input) {
                      if (input!.length < 6) {
                        return "Password should be of at least 6 characters";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    obscureText: true,
                    onSaved: (input) => _password = input,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(
                        100.0,
                        20.0,
                        100.0,
                        20.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: signUp,
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: navigateToSignInPage,
                    child: const Text(
                      "Already Have An Account ?",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

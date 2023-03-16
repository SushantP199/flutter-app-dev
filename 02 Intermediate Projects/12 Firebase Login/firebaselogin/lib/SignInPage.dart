import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String? _email, _password;

  checkAuthentication() {
    _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, "/");
        });
      }
    });
  }

  navigateToSignUpPage() {
    Navigator.pushReplacementNamed(context, "/SignUpPage");
  }

  @override
  void initState() {
    super.initState();
    checkAuthentication();
  }

  showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void signIn() async {
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();

      try {
        UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
            email: _email.toString(), password: _password.toString());
      } catch (e) {
        showError(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 50.0),
                child: const Image(
                  image: AssetImage("assets/logo.png"),
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _globalKey,
                  child: Column(
                    children: [
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
                          onPressed: signIn,
                          child: const Text(
                            "Sign In",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: InkWell(
                          onTap: navigateToSignUpPage,
                          child: const Text(
                            "Create An Account ?",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

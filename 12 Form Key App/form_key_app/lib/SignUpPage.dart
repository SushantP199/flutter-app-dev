import 'package:flutter/material.dart';
import 'HomePage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String name, email, mobile, collegeName, password;
  final GlobalKey<FormState> _key = GlobalKey();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            text: 'SignUp Page',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                const Image(
                  image: AssetImage('images/mascot.png'),
                  height: 100.0,
                  width: 100.0,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                  ),
                  title: TextFormField(
                    validator: (input) {
                      if (input?.isEmpty ?? true) {
                        return "Enter your name";
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onSaved: (input) => name = input ?? "",
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.email,
                  ),
                  title: TextFormField(
                    validator: (input) {
                      if (input?.isEmpty ?? true) {
                        return "Enter your email";
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onSaved: (input) => email = input ?? "",
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.phone,
                  ),
                  title: TextFormField(
                    validator: (input) {
                      if (input?.isEmpty ?? true) {
                        return "Enter your mobile";
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Mobile',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onSaved: (input) => mobile = input ?? "",
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.school,
                  ),
                  title: TextFormField(
                    validator: (input) {
                      if (input?.isEmpty ?? true) {
                        return "Enter your collage name";
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'College name',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onSaved: (input) => collegeName = input ?? "",
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.security,
                  ),
                  title: TextFormField(
                    validator: (input) {
                      if (input?.isEmpty ?? true) {
                        return "Enter your password";
                      }
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onSaved: (input) => password = input ?? "",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                ButtonTheme(
                  height: 40.0,
                  minWidth: 200.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ElevatedButton(
                    onPressed: _sendToNextScreen,
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.redAccent),
                    ),
                    child: const Text(
                      'SAVE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(40.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _sendToNextScreen() {
    if (_key.currentState?.validate() ?? false) {
      /// Save the data
      _key.currentState?.save();

      /// Pass the data to HomePage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return HomePage(
              name: name,
              email: email,
              mobile: mobile,
              collegeName: collegeName,
              password: password,
            );
          },
        ),
      );
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}

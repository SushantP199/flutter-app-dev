import 'package:flutter/material.dart';
import 'HomePage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String name, email, mobile, collegeName, password;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: 'SignUp Page',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: this._key,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Image(
                  image: AssetImage('images/mascot.png'),
                  height: 100.0,
                  width: 100.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                  ),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Enter your name";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onSaved: (input) => this.name = input,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.email,
                  ),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Enter your email";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onSaved: (input) => this.email = input,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.phone,
                  ),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Enter your mobile";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Mobile',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onSaved: (input) => this.mobile = input,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.school,
                  ),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Enter your collage name";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'College name',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onSaved: (input) => this.collegeName = input,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.security,
                  ),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Enter your password";
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onSaved: (input) => this.password = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                ButtonTheme(
                  height: 40.0,
                  minWidth: 200.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: RaisedButton(
                    onPressed: _sendToNextScreen,
                    color: Colors.redAccent,
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
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
    if (_key.currentState.validate()) {
      /// Save the data
      _key.currentState.save();

      /// Pass the data to HomePage
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
        return HomePage(
          name: this.name,
          email: this.email,
          mobile: this.mobile,
          collegeName: this.collegeName,
          password: this.password,
        );
      }));
    } else {
      setState(() {
        this._autoValidate = true;
      });
    }
  }
}

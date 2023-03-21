import 'package:flutter/material.dart';
import 'package:login_app/provider/auth_provider.dart';
import 'package:login_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("build");

    var authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("Provider | State Management")),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Consumer<AuthProvider>(builder: (context, value, child) {
                    print("rebuild email");

                    if (authProvider.error != null) {
                      _emailController.text = "";
                    }

                    return TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                      ),
                      controller: _emailController,
                    );
                  }),
                  const SizedBox(height: 10),
                  Consumer<AuthProvider>(builder: (context, value, child) {
                    print("rebuild password");

                    if (authProvider.error != null) {
                      _passwordController.text = "";
                    }

                    return TextFormField(
                      obscureText: authProvider.showPassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            authProvider.setShowPassword();
                          },
                          icon: authProvider.showPassword
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                      ),
                      controller: _passwordController,
                    );
                  }),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () async {
                      authProvider.logIn(_emailController.value.text,
                          _passwordController.value.text, context);
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Consumer<AuthProvider>(builder: (context, value, child) {
                    if (authProvider.error != null) {
                      print("rebuild error");

                      return Text(
                        authProvider.error.toString(),
                        style: const TextStyle(color: Colors.redAccent),
                      );
                    } else {
                      print("rebuild empty error");

                      return Container();
                    }
                  }),
                ],
              ),
            ),
          ),
          Consumer<AuthProvider>(builder: (context, value, child) {
            if (authProvider.isLoading == true) {
              print("rebuild loader");

              return Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  const Center(child: CircularProgressIndicator()),
                ],
              );
            } else {
              print("rebuild empty loader");

              return Container();
            }
          }),
        ],
      ),
    );
  }
}

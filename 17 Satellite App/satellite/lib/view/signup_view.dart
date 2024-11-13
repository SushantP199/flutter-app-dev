import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../res/components/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final ValueNotifier<bool> _passwordVisbililty = ValueNotifier(true);

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Satellite App"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email_outlined),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _emailFocusNode,
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusedChanged(
                        context, _emailFocusNode, _passwordFocusNode);
                  },
                ),
                SizedBox(height: deviceHeight * 0.01),
                ValueListenableBuilder(
                  valueListenable: _passwordVisbililty,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _passwordVisbililty.value =
                                !_passwordVisbililty.value;
                          },
                          icon: _passwordVisbililty.value
                              ? const Icon(Icons.visibility_sharp)
                              : const Icon(Icons.visibility_off_outlined),
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      focusNode: _passwordFocusNode,
                      obscureText: _passwordVisbililty.value,
                    );
                  },
                ),
                SizedBox(height: deviceHeight * 0.03),
                RoundButton(
                  title: "Sign Up",
                  loading: authViewModel.isLoading,
                  onPress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.flushbarErrorMessage(
                          "Please enter your email", context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushbarErrorMessage(
                          "Please enter your password", context);
                    } else if (_passwordController.text.length < 6) {
                      Utils.flushbarErrorMessage(
                          "Plassword should at least of 6 characters", context);
                    } else {
                      print("API Hit...");
                      Map data = {
                        "email": _emailController.text,
                        "password": _passwordController.text
                      };
                      authViewModel.register(data, context);
                    }
                  },
                ),
                SizedBox(height: deviceHeight * 0.015),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RoutesName.login);
                  },
                  child: const Text(
                    "Have an account? Log In",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

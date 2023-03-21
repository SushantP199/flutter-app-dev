import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../screens/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  bool? _isLoading;
  String? _error;
  bool _showPassword = true;

  bool? get isLoading {
    return _isLoading;
  }

  String? get error {
    return _error;
  }

  bool get showPassword {
    return _showPassword;
  }

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setError(String? error) {
    _error = error;
    notifyListeners();
  }

  void setShowPassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  void logIn(String email, String password, BuildContext context) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      Response response = await post(
        Uri.parse("https://reqres.in/api/login"),
        body: {"email": email, "password": password},
      );

      if (response.statusCode == 200) {
        print("user logged in successfully.");

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          ),
        );
      } else {
        setError("Wrong Credentials, Try Again!");
        print("user login failed.");
      }
    } catch (e) {
      setError("Something Went Wrong, Try Again!");

      print(e.toString());
    }

    setIsLoading(false);
  }
}

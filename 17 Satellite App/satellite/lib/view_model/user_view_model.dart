import 'package:flutter/foundation.dart';
import 'package:satellite/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  Future<bool> saveUser(UserModel userModel) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString("token", userModel.token.toString());

    notifyListeners();

    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final String? token = sharedPreferences.getString("token");

    return UserModel(token: token.toString());
  }

  Future<bool> remove() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.remove("token");

    return true;
  }
}

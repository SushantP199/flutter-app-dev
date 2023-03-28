import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider_app/model/user_model.dart';
import 'package:mvvm_provider_app/utils/routes/routes_name.dart';
import 'package:mvvm_provider_app/view_model/user_view_model.dart';

class SplashService {
  void checkAuthentication(BuildContext context)  async {
    getUserData().then((value) async {
      print(value.token.runtimeType);
      print(null.runtimeType);
      print('null'.runtimeType);  

      if (value.token == null || value.token == 'null' || value.token == "") {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RoutesName.login, (route) => false);
            print("frr");
      } else {
            print("object 2");

        await Future.delayed(Duration(seconds: 3));         
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RoutesName.home, (route) => false);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<UserModel> getUserData() => UserViewModel().getUser();
}

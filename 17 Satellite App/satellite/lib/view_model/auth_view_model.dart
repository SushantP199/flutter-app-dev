import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:satellite/model/user_model.dart';
import 'package:satellite/repository/auth_repository.dart';
import 'package:satellite/utils/routes/routes_name.dart';
import 'package:satellite/utils/utils.dart';
import 'package:satellite/view_model/user_view_model.dart';

class AuthViewModel extends ChangeNotifier {
  final _authRepository = AuthRepository();

  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login(dynamic data, BuildContext context) async {
    setLoading(true);

    _authRepository.loginApi(data).then((value) {
      setLoading(false);
      if (kDebugMode) {
        print(value.toString());
      }
      UserViewModel().saveUser(UserModel(token: value["token"] ?? ""));
      Utils.flushbarErrorMessage("Logged In Successfully", context);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RoutesName.home, (route) => false);
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
      Utils.flushbarErrorMessage(error.toString(), context);
    });
  }

  Future<void> register(dynamic data, BuildContext context) async {
    setLoading(true);

    _authRepository.registerApi(data).then((value) {
      setLoading(false);
      if (kDebugMode) {
        print(value.toString());
      }
      Utils.flushbarErrorMessage("Registered Successfully", context);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RoutesName.login, (route) => false);
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
      Utils.flushbarErrorMessage(error.toString(), context);
    });
  }
}

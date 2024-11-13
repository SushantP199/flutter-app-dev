import 'package:flutter/material.dart';
import 'package:satellite/utils/routes/routes_name.dart';
import 'package:satellite/view/home_view.dart';
import 'package:satellite/view/login_view.dart';
import 'package:satellite/view/signup_view.dart';
import 'package:satellite/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeView(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginView(),
        );
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignupView(),
        );
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashView(),
        );
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const Scaffold(
              body: Center(
                child: Text("NO ROUTES DEFINED"),
              ),
            );
          },
        );
    }
  }
}

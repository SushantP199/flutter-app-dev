import 'package:flutter/material.dart';
import 'package:mvvm_provider_app/utils/routes/routes_name.dart';
import 'package:mvvm_provider_app/view/home_view.dart';
import 'package:mvvm_provider_app/view/login_view.dart';
import 'package:mvvm_provider_app/view/signup_view.dart';
import 'package:mvvm_provider_app/view/splash_view.dart';

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

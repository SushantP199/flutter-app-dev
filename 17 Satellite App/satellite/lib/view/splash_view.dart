import 'package:flutter/material.dart';
import 'package:satellite/view_model/services/splash_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashService splashService = SplashService();

  @override
  void initState() {
    super.initState();

    splashService.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: LinearProgressIndicator(),
        ),
      ),
    );
  }
}

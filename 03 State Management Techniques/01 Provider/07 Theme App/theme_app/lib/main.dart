import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_app/provider/theme_provider.dart';
import 'package:theme_app/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    print("App Build");

    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Builder(
        builder: (context) {

          print("Builder build");

          final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeProvider.theme,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}

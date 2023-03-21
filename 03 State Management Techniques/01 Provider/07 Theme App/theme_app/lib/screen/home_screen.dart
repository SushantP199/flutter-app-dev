import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);

    print("HomeScreen build");

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider | State Management"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Icon(
            Icons.favorite_rounded,
            size: 120,
          ),
          SizedBox(height: 50),
          RadioListTile<ThemeMode>(
            value: ThemeMode.light,
            groupValue: themeProvider.theme,
            onChanged: ((value) => themeProvider.setTheme(value!)),
            title: Text("Light Mode"),
          ),
          RadioListTile<ThemeMode>(
            value: ThemeMode.dark,
            groupValue: themeProvider.theme,
            onChanged: ((value) => themeProvider.setTheme(value!)),
            title: Text("Dark Mode"),
          ),
          RadioListTile<ThemeMode>(
            value: ThemeMode.system,
            groupValue: themeProvider.theme,
            onChanged: ((value) => themeProvider.setTheme(value!)),
            title: Text("System Mode"),
          )
        ],
      ),
    );
  }
}

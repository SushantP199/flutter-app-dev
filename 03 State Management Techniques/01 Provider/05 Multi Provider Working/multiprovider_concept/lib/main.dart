import 'package:flutter/material.dart';
import 'package:multiprovider_concept/provider/height_provider.dart';
import 'package:multiprovider_concept/provider/slider_provider.dart';
import 'package:multiprovider_concept/screen/slider_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SliderProvider>(create: (_) => SliderProvider()),
        ChangeNotifierProvider<HeightProvider>(create: (_) => HeightProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'multiprovider_concept',
        home: SliderScreen(),
      ),
    );
  }
}
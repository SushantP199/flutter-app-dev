import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_concept/provider/counter_provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {


  @override
  void initState() {
    super.initState();

    final counterProvider = Provider.of<CounterProvider>(context, listen: false);

    Timer.periodic(Duration(seconds: 0), (timer) {
      counterProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider | State Management"),
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, value, child) {
            print("rebuild");

            return Text(
              "${counterProvider.count}",
              style: TextStyle(fontSize: 40),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

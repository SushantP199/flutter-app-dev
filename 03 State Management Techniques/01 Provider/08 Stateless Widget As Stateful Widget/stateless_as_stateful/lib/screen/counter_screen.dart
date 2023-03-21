import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _obscureText = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      appBar: AppBar(title: const Text("Provider | State Management")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ValueListenableBuilder(
                valueListenable: _obscureText,
                builder: (context, value, child) {
                  
                  print("rebuild TextFormField in ValueListenableBuilder");

                  return TextFormField(
                    obscureText: _obscureText.value,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _obscureText.value = !_obscureText.value;
                        },
                        icon: const Icon(Icons.visibility),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {

                print("rebuild Text in ValueListenableBuilder");

                return Text(
                  "Count ${_counter.value}",
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print("Count ${_counter.value}");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

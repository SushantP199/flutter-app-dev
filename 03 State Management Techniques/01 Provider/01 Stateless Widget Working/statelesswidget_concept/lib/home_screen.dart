import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  int number = 05;

  @override
  Widget build(BuildContext context) {

    print("build");

    return Scaffold(
      appBar: AppBar(title: Text("Provider | State Management")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(number.toString(), style: TextStyle(fontSize: 50),),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          number++;
          print(number);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
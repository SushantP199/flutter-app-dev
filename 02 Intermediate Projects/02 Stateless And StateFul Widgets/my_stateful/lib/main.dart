import 'package:flutter/material.dart';

void main() {

  var app = MaterialApp(
    title: 'Stateful',
    debugShowCheckedModeBanner: false,
    home: MyButton(),
  );

  runApp(app);
}

class MyButton extends StatefulWidget {
  
  @override 
  MyButtonState createState() {
    return MyButtonState();
  }
}

class MyButtonState extends State<MyButton> {

  int counter = 0;
  List<String> spanishNumbers = <String>[
    "Uno",
    "Dos",
    "Tres",
    "Cuarto",
    "Cinco",
    "Seis",
    "Seithe",
    "Ocho",
    "Nueve",
    "Dietz"
  ];
  List<String> englishNumbers = <String>[
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "Nine",
    "Ten"
  ];
  String defaultTextSpanish = "Spanish Numbers";
  String defaultTextEnglish = "English Numbers";

  void displayNumber() {
    setState((){
      defaultTextSpanish = spanishNumbers[counter % (spanishNumbers.length)];
      defaultTextEnglish = englishNumbers[counter % (spanishNumbers.length)];
      counter++;
    });
  }

  @override 
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Flutter App'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              defaultTextSpanish,
              style: TextStyle(fontSize: 30.0,
              color: Colors.pinkAccent,
              ),
            ),
            Text(
              defaultTextEnglish,
              style: TextStyle(fontSize: 30.0,
              color: Colors.pinkAccent,
              ),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: displayNumber,
              child: Text(
                'Call Number',
                 style: TextStyle(
                   color: Colors.white,
                  ),
                ),
              color: Colors.pinkAccent,
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Row(
          children: <Widget>[
            FloatingActionButton(
              onPressed: displayNumber,
              child:Text('->'),
              backgroundColor: Colors.pinkAccent,
            ),
          ],
        ),
      ),
    );
  }
}
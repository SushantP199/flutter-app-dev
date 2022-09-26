import 'package:flutter/material.dart';
import 'dart:math';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  int leftDiceNumber = Random().nextInt(6) + 1;
  int rightDiceNumber =  Random().nextInt(6) + 1;

  // var appBody = Center(
  //   child:Row(
  //     children: <Widget>[
  //       Expanded(
  //         child: FlatButton(
  //           onPressed: (){
  //             print("Left dice pressed");
  //           },
  //           child:Image.asset('images/dice1.png'),
  //         ),
  //       ),
  //       Expanded(
  //         child: FlatButton(
  //           onPressed:(){
  //             leftDiceNumber = 6;
  //             print('Right button got pressed $leftDiceNumber');
  //           },
  //           child: Image.asset('images/dice$leftDiceNumber.png'),
  //         ),
  //       ),
  //     ],
  //   )
  // );
  void diceNumber(){
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return appBody;
    return Center(
    child:Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            onPressed: (){
              diceNumber();
              print("Left dice pressed $leftDiceNumber");
            },
            child:Image.asset('images/dice$leftDiceNumber.png'),
          ),
        ),
        Expanded(
          child: FlatButton(
            onPressed:(){
              diceNumber();
              print('Right dicen got pressed $rightDiceNumber');
            },
            child: Image.asset('images/dice$rightDiceNumber.png'),
          ),
        ),
      ],
    )
  );
  }
}

void main() {

  var app = MaterialApp(
    home: Scaffold(
      backgroundColor : Colors.red,
      appBar : AppBar(
        backgroundColor : Colors.red,
        title : Text(
          'Dice Roller',
        ),
      ),
      body : DicePage(),
    ),
  );

  runApp(app);
}

import 'dart:math';

import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Dice Roller',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AssetImage one = AssetImage('images/one.png'); 
  AssetImage two = AssetImage('images/two.png'); 
  AssetImage three = AssetImage('images/three.png'); 
  AssetImage four = AssetImage('images/four.png'); 
  AssetImage five = AssetImage('images/five.png'); 
  AssetImage six = AssetImage('images/six.png');

  AssetImage diceImageOne, diceImageTwo; 

  @override
  void initState() {
    super.initState();
    setState((){
      diceImageOne = one;
      diceImageTwo = six;
    });
  }

  void diceRoller() {
    
    int randomImageNumberOne = (Random().nextInt(6) + 1);
    int randomImageNumberTwo = (Random().nextInt(6));
    AssetImage newImageOne, newImageTwo;

    switch (randomImageNumberOne) {
      case 1: 
        newImageOne = one;
        break;
      case 2: 
        newImageOne = two;
        break;
      case 3: 
        newImageOne = three;
        break;
      case 4: 
        newImageOne = four;
        break;
      case 5: 
        newImageOne = five;
        break;
      case 6: 
        newImageOne = six;
        break;
      default: print("Invalid random number occured");
    }

    List<AssetImage> imagesList = <AssetImage>[
      one,
      two,
      three,
      four,
      five,
      six
    ];

    newImageTwo = imagesList[randomImageNumberTwo];
	
    /*switch (randomImageNumberTwo) {
      case 1: 
        newImageTwo = one;
        break;
      case 2: 
        newImageTwo = two;
        break;
      case 3: 
        newImageTwo = three;
        break;
      case 4: 
        newImageTwo = four;
        break;
      case 5: 
        newImageTwo = five;
        break;
      case 6: 
        newImageTwo = six;
        break;
      default: print("Invalid random number occured");
    }*/

    setState(() {
      diceImageOne = newImageOne;
      diceImageTwo = newImageTwo;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller App',style : TextStyle(color: Colors.grey[900],),),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: Colors.grey[900],
        child: Center(
          child: Column(
	          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: diceImageOne,
                height: 150.0,
                width: 150.0,
              ),
		          SizedBox(height: 25.0),
		          Image(
                image: diceImageTwo,
                height: 150.0,
                width: 150.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0),
                child: RaisedButton(
                  onPressed: diceRoller,
		              color: Colors.amber,
		              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  child: Padding(padding: EdgeInsets.symmetric(horizontal:5.0, vertical:10.0),child:Text(
                    'Roll the Dice',
		                style : TextStyle(color: Colors.grey[900], fontSize: 30.0),
                  ),),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:math';
import "package:delayed_display/delayed_display.dart";

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  ///[TODO:-1] Link up images
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage lucky = AssetImage('images/rupee.png');
  AssetImage unlucky = AssetImage('images/sadFace.png');

  ///[TODO:-2] Declare requirements
  List<String> itemsArray;
  int luckyNumber;
  int attemptCounts;
  String message;

  ///[TODO:-3] Initialize the game state
  void initState() {
    super.initState();
    setState(() {
      this.itemsArray = List<String>.generate(25, (index) => "empty");
      this.attemptCounts = 0;
      this.message = "";
    });
    this.generateRandomNumber();
  }

  void generateRandomNumber() {
    int randomNumber = Random().nextInt(25);
    setState(() {
      this.luckyNumber = randomNumber;
    });
  }

  ///[TODO:-4] Method to play the game
  void playGame(int index) {
    if (this.luckyNumber == index) {
      setState(() {
        this.itemsArray[index] = "lucky";
        this.message = "You win!";
      });
    } else {
      setState(() {
        this.itemsArray[index] = "unlucky";
      });
    }
  }

  ///[TODO:-5] Method to get the images
  AssetImage getImage(int index) {
    String currentState = this.itemsArray[index];
    switch (currentState) {
      case "lucky":
        return this.lucky;
      case "unlucky":
        return this.unlucky;
    }
    return this.circle;
  }

  ///[TODO:-6] Method show all states
  void showAll() {
    setState(() {
      this.itemsArray = List<String>.filled(25, "unlucky");
      this.itemsArray[this.luckyNumber] = "lucky";
    });
  }

  ///[TODO:-7] Method reset all states
  void resetGame() {
    setState(() {
      this.itemsArray = List<String>.filled(25, "empty");
      this.attemptCounts = 0;
      this.message = "";
    });
    this.generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scratch and Win'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0),
              itemCount: this.itemsArray.length,
              itemBuilder: (context, i) => SizedBox(
                height: 50.0,
                width: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    print(this.attemptCounts);
                    this.attemptCounts++;
                    if (this.attemptCounts <= 10 && this.message=="") {
                      this.playGame(i);
                    } else {
                      Future.delayed(Duration(seconds: 20), () {
                        this.resetGame();
                      });
                    }
                  },
                  child: Image(
                    image: this.getImage(i),
                  ),
                ),
              ),
            ),
          ),
          DelayedDisplay(
            delay: Duration(seconds: 10),
            child: Center(
              child: Text(
                this.message,
                style: TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    letterSpacing: 15.0),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
            child: RaisedButton(
              onPressed: this.showAll,
              color: Colors.pink,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'SHOW ALL',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    letterSpacing: 10.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
            child: RaisedButton(
              onPressed: this.resetGame,
              color: Colors.pink,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'RESET',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    letterSpacing: 10.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}

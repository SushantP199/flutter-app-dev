import 'dart:math';
import "package:delayed_display/delayed_display.dart";
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  ///[TODO:-1] Link up images
  AssetImage circle = const AssetImage('images/circle.png');
  AssetImage lucky = const AssetImage('images/rupee.png');
  AssetImage unlucky = const AssetImage('images/sadFace.png');

  ///[TODO:-2] Declare requirements
  late List<String> itemsArray;
  late int luckyNumber;
  late int attemptCounts;
  late String message;

  ///[TODO:-3] Initialize the game state
  @override
  void initState() {
    super.initState();
    setState(() {
      itemsArray = List<String>.generate(25, (index) => "empty");
      attemptCounts = 0;
      message = "";
    });
    generateRandomNumber();
  }

  void generateRandomNumber() {
    int randomNumber = Random().nextInt(25);
    setState(() {
      luckyNumber = randomNumber;
    });
  }

  ///[TODO:-4] Method to play the game
  void playGame(int index) {
    if (luckyNumber == index) {
      setState(() {
        itemsArray[index] = "lucky";
        message = "You win!";
      });
    } else {
      setState(() {
        itemsArray[index] = "unlucky";
      });
    }
  }

  ///[TODO:-5] Method to get the images
  AssetImage getImage(int index) {
    String currentState = itemsArray[index];
    switch (currentState) {
      case "lucky":
        return lucky;
      case "unlucky":
        return unlucky;
    }
    return circle;
  }

  ///[TODO:-6] Method show all states
  void showAll() {
    setState(() {
      itemsArray = List<String>.filled(25, "unlucky");
      itemsArray[luckyNumber] = "lucky";
    });
  }

  ///[TODO:-7] Method reset all states
  void resetGame() {
    setState(() {
      itemsArray = List<String>.filled(25, "empty");
      attemptCounts = 0;
      message = "";
    });
    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scratch and Win'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0),
              itemCount: itemsArray.length,
              itemBuilder: (context, i) => SizedBox(
                height: 50.0,
                width: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    print(attemptCounts);
                    attemptCounts++;
                    if (attemptCounts <= 10 && message == "") {
                      playGame(i);
                    } else {
                      Future.delayed(const Duration(seconds: 20), () {
                        resetGame();
                      });
                    }
                  },
                  child: Image(
                    image: getImage(i),
                  ),
                ),
              ),
            ),
          ),
          DelayedDisplay(
            delay: const Duration(seconds: 10),
            child: Center(
              child: Text(
                message,
                style: const TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    letterSpacing: 15.0),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
            child: ElevatedButton(
              onPressed: showAll,
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.pink),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 10),
                ),
              ),
              child: const Text(
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
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
            child: ElevatedButton(
              onPressed: resetGame,
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.pink),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 10),
                ),
              ),
              child: const Text(
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

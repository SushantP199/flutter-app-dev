/// [TODOs] :
/// 1] Remove Bottom Padding of gridview builder
/// 2] Make learn code online text as link redirect to its website [\]
/// 3] Add text a "A project by sushant pagam"[\]
/// 4] Facy customization of app

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const TicTacToe());

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TicTacToe',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  ///[TODO]: Link up images
  AssetImage cross = const AssetImage('images/cross.png');
  AssetImage circle = const AssetImage('images/circle.png');
  AssetImage edit = const AssetImage('images/edit.png');

  bool isCross = true;
  late List<String> getState;
  late String message;

  ///[TODO]: Method to get images
  AssetImage getImage(String type) {
    switch (type) {
      case "Cross":
        return cross;
      case "Circle":
        return circle;
      default:
        return edit;
    }
  }

  ///[TODO]: Initialize game state
  @override
  void initState() {
    super.initState();
    setState(() {
      getState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      message = "";
    });
  }

  ///[TODO]: Method to play game
  void playGame(int index) {
    if ((getState[index] == "empty") && (message == "")) {
      setState(() {
        if (isCross) {
          getState[index] = "Cross";
        } else {
          getState[index] = "Circle";
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

  ///[TODO]: Method of Winning Logic
  void checkWin() {
    if ((getState[0] != "empty") &&
        (getState[0] == getState[1]) &&
        (getState[1] == getState[2])) {
      message = "${getState[0]} wins!";
    } else if ((getState[3] != "empty") &&
        (getState[3] == getState[4]) &&
        (getState[4] == getState[5])) {
      message = "${getState[3]} wins!";
    } else if ((getState[6] != "empty") &&
        (getState[6] == getState[7]) &&
        (getState[7] == getState[8])) {
      message = "${getState[6]} wins!";
    } else if ((getState[0] != "empty") &&
        (getState[0] == getState[3]) &&
        (getState[3] == getState[6])) {
      message = "${getState[0]} wins!";
    } else if ((getState[1] != "empty") &&
        (getState[1] == getState[4]) &&
        (getState[4] == getState[7])) {
      message = "${getState[1]} wins!";
    } else if ((getState[2] != "empty") &&
        (getState[2] == getState[5]) &&
        (getState[5] == getState[8])) {
      message = "${getState[2]} wins!";
    } else if ((getState[0] != "empty") &&
        (getState[0] == getState[4]) &&
        (getState[4] == getState[8])) {
      message = "${getState[0]} wins!";
    } else if ((getState[2] != "empty") &&
        (getState[2] == getState[4]) &&
        (getState[4] == getState[6])) {
      message = "${getState[2]} wins!";
    } else if ((getState[0] != "empty") &&
        (getState[0] == getState[1]) &&
        (getState[1] == getState[2])) {
      message = "${getState[0]} wins!";
    } else if (!getState.contains("empty")) {
      message = "Game Draw!";
    }
  }

  ///[TODO]: Method to reset game
  void resetGame() {
    setState(() {
      getState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      message = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TIC TAC TOE'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0),
                itemCount: 9,
                itemBuilder: (context, i) => SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: MaterialButton(
                      onPressed: () {
                        playGame(i);
                        if (message != "") {
                          Future.delayed(const Duration(seconds: 20), () {
                            resetGame();
                          });
                        }
                      },
                      child: Image(
                        image: getImage(getState[i]),
                      )),
                ),
              ),
            ),
            Text(
              message,
              style: const TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 10.0,
                color: Colors.purple,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: MaterialButton(
                onPressed: resetGame,
                color: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                  child: Text(
                    'RESET',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 5.0,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              child: const Text(
                "LearnCodeOnline.in",
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 0.5,
                  color: Colors.purple,
                ),
              ),
              onTap: () async {
                await launchUrl(Uri.parse("https://flutter.dev/"));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "A project by ",
                  style: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: 1.0,
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                InkWell(
                  child: const Text(
                    "Sushant Pagam",
                    style: TextStyle(
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () async {
                    await launchUrl(
                      Uri.parse("https://github.com/SushantP199"),
                    );
                  },
                ),
              ],
            ),
          ]),
    );
  }
}

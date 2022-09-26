/// [TODOs] :
/// 1] Remove Bottom Padding of gridview builder
/// 2] Make learn code online text as link redirect to its website [\]
/// 3] Add text a "A project by sushant pagam"[\]
/// 4] Facy customization of app

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:delayed_display/delayed_display.dart'

void main() => runApp(TicTacToe());

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TicTacToe',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  ///[TODO]: Link up images
  AssetImage cross = AssetImage('images/cross.png');
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage edit = AssetImage('images/edit.png');

  bool isCross = true;
  List<String> getState;
  String message;

  ///[TODO]: Method to get images
  AssetImage getImage(String type) {
    switch (type) {
      case "Cross":
        return cross;
        break;
      case "Circle":
        return circle;
        break;
      case "empty":
        return edit;
        break;
    }
  }

  ///[TODO]: Initialize game state
  void initState() {
    super.initState();
    setState(() {
      this.getState = [
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
      this.message = "";
    });
  }

  ///[TODO]: Method to play game
  void playGame(int index) {
    if ((this.getState[index] == "empty") && (this.message == "")) {
      setState(() {
        if (this.isCross) {
          this.getState[index] = "Cross";
        } else {
          this.getState[index] = "Circle";
        }
        this.isCross = !this.isCross;
        checkWin();
      });
    }
  }

  ///[TODO]: Method of Winning Logic
  void checkWin() {
    if ((this.getState[0] != "empty") &&
        (this.getState[0] == this.getState[1]) &&
        (this.getState[1] == this.getState[2])) {
      this.message = "${this.getState[0]} wins!";
    } else if ((this.getState[3] != "empty") &&
        (this.getState[3] == this.getState[4]) &&
        (this.getState[4] == this.getState[5])) {
      this.message = "${this.getState[3]} wins!";
    } else if ((this.getState[6] != "empty") &&
        (this.getState[6] == this.getState[7]) &&
        (this.getState[7] == this.getState[8])) {
      this.message = "${this.getState[6]} wins!";
    } else if ((this.getState[0] != "empty") &&
        (this.getState[0] == this.getState[3]) &&
        (this.getState[3] == this.getState[6])) {
      this.message = "${this.getState[0]} wins!";
    } else if ((this.getState[1] != "empty") &&
        (this.getState[1] == this.getState[4]) &&
        (this.getState[4] == this.getState[7])) {
      this.message = "${this.getState[1]} wins!";
    } else if ((this.getState[2] != "empty") &&
        (this.getState[2] == this.getState[5]) &&
        (this.getState[5] == this.getState[8])) {
      this.message = "${this.getState[2]} wins!";
    } else if ((this.getState[0] != "empty") &&
        (this.getState[0] == this.getState[4]) &&
        (this.getState[4] == this.getState[8])) {
      this.message = "${this.getState[0]} wins!";
    } else if ((this.getState[2] != "empty") &&
        (this.getState[2] == this.getState[4]) &&
        (this.getState[4] == this.getState[6])) {
      this.message = "${this.getState[2]} wins!";
    } else if ((this.getState[0] != "empty") &&
        (this.getState[0] == this.getState[1]) &&
        (this.getState[1] == this.getState[2])) {
      this.message = "${this.getState[0]} wins!";
    } else if (!this.getState.contains("empty")) {
      this.message = "Game Draw!";
    }
  }

  ///[TODO]: Method to reset game
  void resetGame() {
    setState(() {
      this.getState = [
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
      this.message = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIC TAC TOE'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: GridView.builder(
                padding: EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                        if (this.message != "") {
                          Future.delayed(Duration(seconds: 20), () {
                            this.resetGame();
                          });
                        }
                      },
                      child: Image(
                        image: this.getImage(this.getState[i]),
                      )),
                ),
              ),
            ),
            Text(
              this.message,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 10.0,
                color: Colors.purple,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: MaterialButton(
                onPressed: 
                  resetGame,
                color: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 5.0),
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
              child: Text(
                "LearnCodeOnline.in",
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 0.5,
                  color: Colors.purple,
                ),
              ),
              onTap: () async {
                await launch(
                    "https://courses.learncodeonline.in/learn/complete-flutter-course");
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "A project by ",
                  style: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: 1.0,
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                InkWell(
                  child: Text(
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
                    await launch("https://github.com/SushantP199");
                  },
                ),
              ],
            ),
          ]),
    );
  }
}

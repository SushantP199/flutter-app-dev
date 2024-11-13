import 'package:destini/StoryBrain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Destini());
}

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: DestiniBody(),
      ),
    );
  }
}

class DestiniBody extends StatefulWidget {
  const DestiniBody({super.key});

  @override
  _DestiniBodyState createState() => _DestiniBodyState();
}

class _DestiniBodyState extends State<DestiniBody> {
  StoryBrain storyBrain = StoryBrain();

  void actionPlay(int choice) {
    setState(() {
      storyBrain.nextStory(choice);
    });
  }

  bool visible() {
    if (storyBrain.getStoryNumber() == 3 ||
        (storyBrain.getStoryNumber() == 4) ||
        (storyBrain.getStoryNumber() == 5)) {
      print("false");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Positioned.fill(
          child: Image(
            image: AssetImage('images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: const TextStyle(
                      fontFamily: 'Poor Story',
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.redAccent,
                    ),
                  ),
                  onPressed: () {
                    actionPlay(1);
                  },
                  child: Text(
                    storyBrain.getActionOne(),
                    style: const TextStyle(
                      fontFamily: 'Poor Story',
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Visibility(
                visible: visible(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.blueAccent,
                      ),
                    ),
                    onPressed: () {
                      actionPlay(2);
                    },
                    child: Text(
                      storyBrain.getActionTwo(),
                      style: const TextStyle(
                        fontFamily: 'Poor Story',
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

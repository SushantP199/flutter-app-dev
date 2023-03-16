import 'package:destini/StoryBrain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:DestiniBody(),
      ),
    );
  }
}

class DestiniBody extends StatefulWidget {
  @override
  _DestiniBodyState createState() => _DestiniBodyState();
}

class _DestiniBodyState extends State<DestiniBody> {

  StoryBrain storyBrain = new StoryBrain();

  void actionPlay(int choice){
    setState(() {
      storyBrain.nextStory(choice);
    });
  }

  bool visible() {
    if (storyBrain.getStoryNumber() == 3 || (storyBrain.getStoryNumber() == 4 ) || (storyBrain.getStoryNumber() == 5 ) ){
      print("false");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget>[
        Positioned.fill(
          child: Image(
            image: AssetImage('images/background.png'),
            fit:BoxFit.fill,
          ),
        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      storyBrain.getStory(),
                      style: TextStyle(
                        fontFamily: 'Poor Story',
                        color:Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ), 
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    color:Colors.redAccent,
                    onPressed: (){
                      actionPlay(1);
                    },
                    child: Text(
                      storyBrain.getActionOne(),
                      style:TextStyle(
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
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      color:Colors.blueAccent,
                      onPressed: (){
                        actionPlay(2);
                      },
                      child: Text(
                        storyBrain.getActionTwo(),
                        style:TextStyle(
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
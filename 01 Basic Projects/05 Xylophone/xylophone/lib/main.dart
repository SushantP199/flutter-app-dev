import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class XylophoneApp extends StatelessWidget {

  void playSound(int number){
    final player = AudioCache();
    player.play('note$number.wav');
  }

  Widget buildNoteButton({@required int number, Color color} ){
    return Expanded(
      child:FlatButton(
        color: color,
          onPressed:(){
          playSound(number);
        },
        child: Text(
          'Note $number',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Princess Sofia',
            fontSize: 40,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child:Center(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildNoteButton(number:1, color: Colors.red),
              buildNoteButton(number:2, color: Colors.blueAccent),
              buildNoteButton(number:3, color: Colors.greenAccent),
              buildNoteButton(number:4, color: Colors.yellowAccent),
              buildNoteButton(number:5, color: Colors.pinkAccent),
              buildNoteButton(number:6, color: Colors.orangeAccent),
              buildNoteButton(number:7, color: Colors.deepPurpleAccent),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {

  var app = MaterialApp(
    home: XylophoneApp(),
  );

  runApp(app);
}
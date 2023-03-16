import 'package:flutter/material.dart';
import 'AudioNumber.dart';
import 'package:audioplayers/audio_cache.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // AudioCache used for smaller audio and single audio
  AudioCache audioCache = AudioCache();

  List<AudioNumber> numberrList = [
    AudioNumber(aU: 'one.wav', bC: Colors.red, bT: 'One'),
    AudioNumber(aU: 'two.wav', bC: Colors.blue, bT: 'Two'),
    AudioNumber(aU: 'three.wav', bC: Colors.green, bT: 'Three'),
    AudioNumber(aU: 'four.wav', bC: Colors.pink, bT: 'Four'),
    AudioNumber(aU: 'five.wav', bC: Colors.brown, bT: 'Five'),
    AudioNumber(aU: 'six.wav', bC: Colors.blueGrey, bT: 'Six'),
    AudioNumber(aU: 'seven.wav', bC: Colors.teal, bT: 'Seven'),
    AudioNumber(aU: 'eight.wav', bC: Colors.grey, bT: 'Eight'),
    AudioNumber(aU: 'nine.wav', bC: Colors.orange, bT: 'Nine'),
    AudioNumber(aU: 'ten.wav', bC: Colors.purple, bT: 'Ten'),
  ];

  void play(String uri) {
    audioCache.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spanish Numbers Audio"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('images/logo.png'),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical:20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio:2.0,
              ),
              itemCount: this.numberrList.length,
              itemBuilder: (context, i) => SizedBox(
                child: RaisedButton(
                  onPressed: () {
                    this.play(this.numberrList[i].audioUri);
                  },
                  color: this.numberrList[i].buttonColor,
                  child: Text(
                    this.numberrList[i].buttonText,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

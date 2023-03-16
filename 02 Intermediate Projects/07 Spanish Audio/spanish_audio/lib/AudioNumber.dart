// Helper class file
import 'package:flutter/material.dart';

class AudioNumber {
  String audioUri;
  MaterialColor buttonColor;
  String buttonText;

  AudioNumber(
      {@required String aU, @required MaterialColor bC, @required String bT}) {
    this.audioUri = aU;
    this.buttonColor = bC;
    this.buttonText = bT;
  }
}

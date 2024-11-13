// Helper class file
import 'package:flutter/material.dart';

class AudioNumber {
  late String audioUri;
  late MaterialColor buttonColor;
  late String buttonText;

  AudioNumber({
    required String aU,
    required MaterialColor bC,
    required String bT,
  }) {
    audioUri = aU;
    buttonColor = bC;
    buttonText = bT;
  }
}

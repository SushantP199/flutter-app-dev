import 'dart:io';

void main() {
  print("Enter you number ->");
  var number = int.parse(stdin.readLineSync()!);
  var day;

  switch (number) {
    case 0:
      day = 'Sunday';
      break;

    case 1:
      day = 'Monday';
      break;

    case 2:
      day = 'Thuesday';
      break;

    case 3:
      day = 'Wednesday';
      break;

    case 4:
      day = 'Thursday';
      break;

    case 5:
      day = 'Friday';
      break;

    case 6:
      day = 'Saturday';
      break;

    default:
      print("You have not selected proper number (BET 0 to 6)");
  }

  print("\nThe day $day is present on number $number");
}

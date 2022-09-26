void main() {
  var i;

  for (i = 0; i <= 10; i++) {
    if (i == 5) {
      continue;
    }
    print("This is line number ${i}");
  }

  while (i >= 1) {
    if (i == 5) {
      break;
    }
    print('This is line number ${i}');
    i--;
  }
}

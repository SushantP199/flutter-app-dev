// List built-in data type

void main() {
  // Collection if

  var superheros = [
    'superman',
    'batman',
    'spiderman',
    if (true) 'doctor strange',
    if (false) 'padman'
  ];
  print("Superheros : $superheros");

  // Collection for

  var heros = [
    'thanos',
    'black panter',
    for (var superhero in superheros) '_$superhero'
  ];
  print("\nHeros : $heros");
}

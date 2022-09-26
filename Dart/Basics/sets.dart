// Set built-in data type

void main() {
  // Declaration

  var colors = {'red', 'blue', 'green'};
  print("Colors : $colors");

  // Add elements to set

  colors.add('yellow');
  print("\nColors : $colors");

  var emptyColors = <String>{};
  print("\nEmptyColors (before .addAll) : $emptyColors");

  emptyColors.addAll(colors);
  // emptyColors = {...?colors};
  print("\nEmptyColors (after .addAll) : $emptyColors");

  // collection if and for

  var places = {'Mumbai', 'Dubai', 'italy', if (true) 'Delhi'};
  print("\nPlaces : $places");

  var mixed = {...colors, for (var place in places) '_$place'};
  print("\nMixed set : $mixed");

  print("\nplaces[0] = ${places.iterator}");

  for (var item in mixed) {
    print(item);
  }
}

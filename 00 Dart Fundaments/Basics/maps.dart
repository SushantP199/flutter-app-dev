// Maps buit-in data type

void main() {
  // Declarations

  var values = {0: 'Zero', 1: 'One', 2: 'Two', if (true) 3: 'Three'};
  print("Values : $values");
  print("\n${values[0]}");
  values[4] = 'Four';
  print("\n${values[0]}");

  var newMap = {
    ...values,
  };
  print("\nNew : $newMap, ${(newMap)}");
}

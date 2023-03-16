
void main(){

  var superheros = [ 'batman', 'superman', 'doctor strange', 'thanos', 'deadpool' ];


  /// Methods in class List
  superheros.add('black panther');
  superheros.insert(0, 'wonder women');

  superheros.remove('superman');
  superheros.removeAt(3);
  superheros.removeLast();
  // superheros.clear();


  /// Properties in class List
  print('\nLength = ${superheros.length}');
  print('\nsuperheros_reversed = ${superheros.reversed} $superheros');
  print('\nfirst = ${superheros.first}');


  /// Display the List
  print("\n*** SUPERHEROS ***");
  for ( var hero in superheros) {
    print("${superheros.indexOf(hero) + 1} ) $hero ");
  }

}
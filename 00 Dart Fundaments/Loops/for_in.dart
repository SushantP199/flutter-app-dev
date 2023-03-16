void main() {
  var heros = ['batman', 'superman', 'doctor strange'];

  // for(var hero = 0; hero<heros.length; hero++){
  //   print('${heros[i]}');
  // }

  for (var hero in heros) {
    print('${hero}');
  }
}

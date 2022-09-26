class Animal {
  Animal(int age) {
    print("This is Animal()");
  }

  Animal.named() {
    print("This is Animal.named()");
  }

  String color = "Red";

  void eat() {
    print("Eats!");
  }
}

class Dog extends Animal {
  String? breed;

  Dog(int n, int g) : super(g) {
    print("This is DOG()");
  }

  void bark() {
    print("Barks!");
  }

  @override
  void eat() {
    print("Dog eats!");
    super.eat();
  }
}

class Cat extends Animal {
  int? age;

  Cat() : super.named() {
    print("This is cAT()");
  }

  @override
  String color = "White";

  void meow() {
    print("Meow!");
  }
}

void main() {
  Dog d = new Dog(2, 3);
  // d.color = "Brown";
  d.breed = "Bulldog";
  print("\n${d.color}\n${d.breed}");
  d.bark();
  d.eat();

  Cat c = new Cat();
  // c.color = "Grey";
  c.age = 3;
  print("\n${c.color}\n${c.age}");
  c.meow();
  c.eat();

  Animal a = new Animal(5);
  // a.color = "Yellowish Black";
  print("\n${a.color}");
  a.eat();
}

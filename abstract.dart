void main() {
  Animal platypus = Platypus();
  print(platypus.isAlive);
  platypus.eat();
  platypus.move();
  // platypus.layEggs();
  print(platypus);
}

abstract class Animal{
  bool isAlive = true;
  void eat();
  void move();


  @override
  String toString(){
    return "the animals have eaten";
  } 
}

//when you extend an abstract class,
// you must provide an implementation of any abstract methods,
// which in this case are eat and move
class Platypus extends Animal{
  @override
  void eat() {
    // TODO: implement eat
    print('Munch munch');
  }

  @override
  void move() {
    // TODO: implement move
    print('Glide glide');
  }
  
  //As was true with subclassing normal classes,
  // abstract class subclasses can also have their own unique methods.
  void layEggs() {
  print('Plop plop');
}

}
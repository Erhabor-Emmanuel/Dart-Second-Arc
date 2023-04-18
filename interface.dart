import 'dart:html';

void main() {
  //Since FakeWebServer is a subclass of DataRepository,
  // the factory constructor is allowed to return it
  //******************
  //The neat trick is that by using an unnamed constructor for the factory,
  // you can make it look like it’s possible to instantiate the class now.
  final repository = DataRepository();
  final temperature = repository.fetchTemperature('manila');
}


//An interface is a description of how communication will be managed between two parties.

//When you create an interface in Dart, you define the rules for how one part of your
// codebase will communicate with another part. 

//There’s no interface keyword in Dart. Instead, you can use any class as an interface.
// Since only the field and method names are important, most interfaces are made from abstract classes
// that contain no logic.

abstract class DataRepository{
  //recall that factory constructors can return subclasses
  factory DataRepository() => FakeWebServer();
  double? fetchTemperature(String city);
}

//when creating a concrete class to implement the interface,
// you must use the implements keyword instead of the extends keyword.
class FakeWebServer implements DataRepository{
  @override
  double? fetchTemperature(String city) {
    // TODO: implement fetchTemperature
    return 42.0;
  }

}
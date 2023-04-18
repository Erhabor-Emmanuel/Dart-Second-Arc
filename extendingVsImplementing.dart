//Dart only allows you to extend a single superclass. This is known as single inheritance,

//e.g
// class MySubclass extends OneClass, AnotherClass{} ********// Not OK

//However, you can implement more than one interface:
//class MyClass implements OneClass, AnotherClass{} **********// OK

//You can also combine extends and implements:
//class MySubclass extends OneClass implements AnotherClass {}

void main(){
  //Check that SomeClass objects have access to AnotherClass data and methods:
  final someClass = SomeClass();
  print(someClass.myField);
  someClass.myMethod();
}

//*************************
class AnotherClass{
  int myField = 42;
  void myMethod() => print(myField);
}

//But what’s the difference between just extending or implementing? 
//That is, how are these two lines different?
class SomeClass extends AnotherClass {}

//The implements keyword tells Dart that you only want the field types and method signatures.
class MostClass implements AnotherClass {
  //You’ll provide the concrete implementation details for everything yourself.
  @override
  int myField = 0;

  @override
  void myMethod() => print('Hello');
}
//When you extend AnotherClass, SomeClass has access to any logic or variables in AnotherClass.
//However, if MostClass implements AnotherClass, MostClass must provide its own version of all methods
// and variables in AnotherClass.
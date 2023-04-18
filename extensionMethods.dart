//Dart has a feature called extension methods that allow you to add functionality to existing classes. 
//Even though they’re called extension methods, you can also add other members like getters,
// setters or even operators


//Extension syntax
//To make an extension, you use the following syntax:
import 'className.dart';
import 'extendingVsImplementing.dart';

extension on SomeClass{
  // your custom code
}
//This should be located at the top-level in a file; that is, not inside another class or function. 

//You may give the extension itself a name if you like. In that case the syntax is as follows:
extension YourExtensionName on ClassName{
  // your custom code
}

void main(){
  final original = 'abc';
  final secret = encode(original);
  print(secret);
  //************* the one gotten when using extension*********
  final real = 'uvw';
  final coded = real.encoded;
  print(coded);
  //Now the private _code method factors out all of the common parts of encoded and decoded
  //Which is better.
  final dReal =  'i like extension';
  final hidden = dReal.encoded;
  final revealed = dReal.decoded;
  print(hidden);
  print(revealed);
  //printing from the int extension below:
  print(5.cubed);

  //Now you can check at runtime whether a particular language is strongly typed or not:
  final language = ProgrammingLanguage.dart;
  print(language.isStronglyTyped);
}

//String extension example
//************** Solving the normal way *************
String encode(String input){
  final output = StringBuffer();
  for(final codePoint in input.runes){
    output.writeCharCode(codePoint +1);
  }
  return output.toString();
}
//This function uses a StringBuffer for efficient string manipulation.
// A normal String is immutable, but a StringBuffer is mutable.
//That means your function doesn’t have to create a new string every time you append a character.
//You loop through each Unicode code point and increment it by 1 before writing it to output.
//Finally, you convert the StringBuffer back to a regular String and return it.


//Converting to an extension

//The next step is to convert the encode function above to an extension so that you can use it like so:
extension on String{
  String get encodedd{
    final output = StringBuffer();
    for(final codePoint in runes){
      output.writeCharCode(codePoint + 1);
    }
    return output.toString();
  }
}
//The keywords extension on are what make this an extension.
//Rather than making a normal method, you can use a getter method. 
//This makes it so that you can call the extension using encoded, without the parentheses,

//*******Refactoring to remove code duplication*********
//Lets Refactor the String extension by replacing the entire extension with the following:
extension on String{
  String get encoded{
    return _code(1);
  }
  String get decoded{
    return _code(-1);
  }

  String _code(int steps){
    final output = StringBuffer();
    for(final codePoint in runes){
      output.writeCharCode(codePoint + steps);
    }
    return output.toString();
  }
}

//int extension example
//Notice the use of this to get a reference to the int object which will be 5 in the example above
extension on int{
  int get cubed{
    return this * this * this;
  }
}

//Enum extension example
enum ProgrammingLanguage {dart, swift, javaScript}
//Normally you wouldn’t be able to perform any internal logic on those enum values,
// but you can by adding the following extension on ProgrammingLanguage:

extension on ProgrammingLanguage{
  bool get isStronglyTyped{
    switch(this){
      case ProgrammingLanguage.dart:
      case ProgrammingLanguage.swift:
      return true;
      case ProgrammingLanguage.javaScript:
      return false;
      default:
      throw Exception('Unkown programming language $this');
    }
  }
}




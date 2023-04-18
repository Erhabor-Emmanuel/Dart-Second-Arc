//Being able to transform a stream as the data is coming in is very powerful.
//In Previois examples, we never did anything with the data except print the length of the list of bytes
//Those bytes represent text, though, we're going to transform the data from numbers to text.

import 'dart:convert';
import 'dart:io';

Future<void>main() async{
  final file = File('/Users/soft_code/Documents/dLearner/assetss/longText.txt');
  final stream = file.openRead();
  await for (var data in stream.transform(utf8.decoder)){
    print(data);
  }
  // stream.listen((event) {
  //   print(event);
  // });
}
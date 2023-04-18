import 'dart:convert';

//The following code produces a stream that outputs an integer every
// second and then stops after the tenth time.



// Stream<int>.periodic( 
//   Duration(seconds: 1),
//   (value) => value,
//   ).take(10);

//1. Set the stream above to a variable named myStream.
//2. Use await for to print the value of the integer on each data event coming from the stream.

import 'dart:io';

Future<void>main()async{
  final file = File('/Users/soft_code/Documents/dLearner/assetss/longText.txt');
  // final Stream = file.openRead();
  final stream = Stream<int>.periodic(
    Duration(seconds: 1),
    (value) => value,
  ).take(10);
  await for(var data in stream){
    print(data);
  }
}
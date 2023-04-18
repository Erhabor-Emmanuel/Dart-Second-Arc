import 'dart:io';

Future<void> main() async{
  try{
    final file = File('/Users/soft_code/Documents/dLearner/assetss/longText.txt');
  final stream = file.openRead();
  stream.listen((event) {
    print(event.length);
  });
  }on Exception catch(error){
    print('error====== $error');
  } finally{
    print('All finished');
  }
  

  // await for (var event in stream){
  //   print(event.length);
  // }
}

//Instead of calling readAsString on file, this time you’re calling openRead,
//which returns an object of type Stream<List<int>>. That’s a lot of angle brackets,
//but Stream<List<int>> simply means that it’s a stream that periodically produces a list,
//and that list is a list of integers. The integers are the byte values,
//and the list is the chunk of data that’s being passed in.

//To subscribe for notifications whenever there’s new data coming in the stream,
//you call the listen method and pass it an anonymous function that takes a single parameter.


//Note: By default, only a single object can listen to a stream.
//This is known as a single subscription stream.


//If you want more than one object to be notified of stream events, you need to create a broadcast stream, 
//which you could do like so: final broadcastStream = stream.asBroadcastStream();
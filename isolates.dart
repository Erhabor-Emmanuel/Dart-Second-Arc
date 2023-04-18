import 'dart:isolate';
// If you want to run some computationally intensive code on another thread,
// then you’ll need to create a new isolate to do that.

//The term for creating an isolate in Dart is called spawning.

//Since isolates don’t share any memory with each other,
//they can only communicate by sending messages.

//When you spawn a new isolate, you give it a message communication object called a **send port**
//The new isolate uses the send port to send messages back to a receive port,
//which is listening on the main isolate

Future<void>main() async{
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn(playHideAndSeekTheLongVersion, receivePort.sendPort);
  receivePort.listen((message) {
    print(message);
    receivePort.close();
    isolate.kill();
  });
}

//You created a receive port to listen for messages from the new isolate.
//Next, you spawned a new isolate and gave it two arguments.
// The first argument is the function that you want the isolate to execute.
//That function must be a top-level or static function. It must also take a single parameter.
//The second argument of spawn will be passed as the argument to playHideAndSeekTheLongVersion.
//The receivePort has a sendPort that belongs to it.
//This is the part where Mommy gives little Timmy the phone and says to call home if anything happens.
//The second parameter of spawn isn’t actually required to be a SendPort object,
//but how is Timmy going to call home without a phone?
//If you want to pass additional parameters to the function,
//you can make the second parameter of spawn be a list or a map in which
//one of the elements is a SendPort and the other elements are additional arguments
//Finally, receivePort.listen gets a callback whenever sendPort sends a message.
//In this example, the isolate is no longer needed after the work is done,
//so you can close the receive port and kill the isolate to free up the memory.



void playHideAndSeekTheLongVersion(SendPort sendPort){
  var counting = 0;
  for(var i = 1; i <= 1000000000; i++){
    counting = i;
  }
  print('$counting! Ready or not, here i come ');
}

//**SendPort** is like one of those emergency mobile phones for kids where the phone can only call home.
//Home in this case is the main isolate. And this time we are sending a message via the sendport.
//Back in the main isolate, there will be a receive port listening for the message.
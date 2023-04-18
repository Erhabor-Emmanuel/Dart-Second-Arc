import 'dart:async';
import 'dart:io';


// you may use the cancelOnError parameter to tell the stream that you want
// to stop listening in the event of an error. However,
// even if there isn’t an error, you should always cancel your subscription to a stream
// if you no longer need it. This allows Dart to clean up the memory the stream was using.
// Failing to do so can cause a memory leak


Future<void> main() async{
  final file = File('/Users/soft_code/Documents/dLearner/assetss/longText.txt');
  final stream = file.openRead();
  StreamSubscription<List<int>>? subscription;
  subscription = stream.listen((event) {
    print(event.length);
    subscription?.cancel();
  },
  cancelOnError: true,
  onDone: (){
    print('All Finished');
  }
  );
}

//Calling listen returns a StreamSubscription, which is part of the dart:async library.
//Keeping a reference to that in the subscription variable allows you to cancel the subscription
//whenever you want.
//Run the code and you’ll only see 65536 printed once.
//The onDone callback was never called because the stream never completed.